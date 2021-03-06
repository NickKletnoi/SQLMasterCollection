USE [CoStar]
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateMarketSkuNational]    Script Date: 6/19/2017 11:39:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROC [dbo].[uspUpdateMarketSkuNational]
AS


SELECT distinct SKUID 
INTO #National_Skus
FROM SkuLG WHERE SkuName LIKE '%National Subscription%'


SELECT 
LineItemID 
INTO #Problem_LineItems
FROM [dbo].[SkuBridge] WHERE SKUID IN (SELECT SKUID FROM #National_Skus)

select distinct LI.LineItemID,L.LocationID,A.City 
INTO #FixedAddr3
FROM [DCSQLDEV104].Enterprise.[dbo].[LineItem] LI
JOIN [DCSQLDEV104].Enterprise.[dbo].Location L on LI.SiteLocationID=L.LocationID 
LEFT JOIN [DCSQLDEV104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID 
where LI.LineItemID  in  (SELECT LineItemID FROM #Problem_LineItems)
-------------------------------------------------------------------------

UPDATE LG
SET LG.SkuName=LG.SkuName+'('+A.City+')'
from [dbo].[SkuLG] LG JOIN [dbo].[SkuBridge] SB ON
LG.SKUID=SB.SKUID JOIN #FixedAddr3 A on SB.LineItemID=A.LineItemID
--where SB.LineItemID in (Select distinct LineItemID from #FixedAddr3)
--------------------------------------------------------------------
UPDATE P
SET P.[SkuName]=S.SkuName
from SkuLG S JOIN SkuPriceLG P on S.SKUID=P.SKUID
where P.SKUID IN (Select SkuID from #National_Skus)
------------------------------------------------------------------
DROP TABLE #National_Skus;
DROP TABLE #FixedAddr3;
DROP TABLE #Problem_LineItems;
-----------------------------------------------------------------
--- LEAVE THE LINES 

select * from [dbo].[LineItemAppts5]
select count(*) from [dbo].[LineItemAppts5]

select * from [dbo].[LineItemAppts5]


select distinct SB.SKUID,LIA.LineItemID 
INTO Apt.SkuBridge
from [dbo].[LineItemAppts5] LIA JOIN  [revenue].[SkuBridge] SB 
ON LIA.LineItemID=SB.LineItemID



delete from dbo.SkuBridge where LineItemID IN  (select Distinct LineItemID from Apt.SkuBridge);
delete from revenue.SkuBridge where LineItemID IN  (select Distinct LineItemID from Apt.SkuBridge);
delete from dbo.SkuBridge2 where LineItemID IN  (select Distinct LineItemID from Apt.SkuBridge);
delete from dbo.SkuBridgeFinal where LineItemID IN  (select Distinct LineItemID from Apt.SkuBridge);
delete from dbo.SkuBridgeFinal2 where LineItemID IN  (select Distinct LineItemID from Apt.SkuBridge);
-------------------------------------------------------
delete from [dbo].[Sku] where SKUID IN (Select distinct SKUID from Apt.SkuBridge);
delete from [dbo].[SkuPrice] where SKUID IN (Select distinct SKUID from Apt.SkuBridge);
select * from [dbo].[SkuApptsFinal];
--------------------------------------------------------------------------------------

select * from [dbo].[SkuApptsFinal]

ALTER TABLE [dbo].[LineItemAppts5] ADD SkuName Varchar(265) NULL, SKUID INT NULL;

SELECT * FROM [dbo].[SkuApptsFinal]

select top 10 * from [dbo].[LineItemAppts5]

select  [NetworkName],*  from [dbo].[LineItemAppts5] where [NetworkName] is null

select Distinct
('Appts'+'-'+[NetworkName]+'-'+[UnitSign]+'-'+Cast([ContractTermMonths] as Varchar(4))) as SkuName
From [dbo].[LineItemAppts5]

SELECT P.ProductDesc,
*
FROM [dbo].[LineItemAppts5]  LI JOIN Product P on LI.ProductID=P.ProductID
where ( P.ProductDesc Not like '%Finder%' ) AND ( P.ProductDesc Not like '%Apartments.com%')


alter table [dbo].[LineItemAppts5] add SkuNamePre varchar(20) null;

update LI
set LI.SkuNamePre='Finder'
From [dbo].[LineItemAppts5]  LI JOIN Product P on LI.ProductID=P.ProductID
where P.ProductDesc Like '%Finder%'
--------------
update LI
set LI.SkuNamePre='Appts'
From [dbo].[LineItemAppts5]  LI JOIN Product P on LI.ProductID=P.ProductID
where P.ProductDesc Like '%Apartments.com%'

select top 10 * from [dbo].[SkuApptsFinal]

select * from  [dbo].[LineItemAppts5] 
--30004-Appts-Gold-M-24

select *,
[SkuNamePre]+'-'+[NetworkName]+'-'+ISNULL([UnitSign],'N')+'-'+ISNULL(Cast([ContractTermMonths] as varchar(4)),'N/A')

---'[UnitSign]+'-'Cast([ContractTermMonths] as Varchar(4))) as SkuN
from [dbo].[LineItemAppts5]


select * from  [dbo].[SkuApptsFinal]


alter table [dbo].[SkuApptsFinal] add SkuNameShort varchar(250) NULL;

select top 10 * from [dbo].[LineItemAppts5]

 
update SAF
SET [SkuNameShort]=RIGHT([SkuName],LEN([SkuName])-6)  
from [dbo].[SkuApptsFinal] SAF
------------------------------------

Update LI
SET [SkuName]=[SkuNamePre]+'-'+[NetworkName]+'-'+ISNULL([UnitSign],'N')+'-'+ISNULL(Cast([ContractTermMonths] as varchar(4)),'N/A')
FROM [dbo].[LineItemAppts5] LI

update LIA
set LIA.[SKUID]=SAF.SKUID
FROM [dbo].[LineItemAppts5] LIA JOIN [dbo].[SkuApptsFinal] SAF ON LIA.SkuName=SAF.SkuNameShort

select Distinct SkuName from [dbo].[LineItemAppts5] where SKUID IS NULL

Finder-Finder Sites-M-N/A
Finder-Finder Sites-P-N/A

select count(*) from [dbo].[LineItemAppts5] where SKUID is null;---403

update LIA
set LIA.[SKUID]=SAF.SKUID
FROM [dbo].[LineItemAppts5] LIA JOIN [dbo].[SkuApptsFinal] SAF ON LIA.SkuName=SAF.SkuNameShort
where LIA.SKUID is null
--73,853
select Distinct
SKUID,LineItemID
INTO LineItemApptsNewInsert
from [dbo].[LineItemAppts5]

select * from LineItemApptsNewInsert

Insert [dbo].[SkuBridge2]([LineItemID],[SKUID])
select [LineItemID],[SKUID] from LineItemApptsNewInsert;

-------------
Insert [dbo].[SkuBridge]([LineItemID],[SKUID])
select [LineItemID],[SKUID] from LineItemApptsNewInsert;
------------------
Insert [revenue].[SkuBridge]([LineItemID],[SKUID])
select [LineItemID],[SKUID] from LineItemApptsNewInsert;
--------------------

insert [revenue].[SkuPrice] ([SKUID],[SkuName],[Price])
select [SKUID],[SkuName],[Price] FROM [dbo].[SkuApptsFinal] 
-------------
insert [dbo].[SkuPrice] ([SKUID],[SkuName],[Price])
select [SKUID],[SkuName],[Price] FROM [dbo].[SkuApptsFinal] 
----------
----------
insert [revenue].[Sku] ([SKUID],[SkuName],[Amount])
select [SKUID],[SkuName],[Price] FROM [dbo].[SkuApptsFinal] ;
------
insert [dbo].[Sku] ([SKUID],[SkuName],[Amount])
select [SKUID],[SkuName],[Price] FROM [dbo].[SkuApptsFinal] ;


insert [dbo].[SkuListPriced] ([SKUID],[ListPrice])
select [SKUID],[Price] from  [dbo].[SkuApptsFinal] where Price is not null

(select distinct LineItemID from [revenue].[SkuBridge])

select distinct LineItemID from [dbo].[LineItemAppts5]
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
