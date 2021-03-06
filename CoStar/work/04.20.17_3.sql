USE [CoStar]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_LineItem]    Script Date: 4/20/2017 2:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SELECT * FROM [dbo].[LineItem1]

UPDATE WB
SET WB.[CustomerType]=LI1.[CustomerType]
FROM [dbo].[LineItemWB] WB JOIN  [dbo].[LineItem1] LI1 ON WB.BundleID=LI1.BundleID 
----------------------------------------------------------------------------------
select * from LineItemWB where CustomerType>5;------------------------------------
----------------------------------------------------------------------------------
UPDATE WB
SET WB.[CustomerType]=0
FROM [dbo].[LineItemWB] WB where CustomerType>5
------------------------------------------------------
------------------------------------------------------
UPDATE MC
SET MC.[CustomerType]=WB.CustomerType
from [dbo].[SkuLG] MC join [dbo].[LineItemWB] WB on MC.SKUID=WB.SKUID









EXEC [dbo].[uspLOAD_LineItem]


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
ISNULL(BT.[BusinessTypeCategoryID],0) as CustomerType, 
LI.BillingStartDate as [Date], 
-1 as SKUID ,
CAST (OriginalMonthlyPrice AS decimal(10,2)) as Amount
FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI LEFT JOIN
[DCSQLPRD104].EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.LocationProfile LP ON LI.SiteLocationID=LP.LocationID LEFT JOIN
[dbo].[BusinessType] BT ON LP.BusinessTypeID=BT.BusinessTypeID
WHERE 
--YEAR(BillingStartDate) in (2016,2017) 
LineItemStatusID=1
AND BUNDLEID IS NOT NULL