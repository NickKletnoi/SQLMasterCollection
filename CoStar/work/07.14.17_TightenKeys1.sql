-----------------------------------------------------------------------------------
select PR1.[GLAccount] as Pr1, PR2.[GLAccount] as Pr2  
from [cube].[F_ProductRevenueENT] PR1 JOIN CoStarB.cube.F_ProductRevenueENT PR2 ON 
PR1.InvoiceDetailID=PR2.InvoiceDetailID and PR1.InvoiceID=PR2.InvoiceID 
WHERE PR1.GLAccount<>PR2.GLAccount;
----------------------------------------------------------------------------------
------------------ CHECK THE NAVISION --------------------------------------------
----------------------------------------------------------------------------------
select distinct PR1.[GLAccount] as NAV_NOW, PR2.[GLAccount] as NAV_ORG
--update PR1
--set PR1.GLAccount=PR2.GLAccount
from [cube].[F_ProductRevenueNAV] PR1 JOIN CoStarB.cube.F_ProductRevenueNAV PR2 ON 
PR1.LineItemID=PR2.LineItemID and PR1.LocationID=PR2.LocationID 
WHERE PR1.GLAccount<>PR2.GLAccount;
-----------------------------------------------------------------------------------
------------------- CHECK THE DIMENSION -------------------------------------------
-----------------------------------------------------------------------------------
select GLAccount from [cube].[F_ProductRevenueNAV] where GLAccount NOT IN (
select GLAccount from cube.D_GLAccount);
-----------------------------------------------------------------------------------
select GLAccount from [cube].[F_ProductRevenueENT] where LEFT(CAST(GLAccount AS varchar(4)),4) NOT IN (
select GLAccount from cube.D_GLAccount);
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
update E
set E.GLAccount=LEFT(CAST(E.GLAccount AS varchar(4)),4)
from [cube].[F_ProductRevenueENT] E
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
---- check the customer dimension --------------------------------------------------
------------------------------------------------------------------------------------
select distinct locationid from [cube].[F_ProductRevenueENT] where LocationID not in (
select LocationID from cube.D_Customer); --46,835
----------------------------------------------------------------------------
select distinct BillingLocationID from [cube].[F_ProductRevenueENT] where BillingLocationID not in (
select LocationID from cube.D_Customer);--14,306
----------------------------------------------------------------
select distinct locationid from [cube].[F_ProductRevenueNAV] where LocationID not in (
select LocationID from cube.D_Customer);--0
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
---- check the location dimension ---------------------------------------------------------
-------------------------------------------------------------------------------------------
select distinct locationid from [cube].[F_ProductRevenueENT] where LocationID not in (
select LocationID from cube.D_Location);
---------------------------------------------------------------------------------------------
select distinct BillingLocationID from [cube].[F_ProductRevenueENT] where BillingLocationID not in (
select LocationID from cube.D_Location);
---------------------------------------------------------------------------------------------
select distinct locationid from [cube].[F_ProductRevenueNAV] where LocationID not in (
select LocationID from cube.D_Location);
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
select count(distinct locationid) from [cube].[F_ProductRevenueENT];
select count(distinct BillingLocationID) from [cube].[F_ProductRevenueENT];
------------------------------------------------------------------------------------------------------
select count(distinct locationid) from [cube].[F_ProductRevenueNAV];
------------------------------------------------------------------------------------------------------
select count(distinct locationid) from [cube].[D_Customer];
select count(distinct locationid) from [cube].[D_Location];
------------------------------------------------------------------------------------------------------

select locationid from D_Location where LocationID not in (
select LocationID from D_Customer)

select Distinct LocationID 
INTO ukn.Location
from D_Location UNION
select Distinct LocationID from D_Customer UNION
select Distinct LocationID from [cube].[F_ProductRevenueENT] UNION
select Distinct BillingLocationID from [cube].[F_ProductRevenueENT] UNION
select Distinct LocationID from [cube].[F_ProductRevenueNAV] 
-----------------------------------------------------------------------------------------------------

select count(distinct locationID) from ukn.Location;
select count(*) from ukn.Location;


Insert [cube].[D_Location] ([LocationID],[City],[State],[Zip])
select Distinct LocationID, SiteCity as City, SiteState as [State], SiteZip as [Zip]  
from [DCSQLPRD104].Enterprise.dbo.InvoiceDetail where LocationID IN (select LocationID from ukn.Location)
 EXCEPT 
select [LocationID],[City],[State],[Zip] from [cube].[D_Location]

select * from cube.D_Location