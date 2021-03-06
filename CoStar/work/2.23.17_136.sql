----SELECT TOP 10 * FROM LineItem
----SELECT COUNT(*) FROM LineItem
----SELECT DISTINCT ContractID from LineItem

SELECT TOP 10 * FROM LineItem

SELECT DISTINCT CONTRACTID FROM LineItem
SELECT DISTINCT CONTRACTID FROM INVOICEDETAIL  

SELECT DISTINCT 
PRODUCTID, 
OriginalMonthlyPrice 
FROM LineItem
ORDER BY ProductID, ORIGINALMONTHLYPRICE

SELECT DISTINCT 
SiteLocationID 
FROM LineItem

SELECT 
--CONTRACTID AS CONTRACTID, 
PRODUCTID AS PRODUCTID, 
SALESUNITID AS SALESUNIT,
DATASETID AS DATASET, 
--SiteLocationID AS SITELOCATION, 
SUM(ORIGINALMONTHLYPRICE) AS PRICE
FROM LineItem
GROUP BY  
--CONTRACTID, 
PRODUCTID, 
SALESUNITID,
DATASETID
--SiteLocationID

------------------------------
SELECT * FROM LOCATION
------------------------------
SELECT MIN(BUILDDATE) AS [START_DATE], MAX(BuildDate) AS [END_DATE]  
FROM [dbo].[InvoiceDetail]
------------------------------
SELECT MIN([BillingStartDate]) AS [START_DATE], MAX([BillingStartDate]) AS [END_DATE]  
FROM [dbo].[InvoiceDetail]
WHERE [BillingStartDate] NOT IN ( '1931-10-24 00:00:00', '' )


----------------------------------------------------------------
SELECT COUNT(*) FROM  [dbo].[InvoiceDetail]
----------------------------------------------------------------
SELECT COUNT(*) FROM  [dbo].[InvoiceDetail]
WHERE BUNDLEID IS NOT NULL
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
SELECT 
BundleID, BuildDate
--MIN(BUILDDATE) AS [START_DATE], MAX(BuildDate) AS [END_DATE],
FROM [dbo].[InvoiceDetail]
WHERE 
BUNDLEID IS  NULL AND 
YEAR(BuildDate)=2016
ORDER BY BUILDDATE ASC
----------------------------------------------------------------
----------------------------------------------------------------




