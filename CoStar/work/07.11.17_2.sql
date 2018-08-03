USE [CoStar]
GO

INSERT INTO [revenue].[Sku]
           ([SKUID]
           ,[SkuName]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[Amount]
           ,[GLAccountName])
     select 
           [SKUID]
           ,[SkuName]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[Amount]
           ,[GLAccountName]
from dbo.Sku where SkuName is null


select * 
INTO #TempSkuName
from revenue.Sku where SkuName is null
---------------------
select  * from #TempSkuName
-----------------------------------------------------------------------------------


SELECT DISTINCT 
SKUID, 
CAST(SKUID AS VARCHAR(20)) +'-Suite-'+ CAST(
(SELECT TOP 1 M.MarketName from #TempSkuName S2 JOIN dbo.Market M ON S2.MarketID=M.MarketID
 where S2.SKUID=S1.SKUID) AS VARCHAR(100) ) +'-'+
CAST(
(SELECT TOP 1 UserCount from #TempSkuName S3  
where S3.SKUID=S1.SKUID) as Varchar(100)) +'-'+
CAST(
(SELECT TOP 1 BTC.BusinessTypeCategory from #TempSkuName S4 
JOIN dbo.BusinessTypeCategory BTC ON 
S4.CustomerType=BTC.BusinessTypeCategoryID
where S4.SKUID=S1.SKUID) as Varchar(100))
as SkuName 
INTO ##TempSkuName2
FROM #TempSkuName S1 
WHERE S1.PRODUCTID IN (1,2,5)  


select * from ##TempSkuName2

update S
Set S.SkuName=T.SkuName
from dbo.Sku S JOIN ##TempSkuName2 T ON S.SKUID=T.SKUID
--------------

update S
Set S.SkuName=T.SkuName
from dbo.SkuPrice S JOIN ##TempSkuName2 T ON S.SKUID=T.SKUID
--------------------------------------------------------------

select * from revenue.Sku where SkuName is null;


delete from dbo.LineItem where SKUID<>-1
---114,692

select * from [dbo].[LineItemGoodSKU114k]

select * from revenue.SkuBridge order by SKUID
----------------------------------------------------------
select distinct LineItemID from [dbo].[LineItemLEFTTOSKU];
----------------------------------------------------------
----------------------------------------------------------
select count(*) from dbo.Sku;
select count(*) from revenue.Sku;
----------------------------------------------------------
select count(*) from dbo.SkuPrice;
select count(*) from revenue.SkuPrice;
---------------------------------------------------------
select count(*) from dbo.SkuBridge;
select count(*) from revenue.SkuBridge;
---------------------------------------------------------
---------------------------------------------------------
-----------------------------------------------------------