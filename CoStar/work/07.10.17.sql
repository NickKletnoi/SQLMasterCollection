select distinct lineitemid from [err].[LineItemX]

select count(*) from dbo.sku
select count(*) from revenue.Sku
-----
select count(*) from dbo.SkuPrice

select distinct skuid from dbo.SkuPrice
select distinct SKUID from revenue.SkuPrice
------------------------------------------------
select count(*) from  revenue.SkuPrice;
------------------------------------------------
------------------------------------------------
WITH dups as
(
select SKUID, ROW_NUMBER() OVER (PARTITION BY SKUID ORDER BY SKUID) as rn
from revenue.SkuPrice 
)
select *  FROM dups where rn>1;
DELETE FROM dups where rn>1;
-------------------------------------------------------
------------------------------------------------------


INSERT revenue.SkuPrice (
        [SKUID]
      ,[SkuName]
      ,[Price]
      ,[Listed_Price]
      ,[LastUpdateDate]
      ,[GLAccountName]
)
select 
       [SKUID]
      ,[SkuName]
      ,[Price]
      ,[Listed_Price]
      ,[LastUpdateDate]
      ,[GLAccountName]
 from dbo.SkuPrice where SKUID not in  (
select distinct SKUID from revenue.SkuPrice)
-------------------------------------------------------
-------------------------------------------------------
select PP.SKUID, SP.SkuName, SP.CustomerPricingCategory,SP.ProductCategory, PP.AvgInvoicePriceAmt 
from [cube].[F_ProductPrice] PP JOIN revenue.SkuPrice SP ON 
PP.SKUID=SP.SKUID where AvgInvoicePriceAmt>20 
order by SP.CustomerPricingCategory;
--------------------------------------------------------
/* add the missing sku's to the dbo.SkuPrice table */
--------------------------------------------------------
--------------------------------------------------------
select SP.skuid, SP.skuname 
from revenue.SkuPrice SP JOIN [dbo].[616Sku] S ON SP.SKUID=S.SKUID
UNION
select skuid, SkuName from revenue.SkuPrice where ProductCategory='Apartments' and Price is not null
--------------------------------------------------------
--Order by SkuName DESC---------------------------------
--------------------------------------------------------
select * from revenue.SkuPrice;
--------------------------------------------------------
-- /* THIS IS THE WHOLE AREA THAT I WANT TO ADDRESS  */


select count(*) from dbo.SkuPrice;
select count(distinct SKUID) from dbo.SkuPrice;
-----------------
select count(*) from revenue.SkuPrice;
select count(distinct SKUID) from revenue.SkuPrice;
-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
---- SYNC THE SKU DETAILS TABLES --------------------
-----------------------------------------------------
-----------------------------------------------------
-- 11,150 - TOTAL SKU COUNT 07.10.17-----------------
-----------------------------------------------------
select count(*) from dbo.Sku;
select count(distinct SKUID) from dbo.Sku;
-----------------
select count(*) from revenue.Sku;
select count(distinct SKUID) from revenue.Sku;
-----------------
INSERT [revenue].[Sku] (
       [SKUID]
      ,[SkuName]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[Amount]
      ,[GLAccountName]
)
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
 from dbo.Sku where SKUID not in  (
select distinct SKUID from revenue.Sku)
-------------------------------------------
--------------------------------------------------------
--- SYNC THE SKU_BRIDGES -------------------------------
--------------------------------------------------------
--------------------------------------------------------
select count(*) from dbo.SkuBridge;
select count(distinct SKUID) from dbo.SkuBridge;
--------------------------------------------------------
select count(*) from revenue.SkuBridge;
select count(distinct SKUID) from revenue.SkuBridge;
--------------------------------------------------------
WITH dups as
(
select LineItemID, ROW_NUMBER() OVER (PARTITION BY LineItemID ORDER BY SKUID) as rn
from revenue.SkuBridge
)
select *  FROM dups where rn>1;
--DELETE FROM dups where rn>1;

select * 
INTO dbo.SkuBridge
from revenue.SkuBridge order by SKUID
-----------------------------------------------------------------------------------------------------
----- flush out the no-name sku's into their separate table in case you need to un-do the nameing----
------------------------------------------------------------------------------------------------------
select count(distinct skuid) from dbo.SkuPrice where SkuName is null;
select count(distinct skuid) from dbo.Sku where SkuName is null; 
-----
select count(distinct skuid) from revenue.SkuPrice where SkuName is null;
select count(distinct skuid) from revenue.Sku where SkuName is null; 

select distinct SKUID from dbo.sku where SKUID not in (select distinct skuid from dbo.SkuPrice where SkuName is null)
and SkuName is null

select * from dbo.sku where SKUID=999999999
select * from dbo.SkuPrice where SKUID=999999999

update S
set S.SkuName='999999999-Unknown' from revenue.Sku S where SKUID=999999999


select * 
INTO err.SkuNoName5479
from revenue.Sku where SkuName is null;

