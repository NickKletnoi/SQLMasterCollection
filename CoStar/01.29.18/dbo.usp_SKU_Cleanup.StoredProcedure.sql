USE [RevPro]
GO
/****** Object:  StoredProcedure [dbo].[usp_SKU_Cleanup]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_SKU_Cleanup]
AS

IF OBJECT_ID('tempdb..TL', 'U') IS NOT NULL DROP TABLE tempdb..TL;
-------------------------------------------------------------------------------------------
----------------- First Plug the SKUID holes  ---------------------------------------------
-------------------------------------------------------------------------------------------
UPDATE LI
SET LI.SKUID = dbo.fnGetMaxSku(ContractID)
FROM dbo.LineItem LI WHERE LI.SKUID=-1;

-------------- Now Insert Data into the Master Tables from the current batch ------------
SELECT L.ContractID,L.LineItemID,L.SKUID
INTO #TL
FROM Lineitem L
WHERE L.LineitemID NOT IN (SELECT Lineitemid FROM Active_SOFile)

-----------------------------------------------------------------------------------------
INSERT [dbo].[SkuBridge] ([LineItemID],[SKUID],AuditDate) 
SELECT LineItemID, SKUID,GETDATE() FROM #TL T 
WHERE T.LineItemID NOT IN (SELECT DISTINCT LineItemID from dbo.SkuBridge) ;

--- --- Take care of dups in case any crawl into the Bridge------------------------------
WITH BridgeDups AS (
SELECT LineItemID,ROW_NUMBER() OVER (Partition by LineItemID ORDER BY SKUID) rn
FROM dbo.SkuBridge )
DELETE FROM BridgeDups WHERE rn>1;

-------- Take care of dups in case any crawl into the SkuPrice --------------------------
WITH SKUdups AS (
SELECT SKUID , ROW_NUMBER() OVER (Partition by SKUID ORDER BY SKUID) rn
FROM dbo.SkuPrice )
DELETE FROM SKUdups WHERE rn>1;
-------------------------------------------------------------------------------------------
----------------- Insert New Records into the Active SO file -----------------------------
------------------------------------------------------------------------------------------
INSERT [dbo].[Active_SOFile] ([ContractID],[LineItemID],[StatusFlg],AuditDate) 
SELECT T.[ContractID],T.[LineItemID],PC.StatusFlg,GETDATE() FROM #TL T 
JOIN dbo.ProcessedContracts PC ON T.ContractID=PC.ContractID
WHERE T.LineItemID NOT IN (SELECT DISTINCT LineItemID from dbo.Active_SOFile) ;
------------------------------------------------------------------------------
---- Take care of the Contract which changed status to Inactive ----------------------------
update PC
set PC.StatusFlg='I'
from dbo.ProcessedContracts PC where ContractID IN (
select distinct contractid from Staging..LineItem LI where LI.LineItemStatusID<>1);

---------------- SYNC up Active_SOFile with ASO --------------------------------------------- 

INSERT [dbo].[Active_SOFile] ([ContractID],[LineItemID],[StatusFlg],[AuditDate])
SELECT ContractID as ContractID, LineItemID as LineItemID, 'P' StatusFlg,GETDATE() as AuditDate
FROM Staging..LineItem LI1 where LI1.ContractID IN (
SELECT PC.ContractID FROM dbo.ProcessedContracts PC where pc.StatusFlg<>'I'
and PC.ContractID NOT IN (select distinct contractid from dbo.Active_SOFile));

--INSERT [dbo].[Active_SOFile] ([ContractID],[LineItemID],[StatusFlg],[AuditDate])
--SELECT ContractID, LineItemID, 'P' StatusFlg,GETDATE() AuditDate
--FROM Staging..LineItem LI1 where LI1.ContractID IN (
--SELECT PC.ContractID FROM dbo.ProcessedContracts PC WHERE PC.ContractID IN (
--SELECT DISTINCT LI.Contractid FROM Staging..LineItem LI WHERE LI.LineItemStatusID=1
--EXCEPT
--SELECT DISTINCT LI.Contractid  FROM
--dbo.SkuBridge SB JOIN Staging..LineItem LI ON LI.LineItemID=SB.LineItemID 
--WHERE LI.LineItemStatusID=1 ));


-------------------------------------------------------------------------------------------------------
----- Take care of Contracts that had processing status hung due to SKU -1 or sku errors inside the 
----- contract for that run;
-------------------------------------------------------------------------------------------------------
UPDATE PC
SET PC.StatusFlg='H'
FROM dbo.ProcessedContracts PC WHERE PC.StatusFlg='U' AND
convert(varchar(10),statusdatetime,101)=convert(varchar(10),getdate(),101)
----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
------------------------ Apartment & LoopNet SkuName quick fixes (hole plugs )start ----
------------------------ build temp table for apartment fix and temp LoopNet Naming-----
----------------------------------------------------------------------------------------
IF OBJECT_ID('tempdb..AptSkuNameFix', 'U') IS NOT NULL DROP TABLE tempdb..AptSkuNameFix;
------
select
Convert(varchar(10),P.SKUID)+'-'+ P.SkuPart as SkuName,
SB.LineItemID,
P.SKUID
INTO #AptSkuNameFix
from dbo.SkuBridge SB JOIN Staging..LineItem LI 
ON SB.LineItemID=LI.LineItemID JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID LEFT JOIN apt.Product P 
ON LI.ProductID=P.ProductID  
WHERE P.ProductID IS NOT NULL AND
LI.ContractID IN (Select ContractID from dbo.Contract_Input_List);
------------------- update from this table the SB bridge for Apts in todays load only
update SB
set SB.SKUID=A.SKUID
from  #AptSkuNameFix A JOIN dbo.SkuBridge SB on A.LineItemID=SB.LineItemID JOIN Staging..LineItem LI
ON LI.LineItemID=SB.LineItemID WHERE
LI.ContractID IN (Select ContractID from dbo.Contract_Input_List);

-----------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
--DELETE a 
--FROM dbo.Active_SOFile a JOIN Staging..LineItem l ON a.LineItemID = l.LineItemID
--         WHERE l.LineItemStatusID<>1;
---------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

------------------------------- Perm Fix For Apartments ----------------------------------------------
IF OBJECT_ID('tempdb..A', 'U') IS NOT NULL DROP TABLE tempdb..A;
WITH apt AS (
select DISTINCT RIGHT(SP1.SkuName,LEN(SP1.SkuName)-6) as AptSkuNameStub,SKUID from RevPro..SkuPrice SP1 
where SP1.ProductCategory  Like '%Apartments%')
SELECT LI.ContractID,LI.LineItemID,P.ProductDesc,SP.SKUID,SP.SkuName,CASE WHEN PAU.NumUnits>80 THEN 'P' ELSE 'M' END AS Units,
'Apts' as ProdCat, CASE WHEN P.ProductDesc LIKE '%Gold%' THEN 'Gold'
             WHEN P.ProductDesc LIKE '%Silver%' THEN 'Silver'
			 WHEN P.ProductDesc LIKE '%Diamond%' THEN 'Diamond'
			 WHEN P.ProductDesc LIKE '%Platinum%' THEN 'Platinum'
			 WHEN P.ProductDesc LIKE 'LN%Gold%'  THEN 'LN-Gold'
			 WHEN P.ProductDesc LIKE 'LN%Silver%' THEN 'LN-Silver'
			 WHEN P.ProductDesc LIKE 'LN%Diamond%' THEN 'LN-Diamond'
			 WHEN P.ProductDesc LIKE 'LN%Platinum%' THEN 'LN-Platinum'
			 ELSE 'Unknown' END as ProductPart, ISNULL(LI.ContractTermMonths-1,12) as Term,
			 
'Apts'+'-'+
CASE WHEN P.ProductDesc LIKE '%Gold%' THEN 'Gold'
             WHEN P.ProductDesc LIKE '%Silver%' THEN 'Silver'
			 WHEN P.ProductDesc LIKE '%Diamond%' THEN 'Diamond'
			 WHEN P.ProductDesc LIKE '%Platinum%' THEN 'Platinum'
			 WHEN P.ProductDesc LIKE 'LN%Gold%'  THEN 'LN-Gold'
			 WHEN P.ProductDesc LIKE 'LN%Silver%' THEN 'LN-Silver'
			 WHEN P.ProductDesc LIKE 'LN%Diamond%' THEN 'LN-Diamond'
			 WHEN P.ProductDesc LIKE 'LN%Platinum%' THEN 'LN-Platinum'
			 ELSE 'Unknown' END +'-'+
CASE WHEN PAU.NumUnits>80 THEN 'P' ELSE 'M' END +'-'+ Convert(varchar(10),ISNULL(LI.ContractTermMonths-1,12)) AS NewSkuName,apt.SKUID as NewSKUID
into #A
FROM  Staging..LineItem LI 
JOIN Staging..LocationOccupancy LO ON LI.SiteLocationID=LO.TenantLocationID
JOIN Staging..PropertyApartmentUnit PAU ON PAU.PropertyApartmentUnitID=LO.PropertyID
JOIN RevPro..SkuBridge SB ON SB.LineItemID=LI.LineItemID JOIN RevPro..SkuPrice SP ON SB.SKUID=SP.SKUID
JOIN RevPro.[apt].[Product] P ON LI.ProductID=P.ProductID
JOIN apt ON apt.AptSkuNameStub=
'Apts'+'-'+
CASE WHEN P.ProductDesc LIKE '%Gold%' THEN 'Gold'
             WHEN P.ProductDesc LIKE '%Silver%' THEN 'Silver'
			 WHEN P.ProductDesc LIKE '%Diamond%' THEN 'Diamond'
			 WHEN P.ProductDesc LIKE '%Platinum%' THEN 'Platinum'
			 WHEN P.ProductDesc LIKE 'LN%Gold%'  THEN 'LN-Gold'
			 WHEN P.ProductDesc LIKE 'LN%Silver%' THEN 'LN-Silver'
			 WHEN P.ProductDesc LIKE 'LN%Diamond%' THEN 'LN-Diamond'
			 WHEN P.ProductDesc LIKE 'LN%Platinum%' THEN 'LN-Platinum'
			 ELSE 'Unknown' END +'-'+
CASE WHEN PAU.NumUnits>80 THEN 'P' ELSE 'M' END +'-'+ Convert(varchar(10),ISNULL(LI.ContractTermMonths-1,12))
WHERE LI.ContractID IN (select distinct ContractID from RevPro..Contract_Input_List);
---------------------------------------------------------------------------------------------------------------
WITH Aptdups as (
select LineItemID, ROW_NUMBER() OVER (Partition by LineItemID ORDER BY NewSKUID DESC ) rn
from #A)
delete from Aptdups where rn>1;
----------------------------------------------------------------------------------------------------------------
UPDATE SB
SET SB.SKUID=NAS.NewSKUID
FROM RevPro..SkuBridge SB JOIN #A NAS ON SB.LineItemID=NAS.LineItemID;
-------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('tempdb..A', 'U') IS NOT NULL DROP TABLE tempdb..A;
--------------------------------------------------------------------------------------------------------------










GO
