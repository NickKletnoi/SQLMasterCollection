
select count(*) from dbo.Sku;
select count(*) from dbo.SkuPrice;
select count(*) from dbo.SkuBridge;


--EXEC [dbo].[usp_SKU_MSTR]


SELECT contractid, SKUID, count(*) cnt
INTO #tempGoodContracts
FROM dbo.LineItem where contractid not in (
select distinct contractid 
from dbo.Lineitem where SKUID=-1 
)
group by 
contractid, SKUID

select * from #tempGoodContracts

INSERT [dbo].[SkuBridge] ([LineItemID],[SKUID])
SELECT LineItemID, SKUID FROM dbo.LineItem where ContractID IN (
SELECT DISTINCT CONTRACTID FROM #tempGoodContracts
)
----------------------------------------------
delete from dbo.LineItem where contractid IN (
SELECT DISTINCT CONTRACTID FROM #tempGoodContracts
)-----------------------------------------------------
select * from dbo.LineItem --------------------------
-----------------------------------------------------
select 
    round(185.9148,2) as OriginalNumber, 
    round(185.9148,3)  as AferRoundingApplied
-----------------------------------------------------------
select 
    round(185.9148,2) as OriginalNumber, 
    cast(round(185.9148,3) as numeric(36,2)) as AferRoundingApplied
------------------------------------------------------------
INSERT [dbo].[SkuBridge] ([LineItemID],[SKUID])
SELECT [LineItemID],[SKUID] FROM [dbo].[SkuBridge1];
--------------------------------------------------------------

DELETE FROM dbo.LineItem where LineItemID in  (
select distinct LineItemID from dbo.SkuBridge1
)
----------------------------------------------
----------------------------------------------
SELECT CONTRACTID, COUNT(*) AS CNT
INTO #ProblemContractList
FROM  dbo.LineItem
GROUP BY CONTRACTID
ORDER BY CNT ASC


select * from dbo.LineItem L JOIN #ProblemContractList PCL ON L.ContractID=PCL.ContractID
ORDER BY PCL.CNT ASC

delete from dbo.ProcessedContracts where ContractID IN (
select distinct ContractID from #ProblemContractList )
-----------------------------------------------
-----------------------------------------------
select * from dbo.ProcessedContracts;---------
----------------------------------------------
----------------------------------------------

