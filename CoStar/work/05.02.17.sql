SELECT 
LI.LineItemID as LineItemID, 
LI.ContractID as ContractID,
ISNULL(LI.BundleID,-1) as BundleID,
ISNULL(LI.ProductID,-1) as ProductID,
ISNULL(A.CityID,'-1') as MarketID,
A.City,
L.LocationID,
ISNULL(LI.NumberOfUsers,0) as UserCount,
ISNULL(BTC.BusinessTypeCategoryID,8) as CustomerType, 
LI.BillingStartDate as [Date], 
-1 as SKUID ,
CAST (LI.OriginalMonthlyPrice AS decimal(10,2)) as Amount
INTO #TempAppts
FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI LEFT JOIN
[DCSQLPRD104].EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.LocationProfile LP ON LI.SiteLocationID=LP.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Location L ON LI.SiteLocationID=L.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID LEFT JOIN
[dbo].[BusinessType] BT ON LP.BusinessTypeID=BT.BusinessTypeID LEFT JOIN [dbo].[BusinessTypeCategory] BTC ON
BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
WHERE 
--YEAR(BillingStartDate) in (2016,2017) 
LineItemStatusID=1
AND ProductID IN (SELECT ProductID FROM  [dbo].[ProductAppts])
--BUNDLEID IS NOT NULL


SELECT * 
INTO LineItemAppts
FROM #TempAppts

SELECT COUNT(*) FROM #TempAppts

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
----------------------- Appartment Contracts to inspect -----------------------------------
-------------------------------------------------------------------------------------------
SELECT * FROM [dbo].[LineItemAppts] 
WHERE ContractID IN (103966,104035,104111,104142,104188,101478,101578)
ORDER BY ContractID
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--3, 