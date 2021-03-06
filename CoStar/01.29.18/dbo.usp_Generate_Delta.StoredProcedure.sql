USE [RevPro]
GO
/****** Object:  StoredProcedure [dbo].[usp_Generate_Delta]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_Generate_Delta] 
@Staging_TBL			VARCHAR(100)

AS

/*
==========================================================================
DESCRIPTION

	Proc Name:  usp_Generate_Delta
	Purpose:    

	NOTES

	MODIFICATIONS

	Date	    Author		Purpose
	------------------------------------------------

	2017-08-28  Vitaly Romm	Initial version

	EXEC dbo.usp_Generate_Delta	'Sales_Order_Feed'

==========================================================================
*/  

--DECLARE @Staging_TBL VARCHAR(100) = 'Sales_Order_Feed'

DECLARE @SQL_Delta			NVARCHAR(4000),
		@SQL_Max_Update_Dt	NVARCHAR(4000),
		@Archive_TBL		VARCHAR(100) = REPLACE(@Staging_TBL,'Feed','Archive'),
	    @Max_Update_Dt		VARCHAR(100),

		@Threshold			VARCHAR(100) = (SELECT ConfiguredValue 
											FROM Staging..SSIS_Config 
											WHERE ConfigurationFilter = 'RevPro' 
											AND PackagePath LIKE '%Delta_Price_Threshold%'),

		@STG_ID				VARCHAR(100) = CASE LEFT(@Staging_TBL,1) WHEN 'S' THEN 'SO' 
										                             WHEN 'I' THEN 'INV'
																	 WHEN 'C' THEN 'CM'
										   END + '_STG_ID',

		@CRLF				VARCHAR(10) = CHAR(13) + CHAR(10)

--************************** Start Procedure *************************************************--

/* Get the last load date */
SET @SQL_Max_Update_Dt = 'SELECT @Max_Update_Dt = MAX(Last_Update_Dt)'		+ @CRLF +
					     'FROM ' + @Archive_TBL													


EXEC SP_EXECUTESQL 
     @Query  = @SQL_Max_Update_Dt,
     @Params = N'@Max_Update_Dt DATETIME OUTPUT',
     @Max_Update_Dt = @Max_Update_Dt OUTPUT


IF @Max_Update_Dt IS NOT NULL
BEGIN

SET @SQL_Delta = 'DELETE FROM Staging..' + @Staging_TBL													+ @CRLF +
				 'WHERE ' + @STG_ID + ' NOT IN ('														+ @CRLF +

				 'SELECT DISTINCT A.' + @STG_ID + 														+ @CRLF +
				 'FROM Staging..' + @Staging_TBL + ' A'													+ @CRLF +
                 'JOIN ' + @Archive_TBL + ' B'															+ @CRLF +
				 'ON A.Sales_Order_Line_ID = B.Sales_Order_Line_ID'										+ @CRLF +
				 'AND A.Item_ID = B.Item_ID'															+ @CRLF +
				 'AND A.Invoice_Number = B.Invoice_Number'												+ @CRLF +
				 'AND (A.Unit_Sell_Price - B.Unit_Sell_Price >= A.Unit_Sell_Price * ' + @Threshold		+ @CRLF +
				 'OR'																					+ @CRLF +
				 'B.Unit_Sell_Price - A.Unit_Sell_Price >= B.Unit_Sell_Price * ' + @Threshold + ')'		+ @CRLF +
				 'AND A.Unit_Sell_Price <> B.Unit_Sell_Price'											+ @CRLF +
				 'AND CAST(B.Last_Update_Dt AS VARCHAR(100)) = ''' + @Max_Update_Dt + ''''				+ @CRLF +

				 'UNION'																				+ @CRLF +

				 'SELECT DISTINCT A.' + @STG_ID +														+ @CRLF +
				 'FROM Staging..' + @Staging_TBL + ' A'													+ @CRLF +
					 'LEFT JOIN ' + @Archive_TBL + ' B'													+ @CRLF +
						 'ON A.Sales_Order_Line_ID = B.Sales_Order_Line_ID'								+ @CRLF +
						 'AND A.Item_ID = B.Item_ID'													+ @CRLF +
						 'AND A.Invoice_Number = B.Invoice_Number'										+ @CRLF +
				 'WHERE B.Sales_Order_Line_ID IS NULL'													+ @CRLF +
				 'AND B.Item_ID IS NULL'																+ @CRLF +
				 'AND B.Invoice_Number IS NULL'															+ @CRLF +
				 'AND CAST(B.Last_Update_Dt AS VARCHAR(100))  = ''' + @Max_Update_Dt + ''''				+ @CRLF +

				 ')'


--PRINT @SQL_Delta
EXEC (@SQL_Delta)

END


GO
