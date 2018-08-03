

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
C.ContractID,
SP.SkuName, 
LOC.LocationID as LocationID ,
LOC.LocationName as ClientName, 
CT.ContactID,
CT.FirstName + ' '+ CT.LastName as SalesRep,
WDD.L3Manager, 
WDD.L4Manager,
WDD.L5Manager,
WDD.L6Manager,
WDD.Market,
P.ProductName, 
SUM(L.OriginalMonthlyPrice) as ContractAmount,
SUM(PL.ManualListPrice) ManualAmount 
INTO [Apt].[SalesPricingReport1]
FROM  
[DCSQLPRD104].Enterprise.dbo.LineItem L JOIN 
[DCSQLPRD104].Enterprise.dbo.Contract C ON L.ContractID=C.ContractID LEFT JOIN 
[DCSQLPRD104].Enterprise.dbo.Location LOC ON C.LocationID=LOC.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Contact CT ON LOC.CurrentAEContactID=CT.ContactID LEFT JOIN 
[Apt].[WorkDay_Employee_DataDump] WDD ON WDD.[ContactID]=LOC.CurrentAEContactID LEFT JOIN
dbo.SkuBridge SB ON L.LineItemID=SB.LineItemID LEFT JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Product P ON L.ProductID=P.ProductID JOIN [Apt].[ProductList] PL ON SB.SKUID=PL.SKUID
WHERE P.ProductName like  '%Apts%' and L.LineItemStatusID=1 
GROUP BY L.LineItemID, P.ProductName,LOC.LocationName,LOC.LocationID,CT.LastName, CT.FirstName,SP.SkuName,CT.ContactID,C.ContractID,
WDD.L3Manager, 
WDD.L4Manager,
WDD.L5Manager,
WDD.L6Manager,
WDD.Market
HAVING  SUM(L.OriginalMonthlyPrice)>1
-----------------------------------------------------------------------------------------------------------
/*
SELECT 
C.ContractID, L.CurrentAEContactID , CT.FirstName, CT.LastName
FROM Contract C JOIN Location L 

ON C.LocationID=L.LocationID JOIN Contact CT 
ON L.CurrentAEContactID=CT.ContactID 
WHERE C.ContractID=148859



*/


select * from [Apt].[SalesPricingReport1] where Contractid=148859


select * from [Apt].[ProductList]

select * from [DCSQLPRD104].Enterprise.dbo.Contact

select top 10 * from [DCSQLPRD104].Enterprise.dbo.Contract


select top 10 * from [DCSQLPRD104].Enterprise.dbo.Location where P

select distinct [Worker],[JobProfile]  from [Apt].[WorkDay_Employee_DataDump] where ContactID IN (
select distinct ContactID from [Apt].[SalesPricingReport1])


select OrderID, SUM(ExtendedAmount) as TotalSales
from Sales.Details
GROUP BY OrderID
ORDER BY SUM(ExtendedAmount) DESC


------------------------------------------------------
------------------------------------------------------
select count(*) from [Apt].[SalesPricingReport1];-----
select count(*) from [Apt].[SalesPricingReport];------
------------------------------------------------------
------------------------------------------------------