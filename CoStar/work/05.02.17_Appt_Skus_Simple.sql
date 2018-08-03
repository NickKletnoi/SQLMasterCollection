SELECT 
LI.LineItemID as LineItemID, 
LI.ContractID as ContractID,
ISNULL(LI.ProductID,-1) as ProductID,
ISNULL(A.CityID,'-1') as MarketID,
LI.BillingStartDate as [Date], 
PA.SKUID as SKUID ,
CAST (LI.OriginalMonthlyPrice AS decimal(10,2)) as Amount
INTO [dbo].[LineItemAppts1]
FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI LEFT JOIN
[DCSQLPRD104].EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.LocationProfile LP ON LI.SiteLocationID=LP.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Location L ON LI.SiteLocationID=L.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID LEFT JOIN
[dbo].[BusinessType] BT ON LP.BusinessTypeID=BT.BusinessTypeID LEFT JOIN [dbo].[BusinessTypeCategory] BTC ON
BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID LEFT JOIN [dbo].[ProductAppts] PA ON 
LI.ProductID=PA.ProductID

WHERE 
--YEAR(BillingStartDate) in (2016,2017) 
LineItemStatusID=1
AND LI.ProductID IN (SELECT ProductID FROM  [dbo].[ProductAppts])
--BUNDLEID IS NOT NULL


select * from [dbo].[LineItemAppts1] LIA JOIN SkuAppts SA on LIA.SKUID=SA.SKUID
order by ContractID
--282,246 (Silver ?) 
select * from [dbo].[SkuAppts]
-------------------------------------
select * from [dbo].[ProductAppts] where ProductID in (282,246)
SELECT * FROM [dbo].[LineItemAppts] ORDER BY ContractID, ProductID
select * from [dbo].[SkuAppts]
------------------------------------