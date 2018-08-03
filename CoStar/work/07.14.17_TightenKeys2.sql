--16092


select * from revenue.Sku where SKUID=16092
select * from [cube].[F_ProductRevenueNAV] where SKUID=16092

select distinct skuid from  [cube].[F_ProductRevenueNAV] union
select distinct skuid from [cube].[F_ProductRevenueENT] 
--9921
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--- These are the skus for  only the elements present in the Enterprise and Navision
---------------------------------------------------------------------------------------
select count(distinct skuid) from revenue.SkuPrice where DiscountedMonthlyPrice>0;
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
/* 
Build the dimension with elements that are needed using the locationID's provided
By the the 
-------------
ukn.Location
-------------
table
*/


Insert [cube].[D_Location] ([LocationID],[City],[State],[Zip])
select Distinct LocationID, SiteCity as City, SiteState as [State], SiteZip as [Zip]  
from [DCSQLPRD104].Enterprise.dbo.InvoiceDetail





--21,203,397

-------------------------------------------------------------------------------
insert [cube].[D_Customer]([LocationID],[CustomerName],[BusinessTypeCategory])
select LP.LocationID, LP.CompanyName,BT.BusinessTypeName 
from [DCSQLPRD104].Enterprise.dbo.LocationProfile LP LEFT JOIN [dbo].[BusinessType] BT 
ON LP.BusinessTypeID=BT.BusinessTypeID
where LP.LocationID IN (select LocationID from [ukn].[Location]) EXCEPT
select locationid,'','' from [cube].[D_Customer]
-------------------------------------------------------------------------------

select distinct LocationID,CustomerName 
into #tempCustomer
from dbo.D_Customer

update C
set C.CustomerName=T.LocationName
from cube.D_Customer C JOIN [DCSQLPRD104].Enterprise.dbo.Location T ON C.LocationID=T.LocationID
where C.CustomerName IS NULL


select * from cube.D_Customer

insert [cube].[D_Location]([LocationID],[CustomerName],[BusinessTypeCategory])
select LP.LocationID, LP.CompanyName,BT.BusinessTypeName 
from [DCSQLPRD104].Enterprise.dbo.LocationProfile LP LEFT JOIN [dbo].[BusinessType] BT 
ON LP.BusinessTypeID=BT.BusinessTypeID
where LP.LocationID IN (select LocationID from [ukn].[Location]) EXCEPT
select locationid,'','' from [cube].[D_Customer]
-------------------------------------------------
-------------------------------------------------

SELECT 
C.NAME AS COLUMN_NAME,
T.NAME AS TABLE_NAME 
FROM SYS.columns C JOIN SYS.TABLES T 
ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN SYS.schemas S 
ON T.[SCHEMA_ID]=S.[schema_id]
WHERE
C.NAME like '%City%'
--T.NAME='LOCATION' AND 
ORDER BY C.COLUMN_ID


alter table  [cube].[F_ProductRevenueENT] alter column [GLAccount] varchar(20) null;




exec sp_rename 'F_MEA.YR_MTH','YearMonth'

truncate table [cube].[F_MEA]


select * from 

truncate table [dbo].[WriteTable_MEA]

select * from [dbo].[WriteTable_MEA]
