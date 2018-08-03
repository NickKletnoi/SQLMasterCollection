USE [CoStar]
GO

SELECT [SKUID]
      ,[SkuName]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[Amount]
INTO dbo.Sku1      
  FROM [dbo].[Sku]
GO


select * 
INTO dbo.SkuBridge1
from dbo.SkuBridge

select * INTO revenue.Sku from dbo.Sku1;
select * INTO revenue.SkuPrice from dbo.SkuPrice1;
select * INTO revenue.SkuBridge from dbo.SkuBridge1;

select * from dbo.SkuApptsFinal
select * from dbo.SkuPrice where ProductCategory='Apartments'

select * from dbo.SkuName

select * from dbo.SkuListPriced
-----------------------------------
select * from revenue.SkuPrice
-----------------------------------

select MIN(SKUID), MAX(SKUID) from dbo.SkuPrice where flg='B'
select SKUID from dbo.SkuPrice where flg='A' order by SKUID desc
-------------------------------------------------------------------

select count(*) from revenue.SkuBridge














