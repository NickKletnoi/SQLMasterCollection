USE [Staging]
GO
/****** Object:  StoredProcedure [dbo].[uspProcessStraightLineDiscountContracts]    Script Date: 12/21/2017 2:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[uspProcessStraightLineDiscountContracts]
AS

DECLARE @CURRENT_CONTRACTID INT

DECLARE C CURSOR FOR
 --SELECT DISTINCT ContractID FROM RevPro..vwStraightLineContracts SLC 
 --WHERE SLC.StraightLineType='D'
 --ORDER BY SLC.ContractID
SELECT DISTINCT [ContractID] FROM RevPro..[Active_SOFile]
WHERE ContractID NOT IN (SELECT DISTINCT ContractID from RevPro..StraightLineContracts)
  
 OPEN C
 FETCH c into @CURRENT_CONTRACTID
 WHILE @@FETCH_STATUS = 0
 BEGIN
   EXEC [dbo].[usp_CreateStraightLineDiscountWaterfall] @CURRENT_CONTRACTID
FETCH c into @CURRENT_CONTRACTID
 END

 CLOSE C
 DEALLOCATE C

--DELETE FROM [dbo].[StraightLineDiscountContracts] where StraightLine_Flg=0; 
DELETE FROM [dbo].[StraightLineDiscountContracts] where Contract_Final_Amt IS NULL;
--DELETE SLD FROM dbo.StraightLineDiscountContracts SLD WHERE SLD.Cnt=1; 



GO
