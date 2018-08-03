select * 
into [stg].[StraightLineContracts]
from [dbo].[StraightLineContracts];


select * 
into [stg].[StraightLineDiscountContracts]
from [dbo].[StraightLineDiscountContracts];

select * 
into bkp.[StraightLineDiscountContracts]
from [dbo].[StraightLineDiscountContracts];
----

select * 
into [bkp].[StraightLineContracts]
from [dbo].[StraightLineContracts];

select count(*) [Active_SOFile]  from [bkp].[Active_SOFile]
select count(*) [Sku] from [bkp].[Sku]
select count(*) [SkuBridge] from [bkp].[SkuBridge]
select count(*)  [SkuPrice] from [bkp].[SkuPrice]
select count(*) [StraightLineContracts] from [bkp].[StraightLineContracts]
select count(*) [StraightLineDiscountContracts] from [bkp].[StraightLineDiscountContracts]
--------------------------------------------------------
select count(*) [Active_SOFile] from [dbo].[Active_SOFile]
select count(*) [Sku] from [dbo].[Sku]
select count(*) [SkuBridge] from [dbo].[SkuBridge]
select count(*) [SkuPrice] from [dbo].[SkuPrice]
select count(*) [StraightLineContracts] from [dbo].[StraightLineContracts]
select count(*) [StraightLineDiscountContracts] from [dbo].[StraightLineDiscountContracts]
---------------------------------
drop table [bkp].[Active_SOFile];
drop table [bkp].[Sku];
drop table [bkp].[SkuBridge];
drop table [bkp].[SkuPrice];
drop table [bkp].[StraightLineContracts];
drop table [bkp].[StraightLineDiscountContracts];
-----------------------------------------------------

select * into [bkp].[Active_SOFile] from [dbo].[Active_SOFile];
select * into [bkp].[Sku] from [dbo].[Sku];
select * into [bkp].[SkuBridge] from [dbo].[SkuBridge];
select * into [bkp].[SkuPrice] from [dbo].[SkuPrice];
select * into [dbo].[StraightLineContracts] from [bkp].[StraightLineContracts];
select * into [dbo].[StraightLineDiscountContracts] from [bkp].[StraightLineDiscountContracts];
-----------------------------------------------------
select count(*) [StraightLineContracts] from [bkp].[StraightLineContracts]
select count(*) [StraightLineDiscountContracts] from [bkp].[StraightLineDiscountContracts]
------------------------------------------------------------------------------------------
select count(*) [StraightLineContracts] from [dbo].[StraightLineContracts]
select count(*) [StraightLineDiscountContracts] from [dbo].[StraightLineDiscountContracts]
-------------------------------------------------------------------------------------------
drop table dbo.[StraightLineContracts];
DROP  dbo.[StraightLineDiscountContracts];
------------------------------------------------
------------------------------------------------
select BillingStartDate,
count(distinct billingstartdate) bsd, 
count(distinct CurrentTermStartDate) csd
from staging..LineItem 
group by billingstartdate
having count(distinct billingstartdate) <> count(distinct CurrentTermStartDate)
---
select CurrentTermStartDate,
count(distinct billingstartdate) bsd, 
count(distinct CurrentTermStartDate) csd
from staging..LineItem 
group by CurrentTermStartDate
having count(distinct billingstartdate)<>count(distinct CurrentTermStartDate)











