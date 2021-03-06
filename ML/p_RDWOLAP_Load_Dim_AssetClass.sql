USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_AssetClass]    Script Date: 04/04/2008 14:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Select * from Dim_AssetClass
*/
CREATE PROCEDURE  [dbo].[p_RDWOLAP_Load_Dim_AssetClass]  
AS  

/*  
------------------ Updating the existing records ------------------  
    
UPDATE Dim_AssetClass    
SET      
AssetClassName = Stage.AssetClassName,
AssetClassActive = Stage.AssetClassActive,
--InsertDate = InsertDate,
LastUpdateDate = Stage.LastUpdateDate
FROM dbo.Dim_AssetClass DAC    
INNER JOIN dbo.Dim_AssetClass_Stage Stage    
 ON Stage.AssetClassId_NK = DAC.AssetClassId_NK     
  
  
------------------------ Inserting new records    ------------------------  
    
    
INSERT INTO Dim_AssetClass(--AssetTypeId_NK,  
AssetClassName,
AssetClassActive,
InsertDate
--,LastUpdateDate
)  
SELECT    
--Stage.AssetTypeId_NK,  
Stage.AssetClassName,  
Stage.AssetClassActive,  
Stage.InsertDate
--,  Stage.LastUpdateDate  
FROM dbo.Dim_AssetClass_Stage Stage    
LEFT JOIN dbo.Dim_AssetClass DAC  
  ON Stage.AssetClassId_NK = DAC.AssetClassId_NK     
WHERE     
DAC.AssetClassId_NK  IS NULL    
*/

INSERT INTO dbo.Dim_AssetClass
SELECT
	SourceID          = ENT_PROP.ENT_PROP_ID, 
	LookupValue       = ENT_PROP.NM,
	ACTV_IN,
	GETDATE(),
	NULL
 	
FROM	RDWDB.dbo.ENT_PROP ENT_PROP
WHERE	ENT_PROP.ENT_TYP_ID IN ( 11)
		AND NOT EXISTS(SELECT * FROM dbo.Dim_AssetClass WHERE ENT_PROP.ENT_PROP_ID=AssetClassId_NK)
UNION ALL
SELECT -1,'None','N',GETDATE(),NULL
WHERE
	NOT EXISTS(SELECT * FROM dbo.Dim_AssetClass WHERE AssetClassId_NK=-1)
    
RETURN @@Error 
