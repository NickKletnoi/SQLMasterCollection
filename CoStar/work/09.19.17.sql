SELECT 
SPR.SkuName,
SPR.BillingLocID,
SPR.ClientName,
SPR.RepName,
WEDD.L3Manager,
WEDD.L4Manager,
WEDD.L5Manager,
WEDD.L6Manager,
WEDD.Market
FROM 
[Apt].[SalesPricingReport] SPR JOIN [Apt].[WorkDay_Employee_DataDump] WEDD ON 
SPR.ContactID=WEDD.EmployeeID 
---------------------------------------------------------------------------------------
SELECT 
SPR.SkuName,
SPR.BillingLocID,
SPR.ClientName,
SPR.RepName,
WEDD.L3Manager,
WEDD.L4Manager,
WEDD.L5Manager,
WEDD.L6Manager,
WEDD.Market
FROM 
[Apt].[SalesPricingReport] SPR JOIN [Apt].[WorkDay_Employee_DataDump] WEDD ON 
SPR.ContactID=WEDD.ExtractCrmID
----------------------------------------------------------------------------------------
SELECT DISTINCT 
--SPR.SkuName,
--SPR.BillingLocID,
--SPR.ClientName,
SPR.ContactID,
SPR.RepName
----WEDD.L3Manager,
----WEDD.L4Manager,
----WEDD.L5Manager,
----WEDD.L6Manager,
----WEDD.Market
 from 
[Apt].[SalesPricingReport] SPR where RepName like '%Elizabeth Culver%'

--------------------------------------------------------------------------------------

select [EmployeeID],[ExtractCrmID],[Worker] from [Apt].[WorkDay_Employee_DataDump]
where Worker like '%Culver%'

