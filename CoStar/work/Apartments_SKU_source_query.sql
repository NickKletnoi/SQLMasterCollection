---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
SELECT SUM([TotalAmount]) 
FROM [bal].[2017BalancesContractLineItem] 
WHERE SKUID is not null;
---------------------------------------------------------------------------------------------
--$802,390,387.49----------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
/*
work on getting the
sku'ing tip correctly
for the Apartment Unit 
counts to be reflected
in the sku compositions;

*/
------------------------------- Perm Fix For Apartments ----------------------------------------------
IF OBJECT_ID('tempdb..A', 'U') IS NOT NULL DROP TABLE tempdb..A;
WITH apt AS (
select DISTINCT RIGHT(SP1.SkuName,LEN(SP1.SkuName)-6) as AptSkuNameStub,SKUID from RevPro..SkuPrice SP1 
where SP1.ProductCategory  Like '%Apartments%')
SELECT LI.ContractID,LI.LineItemID,P.ProductDesc,SP.SKUID,SP.SkuName,CASE WHEN PAU.TotalNumUnits>80 THEN 'P' ELSE 'M' END AS Units,
'Apts' as ProdCat, CASE WHEN P.ProductDesc LIKE '%Gold%' THEN 'Gold'
             WHEN P.ProductDesc LIKE '%Silver%' THEN 'Silver'
			 WHEN P.ProductDesc LIKE '%Diamond%' THEN 'Diamond'
			 WHEN P.ProductDesc LIKE '%Platinum%' THEN 'Platinum'
			 WHEN P.ProductDesc LIKE 'LN%Gold'  THEN 'LN - Gold'
			 WHEN P.ProductDesc LIKE 'LN%Silver' THEN 'LN - Silver'
			 WHEN P.ProductDesc LIKE 'LN%Diamond' THEN 'LN - Diamond'
			 WHEN P.ProductDesc LIKE 'LN%Platinum' THEN 'LN - Platinum'
			 ELSE 'Unknown' END as ProductPart, ISNULL(LI.ContractTermMonths-1,12) as Term,
			 
'Apts'+'-'+
CASE WHEN P.ProductDesc LIKE '%Gold%' THEN 'Gold'
             WHEN P.ProductDesc LIKE '%Silver%' THEN 'Silver'
			 WHEN P.ProductDesc LIKE '%Diamond%' THEN 'Diamond'
			 WHEN P.ProductDesc LIKE '%Platinum%' THEN 'Platinum'
			 WHEN P.ProductDesc LIKE 'LN%Gold'  THEN 'LN - Gold'
			 WHEN P.ProductDesc LIKE 'LN%Silver' THEN 'LN - Silver'
			 WHEN P.ProductDesc LIKE 'LN%Diamond' THEN 'LN - Diamond'
			 WHEN P.ProductDesc LIKE 'LN%Platinum' THEN 'LN - Platinum'
			 ELSE 'Unknown' END +'-'+
CASE WHEN PAU.TotalNumUnits>80 THEN 'P' ELSE 'M' END +'-'+ Convert(varchar(10),ISNULL(LI.ContractTermMonths-1,12)) AS NewSkuName,apt.SKUID as NewSKUID
into #A
FROM dbo.LineItem LI 
 JOIN Staging..LocationOccupancy LO ON LI.SiteLocationID=LO.TenantLocationID
 JOIN Staging..vwPropertyApartmentNumUnits PAU ON PAU.PropertyApartmentID=LO.PropertyID
 JOIN RevPro..SkuBridge SB ON SB.LineItemID=LI.LineItemID JOIN RevPro..SkuPrice SP ON SB.SKUID=SP.SKUID
JOIN RevPro.[apt].[Product] P ON LI.ProductID=P.ProductID
JOIN apt ON apt.AptSkuNameStub=
'Apts'+'-'+
CASE WHEN P.ProductDesc LIKE '%Gold%' THEN 'Gold'
             WHEN P.ProductDesc LIKE '%Silver%' THEN 'Silver'
			 WHEN P.ProductDesc LIKE '%Diamond%' THEN 'Diamond'
			 WHEN P.ProductDesc LIKE '%Platinum%' THEN 'Platinum'
			 WHEN P.ProductDesc LIKE 'LN%Gold'  THEN 'LN - Gold'
			 WHEN P.ProductDesc LIKE 'LN%Silver' THEN 'LN - Silver'
			 WHEN P.ProductDesc LIKE 'LN%Diamond' THEN 'LN - Diamond'
			 WHEN P.ProductDesc LIKE 'LN%Platinum' THEN 'LN - Platinum'
			 ELSE 'Unknown' END +'-'+
CASE WHEN PAU.TotalNumUnits>80 THEN 'P' ELSE 'M' END +'-'+ Convert(varchar(10),ISNULL(LI.ContractTermMonths-1,12))
WHERE LI.ContractID IN (select distinct ContractID from RevPro..ProcessedContracts)
---------------------------------------------------------------------------------------------------------------
UPDATE SB
SET SB.SKUID=NAS.NewSKUID
FROM RevPro..SkuBridge SB JOIN #A NAS ON SB.LineItemID=NAS.LineItemID

-------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('tempdb..A', 'U') IS NOT NULL DROP TABLE tempdb..A;
--------------------------------------------------------------------------------------------------------------




select * from RevPro.apt.NewAptSkus


---------------
--FROM dbo.[vwPropertyApartmentNumUnits] PAU JOIN dbo.LocationOccupancy LO ON 
select 
SP.SKUID,RIGHT(SP.SkuName,LEN(SP.SkuName)-6) from RevPro..SkuPrice SP JOIN 
(

select DISTINCT RIGHT(SP1.SkuName,LEN(SP1.SkuName)-6) as AptSkuNameStub,SKUID from RevPro..SkuPrice SP1 
where SP1.ProductCategory  Like '%Apartments%'


 ) apt


 ON RIGHT(SP.SkuName,LEN(SP.SkuName))=a.AptNameStub

ENTERPRISE.dbo.LineItem LI ON SB2.LineItemID=LI.LineItemID 
 LEFT JOIN  ENTERPRISE.dbo.Location L ON LI.SiteLocationID=L.LocationID
 LEFT JOIN ENTERPRISE.dbo.LocationOccupancy LO on LI.SiteLocationID=LO.TenantLocationID
 LEFT JOIN [dbo].[BldSqFt] BSF ON BSF.PropertyID=LO.PropertyID

 select top 10 * from dbo.vwPropertyApartmentNumUnits
