exec [dbo].[uspLOAD_LineItem]

select count(distinct contractid) from [dbo].[LineItem];

select count(distinct lineitemid) from [dbo].[LineItem];

select count(*) from [dbo].[LineItem] where BundleID=-1

select count(*) from [dbo].[LineItem] where SKUID=-1
----------------------------------------------------------
select count(*) from [dbo].[LineItem];
----------------------------------------------------------
---------------------------------
select YEAR(date) as BillingStartYear, MONTH(date) BillingStartMonth, sum(OriginalMonthlyPrice) as Amount 
from [dbo].[LineItem] 
--where SKUID=-1
group by YEAR(date), MONTH(date)
order by YEAR(date),MONTH(date)
--------------------------------
select count(*) from [dbo].[LineItem] where BundleID<>-1 and SKUID=-1 
---------------------------------
exec [dbo].[uspLOAD_LineItem]


select count(distinct SKUID) from LineItem where SKUID<>-1
select count(distinct ) 
select count(distinct ContractID) from LineItem where BundleID<>-1
select count(*) from lineitem where SKUID<>-1 and BundleID=-1
------------------------------------------------------------------
------------------------------------------------------------------
select count(*) from lineitem
select count(*) from lineitem where SKUID<>-1
---1,028,567
---1,028,567
---535,100
-------------------------------------------------------------------------------------------------------------
select count(*) from lineItem where BundleID<>-1;-------------------------------------------------------------
select lineItemid from Lineitem where LIneitemid not in (select LineItemID from [cube].[F_ProductRevenueENT])
select lineItemid from Lineitem where LIneitemid not in (select LineItemID from [cube].[F_ProductRevenueNAV])
--------------------------------------------------------------------------------------------------------------
select distinct [SKUID] from [cube].[F_ProductRevenueENT];
select * from [revenue].[SkuPrice];
--------------------------------------------------------------------------------------------------------------
select * from [revenue].[Sku];
--------------------------------------------------------------------------------------------------------------
--------------------- REVENUE CAPTURE BY MONTH ---------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
select count(distinct skuid) sku_count,count(distinct contractid) contract_count, 
SUM(CAST([GrossMonthlyPrice] as money)-CAST([DiscountAmount] as money)-CAST([SalesTaxAmount] as money)) as Amt
 from [cube].[F_ProductRevenueENT] where [ChargeYear]=2017 and [ChargeMonth]=6
 --$61,179,773.66 -- JUNE 2017

select count(distinct skuid) sku_count,count(distinct contractid) contract_count, 
SUM(CAST([GrossMonthlyPrice] as money)-CAST([DiscountAmount] as money)-CAST([SalesTaxAmount] as money)) as Amt
 from [cube].[F_ProductRevenueENT] where [ChargeYear]=2017 and [ChargeMonth]=5
 --$62,415,832.7898 --- MAY 2017

 select count(distinct skuid) sku_count,count(distinct contractid) contract_count, 
SUM(CAST([GrossMonthlyPrice] as money)-CAST([DiscountAmount] as money)-CAST([SalesTaxAmount] as money)) as Amt
 from [cube].[F_ProductRevenueENT] where [ChargeYear]=2017 and [ChargeMonth]=4
 --$60,976,282.86  ---  APRIL 2017

 select count(distinct skuid) sku_count,count(distinct contractid) contract_count, 
SUM(CAST([GrossMonthlyPrice] as money)-CAST([DiscountAmount] as money)-CAST([SalesTaxAmount] as money)) as Amt
 from [cube].[F_ProductRevenueENT] where [ChargeYear]=2017 and [ChargeMonth]=3
 --$58,830,052.63  -- MARCH 2017
 -----------------------------------------------------------------------------------------------------------------
 -----------------------------------------------------------------------------------------------------------------
 -----------------------------------------------------------------------------------------------------------------


 select * from [revenue].[SkuPrice] where [Price]=0


 SELECT SUM(CurrentMonthlyPrice) AS CurrentMonthlyPrice, SUM(DiscountedMonthlyPrice) AS DiscountedMonthlyPrice
FROM [DCSQLPRD104].Enterprise.dbo.LineItem
--WHERE CurrentMonthlyPrice < 0 --<> OriginalMonthlyPrice
WHERE CurrentTermStartDate <
--AND LineItemStatusID = 1

--65,801,642.154
--61,951,274.72
--2,018,210.081

SELECT LineItemID
INTO err.LineItemCurrent
FROM [DCSQLPRD104].Enterprise.dbo.LineItem
--WHERE CurrentMonthlyPrice < 0 --<> OriginalMonthlyPrice
WHERE CurrentTermStartDate > '2016-07-01'
AND LineItemStatusID = 1
---------------------------------------------
---------------------------------------------
select LC.lineitemID,LI.CurrentMonthlyPrice as AmtAboveZero  from err.LineItemCurrent LC 
JOIN [DCSQLPRD104].Enterprise.dbo.LineItem LI on LC.LineItemID=LI.LineItemID
 where LC.lineitemid not in (select lineitemid from [cube].[F_ProductRevenueENT])
and LI.CurrentMonthlyPrice>0
-------------------------------------------------------------------------
select count(*) from [cube].[F_ProductRevenueENT] where [MonthlyPrice]=0;
-------------------------------------------------------------------------
--2,399,527;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
select distinct LI.[LineItemID],LI.ContractID,LI.CurrentMonthlyPrice 
INTO [err].[LineItemCurrent]
from [DCSQLPRD104].Enterprise.dbo.LineItem LI
where  LI.CurrentTermStartDate > '2016-07-01' AND  LI.LineItemStatusID = 1 AND
LI.lineitemid not in (
select lineItemid from revenue.SkuBridge) 
ORDER BY LI.ContractID
----------------------------------------------------------------
---select * from;-----------------------------------------------
---------------------------------------------------------------
FROM [DCSQLPRD104].Enterprise.dbo.LineItem
--WHERE CurrentMonthlyPrice < 0 --<> OriginalMonthlyPrice
WHERE CurrentTermStartDate > '2016-07-01';
AND LineItemStatusID = 1;---------------------------------------------------
----------------------------------------------------------------------------
select distinct contractid from [cube].[F_ProductRevenueENT] where contractid  in (
select distinct contractid from [err].[LineItemCurrent])
-----------------------------------------------------------------------------
select distinct contractid from [err].[LineItemCurrent] where contractid not  in (
select distinct contractid from  [cube].[F_ProductRevenueENT] );
------------------------------------------------------------------------------
select distinct LineItemID from [err].[LineItemCurrent] where LineItemID in (
Select distinct LineItemID from [cube].[F_ProductRevenueENT] );
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
select SUM(Case [CurrentMonthlyPrice] WHEN 0  THEN 0 ELSE 1 END) AS Cnt
from [err].[LineItemCurrent]
--group by LineItemID 
having SUM(Case [CurrentMonthlyPrice] WHEN 0  THEN 0 ELSE 1 END)>1
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
select * from [err].[LineItemX] where LineItemID in (select lineitemid from revenue.SkuBridge);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------




