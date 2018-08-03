/* Goals for today: perform some statistcs on the data and
see how viable the overall numbers are 

what we are looking for is sku count in each category and 
how much that cateogry is worth both from a standpoint of 
actual dollars that it brings in as well as the transformation
lines that it has to touch to be able to perform pricing of
that sku accordingly;
*/

select * from [revenue].[Sku]
select * from [revenue].[SkuPrice]
---------------------------------

select * from [dbo].[BusinessTypeCategory]
------------------------------------------










update SP
SET SP.CustomerPricingCategory='Appraisal/Valuation/Tax Appeal'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Appraisal/Valuation/Tax Appeal%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Brokerage/Consultants'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Brokerage/Consultants%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Lender'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Lender%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Vendor'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Vendor%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Commercial'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Commercial%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='OwnerPMC'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%OwnerPMC%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Retailer&CorporateREPricing'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Retailer&CorporateREPricing%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Unknown'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Unknown%'
----------------------------------------------------------------------------
update SP
SET SP.ProductCategory='Apartments'
from [revenue].[SkuPrice] SP where (ProductCategory LIKE  '%Appts%') OR  (ProductCategory LIKE  '%Finder%') 
----------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Undefined'
from [revenue].[SkuPrice] SP where CustomerPricingCategory IS NULL;

select * from [revenue].[SkuPrice] where [CustomerPricingCategory] is null;

select CustomerPricingCategory,count(distinct PR.SKUID) as Cnt, CAST(sum(PR.TotalMonthlyPrice) as money) as AppxDollarValue 
from [cube].[F_ProductRevenue] PR LEFT JOIN [revenue].[SkuPrice] SP ON SP.SKUID=PR.SKUID   
-- where PR.skuid  in (select skuid from [dbo].[741Sku])
group by CustomerPricingCategory
-------------
select ProductCategory,count(*) as Cnt, CAST(sum(Price) as money) as AppxDollarValue 
from [revenue].[SkuPrice] where skuid not in (select skuid from [dbo].[741Sku]) and Price>4
group by ProductCategory

-------------------------

select SP.CustomerPricingCategory ,
count(distinct PR.SKUID) as Cnt, CAST(sum(PR.TotalMonthlyPrice) as money) as AppxDollarValue,
CAST(sum(PR.[DiscountAmount]) as money) as DiscountDollarValue,
CAST(sum(PR.TotalMonthlyPrice) as money)-CAST(sum(PR.[DiscountAmount]) as money) as DifferenceValue
from [cube].[F_ProductRevenue] PR LEFT JOIN [revenue].[SkuPrice] SP ON SP.SKUID=PR.SKUID   
where PR.skuid  in (select skuid from [dbo].[616Sku])
group by CustomerPricingCategory order by 2
--------------------------------------

select * from [revenue].[SkuPrice] where ProductCategory='Other'

