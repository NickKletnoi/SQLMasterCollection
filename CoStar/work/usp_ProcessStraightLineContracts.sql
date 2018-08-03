USE [Staging]
GO

/****** Object:  StoredProcedure [dbo].[uspProcessStraightLineContracts]    Script Date: 11/16/2017 5:12:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[uspProcessStraightLineContracts]
AS

DECLARE @CURRENT_CONTRACTID INT

 DECLARE C CURSOR FOR
 SELECT DISTINCT [ContractID] FROM RevPro..[Active_SOFile]
 ORDER BY [ContractID]
  
 OPEN C
 FETCH c into @CURRENT_CONTRACTID
 WHILE @@FETCH_STATUS = 0
 BEGIN
   EXEC [dbo].[usp_CreateStraightLineWaterfall] @CURRENT_CONTRACTID
FETCH c into @CURRENT_CONTRACTID
 END

 CLOSE C
 DEALLOCATE C

DELETE FROM [dbo].[StraightLineContracts] where Contract_Final_Amt IS NULL;
DELETE FROM [dbo].[StraightLineContracts] where StraightLine_Flg=0; 
GO

