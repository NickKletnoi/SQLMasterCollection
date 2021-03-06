USE [CoStar]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_LineItem]    Script Date: 3/27/2017 2:59:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[uspLOAD_LineItem]
AS

TRUNCATE TABLE LineItem;

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
NumberOfUsers as UserCount,
0 as CustomerType, 
BillingStartDate as [Date], 
0 as SKUID ,
CAST (OriginalMonthlyPrice AS decimal(10,2)) as Amount
FROM Enterprise.dbo.LineItem LI JOIN
EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID
WHERE YEAR(BillingStartDate) in (2016,2017) AND BUNDLEID IS NOT NULL
UNION
SELECT 
ContractID,
BundleID,
ProductID,
ProductMarket as MarketID,
NumberOfUsers as UserCount,
0 as CustomerType, 
BillingStartDate as [Date], 
0 as SKUID ,
CAST (OriginalMonthlyPrice AS decimal(10,2)) as Amount
FROM Enterprise.dbo.LineItem LI JOIN
EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID
WHERE YEAR(BillingStartDate) in (2016,2017) AND BUNDLEID IS NULL