select * from [revenue].[Sku]
--------------------------------------------------------------
select BT.[BusinessTypeName], BTC.BusinessTypeCategory 
from [dbo].[BusinessType] BT JOIN [dbo].[BusinessTypeCategory] BTC ON 
BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
------------------------------------------------------------------
select SKUID 
INTO bug.DroppedSkus
from [dbo].[741Sku] where skuid not in (select SKUID from 
------------------------------------------------------------------
---------------------------------------------------------------
select CustomerPricingCategory, count(*) as cnt
 from [revenue].[SkuPrice] where skuid in (select skuid from [dbo].[616Sku])
 group by CustomerPricingCategory
 -----------------------------------------------------------------------
 -----------------------------------------------------------------------

 SELECT
 CAST(sum(PR.[GrossMonthlyPrice]) as money)-
 CAST(sum(PR.[DiscountAmount]) as money)
 - CAST(sum(PR.[SalesTaxAmount]) as money) as Final12AmountEnterprise,
 count(distinct [ContractID]) as distinctContractCnt
from [cube].[F_ProductRevenueENT] PR 
--where SKUID IN (select SKUID from [dbo].[616Sku])
---$615,788,876.0433 / for all periods all skus
---$91,907,412.3036
--
-------------------------------------------------------------------------
SELECT 
CAST(sum(PR.[InvoiceAmount]) as money) as Final12AmountNavision,
count(distinct [ContractID]) as distinctContractCnt
from [cube].[F_ProductRevenueNAV] PR 
--where SKUID IN (select SKUID from [dbo].[616Sku])
---$600,406,498.87 / for all periods all skus
--$63,781,107.4085
-------------------------------------------------------------------------
--3,706,206,607.17
--869,917,250.90
-------------------------------------------------------------------------
select count(*)
from [revenue].[SkuPrice]
group by [ProductCategory]
--------------------------------------------------------------------------

 select 
CAST(sum(PR.[InvoiceAmount]) as money) as AppxDollarValue
from [cube].[F_ProductRevenueNAV] PR 
WHERE PR.SKUID is not null
--600,406,498.87
-----------------------------------------------------------------------------
select min([ChargeYear]),min([ChargeMonth]) from [cube].[F_ProductRevenue]
select max([ChargeYear]),max([ChargeMonth]) from [cube].[F_ProductRevenue]
----------------------------------------------------------------------------
select * from revenue.SkuPrice where SKUID in (
select distinct skuid from [cube].[F_ProductRevenueNAV] where skuid not in (
select distinct SKUID from [cube].[F_ProductRevenue]))
-----------------------------------------------------------------------------
select * from revenue.SkuPrice where SKUID in (
select distinct skuid from [cube].[F_ProductRevenue] where skuid not in (
select distinct SKUID from [cube].[F_ProductRevenueNAV]));
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

select * 
INTO err.F_ProductRevenueSKUNegative1
from cube.F_ProductRevenue 
where SKUID=-1
-------------------------
delete from cube.F_ProductRevenue where SKUID=-1

select sum([TotalMonthlyPrice]) from [cube].[F_ProductRevenue] where SKUID=-1
select sum([TotalMonthlyPrice]) from err.F_ProductRevenueSKUNegative1


--149,366,702.28

select sum([InvoiceAmount]) from [cube].[F_ProductRevenueNAV1] where [SKUID]=-1
--2836,289,356.27

delete from [cube].[F_ProductRevenueNAV1] where SKUID=-1
------------------------------------------------------------------
------- PRICE COMPARISONS -----------------------------------------

select LP.[SKUID],SP.[SkuName],LP.Price as ListedPrice, PP.Price as AveragePriceNav
from [cube].[F_ProductPrice] PP JOIN [dbo].[616SkuListPriced] LP ON 
PP.SKUID=LP.SKUID JOIN revenue.SkuPrice SP ON PP.SKUID=SP.SKUID
ORDER BY LP.SKUID
------------------------------------------------------


select * from [cube].[F_ProductRevenueENT] where SKUID=29256
select * from [cube].[F_ProductRevenueNAV] where SKUID=29256
---------------------------------------------------------

select distinct Contractid 
INTO err.GostContractsNotinNav
from  [cube].[F_ProductRevenueENT] where ContractID not in(
select distinct ContractID from [cube].[F_ProductRevenueNAV])
---------------------------------------------------------------------
----------------------------------------------------------------------
select * 
INTO err.GostLineItems
from [DCSQLPRD104].Enterprise.dbo.LineItem where ContractID in(
select ContractID from  [err].[GostContractsNotinNav])
-----------------------------------------------------------------------
select distinct ContractID 
INTO [dbo].[Contract_Input_List1]
from  
[DCSQLPRD104].Enterprise.dbo.LineItem where LineItemID NOT IN (
select distinct LineItemID from [revenue].[SkuBridge]) and lineItemStatusID=1
Order by ContractID;
-----------------------------------------------------------------------
-----------------------------------------------------------------------






