SELECT 
ContractID,
BundleID,
ProductID,
ProductMarket as MarketID,
'-' as UserCount,
'-' as CustomerType, 
BillingStartDate as [Date], 
0 as SKUID ,
CAST (OriginalMonthlyPrice AS decimal(10,2)) as Amount
FROM Enterprise.dbo.LineItem LI JOIN
EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID
WHERE YEAR(BillingStartDate) in (2016,2017) AND BUNDLEID IS NOT NULL
------------------------------------------------------------------------

SELECT *
INTO LineItem2
FROM LineItem

truncate table [dbo].[LineItem]
select * from LineItem
--------------------------
INSERT LineItem (
            [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount])

SELECT 
ContractID,
BundleID,
ProductID,
ProductMarket as MarketID,
0 as UserCount,
0 as CustomerType, 
BillingStartDate as [Date], 
0 as SKUID ,
CAST (OriginalMonthlyPrice AS decimal(10,2)) as Amount
FROM Enterprise.dbo.LineItem LI JOIN
EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID
WHERE YEAR(BillingStartDate) in (2016,2017) AND BUNDLEID IS NOT NULL

---------------------------------------------------------------------------------