select * from [err].[SkuNoName5479]

select * from [err].[SkuPriceNoName1439]
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------- SKU NAMING RESIDUAL --------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
select count(*) from err.SkuPriceNoName1439

SELECT NN.SKUID,NN.MarketID, COUNT(*) CNT
--INTO #TEMP_SKU2
FROM 

(

SELECT DISTINCT 
SKUID, 
CAST(SKUID AS VARCHAR(20)) +'-'+ 

(SELECT TOP 1 P.ProductDesc from err.SkuNoName5479 S5 JOIN dbo.Product P ON S5.ProductID=P.ProductID
where S5.SKUID=S1.SKUID)  +'-'+

CAST(
(SELECT TOP 1 M.MarketName from err.SkuNoName5479 S2 JOIN dbo.Market M ON S2.MarketID=M.MarketID
 where S2.SKUID=S1.SKUID) AS VARCHAR(100) ) +'-'+
CAST(
(SELECT TOP 1 UserCount from err.SkuNoName5479 S3  
where S3.SKUID=S1.SKUID) as Varchar(100)) +'-'+
CAST(
(SELECT TOP 1 BTC.BusinessTypeCategory from err.SkuNoName5479 S4 
JOIN dbo.BusinessTypeCategory BTC ON 
S4.CustomerType=BTC.BusinessTypeCategoryID
where S4.SKUID=S1.SKUID) as Varchar(100))
as SkuName 
INTO #tempSkuName2
FROM [err].[SkuNoName5479] S1 
WHERE S1.SkuName IS NULL and S1.SKUID NOT IN (SELECT DISTINCT SKUID FROM [err].[SkuNonSingle19])  

----------------------------------------------------------------------------------------------------

delete from #tempSkuName2 where SkuName is null

--select * from [dbo].[BusinessType]

update SP
set SP.SkuName=T.SkuName
from [err].[SkuPriceNoName1439] SP JOIN #tempSkuName2 T ON SP.SKUID=T.SKUID

select 
S.SKUID,
S.SkuName,
S.MarketID,
S.ProductID
into #tempProbSku
from [err].[SkuNoName5479] S JOIN [err].[SkuPriceNoName1439] SP ON S.SKUID=SP.SKUID 
where SP.SkuName is null

select SKUID, count(*) as cnt 
INTO err.SkuNonSingle19
from #tempProbSku
group by SKUID
having count(*)>1
-------------------------------

select * from [err].[SkuNonSingle19]

update S
SET S.SkuName=SP.SkuName
FROM [err].[SkuNoName5479] S JOIN [err].[SkuPriceNoName1439] SP ON S.SKUID=SP.SKUID

[err].[SkuNoName5479]

select count(*) from [err].[SkuNoName5479] where SkuName is null
select count(*) from [err].[SkuPriceNoName1439] where SkuName is null

select * from dbo.Sku where SkuName like '%99999%'

select * from [err].[SkuPriceNoName1439]
--select * from revenue.SkuPrice

--999999999	999999999-Unknown

update S
set 
S.[SkuName]=CAST(SKUID as Varchar(100)) +'-'+'Unknown'
 FROM [err].[SkuPriceNoName1439] S where SkuName is null
 -------------

 select CAST(SKUID as Varchar(100)) +'-'+'Unknown' from [err].[SkuPriceNoName1439] S where SkuName is null



) NN
--WHERE NN.PRODUCTID IN (1,2,5)
GROUP BY NN.SKUID,NN.MarketID
--ORDER BY SKUID
--HAVING COUNT(*)>1;

SELECT * 
INTO #TEMP_SKU3
FROM #TEMP_SKU2
ORDER BY SKUID, MarketID

SELECT SKUID,COUNT(*)
FROM #TEMP_SKU3
GROUP BY SKUID
HAVING COUNT(*)>1

SELECT * FROM #TEMP_SKU3


select * from dbo.Market


select count(*) from [err].[SkuPriceNoName1439] where SkuName is null
select count(*) from [err].[SkuNoName5479] where SkuName is null

update S
set S.SkuName=S1.SkuName
from dbo.Sku S JOIN [err].[SkuNoName5479] S1 ON S.SKUID=S1.SKUID
-------------
update SP
set SP.SkuName=SP1.SkuName
from dbo.SkuPrice SP JOIN [err].[SkuPriceNoName1439] SP1 ON SP.SKUID=SP1.SKUID
---------------------------------------------------------------------------

select * from revenue.SkuPrice where CustomerPricingCategory='Undefined' and SkuName NOT like'%Unknown%'


----------------------------------------------------------------------------
update S
set S.SkuName=S1.SkuName
from revenue.Sku S JOIN [err].[SkuNoName5479] S1 ON S.SKUID=S1.SKUID
-------------
update SP
set SP.SkuName=SP1.SkuName
from revenue.SkuPrice SP JOIN [err].[SkuPriceNoName1439] SP1 ON SP.SKUID=SP1.SKUID

select * from [revenue].[SkuPrice]