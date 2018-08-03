

/*
----------------------------------------------
--------------Goals for today:----------------
----------------------------------------------
1. Write the SQL for the Apartments report;
2. Write the subtotals for the Apartments report;
3. Release the Apartment report at 5pm today;
4. Study the 60-90	questions as part of the cert;
------------------------------------------------
*/

----------------------Apartments Analysis SQL V001.1
SELECT
SU.SalesUnitDesc as Region,
SU.SalesUnitID,
R.RegionID,
SP.SkuName, 
LOC.LocationID as BillingLocID ,
LOC.LocationName as ClientName, 
CT.FirstName + ' '+ CT.LastName as RepName,
P.ProductName, 
SUM(L.OriginalMonthlyPrice) as ContractAmount,
SUM(PL.ManualListPrice) ManualAmount 
FROM  
[DCSQLPRD104].Enterprise.dbo.LineItem L JOIN 
[DCSQLPRD104].Enterprise.dbo.Contract C ON L.ContractID=C.ContractID LEFT JOIN 
[DCSQLPRD104].Enterprise.dbo.Contact CT ON C.ContractContactID=CT.ContactID LEFT JOIN 
[DCSQLPRD104].Enterprise.dbo.SalesUnit SU ON L.SalesUnitID=SU.SalesUnitID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Region R ON SU.RegionID=R.RegionID LEFT JOIN 
[DCSQLPRD104].Enterprise.dbo.Location LOC ON C.BillingLocationID=LOC.LocationID LEFT JOIN
dbo.SkuBridge SB ON L.LineItemID=SB.LineItemID LEFT JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Product P ON L.ProductID=P.ProductID JOIN [Apt].[ProductList] PL ON SB.SKUID=PL.SKUID
WHERE P.ProductName like  '%Apts%' and L.LineItemStatusID=1 
GROUP BY L.LineItemID, P.ProductName,LOC.LocationName,LOC.LocationID,CT.LastName, CT.FirstName,SP.SkuName,SU.SalesUnitDesc,SU.SalesUnitID,R.RegionID  
HAVING  SUM(L.OriginalMonthlyPrice)>1
-----------------------------------------------------------------------------------------------------------

select * from [Apt].[ProductList]

select top 10 * from  [DCSQLPRD104].Enterprise.dbo.LineItem

select top 10 * from [DCSQLPRD104].Enterprise.dbo.Contract


select top 10 * from [DCSQLPRD104].Enterprise.dbo.Location where P

select top 10 * from [DCSQLPRD104].Enterprise.dbo.Region

select top 10 * from [DCSQLPRD104].Enterprise.dbo.SalesUnit



select OrderID, SUM(ExtendedAmount) as TotalSales
from Sales.Details
GROUP BY OrderID
ORDER BY SUM(ExtendedAmount) DESC