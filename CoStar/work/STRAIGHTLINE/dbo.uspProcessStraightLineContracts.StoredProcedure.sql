USE [Staging]
GO
/****** Object:  StoredProcedure [dbo].[uspProcessStraightLineContracts]    Script Date: 12/21/2017 2:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[uspProcessStraightLineContracts]
AS

DECLARE @CURRENT_CONTRACTID INT

 DECLARE C CURSOR FOR
 SELECT DISTINCT [ContractID] FROM RevPro..[Active_SOFile]
 WHERE ContractID NOT IN (SELECT DISTINCT ContractID from RevPro..vwStraightLineContracts)
  
 OPEN C
 FETCH C into @CURRENT_CONTRACTID
 WHILE @@FETCH_STATUS = 0
 BEGIN
   EXEC [dbo].[usp_CreateStraightLineWaterfall] @CURRENT_CONTRACTID;
   EXEC [dbo].[usp_CreateStraightLineDiscountWaterfall] @CURRENT_CONTRACTID;
FETCH C into @CURRENT_CONTRACTID
 END

 CLOSE C
 DEALLOCATE C

DELETE FROM dbo.StraightLineContracts WHERE Contract_Final_Amt IS NULL;
DELETE FROM dbo.StraightLineDiscountContracts WHERE Contract_Final_Amt IS NULL;

GO
