
select top 100 * from [DCSQLPRD104].Enterprise.dbo.InvoiceDetail
---SiteLocationID
---SiteCity
---SiteState
---SiteZip

select distinct LocationID 
INTO D_Location
from [dbo].[D_Customer]
Union
select distinct LocationID from [dbo].[F_Navision]
Union
select distinct LocationID from [dbo].[F_Enterprise]

select DISTINCT
L.LocationID,
ID.SiteZip as Zip,
ID.SiteCity as City,
ID.SiteState as [State]
INTO [dbo].[D_Location1]
from [dbo].[D_Location] L JOIN [DCSQLPRD104].Enterprise.dbo.InvoiceDetail ID ON L.LocationID=ID.SiteLocationID
ORDER BY City, [State]

select count(*) from [dbo].[D_Location]
----------------------------------------------------------

select [LocationID] from [dbo].[F_Enterprise] where [LocationID] not in 
(select distinct [LocationID] from [dbo].[D_Location])
---------------
select [LocationID] from [dbo].[F_Enterprise] where [LocationID] not in 
(select distinct [LocationID] from [dbo].[D_Customer])
---------------
select [SKUID] from [dbo].[F_Enterprise] where [SKUID] not in 
(select distinct [SKUID] from [dbo].[D_Product])
---------------
select [SKUID] from [dbo].[F_Enterprise] where [SKUID] not in 
(select distinct [SKUID] from [dbo].[SkuFinal])
-----------------
select [GLAccount] from [dbo].[F_Enterprise] where [GLAccount] not in 
(select distinct [GLAccount] from [dbo].[D_GL])
-----------------------
select [YearMonth] from [dbo].[F_Enterprise] where [YearMonth] not in 
(select distinct [YearMonth] from [dbo].[D_YearMonth])
----------------------
----------------------- Navition checks are below --------------
-----------------------
select [LocationID] from [dbo].[F_Navision] where [LocationID] not in 
(select distinct [LocationID] from [dbo].[D_Location])
---------------
select [LocationID] from [dbo].[F_Navision] where [LocationID] not in 
(select distinct [LocationID] from [dbo].[D_Customer])
---------------
select [SKUID] from [dbo].[F_Navision] where [SKUID] not in 
(select distinct [SKUID] from [dbo].[D_Product])
---------------
select [SKUID] from [dbo].[F_Navision] where [SKUID] not in 
(select distinct [SKUID] from [dbo].[SkuFinal])
-----------------
select [GLAccount] from [dbo].[F_Navision] where [GLAccount] not in 
(select distinct [GLAccount] from [dbo].[D_GL])
-----------------------
select [YearMonth] from [dbo].[F_Navision] where [YearMonth] not in 
(select distinct [YearMonth] from [dbo].[D_YearMonth])






