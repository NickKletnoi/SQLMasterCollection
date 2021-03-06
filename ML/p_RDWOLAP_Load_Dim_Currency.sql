USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_Currency]    Script Date: 04/04/2008 14:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- SP to load Dim_Currency from Stage table:

Create Procedure  [dbo].[p_RDWOLAP_Load_Dim_Currency]  
AS    
------------------ Updating the existing records ------------------  
    
UPDATE Dim_Currency    
SET      
CurrencyName = Stage.CurrencyName,
CurrencySymbol = Stage.CurrencySymbol,    
CurrencyActive = Stage.CurrencyActive,  
--InsertDate = Stage.InsertDate,  
LastUpdateDate = Stage.LastUpdateDate  
FROM dbo.Dim_Currency DAT    
INNER JOIN dbo.Dim_Currency_Stage Stage    
 ON Stage.CurrencyId_NK = DAT.CurrencyId_NK     
  
  
------------------------ Inserting new records    ------------------------  
    
    
INSERT INTO Dim_Currency(--CurrencyId_NK,  
CurrencyName,  
CurrencySymbol, 
CurrencyActive,  
InsertDate
--,LastUpdateDate
)  
SELECT    
--Stage.CurrencyId_NK,  
Stage.CurrencyName,  
Stage.CurrencySymbol, 
Stage.CurrencyActive,  
Stage.InsertDate
--,  Stage.LastUpdateDate  
FROM dbo.Dim_Currency_Stage Stage    
LEFT JOIN dbo.Dim_Currency DAT  
  ON Stage.CurrencyId_NK = DAT.CurrencyId_NK     
WHERE     
DAT.CurrencyId_NK IS NULL    
    
RETURN @@Error 

