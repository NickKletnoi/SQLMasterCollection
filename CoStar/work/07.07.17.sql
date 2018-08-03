exec [dbo].[uspLOAD_LineItem]

delete from dbo.LineItem where BundleID=-1;

select * from dbo.LineItem
order by ContractID, ProductID


insert [dbo].[Contract_Input_List]([ContractID])
select distinct contractid from dbo.LineItem order by contractid;

select * from [dbo].[Contract_Input_List]

select * from dbo.SkuPrice
--11,138
select * from dbo.Sku
--81,099

exec [dbo].[uspProcessContracts]
---------------------------------------------------------------------
SELECT 
ContractID,
ProductID,
DATE,
ROW_NUMBER() OVER (PARTITION BY CONTRACTID,DATE ORDER BY CONTRACTID,DATE) as BundleID,
Amount
FROM dbo.lineItem
----------------------------------------------------------------------

SELECT *
INTO err.LineItemX24134NoSkuID 
FROM dbo.LineItem where SKUID=-1

SELECT LineItemID, SKUID 
INTO [revenue].[SkuBridgeX]
from dbo.LineItem where SKUID<>-1
---------------------------------------------------------------------
--84,897
select distinct lineitemid from [revenue].[SkuBridgeX]

with dups as (
select LineItemid, ROW_NUMBER() OVER (PARTITION BY LineItemID order by Date) as rn from dbo.LineItem
)
delete from dups where rn>1;

select * from [revenue].[SkuBridgeX] order by SKUID
-------------------------------------------------------

select count(*) from  [revenue].[SkuBridgeX] 

select * 

from dbo.sku where SKUID NOT IN (select skuid from revenue.SkuPrice)

select * 
INTO dbo.SkuPriceX
from dbo.SkuPrice where SKUID NOT IN (select SKUID from revenue.SkuPrice)
order by SKUID
-----------------------
select * 
INTO dbo.SkuX
from dbo.Sku where SKUID NOT IN (select distinct SKUID from revenue.Sku)
order by SKUID
-----------------------

select Distinct [LineItemID],[SKUID] 
into dbo.SkuBridgeX
from dbo.LineItem where SKUID NOT IN (select distinct SKUID from revenue.sku) and SKUID<>-1

select distinct skuid from #SkuBridgeX

select * INTO [revenue].[SkuX] from [dbo].[SkuX];
select * INTO [revenue].[SkuPriceX] from [dbo].[SkuPriceX];

select * INTO [revenue].[SkuBridgeX] from [dbo].[SkuBridgeX];

select distinct skuid from revenue.SkuBridgeX
---------------------------------------------------------------
---------------------------------------------------------------

EXEC [dbo].[uspLOAD_LineItem];


delete from [dbo].LineItem where LineItemID IN (select distinct LineItemID from revenue.SkuBridgeX)

select distinct LineItemID from  [dbo].LineItem;

delete from [dbo].LineItem where BundleID<>-1

select * from  [dbo].LineItem;
---------------------------------------------------------------

SELECT 
ContractID,
ProductID,
DATE,
ROW_NUMBER() OVER (PARTITION BY DATE ORDER BY ContractID) as BundleID,
Amount
--INTO #LineItemX
FROM dbo.lineItem
ORDER BY ContractID,ProductID,DATE
--------------------------------------------------------------------------

select * from #LineItemX

select 
ContractID, 
Date, 
rank() Over (partition by Contractid,Date order by Contractid,Date) as BundleID
from dbo.LineItem
----------------------



select contractid, date, count(*) as BundleID
INTO #LineItemUpateBundle
 from dbo.LineItem
 group by  contractid, date
order by Contractid, date, count(*);

update LI
SET LI.BundleID=LIB.BundleID
from dbo.LineItem LI JOIN #LineItemUpateBundle LIB ON LI.ContractID=LIB.ContractID AND LI.Date=LIB.Date;

drop table #LineItemUpateBundle;
---------------------------------------------

select * from dbo.LineItem order by Contractid, Date
----------------------------------------------


truncate table [dbo].[Contract_Input_List]

insert [dbo].[Contract_Input_List]([ContractID])
select distinct ContractID from dbo.LineItem
order by ContractID

select count(*) from dbo.SkuPrice --11,737
select count(*) from dbo.Sku --84,695

select count(*) from dbo.LineItem

select * from dbo.LineItem where ContractID=83492
order by BundleID

delete from dbo.LineItem where BundleID=-1


EXEC [dbo].[uspProcessContracts]

select * from dbo.LineItem 
where SKUID<>-1


update dbo.LineItem set SKUID=-1 where SKUID<>-1

select distinct contractid from dbo.LineItem
select distinct contractid from dbo.Contract_Input_List


INSERT [revenue].[SkuBridgeX](LineItemID,  SKUID )
select distinct LineItemID,  SKUID 
from dbo.LineItem where SKUID<>-1

drop table #LenderSku

select SKUID,SkuName, -1 as LineItemID
into #LenderSku
from [revenue].[SkuPrice] where SkuName like '%Lender%' and SKUID not in (
select distinct SKUID from [dbo].[616Sku])

select * from #LenderSku

update LS
set LS.LineItemID=SB.LineItemID
from #LenderSku LS JOIN revenue.SkuBridge SB ON LS.SKUID=SB.SKUID

select * 
into price.LenderSku
from #LenderSku

select * from Price.LenderSku



select * from [revenue].[SkuPrice]

select * from [cube].[F_ProductPrice] where SKUID=11020

select * 

from #LenderSku


delete from [dbo].[Contract_Input_List] where ContractID in (
select distinct ContractID from dbo.LineItem where SKUID<>-1)


select * from [dbo].[Contract_Input_List] 

select distinct skuid from dbo.LineItem


INSERT revenue.[SkuX] (
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

SELECT [SKUID]
      ,[SkuName]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[Amount]
      ,[GLAccountName]
from [dbo].[Sku] where SKUID IN (select distinct SKUID from dbo.LineItem where SKUID<>-1)
---------------------------------------------------------------------------------------------

INSERT [revenue].[SkuPrice] (
        [SKUID]
      ,[SkuName]
      ,[Price]
      ,[Listed_Price]
      ,[LastUpdateDate]
      ,[GLAccountName]
      
 
)
SELECT [SKUID]
      ,[SkuName]
      ,[Price]
      ,[Listed_Price]
      ,[LastUpdateDate]
      ,[GLAccountName]
      
  FROM dbo.[SkuPrice] where SKUID IN (select distinct SKUID from dbo.LineItem where SKUID<>-1)

  select * from dbo.sku

  delete from dbo.sku where skuid



USE master;

GO

ALTER DATABASE CoStar

Modify Name = CoStar0707 ;

GO







