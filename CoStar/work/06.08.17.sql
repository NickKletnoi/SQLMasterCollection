SELECT distinct 
--LI.LineItemID as LineItemID, 
LI.ContractID as ContractID,
C.[DefaultTermMonths]-1 as ContractTermMonths
--ISNULL(LI.ProductID,-1) as ProductID,
--ISNULL(A.CityID,'-1') as MarketID,
--LI.BillingStartDate as [Date], 
--PA.ProductPackage as NetworkName,
--CASE WHEN BLD.[GrossBldgSqFt]>80 THEN 'P' ELSE 'M' END AS UnitSign,
--CAST (LI.OriginalMonthlyPrice AS decimal(10,2)) as Amount,
--CAST (LI.ContractTermMonths-1 AS INT) AS ContractTermMonths 
--INTO [dbo].[LineItemAppts3]
--INTO #LineItemAppts2
FROM [DCSQLDEV104].Enterprise.dbo.LineItem LI LEFT JOIN
[DCSQLDEV104].Enterprise.dbo.[Contract] C ON LI.ContractID=C.ContractID
--[DCSQLDEV104].Enterprise.dbo.Location L ON LI.SiteLocationID=L.LocationID LEFT JOIN
--[DCSQLDEV104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID LEFT JOIN
--[DCSQLDEV104].Enterprise.[dbo].[PropertyAddress] PRADDR ON L.AddressID=PRADDR.AddressID LEFT JOIN
--[DCSQLDEV104].Enterprise.[dbo].[Property] P ON P.PropertyID=PRADDR.PropertyID LEFT JOIN 
--[DCSQLDEV104].CoStar2.[dbo].[BldSqFt] BLD ON BLD.PropertyID=P.PropertyID  LEFT JOIN 
--[dbo].[ProductAppts] PA ON LI.ProductID=PA.ProductID

WHERE 
--YEAR(BillingStartDate) in (2016,2017) 
LineItemStatusID=1
AND LI.ProductID IN (SELECT ProductID FROM  [dbo].[ProductAppts])
ORDER BY C.[DefaultTermMonths]-1
-----------------------------------------------------------------------------------


-----------------------------------------------------------------------------------