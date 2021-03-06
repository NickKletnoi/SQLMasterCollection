USE [Staging]
GO
/****** Object:  StoredProcedure [dbo].[uspTransferStraightLineContracts]    Script Date: 12/21/2017 2:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspTransferStraightLineContracts]
AS

INSERT RevPro..StraightLineContracts (
       [ContractID]
      ,[Waterfall_Amt]
      ,[Waterfall_Stub_Amt]
      ,[Contract_Final_Amt]
      ,[StraightLine_Flg]

)
SELECT 
       [ContractID]
      ,[Waterfall_Amt]
      ,[Waterfall_Stub_Amt]
      ,[Contract_Final_Amt]
      ,[StraightLine_Flg]

  FROM Staging..StraightLineContracts WHERE (StraightLine_Flg=0 OR StraightLine_Flg=1) AND 
ContractID NOT IN  (SELECT DISTINCT ContractID FROM RevPro..StraightLineContracts )
AND ( Contract_Final_Amt > 0 ) AND ( Waterfall_Stub_Amt  < Waterfall_Amt )

-----------------------------------------------------------------------------------------

INSERT RevPro..StraightLineDiscountContracts (
       [ContractID]
      ,[Waterfall_Amt]
      ,[Waterfall_Stub_Amt]
      ,[Contract_Final_Amt]
      ,[StraightLine_Flg]

)
SELECT 
       [ContractID]
      ,[Waterfall_Amt]
      ,[Waterfall_Stub_Amt]
      ,[Contract_Final_Amt]
      ,[StraightLine_Flg]

  FROM Staging..StraightLineDiscountContracts WHERE (StraightLine_Flg=0 OR StraightLine_Flg=1) AND 
ContractID NOT IN  (SELECT DISTINCT ContractID FROM RevPro..StraightLineDiscountContracts )
AND ( Contract_Final_Amt > 0 ) AND ( Waterfall_Stub_Amt  < Waterfall_Amt )



GO
