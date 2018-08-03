--------------------------------------------------------------------------
SELECT * FROM [dbo].[TempApts1] WHERE CustomerHQ like '%Pinnacle Property%'
--UNION
--------------------------------------------------------------------------
SELECT * FROM [dbo].[TempApts1] WHERE CustomerHQ like '%Lincoln Property Company%'
------------------------------------------------------------------------------------
select * from [dbo].[NewHQMatchName] where HQName like '%Greystar%'
select * from [dbo].[NewHQMatchName] where HQName like '%Lincoln Property Company%'
-------------------------------------------------------------------------------------
SELECT DISTINCT [HQName] FROM [dbo].[NewHQMatchName]
--Greystar Real Estate Partners
--Lincoln Property Company
--4,341
----------------------------------------------------------------------------------------
INSERT [dbo].[NewHQMatchName2] ([BillingLocID],[NewHQID],[HQName])
SELECT CustomerParentID,54205 ,'Greystar Real Estate Partners'
FROM [dbo].[TempApts1] WHERE CustomerHQ like '%Greystar%'
-------------------------------------------------------------
INSERT [dbo].[NewHQMatchName2] ([BillingLocID],[NewHQID],[HQName])
SELECT CustomerParentID,1452 ,'Lincoln Property Company'
FROM [dbo].[TempApts1] WHERE CustomerHQ like '%Lincoln Property Company%'
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
alter table [dbo].[NewHQMatchName2] alter column [BillingLocID] varchar(50) null;---------
alter table [dbo].[NewHQMatchName2] alter column NewHQID varchar(50) null;----------------
------------------------------------------------------------------------------------------
select * from [dbo].[NewHQMatchName2];----------------------------------------------------
------------------------------------------------------------------------------------------
/* write custom wrapper */

update T 
SET T.CustomerHQ=N.HQName
from dbo.TempApts1 T JOIN [dbo].[NewHQMatchName2] N 
ON T.CustomerParentID=N.BillingLocID 
------------------------------------------
-------------------------------------------

select * from [dbo].[TempApts3]


