
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
SELECT 
BundleID, BuildDate
--MIN(BUILDDATE) AS [START_DATE], MAX(BuildDate) AS [END_DATE],
FROM [dbo].[InvoiceDetail]
WHERE 
BUNDLEID IS  NULL AND 
YEAR(BuildDate)=2016
ORDER BY BUILDDATE ASC
-----------------------------------------------------

--------------------------------------------------------
--------------------------------------------------------
---------------------------------------------------------
----SELECT TOP 10 * FROM LineItem
----SELECT COUNT(*) FROM LineItem-- 1,997,166
----1,564,773
----SELECT DISTINCT ContractID from LineItem

SELECT TOP 10 * FROM LineItem

SELECT DISTINCT CONTRACTID FROM LineItem
SELECT DISTINCT [SiteLocationID] FROM LINEITEM
SELECT DISTINCT CONTRACTID FROM INVOICEDETAIL  

SELECT DISTINCT 
PRODUCTID, 
OriginalMonthlyPrice 
FROM LineItem
ORDER BY ProductID, ORIGINALMONTHLYPRICE

SELECT DISTINCT 
SiteLocationID 
FROM LineItem
---------------------------------- below query with everything except ContractID gives =  1,564,773 )
SELECT 
--CONTRACTID AS CONTRACTID, 
PRODUCTID AS PRODUCTID, 
SALESUNITID AS SALESUNIT,
DATASETID AS DATASET, 
SiteLocationID AS SITELOCATION, 
SUM(ORIGINALMONTHLYPRICE) AS PRICE
FROM LineItem
GROUP BY  
--CONTRACTID, 
PRODUCTID, 
SALESUNITID,
DATASETID,
SiteLocationID

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
SELECT COUNT(*) FROM  [dbo].[InvoiceDetail] -- 22,702,208
----------------------------------------------------------------
SELECT COUNT(*) FROM  [dbo].[InvoiceDetail] -- 15,580,350
WHERE BUNDLEID IS  NULL

----------------------------------------------------------------
-------------- total lines 3,207,456:   
 --------------no BundleID:1,697,958 --------------------------------------------------
SELECT 
BundleID, BuildDate
--MIN(BUILDDATE) AS [START_DATE], MAX(BuildDate) AS [END_DATE],
FROM [dbo].[InvoiceDetail]
WHERE 
BUNDLEID IS  NULL AND 
YEAR([BillingStartDate])=2016
ORDER BY BUILDDATE ASC
-----------------------------------------------------
-------------------1,036,766 total lines-------------
---------------------232,209-------------------------
----------------------------------------------------


