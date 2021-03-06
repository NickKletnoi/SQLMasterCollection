USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_InstrumentType]    Script Date: 04/04/2008 14:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- SP to load Dim_InstrumentType from Stage table:

Create Procedure  [dbo].[p_RDWOLAP_Load_Dim_InstrumentType]  
AS    
------------------ Updating the existing records ------------------  
    
UPDATE Dim_InstrumentType    
SET      
InstrumentTypeName = Stage.InstrumentTypeName,
InstrumentTypeActive = Stage.InstrumentTypeActive,  
--InsertDate = Stage.InsertDate,  
LastUpdateDate = Stage.LastUpdateDate  
FROM dbo.Dim_InstrumentType DAT    
INNER JOIN dbo.Dim_InstrumentType_Stage Stage    
 ON Stage.InstrumentTypeId_NK = DAT.InstrumentTypeId_NK     
  
  
------------------------ Inserting new records    ------------------------  
    
    
INSERT INTO Dim_InstrumentType(--InstrumentTypeId_NK,  
InstrumentTypeName,  
InstrumentTypeActive,  
InsertDate
--,LastUpdateDate
)  
SELECT    
--Stage.InstrumentTypeId_NK,  
Stage.InstrumentTypeName,  
Stage.InstrumentTypeActive,  
Stage.InsertDate
--,  Stage.LastUpdateDate  
FROM dbo.Dim_InstrumentType_Stage Stage    
LEFT JOIN dbo.Dim_InstrumentType DAT  
  ON Stage.InstrumentTypeId_NK = DAT.InstrumentTypeId_NK     
WHERE     
DAT.InstrumentTypeId_NK IS NULL    
    
RETURN @@Error 

--------------------------------------------------------------------------------------

