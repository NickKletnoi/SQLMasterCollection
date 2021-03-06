USE [CoStar]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_LineItemAppts]    Script Date: 5/3/2017 12:11:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--select count(*) from LineItem1


CREATE PROCEDURE [dbo].[uspLOAD_LineItemAppts2]
AS

--TRUNCATE TABLE LineItemAppts;

--INSERT LineItemAppts (
--            [LineItemID]
--           ,[ContractID]
--		   ,[ProductID]
--           ,[MarketID]
--           ,[Date]
--           ,[SKUID]
--           ,[Amount])

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
LI.LineItemID as LineItemID, 
LI.ContractID as ContractID,
ISNULL(LI.ProductID,-1) as ProductID,
ISNULL(A.CityID,'-1') as MarketID,
LI.BillingStartDate as [Date], 
PA.ProductPackage as NetworkName,
CASE WHEN BLD.[GrossBldgSqFt]>80 THEN 'P' ELSE 'M' END AS UnitSign,
CAST (LI.OriginalMonthlyPrice AS decimal(10,2)) as Amount
--INTO [dbo].[LineItemAppts]
INTO #LineItemAppts2
FROM [DCSQLDEV104].Enterprise.dbo.LineItem LI LEFT JOIN
[DCSQLDEV104].Enterprise.dbo.Location L ON LI.SiteLocationID=L.LocationID LEFT JOIN
[DCSQLDEV104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID LEFT JOIN
[DCSQLDEV104].Enterprise.[dbo].[PropertyAddress] PRADDR ON L.AddressID=PRADDR.AddressID LEFT JOIN
[DCSQLDEV104].Enterprise.[dbo].[Property] P ON P.PropertyID=PRADDR.PropertyID LEFT JOIN 
[DCSQLDEV104].CoStar2.[dbo].[BldSqFt] BLD ON BLD.PropertyID=P.PropertyID  LEFT JOIN 
[dbo].[ProductAppts] PA ON LI.ProductID=PA.ProductID

WHERE 
--YEAR(BillingStartDate) in (2016,2017) 
LineItemStatusID=1
AND LI.ProductID IN (SELECT ProductID FROM  [dbo].[ProductAppts])
--BUNDLEID IS NOT NULL

--select * 
--INTO LineItemAppts2
--from #LineItemAppts2

SELECT DISTINCT SKUID=ROW_NUMBER() OVER (PARTITION BY [NetworkName],[UnitSign] ORDER BY [NetworkName] ),
 [NetworkName],[UnitSign] 
FROM [dbo].[LineItemAppts2]
-------------------------------

SELECT DISTINCT [NetworkName],[UnitSign] FROM [dbo].[LineItemAppts2] LI JOIN

(SELECT 
30000+ROW_NUMBER() OVER (ORDER BY NetworkName) as SKUID,
NetworkName as NetworkName, 
UnitSign as UnitSign 
--INTO SkuAppts2
FROM 
(SELECT DISTINCT [NetworkName],[UnitSign] FROM [dbo].[LineItemAppts2] ) L2

) N
ON N.NetworkName=LI.NetworkName and N.UnitSign=LI.Unitsign

 ORDER BY [NetworkName]
 ---------------------
 SELECT * FROM [dbo].[SkuAppts2]

 SELECT 
       LIA.[LineItemID]
      ,LIA.[ContractID]
      ,LIA.[ProductID]
      ,LIA.[MarketID]
	  ,SA.SKUID
      ,LIA.[Date]
      ,LIA.[NetworkName]
      ,LIA.[UnitSign]
      ,LIA.[Amount]
INTO LineItemAppsFinal
FROM [dbo].[LineItemAppts2] LIA JOIN [dbo].[SkuAppts2] SA ON LIA.NetworkName=SA.NetworkName AND LIA.UnitSign=SA.UnitSign

----------------------------------
SELECT * FROM [dbo].[SkuAppts];
SELECT * FROM [dbo].[ProductAppts];
-------------------------------------

SELECT * FROM 
[dbo].[SkuAppts2]

SELECT * FROM [dbo].[LineItemAppsFinal]
WHERE Amount>1 AND NetworkName like '%Finder%'
 ORDER BY CONTRACTID 
 ----------------------
 SELECT * FROM [dbo].[SkuAppts2]


 select 
 [SKUID],
 SkuName=CAST([SKUID] AS VARCHAR(50))+'-'+'Appts'+'-'+[NetworkName]+'-'+[UnitSign],
[NetworkName],
[UnitSign]
INTO SkuAppts3
 from [dbo].[SkuAppts2]

 SELECT * FROM [dbo].[SkuAppts2]

 SELECT * FROM [dbo].[SkuApptsFinal]
 ------------------------------------------

 SELECT * FROM [dbo].[LineItemApptsFinal]



