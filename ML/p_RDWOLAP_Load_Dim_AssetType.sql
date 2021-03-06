USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_AssetType]    Script Date: 04/04/2008 14:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure  [dbo].[p_RDWOLAP_Load_Dim_AssetType]  
AS    
------------------ Updating the existing records ------------------  
    
UPDATE Dim_AssetType    
SET      
AssetTypeName = Stage.AssetTypeName,  
AssetTypeActive = Stage.AssetTypeActive,  
--InsertDate = Stage.InsertDate,  
LastUpdateDate = Stage.LastUpdateDate  
FROM dbo.Dim_AssetType DAT    
INNER JOIN dbo.Dim_AssetType_Stage Stage    
 ON Stage.AssetTypeId_NK = DAT.AssetTypeId_NK     
  
  
------------------------ Inserting new records    ------------------------  
    
    
INSERT INTO Dim_AssetType(--AssetTypeId_NK,  
AssetTypeName,  
AssetTypeActive,  
InsertDate
--,LastUpdateDate
)  
SELECT    
--Stage.AssetTypeId_NK,  
Stage.AssetTypeName,  
Stage.AssetTypeActive,  
Stage.InsertDate
--,  Stage.LastUpdateDate  
FROM dbo.Dim_AssetType_Stage Stage    
LEFT JOIN dbo.Dim_AssetType DAT  
  ON Stage.AssetTypeId_NK = DAT.AssetTypeId_NK     
WHERE     
DAT.AssetTypeId_NK IS NULL    
    
RETURN @@Error 