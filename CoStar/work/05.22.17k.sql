USE [CoStar]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_LineItem]    Script Date: 5/22/2017 4:13:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select count(*) from LineItem1


ALTER PROCEDURE [dbo].[uspLOAD_LineItem]
AS

TRUNCATE TABLE LineItem1;

INSERT LineItem1 (
            [LineItemID]
           ,[ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount])

--SELECT
--LineItemID as LineItemID, 
--ContractID as ContractID,
--ISNULL(BundleID,-1) as BundleID,
--ISNULL(ProductID,-1) as ProductID,
--ISNULL(ProductMarket,'-1') as MarketID,
--ISNULL(NumberOfUsers,0) as UserCount,
--ISNULL(IT.IndustryTypeID,0) as CustomerType, 
--BillingStartDate as [Date], 
---1 as SKUID ,
--CAST (OriginalMonthlyPrice AS decimal(10,2)) as Amount
--FROM Enterprise.dbo.LineItem LI LEFT JOIN
--EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID LEFT JOIN
--Enterprise.dbo.LocationProfile LP ON LI.SiteLocationID=LP.LocationID LEFT JOIN
--Enterprise.dbo.IndustryType IT ON LP.IndustryTypeID=IT.IndustryTypeID
--WHERE 
----YEAR(BillingStartDate) in (2016,2017) 
--LineItemStatusID=1
--AND BUNDLEID IS NOT NULL
--UNION
SELECT 
LineItemID as LineItemID, 
ContractID as ContractID,
ISNULL(BundleID,-1) as BundleID,
ISNULL(ProductID,-1) as ProductID,
ISNULL(ProductMarket,'-1') as MarketID,
ISNULL(NumberOfUsers,0) as UserCount,
ISNULL(BTC.BusinessTypeCategoryID,8) as CustomerType, 
LI.BillingStartDate as [Date], 
-1 as SKUID ,
CAST (OriginalMonthlyPrice AS decimal(10,2)) as Amount
INTO LineItemRS
FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI LEFT JOIN
[DCSQLPRD104].EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.LocationProfile LP ON LI.SiteLocationID=LP.LocationID LEFT JOIN
[dbo].[BusinessType] BT ON LP.BusinessTypeID=BT.BusinessTypeID LEFT JOIN [dbo].[BusinessTypeCategory] BTC ON
BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID

WHERE 
--YEAR(BillingStartDate) in (2016,2017) 
LineItemStatusID=1
--AND BUNDLEID IS NOT NULL
and LineItemID in (select LineItemID from [dbo].[UnSkuedLineItemID2])
------------------------------------

select count(*) from [dbo].[LineItemRS] where BundleID=-1

select Year([Date]),sum(Amount) from 
[dbo].[LineItemRS] where Year([Date]) IN (2016,2017)
group by Year([Date])
----------------
select Year([Date]),sum(Amount) from 
[dbo].[LineItemNB] where Year([Date]) IN (2016,2017)
group by Year([Date])
--------------------------------------------------------------------------------------------
select count(Distinct LineItemID) from [dbo].[LineItemRS] where Year([Date]) IN (2016,2017);
select count(Distinct LineItemID) from [dbo].[LineItemNB] where Year([Date]) IN (2016,2017);
---------------------------------------------------------------------------------------------

select * from [dbo].[LineItemNB]
where Year([Date]) IN (2016,2017) and Amount>0
order by [ContractID],[Date]

select count( distinct LineItemID) from [dbo].[LineItemNB] where 
--Amount>0 and 
LineItemID in (
select Distinct LineItemID from SkuBridge)
------------------------------------------
select 
--count(SkuID) ---------------------------
LineItemID
INTO LINB
from [dbo].[LineItemNB] 
where SKUID=-1 and 
--where 
YEAR(Date) in (2016,2017)
----------------------------------------
----------------------------------------
----------------------------------------

Select * from [dbo].[LineItemNB] LI JOIN Product P on LI.ProductID=P.ProductID where LineItemID in (select LineItemID from LINB)
and P.ProductName like '%Apt%'
Order by ContractID

select * from Product where ProductName like '%Apt%'

select * from Product where ProductID in (268)






