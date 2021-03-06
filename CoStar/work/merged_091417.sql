select [ContractID],[ProductID],[BundleID], sum([CurrentMonthlyPrice]) as price 
from [dbo].[LineItem]
where [LastChargeDate] between '2017-01-01'and '2017-01-31' and [CurrentMonthlyPrice]>1
group by  [ContractID],[ProductID],[BundleID]
order by [ContractID]
--------------------------------------------------------------------------------------------------------

select [ContractID],LI.[ProductID],P.ProductName as ProductName,[BundleID], [CurrentMonthlyPrice],SiteLocationID,* from  [dbo].[LineItem] LI JOIN [dbo].Product P
ON LI.ProductID=P.ProductID
where [LastChargeDate] between '2017-01-01'and '2017-01-31' and [CurrentMonthlyPrice]>1
and contractID=62304
------------------------------------------------------------------------------------------------------------------------------
--where contractID=12 -- 636
--where contractID=12
select * from [dbo].[LineItem]
-------------------------------------------------------------------------------------------------------------------------------
select [ContractID],count([BundleID]) as BundleCount,Count(SiteLocationID) SiteLocationCount, sum([CurrentMonthlyPrice]) as price 
from [dbo].[LineItem]
--where  [LastChargeDate] between '2017-01-01'and '2017-01-31' and [CurrentMonthlyPrice]>1 and count([BundleID])>0
group by  [ContractID],[ProductID],[BundleID]
--having count([BundleID])>0
--order by [ContractID]
having count([BundleID])>1 and count([BundleID])<>Count(SiteLocationID)
--and  [LastChargeDate] between '2017-01-01'and '2017-01-31' and [CurrentMonthlyPrice]>1 and count([BundleID])>0












USE [EnterpriseSalesPricing]
     
       DECLARE @DataTable AS prc.ProductType
      INSERT @DataTable (ProductID,Productname)
      Values (2,'TenantWeb'),
              (5,'CompsWeb')
      
       EXEC [prc].[spPropertyTenantPrice] 
            @pLocationID = 2927,
            @pnumberofMarket = 5,
            @pUserCount = 1,
            @pProducts = @DataTable,
            @pDetail = 0
SELECT BUNDLEID, COUNT(DISTINCT PRODUCTID) AS PRDODUCT FROM LineItem
WHERE [CurrentMonthlyPrice] IS NOT NULL AND YEAR([BillingStartDate])=2016
GROUP BY BUNDLEID
ORDER BY  COUNT(DISTINCT PRODUCTID)USE [CoStar]
GO

INSERT INTO [dbo].[Sku_hist]
           ([SKUID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[Amount])
     SELECT 
           [SKUID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[Amount]
     FROM [dbo].[Sku]
	 WHERE SKUID=3


	 SELECT * FROM [dbo].[Sku_hist]
	 ORDER BY AMOUNT

	 SELECT SKUID, SUM(AMOUNT) AMT 
	 FROM [dbo].[LineItem]
	 WHERE SKUID=3
	 GROUP BY SKUID
	 ---------------------------
	 SELECT SKUID, SUM(AMOUNT) AMT 
	 FROM [dbo].Sku
	 WHERE SKUID=3
	 GROUP BY SKUID
	------------------------------



TRUNCATE TABLE [dbo].[LineItem];
TRUNCATE TABLE [dbo].[Sku];
TRUNCATE TABLE [dbo].[SkuPrice];

Insert [dbo].[LineItem] (
            [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount]
)
SELECT
            [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount] 

FROM [CoStar2].dbo.LineItem WHERE SKUID in (
0,
8,
16,
24,
34,
43
) 
AND AMOUNT<>0
ORDER BY ContractID, BundleID,ProductID
;

INSERT INTO [dbo].[Sku]
           ([SKUID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[Amount])

SELECT            
            [SKUID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[Amount]

FROM [CoStar2].dbo.Sku WHERE SKUID in (
0,
8,
16,
24,
34,
43
) ORDER BY SKUID, ProductID, MarketID
;

INSERT INTO [dbo].[SkuPrice]
           ([SKUID]
           ,[Price]
           ,[Listed_Price]
           ,[LastUpdateDate])
SELECT
            [SKUID]
           ,[Price]
           ,[Listed_Price]
           ,[LastUpdateDate]
FROM [CoStar2].dbo.SkuPrice WHERE SKUID in (
0,
8,
16,
24,
34,
43
) ORDER BY SKUID
;






-------------------------------------------------------------------
SELECT [SKUID]
      ,S.[ProductID] AS ProductID
	  ,P.ProductDesc AS Product_Description
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[Amount]
  FROM [dbo].[Sku] S JOIN Product P ON
  S.ProductID=P.ProductID ORDER BY SKUID
  -----------------------------------------------------------------
  -----------------------------------------------------------------
  SELECT * FROM SkuPrice

  SELECT * FROM LineItem WHERE SKUID=0
  
  ORDER BY SKUID





INSERT Market ([MarketID],[MarketName])
SELECT MarketID=CoStarMarket, MarketName=MarketName 
FROM [DCSQLPRD104].Enterprise.dbo.CostarMarket
union
SELECT MarketID=ProductMarket,MarketName=ProductMarketName 
FROM [DCSQLPRD104].Enterprise.dbo.ProductMarket


select MarketID, COUNT(*) from Market
GROUP BY MARKETID
HAVING COUNT(*) >1

WITH DUPS AS
( SELECT MarketID, ROW_NUMBER() OVER (PARTITION BY MarketID
                                                                ORDER BY MarketID) AS MK
  FROM [dbo].[Market]
)
DELETE FROM DUPS WHERE MK > 1;
----------------------------------
SELECT * FROM [dbo].[Market]

SELECT SKUID, 
CAST(SKUID AS VARCHAR(20))+'-'+
'Suite-'+
CAST(M.MarketName AS VARCHAR(20))+'-'+
CAST(UserCount AS VARCHAR(20))+'-'+
CAST(BT.BusinessTypeCategory AS VARCHAR(20)) AS SKU_NAME
into #sku_name3
FROM SkuLG LG LEFT JOIN Market M on LG.MarketID=M.MarketID LEFT JOIN 
(Select DISTINCT [BusinessTypeCategoryID],[BusinessTypeCategory] FROM [dbo].[BusinessType]) BT
ON LG.CustomerType=BT.BusinessTypeCategoryID

SELECT COUNT(*) FROM SkuLG

SELECT * FROM #sku_name3

UPDATE S
SET S.SkuName=S1.SKU_NAME
FROM SkuLG S join #sku_name3 S1 on S.SKUID=S1.SKUID 


UPDATE S
SET S.SkuName=M.MarketName
FROM Sku S Join Market M on S.MarketID=M.MarketID 
---------------------------------------------------

SELECT SkuN=Skuid
FROM SkuLG 
---------------------------------------------------
-------------------------------------------------------
Select * from SkuLG where SkuName is not null
-------------------------------------------------------
UPDATE SP
SET SP.SkuName=LG.SkuName
from [dbo].[TOP900SKUS] SP JOIN SkuLG LG on SP.SKUID=LG.SKUID
------------------------------------------------------
SELECT * FROM [dbo].[SkuPriceLG] WHERE SkuName IS NOT NULL AND PRICE>4
ORDER BY Price DESC;
--------------------------------------------------------




SELECT 
C.NAME AS COLUMN_NAME,
T.NAME AS TABLE_NAME 
FROM SYS.columns C JOIN SYS.TABLES T 
ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN SYS.schemas S 
ON T.[SCHEMA_ID]=S.[schema_id]
WHERE
C.NAME like '%Market%'
--T.NAME='LOCATION' AND 
ORDER BY C.COLUMN_ID
---------------------------------------------------

SELECT CoStarMarket, MarketName FROM CostarMarket




select * from SkuLG


��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p L O A D _ L i n e I t e m ]         S c r i p t   D a t e :   4 / 2 0 / 2 0 1 7   2 : 2 2 : 5 6   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 S E L E C T   *   F R O M   [ d b o ] . [ L i n e I t e m 1 ]  
  
 U P D A T E   W B  
 S E T   W B . [ C u s t o m e r T y p e ] = L I 1 . [ C u s t o m e r T y p e ]  
 F R O M   [ d b o ] . [ L i n e I t e m W B ]   W B   J O I N     [ d b o ] . [ L i n e I t e m 1 ]   L I 1   O N   W B . B u n d l e I D = L I 1 . B u n d l e I D    
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 s e l e c t   *   f r o m   L i n e I t e m W B   w h e r e   C u s t o m e r T y p e > 5 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 U P D A T E   W B  
 S E T   W B . [ C u s t o m e r T y p e ] = 0  
 F R O M   [ d b o ] . [ L i n e I t e m W B ]   W B   w h e r e   C u s t o m e r T y p e > 5  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 U P D A T E   M C  
 S E T   M C . [ C u s t o m e r T y p e ] = W B . C u s t o m e r T y p e  
 f r o m   [ d b o ] . [ S k u L G ]   M C   j o i n   [ d b o ] . [ L i n e I t e m W B ]   W B   o n   M C . S K U I D = W B . S K U I D  
  
  
  
  
  
  
  
  
  
 E X E C   [ d b o ] . [ u s p L O A D _ L i n e I t e m ]  
  
  
 A L T E R   P R O C E D U R E   [ d b o ] . [ u s p L O A D _ L i n e I t e m ]  
 A S  
  
 T R U N C A T E   T A B L E   L i n e I t e m 1 ;  
  
 I N S E R T   L i n e I t e m 1   (  
                         [ L i n e I t e m I D ]  
                       , [ C o n t r a c t I D ]  
                       , [ B u n d l e I D ]  
                       , [ P r o d u c t I D ]  
                       , [ M a r k e t I D ]  
                       , [ U s e r C o u n t ]  
                       , [ C u s t o m e r T y p e ]  
                       , [ D a t e ]  
                       , [ S K U I D ]  
                       , [ A m o u n t ] )  
  
 - - S E L E C T  
 - - L i n e I t e m I D   a s   L i n e I t e m I D ,    
 - - C o n t r a c t I D   a s   C o n t r a c t I D ,  
 - - I S N U L L ( B u n d l e I D , - 1 )   a s   B u n d l e I D ,  
 - - I S N U L L ( P r o d u c t I D , - 1 )   a s   P r o d u c t I D ,  
 - - I S N U L L ( P r o d u c t M a r k e t , ' - 1 ' )   a s   M a r k e t I D ,  
 - - I S N U L L ( N u m b e r O f U s e r s , 0 )   a s   U s e r C o u n t ,  
 - - I S N U L L ( I T . I n d u s t r y T y p e I D , 0 )   a s   C u s t o m e r T y p e ,    
 - - B i l l i n g S t a r t D a t e   a s   [ D a t e ] ,    
 - - - 1   a s   S K U I D   ,  
 - - C A S T   ( O r i g i n a l M o n t h l y P r i c e   A S   d e c i m a l ( 1 0 , 2 ) )   a s   A m o u n t  
 - - F R O M   E n t e r p r i s e . d b o . L i n e I t e m   L I   L E F T   J O I N  
 - - E n t e r p r i s e S u b . d b o . S a l e s U n i t P r o d u c t M a r k e t   S U P M   o n   L I . S a l e s U n i t I D = S U P M . S a l e s U n i t I D   L E F T   J O I N  
 - - E n t e r p r i s e . d b o . L o c a t i o n P r o f i l e   L P   O N   L I . S i t e L o c a t i o n I D = L P . L o c a t i o n I D   L E F T   J O I N  
 - - E n t e r p r i s e . d b o . I n d u s t r y T y p e   I T   O N   L P . I n d u s t r y T y p e I D = I T . I n d u s t r y T y p e I D  
 - - W H E R E    
 - - - - Y E A R ( B i l l i n g S t a r t D a t e )   i n   ( 2 0 1 6 , 2 0 1 7 )    
 - - L i n e I t e m S t a t u s I D = 1  
 - - A N D   B U N D L E I D   I S   N O T   N U L L  
 - - U N I O N  
 S E L E C T    
 L i n e I t e m I D   a s   L i n e I t e m I D ,    
 C o n t r a c t I D   a s   C o n t r a c t I D ,  
 I S N U L L ( B u n d l e I D , - 1 )   a s   B u n d l e I D ,  
 I S N U L L ( P r o d u c t I D , - 1 )   a s   P r o d u c t I D ,  
 I S N U L L ( P r o d u c t M a r k e t , ' - 1 ' )   a s   M a r k e t I D ,  
 I S N U L L ( N u m b e r O f U s e r s , 0 )   a s   U s e r C o u n t ,  
 I S N U L L ( B T . [ B u s i n e s s T y p e C a t e g o r y I D ] , 0 )   a s   C u s t o m e r T y p e ,    
 L I . B i l l i n g S t a r t D a t e   a s   [ D a t e ] ,    
 - 1   a s   S K U I D   ,  
 C A S T   ( O r i g i n a l M o n t h l y P r i c e   A S   d e c i m a l ( 1 0 , 2 ) )   a s   A m o u n t  
 F R O M   [ D C S Q L P R D 1 0 4 ] . E n t e r p r i s e . d b o . L i n e I t e m   L I   L E F T   J O I N  
 [ D C S Q L P R D 1 0 4 ] . E n t e r p r i s e S u b . d b o . S a l e s U n i t P r o d u c t M a r k e t   S U P M   o n   L I . S a l e s U n i t I D = S U P M . S a l e s U n i t I D   L E F T   J O I N  
 [ D C S Q L P R D 1 0 4 ] . E n t e r p r i s e . d b o . L o c a t i o n P r o f i l e   L P   O N   L I . S i t e L o c a t i o n I D = L P . L o c a t i o n I D   L E F T   J O I N  
 [ d b o ] . [ B u s i n e s s T y p e ]   B T   O N   L P . B u s i n e s s T y p e I D = B T . B u s i n e s s T y p e I D  
 W H E R E    
 - - Y E A R ( B i l l i n g S t a r t D a t e )   i n   ( 2 0 1 6 , 2 0 1 7 )    
 L i n e I t e m S t a t u s I D = 1  
 A N D   B U N D L E I D   I S   N O T   N U L L ---------------------------------------------------------------------------
SELECT * FROM SkuLG where SkuName IS NOT NULL AND SkuName LIKE '%Brokerage%'
ORDER BY SKUID, ProductID
---------------------------------------------------------------------------
SELECT * FROM SkuLG where SkuName IS NOT NULL AND SkuName LIKE '%Appraisal%'
ORDER BY SKUID, ProductID
---------------------------------------------------------------------------
SELECT * FROM SkuLG where SkuName IS NOT NULL AND SkuName LIKE '%Lender%'
ORDER BY SKUID, ProductID
---------------------------------------------------------------------------
SELECT * FROM SkuLG where SkuName IS NOT NULL AND SkuName LIKE '%Commercial%'
ORDER BY SKUID, ProductID
----------------------------------------------------------------------------
SELECT * FROM SkuLG where SkuName IS NOT NULL AND SkuName LIKE '%Vendor%'
ORDER BY SKUID, ProductID
---------------------------------------------------------------------------
SELECT  * FROM SkuLG where SkuName IS NOT NULL AND SkuName LIKE '%Owner%'
ORDER BY SKUID, ProductID
----------------------------------------------------------------------------
SELECT * FROM SkuLG where SkuName IS NOT NULL AND SkuName LIKE '%Retailer%'
ORDER BY SKUID, ProductID
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
SELECT * FROM SkuPriceLG where SKUID IN (
----- Brokers
--6552,
--7317,
--9172,
--10450
--)
------Tax Appeal
--27753,
--28045,
--28768
------ Lender
----)
--43,
--152,
--680,
--858
--)
----- Vendor
--26980,
--27134,
--29054
--)
------- Owner PMC
----1026,
----1156,
----1179,
----1735,
----2754
----)
-- Retailer and Corporate RE
84,
202,
383,
575,
867
);

-- order by SkuName;

SELECT COUNT(*) FROM SkuPriceLG where SkuName LIKE '%Retailer%' AND Price>4
SELECT COUNT(*) FROM SkuPriceLG where SkuName is not null AND Price>4

SELECT * FROM  [dbo].[BusinessTypeCategory]
------------------------------
--- TOTAL SKU COUNT#2350
--- TOTAL SKU N/A#861
------------------------------
--SELECT SkuName, COUNT(*) CNT 
--FROM SkuPriceLG
--GROUP BY SKU
---------------------- Mapping / David / ----------------------------
SELECT
BT.BusinessTypeName,
BTC.BusinessTypeCategory
FROM 
[dbo].[BusinessType] BT JOIN [dbo].[BusinessTypeCategory] BTC 
ON BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
---------------------------------------------------------------------
SELECT 
S.CustomerType,
BT.BusinessTypeName,
BTC.BusinessTypeCategory,
count(*) as cnt
 FROM SkuLG S JOIN BusinessType BT on S.CustomerType=BT.BusinessTypeID JOIN BusinessTypeCategory BTC ON
 BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID WHERE S.SKUID IN (
 select SKUID from SkuPriceLG where SKUID in (
 select distinct skuid from #EasySku) and SkuName is not null and Price>4 )
 group by customertype,BTC.BusinessTypeCategory,BT.BusinessTypeName
 order by CustomerType

 select * 
 INTO #EasySku
 from skuLG where CustomerType in (
 4,8,11,12,13,14,15,16) and skuname is not null


 select * from SkuLG where SKUID in (
  select * from SkuPriceLG where SKUID in (
 select distinct skuid from #EasySku where SkuName is not null and Price>4 )
  ---
  select * from SkuPriceLG where SKUID in (
 select distinct skuid from #EasySku where SkuName is not null and Price>4 )
 

SELECT DISTINCT 
S.SKUID,S.SkuName
FROM 
 [dbo].[SkuPriceLG] SP JOIN [dbo].[SkuLG] S ON SP.SKUID=S.SKUID
WHERE S.MarketID IN 

(SELECT MarketID FROM Market2 WHERE StateFlg=1)
AND S.SkuName IS NOT NULL AND SP.Price>4
AND S.CustomerType IN (1,2)
--------------------------------------------------------

SELECT 
DISTINCT SKUID 
INTO #TAX_SKUS
FROM SkuLG WHERE SkuName LIKE '%Appraisal/Valuation/Tax Appeal%'
AND Amount>0

SELECT 
DISTINCT SKUID 
INTO #Broker_SKUS
FROM SkuLG WHERE SkuName LIKE '%Brokerage/Consultants%'
AND Amount>0


select distinct skuid
into #State_Skus
 from SkuLG where SKUID in (
SELECT SkuID from #Broker_SKUS
union
SELECT SkuID from #TAX_SKUS)
AND MarketID IN (
SELECT [MarketID] FROM [dbo].[Market2] WHERE [StateFlg]=1)


SELECT 

LineItemID 
INTO #Problem_LineItems
FROM [dbo].[SkuBridge] WHERE SKUID IN (SELECT SKUID FROM #State_Skus)

SELECT  LI.[SiteLocationID], L.SiteAddress, PL.LineItemID 
into #FixedAddr1
FROM [DCSQLDEV104].Enterprise.[dbo].[LineItem] LI JOIN
(
SELECT distinct ID.SiteAddress, ID.LineItemID from [DCSQLDEV104].Enterprise.[dbo].InvoiceDetail ID 
--where ID.LineItemID=LI.LineItemID
) L ON LI.LineItemID=L.LineItemID
JOIN #Problem_LineItems PL ON PL.LineItemID=LI.LineItemID


select DISTINCT LI.SiteLocationID, L.LocationID,ASM.Address from [DCSQLDEV104].Enterprise.[dbo].[LineItem] LI
JOIN [DCSQLDEV104].Enterprise.[dbo].Location L on LI.SiteLocationID=L.LocationID 
LEFT JOIN [DCSQLDEV104].Enterprise.[dbo].AddressSubmarket ASM ON L.AddressID=ASM.AddressID LEFT JOIN 
where LI.LineItemID  in  (SELECT LineItemID FROM #Problem_LineItems)


Select * from [DCSQLDEV104].Enterprise.[dbo].AddressSubmarket

select * from [DCSQLDEV104].Enterprise.[dbo].CitySubmarket









SELECT * 
--INTO #National_Skus
FROM SkuPriceLG WHERE SkuName LIKE '%National Subscription%' and Price>0

update S
Set S.SkuName='92-Suite-National Subscription-2-Lender(Dallas/FortWorth)'
from SkuLG S where SKUID=92
----------------------------------
update SP
Set SP.SkuName='92-Suite-National Subscription-2-Lender(Dallas/FortWorth)'
from SkuPriceLG SP where SKUID=92
-----------
-----------
update S
Set S.SkuName='697-Suite-National Subscription-20-N/A(Houston)'
from SkuLG S where SKUID=697
----------------------------------
update SP
Set SP.SkuName='697-Suite-National Subscription-20-N/A(Houston)'
from SkuPriceLG SP where SKUID=697
--------
--------
update S
Set S.SkuName='3497-Suite-National Subscription-3-N/A(Atlanta)'
from SkuLG S where SKUID=697
----------------------------------
update SP
Set SP.SkuName='3497-Suite-National Subscription-3-N/A(Atlanta)'
from SkuPriceLG SP where SKUID=697
-------
-------
update S
Set S.SkuName='27753-Suite-National Subscription-6-Appraisal/Valuation/Tax Appeal(Philadelphia)'
from SkuLG S where SKUID=27753
----------------------------------
update SP
Set SP.SkuName='27753-Suite-National Subscription-6-Appraisal/Valuation/Tax Appeal(Philadelphia)'
from SkuPriceLG SP where SKUID=27753
-------------
--------------
update S
Set S.SkuName='8481-Suite-National Subscription-0-Brokerage/Consultants(Atlanta)(Atlanta)'
from SkuLG S where SKUID=8481
----------------------------------
update SP
Set SP.SkuName='8481-Suite-National Subscription-0-Brokerage/Consultants(Atlanta)(Atlanta)'
from SkuPriceLG SP where SKUID=8481
----------
----------
update S
Set S.SkuName='11528-Suite-National Subscription-16-Brokerage/Consultants(New York)'
from SkuLG S where SKUID=11528
----------------------------------
update SP
Set SP.SkuName='11528-Suite-National Subscription-16-Brokerage/Consultants(New York)'
from SkuPriceLG SP where SKUID=11528
--------
--------
update S
Set S.SkuName='28085-Suite-National Subscription-6-Brokerage/Consultants(Montr�al)'
from SkuLG S where SKUID=28085
----------------------------------
update SP
Set SP.SkuName='28085-Suite-National Subscription-6-Brokerage/Consultants(Montr�al)'
from SkuPriceLG SP where SKUID=28085
----------
----------
update S
Set S.SkuName='29004-Suite-National Subscription-64-Brokerage/Consultants(Plymouth)'
from SkuLG S where SKUID=29004
----------------------------------
update SP
Set SP.SkuName='29004-Suite-National Subscription-64-Brokerage/Consultants(Plymouth)'
from SkuPriceLG SP where SKUID=29004
---------------
---------------
update S
Set S.SkuName='29045-Suite-National Subscription-125-Brokerage/Consultants(Greenbelt)'
from SkuLG S where SKUID=29045
----------------------------------
update SP
Set SP.SkuName='29045-Suite-National Subscription-125-Brokerage/Consultants(Greenbelt)'
from SkuPriceLG SP where SKUID=29045
---------
--------
update S
Set S.SkuName='29113-Suite-National Subscription-23-Appraisal/Valuation/Tax Appeal(Portland)'
from SkuLG S where SKUID=29113
----------------------------------
update SP
Set SP.SkuName='29113-Suite-National Subscription-23-Appraisal/Valuation/Tax Appeal(Portland)'
from SkuPriceLG SP where SKUID=29113
------------
------------
update S
Set S.SkuName='29179-Suite-National Subscription-50-Appraisal/Valuation/Tax Appeal(Woodland Hills)'
from SkuLG S where SKUID=29179
----------------------------------
update SP
Set SP.SkuName='29179-Suite-National Subscription-50-Appraisal/Valuation/Tax Appeal(Woodland Hills)'
from SkuPriceLG SP where SKUID=29179
----------
---------
update S
Set S.SkuName='29199-Suite-National Subscription-7-Appraisal/Valuation/Tax Appeal(Madison)'
from SkuLG S where SKUID=29199
----------------------------------
update SP
Set SP.SkuName='29199-Suite-National Subscription-7-Appraisal/Valuation/Tax Appeal(Madison)'
from SkuPriceLG SP where SKUID=29199
---------
---------SELECT 
C.NAME AS COLUMN_NAME,
ST.name AS COLUMN_TYPE, 
T.NAME AS TABLE_NAME
FROM SYS.columns C JOIN SYS.TABLES T 
ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN SYS.schemas S 
ON T.[SCHEMA_ID]=S.[schema_id] JOIN  SYS.TYPES ST ON
C.system_type_id=ST.system_type_id
WHERE
ST.name='int' o
--(C.NAME LIKE '%total area%') OR (C.NAME LIKE '%sq foot%') OR (C.NAME LIKE '%square%')
--T.NAME='LOCATION' AND 
ORDER BY C.Name
------------------------------------------------------------------------------------
--Column='AreaSqFt'	int	table='Footprint'
--Column='AverageTenantSizeSqFt'	int	table='ResearchUpdate'
--Column='AvailableFloorSpace'	int	table='ResearchUpdate'
--Column='CenterTotalLotSqFt'	int	table='ShoppingCenterAttributes'
--                                 table='inboxBaselineRollup'
---DealSF	int	UsageUserInfo ??
--Column=GrossTypFloorSqFtSourceID	table='Property'
------------------------------------------------------------------------------------
----select * from sys.types
------------------------------------------------------------------------------------
USE [CoStar2]
GO

SELECT [LineItemID]
      ,[ContractID]
      ,[BundleID]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[SKUID]
      ,[Amount]
INTO ##SkuBridge2
  FROM [dbo].[LineItem]
UNION
SELECT [LineItemID]
      ,[ContractID]
      ,[BundleID]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[SKUID]
      ,[Amount]
  FROM [dbo].[LineItem_1stbatch]
UNION
SELECT [LineItemID]
      ,[ContractID]
      ,[BundleID]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[SKUID]
      ,[Amount]
  FROM [dbo].[LineItem1]
SELECT [LineItemID]
      ,[ContractID]
      ,[BundleID]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[SKUID]
      ,[Amount]
  FROM [dbo].[LineItem3]


SELECT 
      LineItemID=SB2.LineItemID,
      ContractID=SB2.ContractID,
	  LocationID=LI.SiteLocationID,
      BundleID=SB2.BundleID,
      SKUID=SB2.SKUID,
	  SqFt=BSF.GrossBldgSqFt	 
INTO SkuBridge3  
 FROM ##SkuBridge2 SB2 JOIN ENTERPRISE.dbo.LineItem LI ON SB2.LineItemID=LI.LineItemID 
 LEFT JOIN  ENTERPRISE.dbo.Location L ON LI.SiteLocationID=L.LocationID
 LEFT JOIN ENTERPRISE.dbo.LocationOccupancy LO on LI.SiteLocationID=LO.TenantLocationID
 LEFT JOIN [dbo].[BldSqFt] BSF ON BSF.PropertyID=LO.PropertyID


 with dups as (
 select LineItemID, rn=ROW_NUMBER() over (partition by  LineItemID order by LineItemID) 
   from SkuBridge3 )

delete from dups where rn>1;


select * from ##SkuBridge3SELECT 
LI.LineItemID as LineItemID, 
LI.ContractID as ContractID,
ISNULL(LI.BundleID,-1) as BundleID,
ISNULL(LI.ProductID,-1) as ProductID,
ISNULL(A.CityID,'-1') as MarketID,
A.City,
L.LocationID,
ISNULL(LI.NumberOfUsers,0) as UserCount,
ISNULL(BTC.BusinessTypeCategoryID,8) as CustomerType, 
LI.BillingStartDate as [Date], 
-1 as SKUID ,
CAST (LI.OriginalMonthlyPrice AS decimal(10,2)) as Amount
INTO #TempAppts
FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI LEFT JOIN
[DCSQLPRD104].EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.LocationProfile LP ON LI.SiteLocationID=LP.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Location L ON LI.SiteLocationID=L.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID LEFT JOIN
[dbo].[BusinessType] BT ON LP.BusinessTypeID=BT.BusinessTypeID LEFT JOIN [dbo].[BusinessTypeCategory] BTC ON
BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
WHERE 
--YEAR(BillingStartDate) in (2016,2017) 
LineItemStatusID=1
AND ProductID IN (SELECT ProductID FROM  [dbo].[ProductAppts])
--BUNDLEID IS NOT NULL


SELECT * 
INTO LineItemAppts
FROM #TempAppts

SELECT COUNT(*) FROM #TempAppts

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
----------------------- Appartment Contracts to inspect -----------------------------------
-------------------------------------------------------------------------------------------
SELECT * FROM [dbo].[LineItemAppts] 
WHERE ContractID IN (103966,104035,104111,104142,104188,101478,101578)
ORDER BY ContractID
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--3, SELECT 
LI.LineItemID as LineItemID, 
LI.ContractID as ContractID,
ISNULL(LI.ProductID,-1) as ProductID,
ISNULL(A.CityID,'-1') as MarketID,
LI.BillingStartDate as [Date], 
PA.SKUID as SKUID ,
CAST (LI.OriginalMonthlyPrice AS decimal(10,2)) as Amount
INTO [dbo].[LineItemAppts1]
FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI LEFT JOIN
[DCSQLPRD104].EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.LocationProfile LP ON LI.SiteLocationID=LP.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Location L ON LI.SiteLocationID=L.LocationID LEFT JOIN
[DCSQLPRD104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID LEFT JOIN
[dbo].[BusinessType] BT ON LP.BusinessTypeID=BT.BusinessTypeID LEFT JOIN [dbo].[BusinessTypeCategory] BTC ON
BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID LEFT JOIN [dbo].[ProductAppts] PA ON 
LI.ProductID=PA.ProductID

WHERE 
--YEAR(BillingStartDate) in (2016,2017) 
LineItemStatusID=1
AND LI.ProductID IN (SELECT ProductID FROM  [dbo].[ProductAppts])
--BUNDLEID IS NOT NULL


select * from [dbo].[LineItemAppts1] LIA JOIN SkuAppts SA on LIA.SKUID=SA.SKUID
order by ContractID
--282,246 (Silver ?) 
select * from [dbo].[SkuAppts]
-------------------------------------
select * from [dbo].[ProductAppts] where ProductID in (282,246)
SELECT * FROM [dbo].[LineItemAppts] ORDER BY ContractID, ProductID
select * from [dbo].[SkuAppts]
------------------------------------��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p L O A D _ L i n e I t e m A p p t s ]         S c r i p t   D a t e :   5 / 3 / 2 0 1 7   1 2 : 1 1 : 4 6   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
  
 - - s e l e c t   c o u n t ( * )   f r o m   L i n e I t e m 1  
  
  
 C R E A T E   P R O C E D U R E   [ d b o ] . [ u s p L O A D _ L i n e I t e m A p p t s 2 ]  
 A S  
  
 - - T R U N C A T E   T A B L E   L i n e I t e m A p p t s ;  
  
 - - I N S E R T   L i n e I t e m A p p t s   (  
 - -                         [ L i n e I t e m I D ]  
 - -                       , [ C o n t r a c t I D ]  
 - - 	 	       , [ P r o d u c t I D ]  
 - -                       , [ M a r k e t I D ]  
 - -                       , [ D a t e ]  
 - -                       , [ S K U I D ]  
 - -                       , [ A m o u n t ] )  
  
 - - S E L E C T  
 - - L i n e I t e m I D   a s   L i n e I t e m I D ,    
 - - C o n t r a c t I D   a s   C o n t r a c t I D ,  
 - - I S N U L L ( B u n d l e I D , - 1 )   a s   B u n d l e I D ,  
 - - I S N U L L ( P r o d u c t I D , - 1 )   a s   P r o d u c t I D ,  
 - - I S N U L L ( P r o d u c t M a r k e t , ' - 1 ' )   a s   M a r k e t I D ,  
 - - I S N U L L ( N u m b e r O f U s e r s , 0 )   a s   U s e r C o u n t ,  
 - - I S N U L L ( I T . I n d u s t r y T y p e I D , 0 )   a s   C u s t o m e r T y p e ,    
 - - B i l l i n g S t a r t D a t e   a s   [ D a t e ] ,    
 - - - 1   a s   S K U I D   ,  
 - - C A S T   ( O r i g i n a l M o n t h l y P r i c e   A S   d e c i m a l ( 1 0 , 2 ) )   a s   A m o u n t  
 - - F R O M   E n t e r p r i s e . d b o . L i n e I t e m   L I   L E F T   J O I N  
 - - E n t e r p r i s e S u b . d b o . S a l e s U n i t P r o d u c t M a r k e t   S U P M   o n   L I . S a l e s U n i t I D = S U P M . S a l e s U n i t I D   L E F T   J O I N  
 - - E n t e r p r i s e . d b o . L o c a t i o n P r o f i l e   L P   O N   L I . S i t e L o c a t i o n I D = L P . L o c a t i o n I D   L E F T   J O I N  
 - - E n t e r p r i s e . d b o . I n d u s t r y T y p e   I T   O N   L P . I n d u s t r y T y p e I D = I T . I n d u s t r y T y p e I D  
 - - W H E R E    
 - - - - Y E A R ( B i l l i n g S t a r t D a t e )   i n   ( 2 0 1 6 , 2 0 1 7 )    
 - - L i n e I t e m S t a t u s I D = 1  
 - - A N D   B U N D L E I D   I S   N O T   N U L L  
 - - U N I O N  
 S E L E C T    
 L I . L i n e I t e m I D   a s   L i n e I t e m I D ,    
 L I . C o n t r a c t I D   a s   C o n t r a c t I D ,  
 I S N U L L ( L I . P r o d u c t I D , - 1 )   a s   P r o d u c t I D ,  
 I S N U L L ( A . C i t y I D , ' - 1 ' )   a s   M a r k e t I D ,  
 L I . B i l l i n g S t a r t D a t e   a s   [ D a t e ] ,    
 P A . P r o d u c t P a c k a g e   a s   N e t w o r k N a m e ,  
 C A S E   W H E N   B L D . [ G r o s s B l d g S q F t ] > 8 0   T H E N   ' P '   E L S E   ' M '   E N D   A S   U n i t S i g n ,  
 C A S T   ( L I . O r i g i n a l M o n t h l y P r i c e   A S   d e c i m a l ( 1 0 , 2 ) )   a s   A m o u n t  
 - - I N T O   [ d b o ] . [ L i n e I t e m A p p t s ]  
 I N T O   # L i n e I t e m A p p t s 2  
 F R O M   [ D C S Q L D E V 1 0 4 ] . E n t e r p r i s e . d b o . L i n e I t e m   L I   L E F T   J O I N  
 [ D C S Q L D E V 1 0 4 ] . E n t e r p r i s e . d b o . L o c a t i o n   L   O N   L I . S i t e L o c a t i o n I D = L . L o c a t i o n I D   L E F T   J O I N  
 [ D C S Q L D E V 1 0 4 ] . E n t e r p r i s e . [ d b o ] . [ A d d r e s s ]   A   O N   L . A d d r e s s I D = A . A d d r e s s I D   L E F T   J O I N  
 [ D C S Q L D E V 1 0 4 ] . E n t e r p r i s e . [ d b o ] . [ P r o p e r t y A d d r e s s ]   P R A D D R   O N   L . A d d r e s s I D = P R A D D R . A d d r e s s I D   L E F T   J O I N  
 [ D C S Q L D E V 1 0 4 ] . E n t e r p r i s e . [ d b o ] . [ P r o p e r t y ]   P   O N   P . P r o p e r t y I D = P R A D D R . P r o p e r t y I D   L E F T   J O I N    
 [ D C S Q L D E V 1 0 4 ] . C o S t a r 2 . [ d b o ] . [ B l d S q F t ]   B L D   O N   B L D . P r o p e r t y I D = P . P r o p e r t y I D     L E F T   J O I N    
 [ d b o ] . [ P r o d u c t A p p t s ]   P A   O N   L I . P r o d u c t I D = P A . P r o d u c t I D  
  
 W H E R E    
 - - Y E A R ( B i l l i n g S t a r t D a t e )   i n   ( 2 0 1 6 , 2 0 1 7 )    
 L i n e I t e m S t a t u s I D = 1  
 A N D   L I . P r o d u c t I D   I N   ( S E L E C T   P r o d u c t I D   F R O M     [ d b o ] . [ P r o d u c t A p p t s ] )  
 - - B U N D L E I D   I S   N O T   N U L L  
  
 - - s e l e c t   *    
 - - I N T O   L i n e I t e m A p p t s 2  
 - - f r o m   # L i n e I t e m A p p t s 2  
  
 S E L E C T   D I S T I N C T   S K U I D = R O W _ N U M B E R ( )   O V E R   ( P A R T I T I O N   B Y   [ N e t w o r k N a m e ] , [ U n i t S i g n ]   O R D E R   B Y   [ N e t w o r k N a m e ]   ) ,  
   [ N e t w o r k N a m e ] , [ U n i t S i g n ]    
 F R O M   [ d b o ] . [ L i n e I t e m A p p t s 2 ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S E L E C T   D I S T I N C T   [ N e t w o r k N a m e ] , [ U n i t S i g n ]   F R O M   [ d b o ] . [ L i n e I t e m A p p t s 2 ]   L I   J O I N  
  
 ( S E L E C T    
 3 0 0 0 0 + R O W _ N U M B E R ( )   O V E R   ( O R D E R   B Y   N e t w o r k N a m e )   a s   S K U I D ,  
 N e t w o r k N a m e   a s   N e t w o r k N a m e ,    
 U n i t S i g n   a s   U n i t S i g n    
 - - I N T O   S k u A p p t s 2  
 F R O M    
 ( S E L E C T   D I S T I N C T   [ N e t w o r k N a m e ] , [ U n i t S i g n ]   F R O M   [ d b o ] . [ L i n e I t e m A p p t s 2 ]   )   L 2  
  
 )   N  
 O N   N . N e t w o r k N a m e = L I . N e t w o r k N a m e   a n d   N . U n i t S i g n = L I . U n i t s i g n  
  
   O R D E R   B Y   [ N e t w o r k N a m e ]  
   - - - - - - - - - - - - - - - - - - - - -  
   S E L E C T   *   F R O M   [ d b o ] . [ S k u A p p t s 2 ]  
  
   S E L E C T    
               L I A . [ L i n e I t e m I D ]  
             , L I A . [ C o n t r a c t I D ]  
             , L I A . [ P r o d u c t I D ]  
             , L I A . [ M a r k e t I D ]  
 	     , S A . S K U I D  
             , L I A . [ D a t e ]  
             , L I A . [ N e t w o r k N a m e ]  
             , L I A . [ U n i t S i g n ]  
             , L I A . [ A m o u n t ]  
 I N T O   L i n e I t e m A p p s F i n a l  
 F R O M   [ d b o ] . [ L i n e I t e m A p p t s 2 ]   L I A   J O I N   [ d b o ] . [ S k u A p p t s 2 ]   S A   O N   L I A . N e t w o r k N a m e = S A . N e t w o r k N a m e   A N D   L I A . U n i t S i g n = S A . U n i t S i g n  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 S E L E C T   *   F R O M   [ d b o ] . [ S k u A p p t s ] ;  
 S E L E C T   *   F R O M   [ d b o ] . [ P r o d u c t A p p t s ] ;  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S E L E C T   *   F R O M    
 [ d b o ] . [ S k u A p p t s 2 ]  
  
 S E L E C T   *   F R O M   [ d b o ] . [ L i n e I t e m A p p s F i n a l ]  
 W H E R E   A m o u n t > 1   A N D   N e t w o r k N a m e   l i k e   ' % F i n d e r % '  
   O R D E R   B Y   C O N T R A C T I D    
   - - - - - - - - - - - - - - - - - - - - - -  
   S E L E C T   *   F R O M   [ d b o ] . [ S k u A p p t s 2 ]  
  
  
   s e l e c t    
   [ S K U I D ] ,  
   S k u N a m e = C A S T ( [ S K U I D ]   A S   V A R C H A R ( 5 0 ) ) + ' - ' + ' A p p t s ' + ' - ' + [ N e t w o r k N a m e ] + ' - ' + [ U n i t S i g n ] ,  
 [ N e t w o r k N a m e ] ,  
 [ U n i t S i g n ]  
 I N T O   S k u A p p t s 3  
   f r o m   [ d b o ] . [ S k u A p p t s 2 ]  
  
   S E L E C T   *   F R O M   [ d b o ] . [ S k u A p p t s 2 ]  
  
   S E L E C T   *   F R O M   [ d b o ] . [ S k u A p p t s F i n a l ]  
   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
   S E L E C T   *   F R O M   [ d b o ] . [ L i n e I t e m A p p t s F i n a l ]  
  
  
  
 USE [CoStar]
GO

/****** Object:  Table [dbo].[ProductAppts]    Script Date: 5/10/2017 2:55:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[ProductAppts1](
	[ProductID] [int] NULL,
	[SKUID] [int] NULL,
	[ProductName] [varchar](150) NULL,
	[SkuName] [varchar](150) NULL,
	[ProductDesc] [varchar](100) NULL,
	[NavisionProductCD] [varchar](10) NULL,
	[ProductPackage] [varchar](50) NULL,
	[ProductCategory] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



SELECT * FROM [dbo].[ProductAppts]

TRUNCATE TABLE [dbo].[ProductAppts1]
---------------------------------------
SELECT * FROM [dbo].[ProductAppts1]
UPDATE [ProductAppts1] SET ProductCategory='Legacy'
SELECT * FROM [ProductAppts1]
SELECT * FROM [dbo].[SkuAppts]
---------------------------------------









 select distinct
 [SKUID],
 SkuName=CAST([SKUID] AS VARCHAR(50))+'-'+'Appts'+'-'+[NetworkName]+'-'+[UnitSign]

--INTO SkuAppts3
 from [dbo].[ProductAppts1]

 SELECT 
 LIA.[LineItemID],
 LIA.ContractID,
 LIA.ProductID,
 LIA.MarketID,
 PA.SKUID,
 SkuName=CAST(PA.SKUID AS VARCHAR(50))+'-'+PA.ProductCategory+'-'+[NetworkName]+'-'+[UnitSign],
 LIA.Date,
 LIA.NetworkName,
 UnitSign,
 Amount
  INTO #ApptsNew2
     FROM [dbo].[LineItemApptsFinal] LIA JOIN [dbo].[ProductAppts1] PA ON 
 LIA.ProductID=PA.ProductID


 select *
 into LineItemApptsFinal2
  from #ApptsNew2

 select count(*) from #ApptsNew where SkuName like '%Appts%';
  select count(*) from #ApptsNew where SkuName like '%Finder%';

  select distinct Skuid, SkuName from [dbo].[LineItemApptsFinal2]
  order by SkuName
SELECT * FROM [dbo].[SkuBridge]
select * from [dbo].[SkuApptsFinal];
select * from [dbo].[SkuApptsFinal];


select * from [dbo].[SkuAppts]

select * from [dbo].[ProductAppts1]

select 
--top 100
-- PA1.ProductID,
 SkuName=CAST(PA1.[SKUID] AS VARCHAR(50))+'-'+PA1.ProductCategory+'-'+LIA.[NetworkName]+'-'+LIA.[UnitSign]
 --, count(*) as cnt
  from [dbo].[ProductAppts1] PA1 JOIN LineItemApptsFinal2 LIA on PA1.ProductID=LIA.ProductID
--  group by CAST(PA1.[SKUID] AS VARCHAR(50))+'-'+PA1.ProductCategory+'-'+LIA.[NetworkName]+'-'+LIA.[UnitSign]

select * from [dbo].[LineItemApptsFinal2] order by SKUID


  select * from ProductAppts1

  ------------------------------------ BUILD THE SKU DIMENSION -------------------------
  select distinct SkuId, SkuName 
  INTO [dbo].[SkuApptsFinal2]
  from [dbo].[LineItemApptsFinal2] order by SkuName
  --------------------------------------------------------------------------------------

  select count(*) from [dbo].[LineItemApptsFinal2] where SkuName like  '%Finder%';
  select count(*) from [dbo].[LineItemApptsFinal2] where SkuName like  '%Appts%';

  
  select COUNT(distinct  contractID) AS PrimaryFinder_Cnt
  --INTO #FinderNoAppts
  from [LineItemApptsFinal2] where SkuName like '%Finder%' and ContractID not in (
  (select contractID
  from [dbo].[LineItemApptsFinal2] where (SkuName like '%Appts%')))
  ----------------
  select COUNT(distinct  contractID) AS PrimaryAppt_Cnt 
  --#ApptsNoFinder
  from [LineItemApptsFinal2] where SkuName like '%Appts%' and ContractID not in (
  (select contractID
  from [dbo].[LineItemApptsFinal2] where (SkuName like '%Finder%')))


  Select * from LineItemAppts2 where ContractID in (select ContractID from #FinderNoAppts)

  select * from #FinderNoAppts

  drop table #ApptsNoFinder




   AND (SkuName like '%Finder%')


   update L
   set L.SkuID=30101,
       L.SkuName='30101-Legacy-Silver-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30001-Legacy-Silver-P'
   ---------------
    update L
   set L.SkuID=30102,
       L.SkuName='30102-Appts-Gold-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30002-Appts-Gold-P'
   ----------------
    update L
   set L.SkuID=30103,
       L.SkuName='30103-Appts-Silver-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30003-Appts-Silver-P'
   -----------------
    update L
   set L.SkuID=30104,
       L.SkuName='30104-Appts-Platinum-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30004-Appts-Platinum-P'
   -------------------------
   update L
   set L.SkuID=30105,
       L.SkuName='30105-Appts-Diamond-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30005-Appts-Diamond-P'
   --------------------------
      update L
   set L.SkuID=30106,
       L.SkuName='30106-Appts-Gold-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30006-Appts-Gold-P'
   -----------------------------
    update L
   set L.SkuID=30106,
       L.SkuName='30106-Appts-Gold-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30007-Appts-Gold-P'
   --------------------------------
       update L
   set L.SkuID=30109,
       L.SkuName='30109-Finder-Silver-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30009-Finder-Silver-P'
   -----------------
    update L
   set L.SkuID=30110,
       L.SkuName='30110-Finder-Gold-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30010-Finder-Gold-P'
   -------------------
   update L
   set L.SkuID=30111,
       L.SkuName='30111-Finder-Platinum-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30011-Finder-Platinum-P'
   -------------------
    update L
   set L.SkuID=30112,
       L.SkuName='30112-Finder-Diamond-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30012-Finder-Diamond-P'
   ------------
    update L
   set L.SkuID=30113,
       L.SkuName='30113-FinderSites-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30013-FinderSites-Finder Sites-P'
   ----------------------
   update L
   set 
   --L.SkuID=30113,
       L.SkuName='30013-FinderSites-M'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30013-FinderSites-Finder Sites-M'
   ---------------------
    update L
   set L.SkuID=30114,
       L.SkuName='30114-Appts-Silver-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30014-Appts-Silver-P'
   -----------
   update L
   set L.SkuID=30115,
       L.SkuName='30115-Finder-Silver-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30015-Finder-Silver-P'
   ---------------
    
  update L
   set 
   L.SkuName='30016-FinderSites-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30016-FinderSites-Finder Sites-P'
   ----------------



   SELECT * FROM [dbo].[SkuApptsFinal2]SELECT  
GL.[Contract ID] as Contract_ID, 
SUM(SIL.Amount) AS Amount
FROM [RIG$G_L Entry] GL
      JOIN [RIG$Sales Invoice Line] SIL 
            ON SIL.[Document No_] = GL.[Document No_] 
            AND SIL.[No_] = GL.[G_L Account No_]
WHERE YEAR(SIL.[Posting Date])=2017
GROUP BY GL.[Contract ID]
ORDER BY GL.[Contract ID] 


--select top 10 * from [dbo].[RIG$Sales Invoice Line]

SELECT 
[Line Item ID] as LineItemID,
[Contract ID] as ContractID,
[Bill-to Customer No_] as LocationID,
[Posting Date] as Posting_Date,
SKUID=-1,
[Amount] as Revenue_AMT
FROM [dbo].[RIG$Sales Invoice Line]
WHERE YEAR([Posting Date])=2017 and Amount>0



��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p L O A D _ L i n e I t e m ]         S c r i p t   D a t e :   5 / 2 2 / 2 0 1 7   4 : 1 3 : 2 3   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 - - s e l e c t   c o u n t ( * )   f r o m   L i n e I t e m 1  
  
  
 A L T E R   P R O C E D U R E   [ d b o ] . [ u s p L O A D _ L i n e I t e m ]  
 A S  
  
 T R U N C A T E   T A B L E   L i n e I t e m 1 ;  
  
 I N S E R T   L i n e I t e m 1   (  
                         [ L i n e I t e m I D ]  
                       , [ C o n t r a c t I D ]  
                       , [ B u n d l e I D ]  
                       , [ P r o d u c t I D ]  
                       , [ M a r k e t I D ]  
                       , [ U s e r C o u n t ]  
                       , [ C u s t o m e r T y p e ]  
                       , [ D a t e ]  
                       , [ S K U I D ]  
                       , [ A m o u n t ] )  
  
 - - S E L E C T  
 - - L i n e I t e m I D   a s   L i n e I t e m I D ,    
 - - C o n t r a c t I D   a s   C o n t r a c t I D ,  
 - - I S N U L L ( B u n d l e I D , - 1 )   a s   B u n d l e I D ,  
 - - I S N U L L ( P r o d u c t I D , - 1 )   a s   P r o d u c t I D ,  
 - - I S N U L L ( P r o d u c t M a r k e t , ' - 1 ' )   a s   M a r k e t I D ,  
 - - I S N U L L ( N u m b e r O f U s e r s , 0 )   a s   U s e r C o u n t ,  
 - - I S N U L L ( I T . I n d u s t r y T y p e I D , 0 )   a s   C u s t o m e r T y p e ,    
 - - B i l l i n g S t a r t D a t e   a s   [ D a t e ] ,    
 - - - 1   a s   S K U I D   ,  
 - - C A S T   ( O r i g i n a l M o n t h l y P r i c e   A S   d e c i m a l ( 1 0 , 2 ) )   a s   A m o u n t  
 - - F R O M   E n t e r p r i s e . d b o . L i n e I t e m   L I   L E F T   J O I N  
 - - E n t e r p r i s e S u b . d b o . S a l e s U n i t P r o d u c t M a r k e t   S U P M   o n   L I . S a l e s U n i t I D = S U P M . S a l e s U n i t I D   L E F T   J O I N  
 - - E n t e r p r i s e . d b o . L o c a t i o n P r o f i l e   L P   O N   L I . S i t e L o c a t i o n I D = L P . L o c a t i o n I D   L E F T   J O I N  
 - - E n t e r p r i s e . d b o . I n d u s t r y T y p e   I T   O N   L P . I n d u s t r y T y p e I D = I T . I n d u s t r y T y p e I D  
 - - W H E R E    
 - - - - Y E A R ( B i l l i n g S t a r t D a t e )   i n   ( 2 0 1 6 , 2 0 1 7 )    
 - - L i n e I t e m S t a t u s I D = 1  
 - - A N D   B U N D L E I D   I S   N O T   N U L L  
 - - U N I O N  
 S E L E C T    
 L i n e I t e m I D   a s   L i n e I t e m I D ,    
 C o n t r a c t I D   a s   C o n t r a c t I D ,  
 I S N U L L ( B u n d l e I D , - 1 )   a s   B u n d l e I D ,  
 I S N U L L ( P r o d u c t I D , - 1 )   a s   P r o d u c t I D ,  
 I S N U L L ( P r o d u c t M a r k e t , ' - 1 ' )   a s   M a r k e t I D ,  
 I S N U L L ( N u m b e r O f U s e r s , 0 )   a s   U s e r C o u n t ,  
 I S N U L L ( B T C . B u s i n e s s T y p e C a t e g o r y I D , 8 )   a s   C u s t o m e r T y p e ,    
 L I . B i l l i n g S t a r t D a t e   a s   [ D a t e ] ,    
 - 1   a s   S K U I D   ,  
 C A S T   ( O r i g i n a l M o n t h l y P r i c e   A S   d e c i m a l ( 1 0 , 2 ) )   a s   A m o u n t  
 I N T O   L i n e I t e m R S  
 F R O M   [ D C S Q L P R D 1 0 4 ] . E n t e r p r i s e . d b o . L i n e I t e m   L I   L E F T   J O I N  
 [ D C S Q L P R D 1 0 4 ] . E n t e r p r i s e S u b . d b o . S a l e s U n i t P r o d u c t M a r k e t   S U P M   o n   L I . S a l e s U n i t I D = S U P M . S a l e s U n i t I D   L E F T   J O I N  
 [ D C S Q L P R D 1 0 4 ] . E n t e r p r i s e . d b o . L o c a t i o n P r o f i l e   L P   O N   L I . S i t e L o c a t i o n I D = L P . L o c a t i o n I D   L E F T   J O I N  
 [ d b o ] . [ B u s i n e s s T y p e ]   B T   O N   L P . B u s i n e s s T y p e I D = B T . B u s i n e s s T y p e I D   L E F T   J O I N   [ d b o ] . [ B u s i n e s s T y p e C a t e g o r y ]   B T C   O N  
 B T . B u s i n e s s T y p e C a t e g o r y I D = B T C . B u s i n e s s T y p e C a t e g o r y I D  
  
 W H E R E    
 - - Y E A R ( B i l l i n g S t a r t D a t e )   i n   ( 2 0 1 6 , 2 0 1 7 )    
 L i n e I t e m S t a t u s I D = 1  
 - - A N D   B U N D L E I D   I S   N O T   N U L L  
 a n d   L i n e I t e m I D   i n   ( s e l e c t   L i n e I t e m I D   f r o m   [ d b o ] . [ U n S k u e d L i n e I t e m I D 2 ] )  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 s e l e c t   c o u n t ( * )   f r o m   [ d b o ] . [ L i n e I t e m R S ]   w h e r e   B u n d l e I D = - 1  
  
 s e l e c t   Y e a r ( [ D a t e ] ) , s u m ( A m o u n t )   f r o m    
 [ d b o ] . [ L i n e I t e m R S ]   w h e r e   Y e a r ( [ D a t e ] )   I N   ( 2 0 1 6 , 2 0 1 7 )  
 g r o u p   b y   Y e a r ( [ D a t e ] )  
 - - - - - - - - - - - - - - - -  
 s e l e c t   Y e a r ( [ D a t e ] ) , s u m ( A m o u n t )   f r o m    
 [ d b o ] . [ L i n e I t e m N B ]   w h e r e   Y e a r ( [ D a t e ] )   I N   ( 2 0 1 6 , 2 0 1 7 )  
 g r o u p   b y   Y e a r ( [ D a t e ] )  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 s e l e c t   c o u n t ( D i s t i n c t   L i n e I t e m I D )   f r o m   [ d b o ] . [ L i n e I t e m R S ]   w h e r e   Y e a r ( [ D a t e ] )   I N   ( 2 0 1 6 , 2 0 1 7 ) ;  
 s e l e c t   c o u n t ( D i s t i n c t   L i n e I t e m I D )   f r o m   [ d b o ] . [ L i n e I t e m N B ]   w h e r e   Y e a r ( [ D a t e ] )   I N   ( 2 0 1 6 , 2 0 1 7 ) ;  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 s e l e c t   *   f r o m   [ d b o ] . [ L i n e I t e m N B ]  
 w h e r e   Y e a r ( [ D a t e ] )   I N   ( 2 0 1 6 , 2 0 1 7 )   a n d   A m o u n t > 0  
 o r d e r   b y   [ C o n t r a c t I D ] , [ D a t e ]  
  
 s e l e c t   c o u n t (   d i s t i n c t   L i n e I t e m I D )   f r o m   [ d b o ] . [ L i n e I t e m N B ]   w h e r e    
 - - A m o u n t > 0   a n d    
 L i n e I t e m I D   i n   (  
 s e l e c t   D i s t i n c t   L i n e I t e m I D   f r o m   S k u B r i d g e )  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 s e l e c t    
 - - c o u n t ( S k u I D )   - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 L i n e I t e m I D  
 I N T O   L I N B  
 f r o m   [ d b o ] . [ L i n e I t e m N B ]    
 w h e r e   S K U I D = - 1   a n d    
 - - w h e r e    
 Y E A R ( D a t e )   i n   ( 2 0 1 6 , 2 0 1 7 )  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S e l e c t   *   f r o m   [ d b o ] . [ L i n e I t e m N B ]   L I   J O I N   P r o d u c t   P   o n   L I . P r o d u c t I D = P . P r o d u c t I D   w h e r e   L i n e I t e m I D   i n   ( s e l e c t   L i n e I t e m I D   f r o m   L I N B )  
 a n d   P . P r o d u c t N a m e   l i k e   ' % A p t % '  
 O r d e r   b y   C o n t r a c t I D  
  
 s e l e c t   *   f r o m   P r o d u c t   w h e r e   P r o d u c t N a m e   l i k e   ' % A p t % '  
  
 s e l e c t   *   f r o m   P r o d u c t   w h e r e   P r o d u c t I D   i n   ( 2 6 8 )  
  
  
  
  
  
  
 SELECT 
[Line Item ID] as LineItemID,
[Contract ID] as ContractID,
[Bill-to Customer No_] as LocationID,
[Posting Date] as Posting_Date,
SKUID=-1,
[Amount] as Revenue_Amount
INTO FACT_INV_2017
FROM [DCSQLDEV135\ACCT].NAVISIONDB260_PRD.[dbo].[RIG$Sales Invoice Line]
WHERE YEAR([Posting Date])=2017 and Amount>0
-----------------------------------------------------------------------
select * from SkuPrice where SkuName is null and price>4;

select * from LineItem where SKUID=-1 and Amount>1


SELECT DISTINCT SKUID, 
CAST(SKUID AS VARCHAR(20))+'-'+
'Suite-'+
(SELECT TOP 1 CAST([MarketID] AS VARCHAR(20)) FROM SKU S1 WHERE S1.SKUID=S.SKUID order by Marketid) +'-'+
(SELECT TOP 1 CAST([UserCount] AS VARCHAR(20)) FROM SKU S2 WHERE S2.SKUID=S.SKUID)+'-'+
(SELECT TOP 1 CAST([CustomerType] AS VARCHAR(20)) FROM SKU S3 WHERE S3.SKUID=S.SKUID) AS SkuName
--INTO ##SKU_NAME
FROM SKU S where S.SKUID IN (select SKUID from ##NewSku)
ORDER BY SKUID
--WHERE SKUID IN (SELECT DISTINCT SKUID FROM #TEMP_SKU3)

DROP TABLE ##SKU_NAME

SELECT COUNT(*) FROM ##NewSku

DROP TABLE #sku_name;
DROP TABLE #sku_name1;


select * from ##SKU_NAME order by SKUID


select distinct SKUID, SKU_NAME
INTO #sku_name1
 from #sku_name

 select * from #sku_name

 select distinct 

 select * from skuPrice where SkuName is null

 update SP
 set SP.SkuName=S.SkuName
 from SkuPrice SP JOIN ##SKU_NAME S ON SP.SKUID=S.SKUID
 where SP.SkuName IS NULL



 select count(*) from Sku
 select count(*) from [dbo].[SkuMC]

 SELECT DISTINCT SKUID 
 INTO ##NewSku
 FROM SKU WHERE SkuName is null

 select * from ##NewSku

 SELECT [LineItemID],[SKUID]
 INTO SkuBridgeFinal
 FROM SkuBridge 
 UNION
 SELECT [LineItemID],[SKUID]
 FROM [dbo].SkuBridge2 

 delete from SkuBridge2 where SKUID=-1
  select * from SkuBridge2
  DROP TABLE SkuBridge2
  SELECT * FROM SkuBridge2


  select * from [dbo].[Sku]
  select * from SkuPrice where Price>4

 delete from [dbo].[SkuBridgeFinal] where SKUID=-1

 select count(*) from [dbo].[SkuBridgeFinal]

 SELECT * FROM SkuBridgeFinal
 -------------------

 select SkuName, count(*) from [dbo].[SkuPriceFinal] 
 where Price>0
 group by SkuName
 having count(*)>1
 select * from  [dbo].[SkuPriceFinal]  where Price>4
 ----------------------------------------------------

 select SKUID, COUNT(*) CNT
 into ##SuiteSku 
 from SkuFinal WHERE ProductID IN (1,2,5) AND Amount>0
 GROUP BY SKUID

 select distinct SKUID 
  into  SkuNonSuite
 from SkuFinal where Amount>0 and 
 SKUID not in (select SKUID from ##SuiteSku)

 select distinct SKUID 
 into SkuNonSuite2
 from SkuFinal where SKUID in (select SKUID from [dbo].[SkuNonSuite])
 and SkuName is null

 select * from SkuFinal where skuid in (select skuid  
  from [dbo].[SkuNonSuite]) order by SKUID, ProductID

  select * from SkuPriceFinal where SKUID=29707

  select * from 


  update S
  set S.SkuName=SP.SkuName
  from SkuPriceFinal SP JOIN SkuFinal S ON SP.SKUID=S.SKUID
  where S.SkuName is null


  select * from SkuFinal







select * from SkuPrice where SkuName is null and price>4;

select * from LineItem where SKUID=-1 and Amount>1


SELECT DISTINCT SKUID, 
CAST(SKUID AS VARCHAR(20))+'-'+
'Suite-'+
(SELECT TOP 1 CAST([MarketID] AS VARCHAR(20)) FROM SkuFinal S1 WHERE S1.SKUID=S.SKUID order by Marketid) +'-'+
(SELECT TOP 1 CAST([UserCount] AS VARCHAR(20)) FROM SkuFinal S2 WHERE S2.SKUID=S.SKUID)+'-'+
(SELECT TOP 1 CAST([CustomerType] AS VARCHAR(20)) FROM SkuFinal S3 WHERE S3.SKUID=S.SKUID) AS SkuName
--INTO ##SKU_NAME
FROM SkuFinal S where S.SKUID IN (select SKUID from ##NewSku)
ORDER BY SKUID
--WHERE SKUID IN (SELECT DISTINCT SKUID FROM #TEMP_SKU3)

DROP TABLE ##SKU_NAME

SELECT COUNT(*) FROM ##NewSku

DROP TABLE #sku_name;
DROP TABLE #sku_name1;

select * from ##SKU_NAME order by SKUID

select distinct SKUID, SKU_NAME
INTO #sku_name1
 from #sku_name

 select * from #sku_name

 select distinct 

 select * from skuPrice where SkuName is null

 update SP
 set SP.SkuName=S.SkuName
 from SkuPrice SP JOIN ##SKU_NAME S ON SP.SKUID=S.SKUID
 where SP.SkuName IS NULL


 select count(*) from Sku
 select count(*) from [dbo].[SkuMC]

 SELECT DISTINCT SKUID 
 INTO ##NewSku
 FROM SKU WHERE SkuName is null

 select * from ##NewSku

 SELECT [LineItemID],[SKUID]
 INTO SkuBridgeFinal
 FROM SkuBridge 
 UNION
 SELECT [LineItemID],[SKUID]
 FROM [dbo].SkuBridge2 

 delete from SkuBridge2 where SKUID=-1
  select * from SkuBridge2
  DROP TABLE SkuBridge2
  SELECT * FROM SkuBridge2


  select * from [dbo].[Sku]
  select * from SkuPrice where Price>4

 delete from [dbo].[SkuBridgeFinal] where SKUID=-1

 select count(*) from [dbo].[SkuBridgeFinal]

 SELECT * FROM SkuBridgeFinal
 -------------------

 select SkuName, count(*) from [dbo].[SkuPriceFinal] 
 where Price>0
 group by SkuName
 having count(*)>1
 select * from  [dbo].[SkuPriceFinal]  where Price>4
 ----------------------------------------------------

 select SKUID, COUNT(*) CNT
 into ##SuiteSku 
 from SkuFinal WHERE ProductID IN (1,2,5) AND Amount>0
 GROUP BY SKUID

 select distinct SKUID 
  into  SkuNonSuite
 from SkuFinal where Amount>0 and 
 SKUID not in (select SKUID from ##SuiteSku)

 select distinct SKUID 
 into SkuNonSuite2
 from SkuFinal where SKUID in (select SKUID from [dbo].[SkuNonSuite])
 and SkuName is null

 select * from SkuFinal where skuid in (select skuid  
  from [dbo].[SkuNonSuite]) order by SKUID, ProductID

  select * from SkuPriceFinal where SKUID=29707

  select * from 


  update S
  set S.SkuName=SP.SkuName
  from SkuPriceFinal SP JOIN SkuFinal S ON SP.SKUID=S.SKUID
  where S.SkuName is null


  select * from SkuFinal

  -------------------------------------------------------------------------------------------------
  select * from SkuPriceFinal where price>4 and SkuName is not null;
  -------------------------------------------------------------------------------------------------

  select RIGHT(S.SkuName,LEN(S.SkuName)-(CHARINDEX('-S',S.SkuName))) [NewName],S.SKUID,count(*) cnt
  from SkuFinal S JOIN SkuFinal S1
  on RIGHT(S.SkuName,LEN(S.SkuName)-(CHARINDEX('-S',S.SkuName)))=RIGHT(S1.SkuName,LEN(S1.SkuName)-(CHARINDEX('-S',S1.SkuName)))
  where S.SKUID<>S1.SKUID
  group by RIGHT(S.SkuName,LEN(S.SkuName)-(CHARINDEX('-S',S.SkuName))),S.SKUID
  having count(*)>1

  select * from SkuFinal
  where RIGHT(SkuName,LEN(SkuName)-(CHARINDEX('-S',SkuName)))='Suite-Dallas/Fort Worth-3-N/A'



  --13513
  --5594

  select * from LineItemWB where SKUID in 
  --(13513)
  (5594)
  order by ContractID, ProductID
  --------------------------------------------
  select * from SkuFinal where SKUID in (5594);
  ---------------------------------------------
  select * from SkuBridgeFinal order by SKUID;
  ----------------------------------------------
  select distinct SKUID  from SkuBridgeFinal   order by SKUID
  ----------------------------------------------







SELECT DISTINCT SBF.SKUID
INTO OldAptSkusList
FROM [dbo].[SkuBridgeFinal] SBF JOIN [LineItemApptsFinal] LIAF ON 
                                                                               SBF.LineItemID=LIAF.LineItemID 
										        JOIN [dbo].[SkuPriceFinal] SPF ON SPF.SKUID=SBF.SKUID 
                     

WHERE LINEITEMID IN (SELECT DISTINCT LINEITEMID FROM [dbo].[LineItemApptsFinal])


select distinct SKUID, SkuName from ##AptSkus

select * from ##AptSkus1 order by SKUID

update AS1
set AS1.SKUID=LIAF.SKUID,
    AS1.SkuName=SAF2.SkuName
from AptSkus AS1 JOIN [LineItemApptsFinal] LIAF ON AS1.LineItemID=LIAF.LineItemID  JOIN [dbo].[SkuApptsFinal2] SAF2
                                                   ON SAF2.SkuId=LIAF.SKUID

select * from [dbo].[SkuApptsFinal2]

select * from ##AptSkus1

select * from AptSkus

UPDATE SBF
SET SBF.SKUID=A.SKUID
FROM [dbo].[SkuBridgeFinal] SBF JOIN AptSkus A ON SBF.LineItemID=A.LineItemID

INSERT SkuPriceFinal ([SKUID],[SkuName])
SELECT [SkuId] ,[SkuName] FROM [dbo].[SkuApptsFinal2] 


SELECT * FROM SkuFinal

delete from SkuPriceFinal where SKUID in (select  Skuid from OldAptSkusList)

select * from [dbo].[SkuPriceFinal]
------------------------------------------------------------------------------


select * from [dbo].[SkuPriceFinal] where SkuName like '%Appts%'

select * from [dbo].[SkuFinal] where SkuName like '%Appts%'

select * from SkuPriceFinal where SKUID in ( select skuid from [dbo].[SkuApptsFinal2])

select * from [dbo].[SkuBridgeFinal] order by SKUID



select * 
INTO #SkuExceptionsList
from SkuPriceFinal where skuid in (
select SKUID from [dbo].[SkuNonSuite])

select * from #SkuExceptionsList where Price>0 order by Price desc
delete from #SkuExceptionsList where SKUID in (35758)

select * 
into SkuExceptionsList052417
from #SkuExceptionsList where Price>0 order by Price desc

select * from [dbo].[SkuExceptionsList052417]
delete from [dbo].[SkuExceptionsList052417] where SKUID in( 30795)
--------------------------------------------------------------------------------------------

select * from SkuFinal where SKUID IN (39541)
update SkuPriceFinal set SkuName='39541-Exchange-Renville-2-0' where SKUID IN (39541)
update SkuFinal set SkuName='39541-Exchange-Renville-2-0' where SKUID IN (39541)
--------
select * from SkuFinal where SKUID IN (39744)
update SkuPriceFinal set SkuName='39744-ADJ-UKN-1-9' where SKUID IN (39744)
update SkuFinal set SkuName='39744-ADJ-UKN-1-9' where SKUID IN (39744)
-----
select * from SkuFinal where SKUID IN (39763)
update SkuPriceFinal set SkuName='39763-Exchange-UKN-1-4' where SKUID IN (39763)
update SkuFinal set SkuName='39763-Exchange-UKN-1-4' where SKUID IN (39763)
-------
select * from SkuFinal where SKUID IN (46247)
update SkuPriceFinal set SkuName='46247-Property-SFO-1-4' where SKUID IN (46247)
update SkuFinal set SkuName='46247-Property-SFO-1-4' where SKUID IN (46247)
-----
select * from SkuFinal where SKUID IN (46247)
update SkuPriceFinal set SkuName='46247-Property-SFO-1-4' where SKUID IN (46247)
update SkuFinal set SkuName='46247-Property-SFO-1-4' where SKUID IN (46247)
------
select * from SkuFinal where SKUID IN (35758)
update SkuPriceFinal set SkuName='35758-Market-UKN-180-0' where SKUID IN (35758)
update SkuFinal set SkuName='35758-Market-UKN-180-0' where SKUID IN (35758)
-------
select * from SkuFinal where SKUID IN (30795)
update SkuPriceFinal set SkuName='30795-Combo-UKN-0-0' where SKUID IN (30795)
update SkuFinal set SkuName='30795-Combo-UKN-0-0' where SKUID IN (30795)
-----
select * from SkuFinal where SKUID IN (32984)
update SkuPriceFinal set SkuName='32984-Combo--1 -78-0' where SKUID IN (32984)
update SkuFinal set SkuName='32984-Combo--1 -78-0' where SKUID IN (32984)

select * from Market2 where MarketID in ('4');
select * from Product where productid in (69,66);
---------------------------------------------------------------------------------


select * 
into ##SkuExceptions
from SkuFinal where skuid in ( 
select SKUID from [dbo].[SkuExceptionsList052417]) order by SKUID

select SKUID,SkuName,count(productid) as ProductCnt 
into #SkuExceptionsSingle
from ##SkuExceptions
Group by SkuName,SKUID
having count(productid)=1
---
select SKUID,SkuName,count(productid) as ProductCnt 
into #SkuExceptionsCombo
from ##SkuExceptions
Group by SkuName,SKUID
having count(productid)>1
-----

drop table #SkuExceptionsSingle
drop table #SkuExceptionsCombo
---

select * from #SkuExceptionsSingle


UPDATE SES
SET SES.SkuName=SkuName
from #SkuExceptionsSingle SES JOIN SkuFinal SF on SF.SKUID=SES.SKUID JOIN 
--------------------------------------------------------------------------

SELECT SF.SKUID,CAST(SF.SKUID AS VARCHAR(20)) +'-'+

(SELECT top 1 P1.ProductName from SkuFinal SF1 JOIN Product P1 on SF1.ProductID= P1.ProductID 
 where SF1.SKUID=SF.SKUID
)
+'-'+RIGHT(SF.SkuName,7)
  AS SkuName
 --into SkuExceptionsCombo
from  SkuExceptionsSingle E JOIN SkuFinal SF ON E.SKUID=SF.SKUID JOIN Product P ON SF.ProductID=P.ProductID
------------------------------------------------------------------------------------------------------------
SELECT distinct SF.SKUID,CAST(SF.SKUID AS VARCHAR(20)) +'-'+

'Combo'
+'-'+RIGHT(SF.SkuName,7)
  AS SkuName
 --into SkuExceptionsCombo
from  SkuExceptionsCombo E JOIN SkuFinal SF ON E.SKUID=SF.SKUID JOIN Product P ON SF.ProductID=P.ProductID
--------------------------------------------------------------------------------------------------------



select * from #SkuExceptionsSingle


  select LEFT(SkuName,LEN(SkuName)-LEN(RIGHT(SkuName,LEN(SkuName)-(CHARINDEX('-S',SkuName))))) 
   
  AS Numbr,
         SKUID
  from SkuFinal 
  
  
  S JOIN SkuFinal S1
  on RIGHT(S.SkuName,LEN(S.SkuName)-(CHARINDEX('-S',S.SkuName)))=RIGHT(S1.SkuName,LEN(S1.SkuName)-(CHARINDEX('-S',S1.SkuName)))
  where S.SKUID<>S1.SKUID
  group by RIGHT(S.SkuName,LEN(S.SkuName)-(CHARINDEX('-S',S.SkuName))),S.SKUID
  having count(*)>1
  -----

  select distinct SkuID, NewSkuName 
  into SkuExceptionsCombo2
  from SkuExceptionsCombo


  update SF
  set SF.SkuName=SE.NewSkuName
  from SkuFinal SF JOIN [dbo].SkuExceptionsCombo2 SE on SF.SKUID=SE.SKUID


  update SPF
  set SPF.SkuName = SF.SkuName
  from SkuPriceFinal SPF JOIN SkuFinal SF on SPF.SKUID=SF.SKUID
  where SPF.SKUID in (select SKUID from SkuExceptionsCombo2)
  --------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------
  select * from SkuPriceFinal where Price>4  order by SkuName
  select * from SkuFinal where SKUID in (31726)
  select * from Product where ProductID in (150)
  ------------------------------------------------------
  select * from [dbo].[SkuPriceFinal] where price>4
  select * from SkuFinal where SKUID in (49042)
  -----------------------------------------------------
  select * from SkuFinal where SKUID in (16881);
  -----------------------------------------------------
  select * from SkuPriceFinal where SKUID in (select SKUID from [dbo].[SkuListPriced])
  -----------------------------------------------------


  select CustomerType, count(*) TypeCnt From SkuFinal
  group by  CustomerType
  order by CustomerType

  select top 100 * from SkuFinal


  UPDATE SF
  SET SF.SkuName=SF.SkuName+'-'+BTC.BusinessTypeCategory
  --, BT.BusinessTypeID,BTC.[BusinessTypeCategory]  
  from SkuFinal SF JOIN [dbo].[BusinessType] BT ON SF.CustomerType=BT.BusinessTypeID JOIN [dbo].[BusinessTypeCategory] BTC ON 
                     BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
					 where SF.SKUID not in (select SKUID from [dbo].[741Sku]) AND
					RIGHT(SkuName,1) IN ('1','2','3','4','5','6','7','8','9','0')
					 ------

update SPF
set SPF.[SkuName]=SF.SkuName
FROM
[dbo].[SkuPriceFinal] SPF JOIN SkuFinal SF ON SPF.SKUID=SF.SKUID

select * from SkuPriceFinal



select CustomerType, count(*) CustomerTypeCnt 
FROM SkuFinal where SKUID not in (select SKUID from [dbo].[SkuListPriced])
group by CustomerType
order by 1
---------------------------------------

SELECT TOP 100 
    SUBSTRING(SkuName, CHARINDEX('-',SkuName)+1,LEN(SkuName)-CHARINDEX('-',SkuName)) No_SKUID_Name,
 CustomerType, 
SkuName 
into #
FROM 
SkuFinal
----
select * from SkuFinal where SKUID in(
select SKUID from [dbo].[SkuListPriced])
--------------------
-----
set @idx = charindex(@Delimiter,@String) 
  if @idx!=0 
   set @slice = left(@String,@idx - 1) 

   --39318-Suite-WSH-13-4
   --39345-Suite-1RM-2-12


   select * from [dbo].[741Sku]


    select 
   SF.SkuName,SF.SkuName+'-'+BTC.BusinessTypeCategory
  --, BT.BusinessTypeID,BTC.[BusinessTypeCategory]  
  from SkuFinal SF JOIN [dbo].[BusinessType] BT ON SF.CustomerType=BT.BusinessTypeID JOIN [dbo].[BusinessTypeCategory] BTC ON 
                     BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
					 where SF.SKUID not in (select SKUID from [dbo].[741Sku]) AND
					RIGHT(SkuName,1) IN ('1','2','3','4','5','6','7','8','9','0')
					 ------

    select 
 *
  --, BT.BusinessTypeID,BTC.[BusinessTypeCategory]  
  from  [dbo].[BusinessType] BT JOIN [dbo].[BusinessTypeCategory] BTC ON 
                     BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
					 

Update SF
SET SF.SkuName=Left(SkuName,LEN(SkuName)-1)+'Unknown' 
 from SkuFinal SF where Right(SkuName,1)='0'
 ----------

 Update SPF
 SET SPF.SkuName=S.SkuName
 From SkuPriceFinal SPF JOIN SkuFinal S ON SPF.SKUID=S.SKUID
 ---------

 select * from SkuPriceFinal where Price>4
 select * from SkuFinal

 select * from product where productid in (173,1,40)

 select ProductID, Productdesc from Product  order by ProductID

  select SKUID,SkuName, COUNT(*) CNT
 into ##SuiteSku 
 from SkuFinal WHERE ProductID IN (1,2,5) AND Amount>0
 GROUP BY SKUID,SkuName


 select DISTINCT SKUID 
 INTO IncompleteSKUs
 from SkuFinal where SKUID NOT IN (select SKUID from ##SuiteSku) and SkuName like '%Suite%'
 Order by SKUID

 select * from SkuFinal where SKUID in (select SKUID from IncompleteSKUs)  order by SKUID,ProductID

 select * from Product where productid in (
166,
166,
167,
168);

--------------------------------------------------------------------------
select * from SkuPriceFinal where Price>4 and SkuName not like '%Suite%'--
select * from [dbo].[SkuPriceFinal] where Price>4 order by SKUID;---------
--------------------------------------------------------------------------





































----------------------------------
SELECT * FROM [dbo].[GLBridge];---
----------------------------------
--- To-do List For Today:
/*
1. Bring in the components of the Journal from Navision for the parts that are relevant;
*/

-------------------------------------------------------
--select count(*) from [dbo].[RIG$Gen_ Journal Line];--
--select distinct from [RIG$Gen_ Journal Line];--------
-------------------------------------------------------


SELECT ECM.ERROR_MESSAGE AS DETAILED_ERROR_MESSAGE, 
ECD.ERROR_COLUMN AS OFFENDING_COLUMN_NAME, 
COUNT(ECD.SEQ_NO) as ERROR_INSTANCE_COUNT 
FROM [dbo].[CSTR_RPRO_ERR_CODE_DETAILS] ECD JOIN [dbo].[CSTR_RPRO_ERR_CODE_MASTER] ECM ON 
ECD.ERROR_CODE=ECM.ERROR_CODE
GROUP BY ECM.ERROR_MESSAGE,ECD.ERROR_COLUMN
ORDER BY 3 DESC 
-------------------------------------------------






select * from [dbo].[CSTR_RPRO_ERR_CODE_DETAILS]


select count(*) from [dbo].[LINB];

select * 
into #CompleteSet
from [dbo].[LineItem]
union
select * from [dbo].[LineItem1]
union
select * from [dbo].[LineItem2]
--union
--select * from [dbo].[LineItemApptsFinal2]

select count(*) from #CompleteSet

select CONTRACTID, SUM(
ISNULL(AMOUNT,0)
) AMT 
into #ZeroContracts
FROM #CompleteSet 
--where amount is null
GROUP BY CONTRACTID 
having  SUM(AMOUNT)=0
--------------------------------------------------------------------------
--------------------------------------------------------------------------
select distinct ContractID 
from [dbo].[FACT_INV_2017] 
where ContractID in 
(select distinct ContractID from #ZeroContracts)
--------------------------------------------------------------------------
--------------------------------------------------------------------------
select distinct contractiD 
from #ZeroContracts
select count(distinct contractid) from #CompleteSet
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------



select * from [dbo].[SkuExceptions] where price>4

select * from SkuFinal where SKUID IN  (30343,30346);


update SF
set SF.SKUID=30343, SF.SkuName='30343-Suite-MIL-9-Unknown'
from SkuFinal SF where SF.SKUID=30346
------------
update SF
set SF.SKUID=30343, SF.SkuName='30343-Suite-MIL-9-Unknown'
from SkuPriceFinal SF where SF.SKUID=30346
------------
delete from [dbo].[SkuExceptions] where SKUID IN (30343,30346);
------------------------------------------------------------------

select LineItemID, 
from [dbo].[FACT_INV_2017] I JOIN 

select * 
into LineItemComplete
from [dbo].[LineItem]
Union
select * 
from [dbo].[LineItem1]
select *
from [dbo].[LineItem2]
union
select * from
[dbo].[LineItemRS]

select LI.LineItemID, LI.Amount as Sales_Amount, I.Revenue_Amount as Invoice_Amount
INTO LineItemAmountNotequalInvoiceAmount
from [dbo].[LineItemComplete] LI JOIN [dbo].[FACT_INV_2017] I on LI.LineItemID=I.LineItemID
where LI.Amount<4 and I.Revenue_Amount>4


select * from [dbo].[LineItemAmountNotequalInvoiceAmount]


select * from Product where ProductDesc like '%Analytics%'

120
121
122
286
298
266
307

select DISTINCT LI.LineItemID,P.ProductDesc,P.ProductID, LI.Sales_Amount, LI.Invoice_Amount 
INTO [dbo].[LineItemAmountNotequalInvoiceAmount2]
from [dbo].[LineItemAmountNotequalInvoiceAmount] LI JOIN [dbo].[LineItemComplete] LIC
ON LI.LineItemID=LIC.LineItemID JOIN Product P ON LIC.ProductID= P.ProductID
where LIC.ProductID NOT IN (
120,
121,
122,
286,
298,
266,
307
);


select * 
INTO [dbo].[LineItemAmountNotequalInvoiceAmount_MJR]
from [dbo].[LineItemAmountNotequalInvoiceAmount]
where (ProductDesc like '%Comps%') OR (ProductDesc like '%Property%') OR (ProductDesc like '%Tennent%')

select * from [dbo].[LineItemAmountNotequalInvoiceAmount_MJR]
order by Invoice_Amount DESC
------------------------------------------------------------------------
select RIL.[Line Item ID],RIL.[Unit Price] as UnitPrice_NAVISION, 0 as DiscountMonthlyPrice_ENT  from
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] RIL 
where   [Gen_ Bus_ Posting Group]='ACTUAL' and RIL.[Unit Price]>0 and 
[Line Item ID] IN (select distinct LineItemID from [dbo].[ZeroContractsEnterprise])  
---

select *  from
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] RIL 
where   [Gen_ Bus_ Posting Group]='ACTUAL' AND
[Line Item ID] IN (1440)  
------------------------------------------------------------------------
--1440
------------------------------------------------------------------------
select * from [DCSQLPRD104].[Enterprise].dbo.LineItem LI where LineItemID IN (1440) 

select top 1 * from [DCSQLPRD104].[Enterprise].dbo.LineItem LI

/*

LineItemID
1440
1442
1446
1450
1451
1452
1473
1478
1503
1504
1505
1506
1509
*/


--where LineItemID=2160625
-- JOIN 
--[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] SIL
--ON LI.[LineItemID]=SIL.[Line Item ID]
--where   SIL.[Unit Price]<>LI.DiscountedMonthlyPrice
----------------------------------
----------------------------------
/*
2257494
*/

select * 
INTO ZeroLines1
from  
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] SIL
where   SIL.[Unit Price]=0 and SIL.[Amount]>0


select
LI.LineItemID,
LI.ContractID,
------------------ this is what i think the logic should be for the Discounted Monthly Price -----------------------
COALESCE( DiscountedMonthlyPrice,CurrentMonthlyPrice,OriginalMonthlyPrice) as DiscountedMonthlyPrice, --- Basically this is 'Sell  Price'
LI.CurrentMonthlyPrice,
LI.OriginalMonthlyPrice
from [DCSQLPRD104].[Enterprise].dbo.LineItem LI
where LI.LineItemID IN (select [LineItemID] from [dbo].[ZeroContractsEnterprise])

--------------------------------------------------------------
select [Line Item ID], * from ZeroLines1;---------------------
select * from [dbo].[LineItemAmountNotequalInvoiceAmount_MJR];
--------------------------------------------------------------
--------------------------------------------------------------

select * from [dbo].[LineItemAmountNotequalInvoiceAmount_MJR]select * from [DCSQLPRD104].[Enterprise].dbo.LineItem LI 
where LI.LineItemID IN (
select distinct [Line Item ID] from [dbo].[ZeroContractsNavision]);
-------------------------------------------------------------------
select distinct * from [DCSQLPRD104].[Enterprise].dbo.LineItem LI 
where LI.LineItemID IN (
select distinct [LineItemID] from [dbo].[ZeroContractsEnterprise]);
--------------------------------------------------------------------
select count(*) from [DCSQLPRD104].[Enterprise].dbo.LineItem;
--------------------------------------------------------------------/*
----------------------------------------
---------GOALS FOR THE DAY:-------------
----------------------------------------
1. re-sku the appartments;
2. find and complete the PowerBI tutorial;
3. finish up the Oracle PL/SQL book;
-----------------------------------------


*/

USE [CoStar]
GO

SELECT LI2.[LineItemID],
      LI2.[ContractID],
      LI2.[ProductID],
      LI2.[MarketID],
      LI2.[SKUID],
      LI2.[SkuName]+'-'+ISNULL(CAST(LIA3.ContractTermMonths AS VARCHAR(10)),'N/A') AS SkuName,
      LI2.[Date],
      LI2.[NetworkName],
      LI2.[UnitSign],
      LI2.[Amount],
	  LIA3.ContractTermMonths
INTO [dbo].[LineItemApptsFinal3]
  FROM [dbo].[LineItemApptsFinal2] LI2 LEFT JOIN [dbo].[LineItemAppts3]  LIA3 ON LI2.LineItemID=LIA3.LineItemID
--GO

SELECT * FROM  [dbo].[LineItemApptsFinal3]


SELECT DISTINCT SKUID, SkuName 
into NewApptSkus
FROM [LineItemApptsFinal3] order by SkuName
SELECT distinct 
--LI.LineItemID as LineItemID, 
LI.ContractID as ContractID,
C.[DefaultTermMonths]-1 as ContractTermMonths
--ISNULL(LI.ProductID,-1) as ProductID,
--ISNULL(A.CityID,'-1') as MarketID,
--LI.BillingStartDate as [Date], 
--PA.ProductPackage as NetworkName,
--CASE WHEN BLD.[GrossBldgSqFt]>80 THEN 'P' ELSE 'M' END AS UnitSign,
--CAST (LI.OriginalMonthlyPrice AS decimal(10,2)) as Amount,
--CAST (LI.ContractTermMonths-1 AS INT) AS ContractTermMonths 
--INTO [dbo].[LineItemAppts3]
--INTO #LineItemAppts2
FROM [DCSQLDEV104].Enterprise.dbo.LineItem LI LEFT JOIN
[DCSQLDEV104].Enterprise.dbo.[Contract] C ON LI.ContractID=C.ContractID
--[DCSQLDEV104].Enterprise.dbo.Location L ON LI.SiteLocationID=L.LocationID LEFT JOIN
--[DCSQLDEV104].Enterprise.[dbo].[Address] A ON L.AddressID=A.AddressID LEFT JOIN
--[DCSQLDEV104].Enterprise.[dbo].[PropertyAddress] PRADDR ON L.AddressID=PRADDR.AddressID LEFT JOIN
--[DCSQLDEV104].Enterprise.[dbo].[Property] P ON P.PropertyID=PRADDR.PropertyID LEFT JOIN 
--[DCSQLDEV104].CoStar2.[dbo].[BldSqFt] BLD ON BLD.PropertyID=P.PropertyID  LEFT JOIN 
--[dbo].[ProductAppts] PA ON LI.ProductID=PA.ProductID

WHERE 
--YEAR(BillingStartDate) in (2016,2017) 
LineItemStatusID=1
AND LI.ProductID IN (SELECT ProductID FROM  [dbo].[ProductAppts])
ORDER BY C.[DefaultTermMonths]-1
-----------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------
select top 100 * from [dbo].[LineItemComplete] where skuid<>-1 and Amount>4;--
select count(*) from [LineItemComplete];--------------------------------------
------------------------------------------------------------------------------
select * from ValidProduct

------------------------------------------------------------------------------
SELECT 
ContractID as ContractID,
LI.SKUID,
GLB.[GLAccount] as GLAccount,
GLR.GLDescription as GLAccountDesc,
CASE VP.ProductType WHEN 'O' THEN 'Other' 
                    WHEN 'LN' THEN 'LoopNet'
					WHEN 'VP' THEN 'VP'
					WHEN 'C'  THEN 'Comps'
					WHEN 'P'  THEN 'Property'
					WHEN 'T'  THEN 'Tenant'
					WHEN 'MA' THEN 'Analytics'
					WHEN 'PPR' THEN 'PPR'
					ELSE 'Other' END AS ProductType,
ISNULL(SM.MarketName,'Unknown') as MarketName,
SPF.SkuName as SkuName,
BT.BusinessTypeName as CustomerTypeName,
SF.UserCount as UserCount,
CAST(YEAR(LI.Date) as varchar(4))+
CASE MONTH(LI.Date)
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sep'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END as YR_MTH,
YEAR(LI.Date) as YEAR, 
MONTH(LI.Date) as MTH, 
SUM(LI.Amount) as RevenueAmt
INTO F_REVENUE5
FROM [dbo].[LineItemComplete] LI JOIN SkuFinal SF ON LI.SKUID=SF.SKUID 
LEFT JOIN [dbo].[ValidProduct] VP ON LI.ProductID=VP.ProductID
JOIN  [dbo].[SkuPriceFinal] SPF ON LI.SKUID=SPF.SKUID
JOIN [dbo].[BusinessType]BT ON LI.CustomerType=BT.BusinessTypeID
JOIN [dbo].[SkuMarket] SM ON LI.SKUID=SM.SKUID
JOIN [dbo].[GLBridge] GLB ON LI.[LineItemID]=GLB.[LineItemID]
JOIN [dbo].[GLRevenueDESC] GLR ON GLB.GLAccount=GLR.GLAccount
WHERE LI.skuid<>-1 and LI.Amount>4
GROUP BY 
ContractID,
LI.SKUID,
VP.ProductType,
GLB.[GLAccount],
GLR.GLDescription ,
SM.MarketName,
SPF.SkuName,
BT.BusinessTypeName,
SF.UserCount,
YEAR(LI.Date), 
MONTH(LI.Date)
ORDER by 
SUM(LI.Amount) DESC,
YEAR(LI.Date), 
MONTH(LI.Date)

--select * from F_REVENUE
--drop table F_REVENUE

select * from F_REVENUE5
---------------------------------------------------------------------------------

SELECT COUNT(*) FROM [dbo].[Market]

select * from [dbo].[BusinessType]

SELECT DISTINCT GLAccount 
GLAccount
into GLRevenue
FROM F_REVENUE
-------------------------

select * from GLRevenue



select Distinct SF.SKUID, SF.SkuName, (select top 1 M.MarketName from 
                                SkuFinal SF1 JOIN Market M ON SF1.MarketID=M.MarketID where SF1.SKUID= SF.SKUID ) as MarketName
INTO SkuMarket
FROM  
[dbo].[SkuFinal] SF


select * from SkuPriceFinal

/*
this is what you play with in the mean time;
bring in the following:
1. Customer
2. GL Account Group
3. Product Type
4. 
*/




select distinct SKUID from SkuFinal where (ProductID in (1,2,5)) and (ProductID not in (
select Productid from 
))

select * from F_REVENUE5 where SKUID NOT IN (
select SKUID from [dbo].[SKUCMA])

select * from F_REVENUE5 where SkuName not like '%Suite%'

update F5
set ProductType = 'Combo' from F_REVENUE5 F5 where SkuName like '%Combo%'

update F5
set ProductType = 'Single' from F_REVENUE5 F5 where SkuName ='U'


select * from F_REVENUE5

select Distinct
GLAccount,GLAccountDesc
INTO D_GL
 from F_REVENUE5

 select distinct Skuid, SkuName, ProductType 
 INTO D_PRODUCT
 from F_REVENUE5

 select distinct 
 CustomerTypeName 
 into D_Customer
 from F_REVENUE5

 select distinct UserCount 
 into D_UserCount
 from F_REVENUE5 

 select distinct YR_MTH
 into D_YEAR_MONTH
 from F_REVENUE5

 select distinct 
 MarketName
 into D_Market
 from F_REVENUE5

 select * from D_GL

 select * from D_PRODUCT


 update D_PRODUCT
 set ProductType='Single' where ProductType='U'



 select count(*) from F_Revenue where SkuName like '%OwnerPMC%'
 UNION
  select count(*) from F_Revenue where SkuName like '%Vendor%'
  UNION
 select count(*) from F_Revenue where SkuName like '%Brokerage/Consultants%'
 union
 select count(*) from F_Revenue where SkuName like '%Lender%'


 
 select count(*) 
 
 update R
 set R.ProductType='Single'
 from F_Revenue R where SkuName like'U'
 
  update R
 set R.ProductType='SuiteCMA'
 from F_Revenue R where SkuName like '%Vendor%'
 
 
   update R
 set R.ProductType='SuiteCMA'
 from F_Revenue R where SkuName like '%Brokerage/Consultants%'

    update R
 set R.ProductType='SuiteCMA'
 from F_Revenue R where SkuName like '%Lender%'

 select 
 ProductType,
 count(*)
  from F_Revenue
  group by ProductType

  select 
  
  Update F_Revenue
  set ProductType='Single'
   from F_Revenue where ProductType='U'


 
 UNION
  select count(*) from F_Revenue where SkuName like '%Vendor%'
  UNION
 select count(*) from F_Revenue where SkuName like '%Brokerage/Consultants%'
 union
 select count(*) from F_Revenue where SkuName like '%Lender%'


 46414-Suite-PA1-5-4-Brokerage/Consultants

 --3710





select top 100
[Line Item ID] as LineItem,
[G_L Account No_] as GLAccount,
YEAR([Posting Date]) as PostingYear, 
MONTH([Posting Date]) as PostingMonth,   
SUM([Amount]) as Amount
from [dbo].[RIG$G_L Entry] 
where [G_L Account No_] IN 
(
'3101',
'3300',
'3090',
'3085',
'3434',
'3091',
'3084'
) and [Posting Date]>'2016-01-01 00:00:00.000'
group by [Line Item ID],YEAR([Posting Date]),MONTH([Posting Date]),[G_L Account No_]

select top 10 * from [dbo].[RIG$G_L Entry]
--------------------------
---------------------------

SELECT 
C.NAME AS COLUMN_NAME,
T.NAME AS TABLE_NAME 
FROM SYS.columns C JOIN SYS.TABLES T 
ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN SYS.schemas S 
ON T.[SCHEMA_ID]=S.[schema_id]
WHERE
C.NAME like '%Global Dimension 1%' and
T.NAME LIKE '%RIG%' 
ORDER BY C.COLUMN_ID

select top 10 * from [dbo].[RIG$ITem]SELECT
[Line Item ID] as LineItem,
[G_L Account No_] as GLAccount,
CAST(YEAR([Posting Date])  as varchar(4))+
CASE MONTH([Posting Date])
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sep'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END as YR_MTH,
YEAR([Posting Date]) as PostingYear, 
MONTH([Posting Date]) as PostingMonth,
SUM([Credit Amount]) as CreditAmount,
SUM([Debit Amount]) as DebitAmount,   
SUM([Amount]) as TotalAmount
INTO F_Invoice1
from [DCSQLDEV135\ACCT].[NavisionDB260_PRD].[dbo].[RIG$G_L Entry] 
where [G_L Account No_] IN 
(
'2401',
'3101',
'3300',
'2025',
'2001',
'3760',
'3434',
'3083',
'2005',
'2028',
'2013',
'2010',
'3090',
'2000',
'3085',
'2009',
'2026',
'2037',
'3084',
'3091',
'2003',
'2021',
'3200',
'2019',
'2002'
) and [Posting Date]>='2017-01-01 00:00:00.000'
group by [Line Item ID],YEAR([Posting Date]),MONTH([Posting Date]),[G_L Account No_]

----

select * from [dbo].[D_YearMonth] order by [YR_MTH]

CAST(YEAR(LI.Date) as varchar(4))+
CASE MONTH(LI.Date)
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sep'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END as YR_MTH,


select 
       SBF.SKUID,
       F.[GLAccount],
	  CAST([PostingYear] as varchar(4))+
     CASE F.[PostingMonth]
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sep'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END as YR_MTH,
      F.[PostingYear],
      F.[PostingMonth],
      sum(F.[Amount]) as Amount
INTO F_Invoice2
from [dbo].[F_Invoice] F JOIN [dbo].[SkuBridgeFinal] SBF ON F.LineItem=SBF.LineItemID
group by  SBF.SKUID, F.[GLAccount], F.[PostingYear],F.[PostingMonth]



 SELECT
[Line Item ID] as LineItem,
[G_L Account No_] as GLAccount,
CAST(YEAR([Posting Date])  as varchar(4))+
CASE MONTH([Posting Date])
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sep'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END as YR_MTH,
YEAR([Posting Date]) as PostingYear, 
MONTH([Posting Date]) as PostingMonth,
SUM([Credit Amount]) as CreditAmount,
SUM([Debit Amount]) as DebitAmount,   
SUM([Amount]) as TotalAmount
INTO F_Invoice3
from [DCSQLDEV135\ACCT].[NavisionDB260_PRD].[dbo].[RIG$G_L Entry] 
where [G_L Account No_] IN 
(
'2401',
'3101',
'3300',
'2025',
'2001',
'3760',
'3434',
'3083',
'2005',
'2028',
'2013',
'2010',
'3090',
'2000',
'3085',
'2009',
'2026',
'2037',
'3084',
'3091',
'2003',
'2021',
'3200',
'2019',
'2002'
) and [Posting Date]>='2017-01-01 00:00:00.000'
group by [Line Item ID],YEAR([Posting Date]),MONTH([Posting Date]),[G_L Account No_]

-------------------------------------

SELECT 
      SBF.SKUID,
      F.[GLAccount],
	  F.[YR_MTH],
      F.[PostingYear],
      F.[PostingMonth],
	  sum(F.[CreditAmount]) AS CreditAmount,
	  sum(F.[DebitAmount]) AS DebitAmount,
      sum(F.[TotalAmount]) AS TotalAmount
INTO F_Invoice4
FROM [dbo].[F_Invoice] F LEFT JOIN [dbo].[SkuBridgeFinal] SBF ON F.LineItemID=SBF.LineItemID
GROUP BY  SBF.SKUID, F.[GLAccount], F.[PostingYear],F.[PostingMonth], F.[YR_MTH]
---------------------------------------------
---------------------------------------------
select 
ContractID,
LocationID 
INTO ContractLocation
from [DCSQLPRD104].Enterprise.dbo.Contract
-----------------------------------------------
-----------------------------------------------
---175,394-------------------------------------

select distinct 
CL.[ContractID],
CL.[LocationID],
L.[LocationName]
FROM 
[dbo].[ContractLocation] CL JOIN [DCSQLPRD104].Enterprise.dbo.Location L ON CL.LocationID=L.LocationID










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






��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p L O A D _ F _ N a v i s i o n ]         S c r i p t   D a t e :   6 / 1 2 / 2 0 1 7   5 : 5 1 : 0 1   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
  
 A L T E R   P R O C E D U R E   [ d b o ] . [ u s p L O A D _ F _ N a v i s i o n ]  
 A S  
  
 S E L E C T  
 S B F 2 . [ L o c a t i o n I D ] ,  
 S B F 2 . [ C o n t r a c t I D ] ,  
 S B F 2 . [ S K U I D ] ,  
 R . [ G _ L   A c c o u n t   N o _ ]   a s   G L A c c o u n t ,  
 C A S T ( Y E A R ( R . [ P o s t i n g   D a t e ] )     a s   v a r c h a r ( 4 ) ) +  
 C A S E   M O N T H ( R . [ P o s t i n g   D a t e ] )  
           W H E N   1   T H E N   ' - J a n '  
 	   W H E N   2   T H E N   ' - F e b '  
 	   W H E N   3   T H E N   ' - M a r '  
 	   W H E N   4   T H E N   ' - A p r '  
 	   W H E N   5   T H E N   ' - M a y '  
 	   W H E N   6   T H E N   ' - J u n '  
 	   W H E N   7   T H E N   ' - J u l '  
 	   W H E N   8   T H E N   ' - A u g '  
 	   W H E N   9   T H E N   ' - S e p '  
 	   W H E N   1 0   T H E N   ' - O c t '  
 	   W H E N   1 1   T H E N   ' - N o v '  
 	   W H E N   1 2   T H E N   ' - D e c '  
 	   E L S E   ' - U k n '   E N D   a s   Y e a r M o n t h ,  
 S U M ( R . [ C r e d i t   A m o u n t ] )   a s   C r e d i t A m o u n t ,  
 S U M ( R . [ D e b i t   A m o u n t ] )   a s   D e b i t A m o u n t ,        
 S U M ( R . [ A m o u n t ] )   a s   T o t a l A m o u n t  
 I N T O   F _ N A V 2  
 f r o m   [ D C S Q L D E V 1 3 5 \ A C C T ] . [ N a v i s i o n D B 2 6 0 _ P R D ] . [ d b o ] . [ R I G $ G _ L   E n t r y ]   R   J O I N   [ d b o ] . [ L i n e I t e m C o m p l e t e ]   L I C   O N   R . [ L i n e   I t e m   I D ] = L I C . L i n e I t e m I D  
           L E F T   J O I N   S k u B r i d g e F i n a l 2   S B F 2   O N   R . [ L i n e   I t e m   I D ] = S B F 2 . L i n e I t e m I D  
 w h e r e   [ G _ L   A c c o u n t   N o _ ]   I N    
 (  
 ' 2 4 0 1 ' ,  
 ' 3 1 0 1 ' ,  
 ' 3 3 0 0 ' ,  
 ' 2 0 2 5 ' ,  
 ' 2 0 0 1 ' ,  
 ' 3 7 6 0 ' ,  
 ' 3 4 3 4 ' ,  
 ' 3 0 8 3 ' ,  
 ' 2 0 0 5 ' ,  
 ' 2 0 2 8 ' ,  
 ' 2 0 1 3 ' ,  
 ' 2 0 1 0 ' ,  
 ' 3 0 9 0 ' ,  
 ' 2 0 0 0 ' ,  
 ' 3 0 8 5 ' ,  
 ' 2 0 0 9 ' ,  
 ' 2 0 2 6 ' ,  
 ' 2 0 3 7 ' ,  
 ' 3 0 8 4 ' ,  
 ' 3 0 9 1 ' ,  
 ' 2 0 0 3 ' ,  
 ' 2 0 2 1 ' ,  
 ' 3 2 0 0 ' ,  
 ' 2 0 1 9 ' ,  
 ' 2 0 0 2 '  
 )   a n d   R . [ P o s t i n g   D a t e ] > = ' 2 0 1 7 - 0 1 - 0 1   0 0 : 0 0 : 0 0 . 0 0 0 '  
 g r o u p   b y   R . [ L i n e   I t e m   I D ] , Y E A R ( R . [ P o s t i n g   D a t e ] ) , M O N T H ( R . [ P o s t i n g   D a t e ] ) , R . [ G _ L   A c c o u n t   N o _ ] ,  
 S B F 2 . [ L o c a t i o n I D ] ,  
 S B F 2 . [ C o n t r a c t I D ] ,  
 S B F 2 . [ S K U I D ]  
  
  
  
 USE [CoStar]
GO



INSERT [dbo].[SkuListPriced2] ([SKUID],[ListPrice])
SELECT [SKUID]
      ,[ListPrice]
  FROM [dbo].[SkuListPriced]

-------------------------------------
SELECT * FROM [dbo].[SkuListPriced];
-------------------------------------
SELECT
L.ContractID,
SUM(
COALESCE( L.CurrentMonthlyPrice,L.OriginalMonthlyPrice) 
) AS ContractAmount
INTO ContractListEnterprise
FROM [DCSQLPRD104].Enterprise.dbo.LineItem L JOIN SkuBridgeFinal2 SBF2 ON L.LineItemID=SBF2.LineItemID
where SBF2.SKUID IN (Select Distinct SKUID from [dbo].[SkuListPriced])AND  L.LineItemStatusID=1 
group by L.ContractID
HAVING SUM(L.CurrentMonthlyPrice) >0


select top 10 * from [DCSQLPRD104].Enterprise.dbo.LineItemselect * from [dbo].[SkuApptsFinal]

select top 1 * from [dbo].[LineItemAppts5]

select [NetworkName],[UnitSign],[ContractTermMonths], count([ContractTermMonths]) as cnt
from [dbo].[LineItemAppts5]
group by [NetworkName],[UnitSign],[ContractTermMonths]
order by 3
----------------------------------------------------
----------------------------------------------------
select Distinct SPF.SkuName
from [dbo].[LineItemAppts5] LIA LEFT  JOIN 
[dbo].[SkuBridgeFinal2] SBF ON LIA.LineItemID=SBF.LineItemID JOIN 
[dbo].[SkuPriceFinal] SPF ON SBF.SKUID=SPF.SKUID
-----------------------------------------------------









--------------------------------------------------------------------------------
----------- Sales Invoice Header Count------------------------------------------
select [No_] as Invoice, 
SUM([Charged Amount]) as ChargedAmount
from [dbo].[RIG$Sales Invoice Header] where 
[Posting Date] BETWEEN '2016-06-15 00:00:00.000' and '2017-06-15 00:00:00.000'
group by [No_]
--------------------------------------------------------------------------------
----------- Sales Invoice Line Count--------------------------------------------
select [Document No_] as Invoice, 
COUNT(*) as InvoiceCount, 
--SUM([Line Discount Amount]) as LineDiscountAmount,
SUM([Amount]) as Amount
from [dbo].[RIG$Sales Invoice Line] where 
[Posting Date] BETWEEN '2016-06-15 00:00:00.000' and '2017-06-15 00:00:00.000'
group by [Document No_]
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
SELECT 
0  AS SKUID,
[Contract ID] AS ContractID,
[Line Item ID] AS LineItemID,
[CustAccountLocationID] AS LocationID,
'' AS GLAccount,
CAST(YEAR([Posting Date])  AS VARCHAR(4))+
CASE MONTH([Posting Date])
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sep'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END AS PostingYearMonth,
YEAR([Posting Date]) AS PostingYear,
MONTH([Posting Date]) AS PostingMonth,
SUM([Amount]) AS InvoiceAmount,
SUM(0) AS ContractAmount
FROM [dbo].[RIG$Sales Invoice Line] WHERE 
[Posting Date] BETWEEN '2016-06-15 00:00:00.000' and '2017-06-15 00:00:00.000'
GROUP BY [Contract ID],[Line Item ID],[CustAccountLocationID],[Posting Date]
----------------------------


select top 10 [Contract Number] from [dbo].[RIG$Sales Invoice Header] where [Contract Number]<>'' and [Contract Number] is not null
select top 10 [Contract ID] from [dbo].[RIG$Sales Invoice Line] where [Contract ID]<>'' and [Contract ID] is not null





[dbo].[RIG$Sales Invoice Line]


select top 10 [Posting Date]  from  [dbo].[RIG$Sales Invoice Header]
select top 10 *  from  [dbo].[RIG$Sales Invoice Header]
select top 10 * from [dbo].[RIG$Sales Invoice Line]
SELECT 
0  AS SKUID,
[Contract ID] AS ContractID,
[Line Item ID] AS LineItemID,
[CustAccountLocationID] AS LocationID,
'' AS GLAccount,
CAST(YEAR([Posting Date])  AS VARCHAR(4))+
CASE MONTH([Posting Date])
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sep'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END AS PostingYearMonth,
YEAR([Posting Date]) AS PostingYear,
MONTH([Posting Date]) AS PostingMonth,
SUM([Amount]) AS InvoiceAmount,
SUM(0) AS ContractAmount
INTO F_NAVISION
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] WHERE 
[Posting Date] BETWEEN '2016-06-15 00:00:00.000' and '2017-06-15 00:00:00.000'
GROUP BY [Contract ID],[Line Item ID],[CustAccountLocationID],[Posting Date]
EXEC [dbo].[uspProcessContracts]


select count(*) from SkuPrice

select count(*) from SkuPrice;
select count(*) from Sku;

select * from LineItem
order by Contractid, ProductID, MarketID

select count(*) from  [dbo].[SkuBridgeFinal]
select count(*) from  [dbo].[SkuBridgeFinal2]

select distinct LineItemID from LineItem where LineItemID in (select distinct LineItemID from [dbo].[SkuBridgeFinal]);

INSERT  [dbo].[SkuBridgeFinal]([LineItemID],[SKUID])
SELECT DISTINCT [LineItemID],[SKUID] 
FROM LineItem WHERE SKUID<>-1 
ORDER BY SKUID

select distinct skuid from LineItem where SKUID IN (select distinct SKUID from [dbo].[SkuBridgeFinal])
select * from SkuPrice where Price>4
select count(*) from [dbo].[SkuBridgeFinal]

select * from [dbo].[LineItem] 
ORDER BY CONTRACTID, DATE 
-----------------------------

TRUNCATE TABLE [dbo].[Contract_Input_List]

INSERT [dbo].[Contract_Input_List]([ContractID])
SELECT DISTINCT [ContractID] FROM [dbo].[LineItem] ORDER BY CONTRACTID 
------------------
SELECT * FROM LineItem where BundleID=-1







select count(*) from [dbo].[LineItem] where SKUID=-1


truncate table [dbo].[Contract_Input_List]

select * from [dbo].[Contract_Input_List]


insert [dbo].[Contract_Input_List] ([ContractID])
select distinct [ContractID] from LineItem order by ContractID

--------------------------------------------------------
select distinct lineitemid from LineItem----124,937;---
-------------------------------------------------------
select distinct LineItemID from LineItem where LineItemID IN 
(select distinct LineItemID from SkuBridgeFinal)
--------------------------------------------------------
select *
INTO revenue.Sku
from dbo.Sku
--------------------81,019
select * 
INTO revenue.SkuPrice
from dbo.SkuPrice
---------------------11,030
select *
INTO revenue.SkuBridge
from dbo.SkuBridgeFinal
---------------------493,133











��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p U p d a t e M a r k e t S k u N a t i o n a l ]         S c r i p t   D a t e :   6 / 1 9 / 2 0 1 7   1 1 : 3 9 : 2 2   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
  
 A L T E R   P R O C   [ d b o ] . [ u s p U p d a t e M a r k e t S k u N a t i o n a l ]  
 A S  
  
  
 S E L E C T   d i s t i n c t   S K U I D    
 I N T O   # N a t i o n a l _ S k u s  
 F R O M   S k u L G   W H E R E   S k u N a m e   L I K E   ' % N a t i o n a l   S u b s c r i p t i o n % '  
  
  
 S E L E C T    
 L i n e I t e m I D    
 I N T O   # P r o b l e m _ L i n e I t e m s  
 F R O M   [ d b o ] . [ S k u B r i d g e ]   W H E R E   S K U I D   I N   ( S E L E C T   S K U I D   F R O M   # N a t i o n a l _ S k u s )  
  
 s e l e c t   d i s t i n c t   L I . L i n e I t e m I D , L . L o c a t i o n I D , A . C i t y    
 I N T O   # F i x e d A d d r 3  
 F R O M   [ D C S Q L D E V 1 0 4 ] . E n t e r p r i s e . [ d b o ] . [ L i n e I t e m ]   L I  
 J O I N   [ D C S Q L D E V 1 0 4 ] . E n t e r p r i s e . [ d b o ] . L o c a t i o n   L   o n   L I . S i t e L o c a t i o n I D = L . L o c a t i o n I D    
 L E F T   J O I N   [ D C S Q L D E V 1 0 4 ] . E n t e r p r i s e . [ d b o ] . [ A d d r e s s ]   A   O N   L . A d d r e s s I D = A . A d d r e s s I D    
 w h e r e   L I . L i n e I t e m I D     i n     ( S E L E C T   L i n e I t e m I D   F R O M   # P r o b l e m _ L i n e I t e m s )  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 U P D A T E   L G  
 S E T   L G . S k u N a m e = L G . S k u N a m e + ' ( ' + A . C i t y + ' ) '  
 f r o m   [ d b o ] . [ S k u L G ]   L G   J O I N   [ d b o ] . [ S k u B r i d g e ]   S B   O N  
 L G . S K U I D = S B . S K U I D   J O I N   # F i x e d A d d r 3   A   o n   S B . L i n e I t e m I D = A . L i n e I t e m I D  
 - - w h e r e   S B . L i n e I t e m I D   i n   ( S e l e c t   d i s t i n c t   L i n e I t e m I D   f r o m   # F i x e d A d d r 3 )  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 U P D A T E   P  
 S E T   P . [ S k u N a m e ] = S . S k u N a m e  
 f r o m   S k u L G   S   J O I N   S k u P r i c e L G   P   o n   S . S K U I D = P . S K U I D  
 w h e r e   P . S K U I D   I N   ( S e l e c t   S k u I D   f r o m   # N a t i o n a l _ S k u s )  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 D R O P   T A B L E   # N a t i o n a l _ S k u s ;  
 D R O P   T A B L E   # F i x e d A d d r 3 ;  
 D R O P   T A B L E   # P r o b l e m _ L i n e I t e m s ;  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - -   L E A V E   T H E   L I N E S    
  
 s e l e c t   *   f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]  
 s e l e c t   c o u n t ( * )   f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]  
  
 s e l e c t   *   f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]  
  
  
 s e l e c t   d i s t i n c t   S B . S K U I D , L I A . L i n e I t e m I D    
 I N T O   A p t . S k u B r i d g e  
 f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]   L I A   J O I N     [ r e v e n u e ] . [ S k u B r i d g e ]   S B    
 O N   L I A . L i n e I t e m I D = S B . L i n e I t e m I D  
  
  
  
 d e l e t e   f r o m   d b o . S k u B r i d g e   w h e r e   L i n e I t e m I D   I N     ( s e l e c t   D i s t i n c t   L i n e I t e m I D   f r o m   A p t . S k u B r i d g e ) ;  
 d e l e t e   f r o m   r e v e n u e . S k u B r i d g e   w h e r e   L i n e I t e m I D   I N     ( s e l e c t   D i s t i n c t   L i n e I t e m I D   f r o m   A p t . S k u B r i d g e ) ;  
 d e l e t e   f r o m   d b o . S k u B r i d g e 2   w h e r e   L i n e I t e m I D   I N     ( s e l e c t   D i s t i n c t   L i n e I t e m I D   f r o m   A p t . S k u B r i d g e ) ;  
 d e l e t e   f r o m   d b o . S k u B r i d g e F i n a l   w h e r e   L i n e I t e m I D   I N     ( s e l e c t   D i s t i n c t   L i n e I t e m I D   f r o m   A p t . S k u B r i d g e ) ;  
 d e l e t e   f r o m   d b o . S k u B r i d g e F i n a l 2   w h e r e   L i n e I t e m I D   I N     ( s e l e c t   D i s t i n c t   L i n e I t e m I D   f r o m   A p t . S k u B r i d g e ) ;  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 d e l e t e   f r o m   [ d b o ] . [ S k u ]   w h e r e   S K U I D   I N   ( S e l e c t   d i s t i n c t   S K U I D   f r o m   A p t . S k u B r i d g e ) ;  
 d e l e t e   f r o m   [ d b o ] . [ S k u P r i c e ]   w h e r e   S K U I D   I N   ( S e l e c t   d i s t i n c t   S K U I D   f r o m   A p t . S k u B r i d g e ) ;  
 s e l e c t   *   f r o m   [ d b o ] . [ S k u A p p t s F i n a l ] ;  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 s e l e c t   *   f r o m   [ d b o ] . [ S k u A p p t s F i n a l ]  
  
 A L T E R   T A B L E   [ d b o ] . [ L i n e I t e m A p p t s 5 ]   A D D   S k u N a m e   V a r c h a r ( 2 6 5 )   N U L L ,   S K U I D   I N T   N U L L ;  
  
 S E L E C T   *   F R O M   [ d b o ] . [ S k u A p p t s F i n a l ]  
  
 s e l e c t   t o p   1 0   *   f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]  
  
 s e l e c t     [ N e t w o r k N a m e ] , *     f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]   w h e r e   [ N e t w o r k N a m e ]   i s   n u l l  
  
 s e l e c t   D i s t i n c t  
 ( ' A p p t s ' + ' - ' + [ N e t w o r k N a m e ] + ' - ' + [ U n i t S i g n ] + ' - ' + C a s t ( [ C o n t r a c t T e r m M o n t h s ]   a s   V a r c h a r ( 4 ) ) )   a s   S k u N a m e  
 F r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]  
  
 S E L E C T   P . P r o d u c t D e s c ,  
 *  
 F R O M   [ d b o ] . [ L i n e I t e m A p p t s 5 ]     L I   J O I N   P r o d u c t   P   o n   L I . P r o d u c t I D = P . P r o d u c t I D  
 w h e r e   (   P . P r o d u c t D e s c   N o t   l i k e   ' % F i n d e r % '   )   A N D   (   P . P r o d u c t D e s c   N o t   l i k e   ' % A p a r t m e n t s . c o m % ' )  
  
  
 a l t e r   t a b l e   [ d b o ] . [ L i n e I t e m A p p t s 5 ]   a d d   S k u N a m e P r e   v a r c h a r ( 2 0 )   n u l l ;  
  
 u p d a t e   L I  
 s e t   L I . S k u N a m e P r e = ' F i n d e r '  
 F r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]     L I   J O I N   P r o d u c t   P   o n   L I . P r o d u c t I D = P . P r o d u c t I D  
 w h e r e   P . P r o d u c t D e s c   L i k e   ' % F i n d e r % '  
 - - - - - - - - - - - - - -  
 u p d a t e   L I  
 s e t   L I . S k u N a m e P r e = ' A p p t s '  
 F r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]     L I   J O I N   P r o d u c t   P   o n   L I . P r o d u c t I D = P . P r o d u c t I D  
 w h e r e   P . P r o d u c t D e s c   L i k e   ' % A p a r t m e n t s . c o m % '  
  
 s e l e c t   t o p   1 0   *   f r o m   [ d b o ] . [ S k u A p p t s F i n a l ]  
  
 s e l e c t   *   f r o m     [ d b o ] . [ L i n e I t e m A p p t s 5 ]    
 - - 3 0 0 0 4 - A p p t s - G o l d - M - 2 4  
  
 s e l e c t   * ,  
 [ S k u N a m e P r e ] + ' - ' + [ N e t w o r k N a m e ] + ' - ' + I S N U L L ( [ U n i t S i g n ] , ' N ' ) + ' - ' + I S N U L L ( C a s t ( [ C o n t r a c t T e r m M o n t h s ]   a s   v a r c h a r ( 4 ) ) , ' N / A ' )  
  
 - - - ' [ U n i t S i g n ] + ' - ' C a s t ( [ C o n t r a c t T e r m M o n t h s ]   a s   V a r c h a r ( 4 ) ) )   a s   S k u N  
 f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]  
  
  
 s e l e c t   *   f r o m     [ d b o ] . [ S k u A p p t s F i n a l ]  
  
  
 a l t e r   t a b l e   [ d b o ] . [ S k u A p p t s F i n a l ]   a d d   S k u N a m e S h o r t   v a r c h a r ( 2 5 0 )   N U L L ;  
  
 s e l e c t   t o p   1 0   *   f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]  
  
    
 u p d a t e   S A F  
 S E T   [ S k u N a m e S h o r t ] = R I G H T ( [ S k u N a m e ] , L E N ( [ S k u N a m e ] ) - 6 )      
 f r o m   [ d b o ] . [ S k u A p p t s F i n a l ]   S A F  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 U p d a t e   L I  
 S E T   [ S k u N a m e ] = [ S k u N a m e P r e ] + ' - ' + [ N e t w o r k N a m e ] + ' - ' + I S N U L L ( [ U n i t S i g n ] , ' N ' ) + ' - ' + I S N U L L ( C a s t ( [ C o n t r a c t T e r m M o n t h s ]   a s   v a r c h a r ( 4 ) ) , ' N / A ' )  
 F R O M   [ d b o ] . [ L i n e I t e m A p p t s 5 ]   L I  
  
 u p d a t e   L I A  
 s e t   L I A . [ S K U I D ] = S A F . S K U I D  
 F R O M   [ d b o ] . [ L i n e I t e m A p p t s 5 ]   L I A   J O I N   [ d b o ] . [ S k u A p p t s F i n a l ]   S A F   O N   L I A . S k u N a m e = S A F . S k u N a m e S h o r t  
  
 s e l e c t   D i s t i n c t   S k u N a m e   f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]   w h e r e   S K U I D   I S   N U L L  
  
 F i n d e r - F i n d e r   S i t e s - M - N / A  
 F i n d e r - F i n d e r   S i t e s - P - N / A  
  
 s e l e c t   c o u n t ( * )   f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]   w h e r e   S K U I D   i s   n u l l ; - - - 4 0 3  
  
 u p d a t e   L I A  
 s e t   L I A . [ S K U I D ] = S A F . S K U I D  
 F R O M   [ d b o ] . [ L i n e I t e m A p p t s 5 ]   L I A   J O I N   [ d b o ] . [ S k u A p p t s F i n a l ]   S A F   O N   L I A . S k u N a m e = S A F . S k u N a m e S h o r t  
 w h e r e   L I A . S K U I D   i s   n u l l  
 - - 7 3 , 8 5 3  
 s e l e c t   D i s t i n c t  
 S K U I D , L i n e I t e m I D  
 I N T O   L i n e I t e m A p p t s N e w I n s e r t  
 f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]  
  
 s e l e c t   *   f r o m   L i n e I t e m A p p t s N e w I n s e r t  
  
 I n s e r t   [ d b o ] . [ S k u B r i d g e 2 ] ( [ L i n e I t e m I D ] , [ S K U I D ] )  
 s e l e c t   [ L i n e I t e m I D ] , [ S K U I D ]   f r o m   L i n e I t e m A p p t s N e w I n s e r t ;  
  
 - - - - - - - - - - - - -  
 I n s e r t   [ d b o ] . [ S k u B r i d g e ] ( [ L i n e I t e m I D ] , [ S K U I D ] )  
 s e l e c t   [ L i n e I t e m I D ] , [ S K U I D ]   f r o m   L i n e I t e m A p p t s N e w I n s e r t ;  
 - - - - - - - - - - - - - - - - - -  
 I n s e r t   [ r e v e n u e ] . [ S k u B r i d g e ] ( [ L i n e I t e m I D ] , [ S K U I D ] )  
 s e l e c t   [ L i n e I t e m I D ] , [ S K U I D ]   f r o m   L i n e I t e m A p p t s N e w I n s e r t ;  
 - - - - - - - - - - - - - - - - - - - -  
  
 i n s e r t   [ r e v e n u e ] . [ S k u P r i c e ]   ( [ S K U I D ] , [ S k u N a m e ] , [ P r i c e ] )  
 s e l e c t   [ S K U I D ] , [ S k u N a m e ] , [ P r i c e ]   F R O M   [ d b o ] . [ S k u A p p t s F i n a l ]    
 - - - - - - - - - - - - -  
 i n s e r t   [ d b o ] . [ S k u P r i c e ]   ( [ S K U I D ] , [ S k u N a m e ] , [ P r i c e ] )  
 s e l e c t   [ S K U I D ] , [ S k u N a m e ] , [ P r i c e ]   F R O M   [ d b o ] . [ S k u A p p t s F i n a l ]    
 - - - - - - - - - -  
 - - - - - - - - - -  
 i n s e r t   [ r e v e n u e ] . [ S k u ]   ( [ S K U I D ] , [ S k u N a m e ] , [ A m o u n t ] )  
 s e l e c t   [ S K U I D ] , [ S k u N a m e ] , [ P r i c e ]   F R O M   [ d b o ] . [ S k u A p p t s F i n a l ]   ;  
 - - - - - -  
 i n s e r t   [ d b o ] . [ S k u ]   ( [ S K U I D ] , [ S k u N a m e ] , [ A m o u n t ] )  
 s e l e c t   [ S K U I D ] , [ S k u N a m e ] , [ P r i c e ]   F R O M   [ d b o ] . [ S k u A p p t s F i n a l ]   ;  
  
  
 i n s e r t   [ d b o ] . [ S k u L i s t P r i c e d ]   ( [ S K U I D ] , [ L i s t P r i c e ] )  
 s e l e c t   [ S K U I D ] , [ P r i c e ]   f r o m     [ d b o ] . [ S k u A p p t s F i n a l ]   w h e r e   P r i c e   i s   n o t   n u l l  
  
 ( s e l e c t   d i s t i n c t   L i n e I t e m I D   f r o m   [ r e v e n u e ] . [ S k u B r i d g e ] )  
  
 s e l e c t   d i s t i n c t   L i n e I t e m I D   f r o m   [ d b o ] . [ L i n e I t e m A p p t s 5 ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  EXEC [dbo].[uspLOAD_F_Navision]

 --40,899,049


 select count(*) from [cube].[F_NAVISION]

 ---4,153,214
 --1,354,709
 ------------------------------------------------------------------------------
 select  Distinct [LineItemID] 
 INTO ukn.LineItem
 from  [cube].[F_NAVISION]  where SKUID=-1;


 delete from [cube].[F_NAVISION] where LineItemID=0
 select count(*) from [cube].[F_NAVISION] where SKUID=-1
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 select Distinct ContractID 
 into ukn.Contract
 from [DCSQLPRD104].Enterprise.dbo.LineItem where LineItemID in (
 select LineItemID from [ukn].[LineItem])
 order by ContractID
 ------------------------------------------------------------------------------

 select distinct LI.ContractID,P.ProductID, P.ProductDesc from [DCSQLPRD104].Enterprise.dbo.LineItem LI JOIN [DCSQLPRD104].Enterprise.dbo.Product P
 ON LI.ProductID=P.ProductID
 ORDER BY LI.ContractID


SELECT  SUM(N.[InvoiceAmount]) AS Inv_Amt,
        SUM(N.[ContractAmount]) AS Cnt_Amt,
		SUM(SP.Price) as LP_Amt
FROM [cube].[F_NAVISION] N JOIN [revenue].[SkuPrice] SP 
ON N.SKUID=SP.SKUID
WHERE N.[SKUID]<>-1;

select * from [revenue].[SkuPrice]


 -------------------------
 ----- Unknown SKU Totals:
 ---187,542,429.55--------
 ---174,192,986.06--------
 -------------------------
 ---Sku totals:
 ---875,118,458.29
 ---756,164,420.41
 -------------------------------------
 ---884,677,062.65
 ---763,997,867.55
 ---2,078,285,234.81
 -------------------------------------
 -------------------------------------
 -------------------------------------
 SELECT SKUID, ISNULL(Price,0.00) AS Price 
 INTO cube.F_ProductPrice  FROM revenue.SkuPrice
 ---------------------------------------
 ---------------------------------------


select count(*) Total_LineItems from [cube].[F_ProductRevenue];
select count(distinct [ContractID]) as Distinct_Contracts from [cube].[F_ProductRevenue];
select sum([InvoiceAmount]) total_dollars from [cube].[F_ProductRevenue];
select sum([ContractAmount]) total_Contract_dollars from [cube].[F_ProductRevenue];
select count( distinct [SKUID]) Distinct_Products from [cube].[F_ProductRevenue];

--1,062,660,887.84

/*
Here are the totals : 06.16.16 to 06.16.17 ( full 12 months )

1. Total number of  LineItems :        4,153,214 
2. Total Distinct Contracts:              50,669
3. Total Revenue Dollars:         $1,062,660,887.84
3.1 Total Revenue Dollars (Contract) 930,357,406.47
4. Total number of distinct Skus:           8411
*/

select 
R.ContractID,
R.SKUID, 
R.[PostingYearMonth],
Cast(AVG([ContractAmount]) as money) as Contract_Amt
INTO cube.AvgPriceFact
from [cube].[F_ProductRevenue] R JOIN [cube].[F_ProductPrice] P ON R.SKUID=P.SKUID
group by 
R.ContractID,
R.SKUID, 
R.[PostingYearMonth]
--------------------------
select SKUID, CAST(AVG(
ISNULL(Contract_Amt,0)
) as money)  as AvgPrice 
INTO cube.AvgPriceFact2
from cube.AvgPriceFact
GROUP By SKUID
--------------------------
update FP
SET FP.Price=APF.AvgPrice
FROM [cube].[F_ProductPrice] FP 
JOIN [cube].[AvgPriceFact2] APF ON FP.SKUID=APF.SKUID
---------------------------
---------------------------
---------------------------
select distinct [PostingYearMonth] from [cube].[F_ProductRevenue]
alter table [revenue].[SkuPrice] add AvgPrice money null;


select 
SUM([InvoiceAmount]) as Inv_Amt,
SUM([ContractAmount]) as Cont_Amt,
SUM(P.Price) as List_Amt
from [cube].[F_ProductRevenue] R JOIN [cube].[F_ProductPrice] P on R.SKUID=P.SKUID
--ere R.PostingYearMonth='2016-Jun'
--------------------------------
select * from [cube].[F_ProductPrice]
select distinct [PostingYearMonth] from [cube].[F_ProductRevenue]
--------------------------------
-----------------
--884,677,062.65
--763,997,867.55
--909,776,620.61
-----------------
select sum([InvoiceAmount]) from [cube].[F_ProductRevenue]

---1,062,660,887.84

select * from [cube].[F_ProductPrice] where Price>4

select count(*) from [cube].[F_ProductPrice];
select count(distinct skuid) from [cube].[F_ProductPrice];

select * from [revenue].[Sku] where SKUID=28212

select * from [cube].[F_ProductPrice] where SKUID=28212
USE [CoStar]
GO

/****** Object:  Table [cube].[F_MEA]    Script Date: 6/23/2017 11:34:44 AM ******/
DROP TABLE [cube].[F_MEA]
GO

/****** Object:  Table [cube].[F_MEA]    Script Date: 6/23/2017 11:34:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [cube].[F_MEA](
    [SKUID] [int] NULL,
	[ContractID] [int] NULL,
	[YR_MTH] [varchar](8) NULL,
	[CarveAmount] [money] NULL
) ON [PRIMARY]
------------------------------------------------
------ CREATE CUSTOMER DIMENSIONS --------------
------------------------------------------------

select *
into [cube].[D_Contract]
from [DCSQLPRD104].Enterprise.dbo.[Contract]
------------------------------------------------ 
select *
into [cube].[D_LineItem]
from [DCSQLPRD104].Enterprise.dbo.[LineItem]
------------------------------------------------
select *
into [cube].[D_GLAccount]
from [dbo].[D_GLAccount]
--------------------------------------------------
select *
into [cube].[D_Location]
from [dbo].[D_Location]
--------------------------------------------------
select *
into [cube].[D_Period]
from [dbo].[D_Period]
--------------------------------------------------
select *
into [cube].[D_Product]
from [dbo].[D_Product]
--------------------------------------------------------------
--------------------------------------------------------------

/*
Things to perform:
1. add Quarters for periods
2. add SIC for customer types
3. run the queries to make sure you are connecting
4. read 605 and 606;

*/

select count(distinct [LocationID]) as CntLocation, count(distinct [ContractID]) as CntContract
from [cube].[F_ProductRevenue]

--1,951,084


select distinct [LocationID] 
into cube.Location
from [cube].[F_ProductRevenue]

select * from cube.Location

SELECT [Description 3], *
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line]
WHERE [Description 3] is not null;
select top 100 * from [DCSQLPRD104].Enterprise.dbo.[Contract];
select distinct BillingTermID from [DCSQLPRD104].Enterprise.dbo.[Contract];
----------------------------------------------------------------------------

DECLARE @BillStart DATE
DECLARE @BillEnd DATE

SELECT MAX(

SELECT  
ContractID, 
LineItemID, 
YEAR(BillingStartDate) as BillingYear,
MONTH( BillingStartDate) as BillingMonth
into stub.RawInput
FROM [DCSQLPRD104].Enterprise.dbo.LineItem  
where BillingStartDate 
BETWEEN '2016-05-15 00:00:00.000' and '2017-06-15 00:00:00.000'
---------------------------------------------------------------
alter table [stub].[RawInput] add InvoiceYear int null;
alter table [stub].[RawInput] add InvMonth int null;
alter table [stub].[RawInput] Rename column StubAmt money null;
--------------------------------------------------------------


update R
set 
R.[InvoiceYear]=2017,
R.[InvMonth]=1
FROM [stub].[RawInput] R  

update R
set 
R.InvoiceYear=R.[BillingYear],
R.[InvMonth]=R.[BillingMonth]+1
FROM [stub].[RawInput] R  where not ( BillingMonth=12 and BillingYear=2016)




select * from [stub].[RawInput] where  BillingMonth=12

SP_Rename 

----------------------------------------------

select * from [stub].[RawInput]

update R
set R.FirstInvAmt=F.[InvoiceAmount]
from [cube].[F_ProductRevenue] F JOIN [stub].[RawInput] R on 
F.ContractID=R.ContractID AND
F.LineItemID=R.LineItemID AND
F.PostingYear=R.InvoiceYear AND
F.PostingMonth=R.InvMonth

delete from [stub].[RawInput] where FirstInvAmt is null;

select * from  [stub].[RawInput]


select Contractid, LineItemID,AVG([InvoiceAmount]) as AvgInvAmt 
INTO stub.RawAvgAmounts
from [cube].[F_ProductRevenue] R 
Group By Contractid, LineItemID

where 
ContractID=152187 AND 	
LineItemID=1892824 AND
PostingYear=2016 AND
PostingMonth=8
-- $374.50


update RI
set RI.[AvgInvAmt]=RA.[AvgInvAmt]
FROM [stub].[RawInput] RI JOIN [stub].[RawAvgAmounts] RA ON 
RI.ContractID=RA.ContractID AND
RI.LineItemID=RA.LineItemID

update RI
set RI.[StubAmt]=RI.[AvgInvAmt]-[FirstInvAmt]
FROM [stub].[RawInput] RI 

update [stub].[RawInput] set StubAmt=NULL where StubAmt is not null;



select sum([StubAmt]) from [stub].[RawInput]

----4,934,868.8582

select * from [stub].[RawInput]

SELECT
sum(sign([StubAmt])) as [sign]
--[StubAmt]
FROM
    [stub].[RawInput] where sign([StubAmt])=-1.00
	--where [StubAmt]='-1.00';
	-----------------------------

select sum([StubAmt]) from [stub].[RawInput]
--4,934,868.85

alter table [cube].[F_ProductRevenue] add StubAmount numeric(38,20) null;

update F
set F.[StubAmount]=R.[StubAmt]
from [cube].[F_ProductRevenue] F JOIN [stub].[RawInput] R on 
F.ContractID=R.ContractID AND
F.LineItemID=R.LineItemID AND
F.PostingYear=R.InvoiceYear AND
F.PostingMonth=R.InvMonth AND
F.LocationID IN (SELECT MAX([LocationID]) from [cube].[F_ProductRevenue] F1 where F1.LocationID=F.LocationID)


select sum([StubAmount])  from [cube].[F_ProductRevenue];

--23,563,639.92450000000000000000

update [cube].[F_ProductRevenue] set [StubAmount]=NULL where [StubAmount] is not null

select * from [stub].[RawInput]

select sum([StubAmt]) from [stub].[RawInput]
--4,934,868.8582
----------------------------------------------------------------------------------

update F 
set F.[StubAmount]=R.StubAmt
from [cube].[F_ProductRevenue] F JOIN [stub].[RawInput] R on 
F.ContractID=R.ContractID AND
F.LineItemID=R.LineItemID AND
F.PostingYear=R.InvoiceYear AND
F.PostingMonth=R.InvMonth AND
F.InvoiceAmount=R.FirstInvAmt
--F.PostingMonth=R.InvMonth 
--AND
--F.LocationID IN (SELECT MAX([LocationID]) from [cube].[F_ProductRevenue] F1 where F1.LocationID=F.LocationID)
--------------------------------------------------------------
--------------------------------------------------------------

update [cube].[F_ProductRevenue] set [StubAmount]=NULL WHERE [StubAmount] IS NOT NULL;

SELECT SUM([StubAmount]) FROM [cube].[F_ProductRevenue];

--11,468,728.26

SELECT COUNT(*) FROM [stub].[RawInput]

SELECT 
[ContractID],
[LineItemID],
[InvoiceYear],
[InvMonth],
[FirstInvAmt],
COUNT(*) AS CNT
FROM [stub].[RawInput]
GROUP BY 
[ContractID],
[LineItemID],
[InvoiceYear],
[InvMonth],
[FirstInvAmt]
HAVING 
COUNT(*)>1
---------------------------------
SELECT 
[ContractID],
[LineItemID],
[PostingYear],
[PostingMonth],
[InvoiceAmount],
COUNT(*) AS CNT
FROM [cube].[F_ProductRevenue] WHERE LEFT([GLAccount],1)='3'
GROUP BY 
[ContractID],
[LineItemID],
[PostingYear],
[PostingMonth],
[InvoiceAmount]
HAVING 
COUNT(*)>1





SELECT * FROM [cube].[F_ProductRevenue]
WHERE
CONTRACTID=83370 AND
LineItemID=1057283 AND
PostingYear=2017 AND
PostingMonth=3
AND lefT(GLAccount,1)=3
-----------------------------
-----------------------------
SELECT * FROM [cube].[D_GLAccount]
WHERE [GLAccount]='3084'
------------------------------
select distinct ContractID from lineitem  where SKUID=-1 

select sum([TotalMonthlyPrice]) from [cube].[F_ProductRevenue2] where SKUID=-1 ;
select sum([TotalMonthlyPrice]) from  [cube].[F_ProductRevenue2] where SKUID is not null;

--963,083,422.32
--963,083,422.32

delete from [cube].[F_ProductRevenue2] where SKUID=-1

---237,849,105.036
--963,083,422.32

select sum([TotalMonthlyPrice]) from [cube].[F_ProductRevenue2] WHERE SKUID IS NOT NULL
--select sum([DiscountAmount]) from [cube].[F_ProductRevenue2];
----------------
--963,083,422.32
--963,083,422.32
----------------

--963,083,422.32

select * from [cube].[F_ProductRevenue2]

update [cube].[F_ProductRevenue2] set SKUID=-1 where SKUID is null;

select SKUID,* from [cube].[F_ProductRevenue2]

select * from [bug].[SkuExists]

select distinct SKUID from [cube].[F_ProductRevenue2] where SKUID<>-1 and SKUID IS NOT NULL
--------------------------------------------------------------
SELECT DISTINCT [SKUID] FROM [cube].[F_ProductRevenue];
SELECT DISTINCT  [ContractID] FROM [cube].[F_ProductRevenue];
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

------------------------------------------------------------
SELECT DISTINCT [Document Type] from [dbo].[RIG$G_L Entry];
------------------------------------------------------------


[dbo].[LoopNet$Sales Invoice Line]

select  [LineItemID],count(*)
from [dbo].[GLBridge]
group by [LineItemID],[GLAccount]
having count(*)>1

select [LineItemID], count(*) from 
[revenue].[SkuBridge]
group by [LineItemID]
having count(*)>1
-----------------------

select * from revenue.SkuPrice where SKUID IN (
59462,
6231
);
select * from [revenue].[SkuBridge] where LineItemID=1317361
------------------------------------------------------------------

with dups as (
select [LineItemID],SKUID ,ROW_NUMBER() OVER (PARTITION BY [LineItemID] ORDER BY SKUID) AS rn
 from [revenue].[SkuBridge]
)
delete from dups where rn>1select count(DISTINCT SKUID) from [dbo].[SkuPrice];
select * from [revenue].[SkuPrice];
 ALTER TABLE [revenue].[SkuPrice] ADD GLSegmentName Varchar(150) null;
 ----------------------------------------------------------------------
 ----------------------------------------------------------------------
 ---- SEGMENT UPDATES START HERE --------------------------------------
 ----------------------------------------------------------------------
 ----------------------------------------------------------------------
 UPDATE SP  SET SP.[GLSegmentName]='247' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Appts-Platinum%';
 ----------------
 UPDATE SP  SET SP.[GLSegmentName]='248' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Appts-Diamond%';
 ----------------
 UPDATE SP  SET SP.[GLSegmentName]='245' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Appts-Gold%';
 ----------------
 UPDATE SP  SET SP.[GLSegmentName]='246' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Appts-Silver%';
 ---------------
 UPDATE SP  SET SP.[GLSegmentName]='269' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Finder-Platinum%';
 --------------
 UPDATE SP  SET SP.[GLSegmentName]='270' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Finder-Diamond%';
 -------------
  UPDATE SP  SET SP.[GLSegmentName]='267' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Finder-Silver%';
  -------------
  UPDATE SP  SET SP.[GLSegmentName]='268' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Finder-Gold%';
 --------------
  UPDATE SP  SET SP.[GLSegmentName]='277' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%FinderSites%';
  -------------
  UPDATE SP  SET SP.[GLSegmentName]='101' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Suite%';
  -------------



  select * from [revenue].[SkuPrice] where SkuName like '%RSV%'

    select * from [revenue].[SkuPrice] where ProductCategory like '%Other%'

  /*
30830-RSV - Request License--1 -0-4-Brokerage/Consultants
31113-RSV � Portfolio Maximizer Term Of Service License--1 -0-4-Brokerage/Consultants
31114-RSV - Change Orders--1 -0-4-Brokerage/Consultants
33415-RSV � Request Maintenance--1 -0-7-OwnerPMC
34807-RSV - Request License-1 -0-12-Vendor
50427-RSV � Data Complete (Excel Tool) License--1 -0-4-Brokerage/Consultants
  */
  /* Goals for today: perform some statistcs on the data and
see how viable the overall numbers are 

what we are looking for is sku count in each category and 
how much that cateogry is worth both from a standpoint of 
actual dollars that it brings in as well as the transformation
lines that it has to touch to be able to perform pricing of
that sku accordingly;
*/

select * from [revenue].[Sku]
select * from [revenue].[SkuPrice]
---------------------------------

select * from [dbo].[BusinessTypeCategory]
------------------------------------------










update SP
SET SP.CustomerPricingCategory='Appraisal/Valuation/Tax Appeal'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Appraisal/Valuation/Tax Appeal%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Brokerage/Consultants'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Brokerage/Consultants%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Lender'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Lender%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Vendor'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Vendor%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Commercial'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Commercial%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='OwnerPMC'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%OwnerPMC%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Retailer&CorporateREPricing'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Retailer&CorporateREPricing%'
---------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Unknown'
from [revenue].[SkuPrice] SP where SkuName LIKE  '%Unknown%'
----------------------------------------------------------------------------
update SP
SET SP.ProductCategory='Apartments'
from [revenue].[SkuPrice] SP where (ProductCategory LIKE  '%Appts%') OR  (ProductCategory LIKE  '%Finder%') 
----------------------------------------------------------------------------
update SP
SET SP.CustomerPricingCategory='Undefined'
from [revenue].[SkuPrice] SP where CustomerPricingCategory IS NULL;

select * from [revenue].[SkuPrice] where [CustomerPricingCategory] is null;

select CustomerPricingCategory,count(distinct PR.SKUID) as Cnt, CAST(sum(PR.TotalMonthlyPrice) as money) as AppxDollarValue 
from [cube].[F_ProductRevenue] PR LEFT JOIN [revenue].[SkuPrice] SP ON SP.SKUID=PR.SKUID   
-- where PR.skuid  in (select skuid from [dbo].[741Sku])
group by CustomerPricingCategory
-------------
select ProductCategory,count(*) as Cnt, CAST(sum(Price) as money) as AppxDollarValue 
from [revenue].[SkuPrice] where skuid not in (select skuid from [dbo].[741Sku]) and Price>4
group by ProductCategory

-------------------------

select SP.CustomerPricingCategory ,
count(distinct PR.SKUID) as Cnt, CAST(sum(PR.TotalMonthlyPrice) as money) as AppxDollarValue,
CAST(sum(PR.[DiscountAmount]) as money) as DiscountDollarValue,
CAST(sum(PR.TotalMonthlyPrice) as money)-CAST(sum(PR.[DiscountAmount]) as money) as DifferenceValue
from [cube].[F_ProductRevenue] PR LEFT JOIN [revenue].[SkuPrice] SP ON SP.SKUID=PR.SKUID   
where PR.skuid  in (select skuid from [dbo].[616Sku])
group by CustomerPricingCategory order by 2
--------------------------------------

select * from [revenue].[SkuPrice] where ProductCategory='Other'

select * from [revenue].[Sku]
--------------------------------------------------------------
select BT.[BusinessTypeName], BTC.BusinessTypeCategory 
from [dbo].[BusinessType] BT JOIN [dbo].[BusinessTypeCategory] BTC ON 
BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
------------------------------------------------------------------
select SKUID 
INTO bug.DroppedSkus
from [dbo].[741Sku] where skuid not in (select SKUID from 
------------------------------------------------------------------
---------------------------------------------------------------
select CustomerPricingCategory, count(*) as cnt
 from [revenue].[SkuPrice] where skuid in (select skuid from [dbo].[616Sku])
 group by CustomerPricingCategory
 -----------------------------------------------------------------------
 -----------------------------------------------------------------------

 SELECT
 CAST(sum(PR.[GrossMonthlyPrice]) as money)-
 CAST(sum(PR.[DiscountAmount]) as money)
 - CAST(sum(PR.[SalesTaxAmount]) as money) as Final12AmountEnterprise,
 count(distinct [ContractID]) as distinctContractCnt
from [cube].[F_ProductRevenueENT] PR 
--where SKUID IN (select SKUID from [dbo].[616Sku])
---$615,788,876.0433 / for all periods all skus
---$91,907,412.3036
--
-------------------------------------------------------------------------
SELECT 
CAST(sum(PR.[InvoiceAmount]) as money) as Final12AmountNavision,
count(distinct [ContractID]) as distinctContractCnt
from [cube].[F_ProductRevenueNAV] PR 
--where SKUID IN (select SKUID from [dbo].[616Sku])
---$600,406,498.87 / for all periods all skus
--$63,781,107.4085
-------------------------------------------------------------------------
--3,706,206,607.17
--869,917,250.90
-------------------------------------------------------------------------
select count(*)
from [revenue].[SkuPrice]
group by [ProductCategory]
--------------------------------------------------------------------------

 select 
CAST(sum(PR.[InvoiceAmount]) as money) as AppxDollarValue
from [cube].[F_ProductRevenueNAV] PR 
WHERE PR.SKUID is not null
--600,406,498.87
-----------------------------------------------------------------------------
select min([ChargeYear]),min([ChargeMonth]) from [cube].[F_ProductRevenue]
select max([ChargeYear]),max([ChargeMonth]) from [cube].[F_ProductRevenue]
----------------------------------------------------------------------------
select * from revenue.SkuPrice where SKUID in (
select distinct skuid from [cube].[F_ProductRevenueNAV] where skuid not in (
select distinct SKUID from [cube].[F_ProductRevenue]))
-----------------------------------------------------------------------------
select * from revenue.SkuPrice where SKUID in (
select distinct skuid from [cube].[F_ProductRevenue] where skuid not in (
select distinct SKUID from [cube].[F_ProductRevenueNAV]));
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

select * 
INTO err.F_ProductRevenueSKUNegative1
from cube.F_ProductRevenue 
where SKUID=-1
-------------------------
delete from cube.F_ProductRevenue where SKUID=-1

select sum([TotalMonthlyPrice]) from [cube].[F_ProductRevenue] where SKUID=-1
select sum([TotalMonthlyPrice]) from err.F_ProductRevenueSKUNegative1


--149,366,702.28

select sum([InvoiceAmount]) from [cube].[F_ProductRevenueNAV1] where [SKUID]=-1
--2836,289,356.27

delete from [cube].[F_ProductRevenueNAV1] where SKUID=-1
------------------------------------------------------------------
------- PRICE COMPARISONS -----------------------------------------

select LP.[SKUID],SP.[SkuName],LP.Price as ListedPrice, PP.Price as AveragePriceNav
from [cube].[F_ProductPrice] PP JOIN [dbo].[616SkuListPriced] LP ON 
PP.SKUID=LP.SKUID JOIN revenue.SkuPrice SP ON PP.SKUID=SP.SKUID
ORDER BY LP.SKUID
------------------------------------------------------


select * from [cube].[F_ProductRevenueENT] where SKUID=29256
select * from [cube].[F_ProductRevenueNAV] where SKUID=29256
---------------------------------------------------------

select distinct Contractid 
INTO err.GostContractsNotinNav
from  [cube].[F_ProductRevenueENT] where ContractID not in(
select distinct ContractID from [cube].[F_ProductRevenueNAV])
---------------------------------------------------------------------
----------------------------------------------------------------------
select * 
INTO err.GostLineItems
from [DCSQLPRD104].Enterprise.dbo.LineItem where ContractID in(
select ContractID from  [err].[GostContractsNotinNav])
-----------------------------------------------------------------------
select distinct ContractID 
INTO [dbo].[Contract_Input_List1]
from  
[DCSQLPRD104].Enterprise.dbo.LineItem where LineItemID NOT IN (
select distinct LineItemID from [revenue].[SkuBridge]) and lineItemStatusID=1
Order by ContractID;
-----------------------------------------------------------------------
-----------------------------------------------------------------------






exec [dbo].[uspLOAD_LineItem]

select count(distinct contractid) from [dbo].[LineItem];

select count(distinct lineitemid) from [dbo].[LineItem];

select count(*) from [dbo].[LineItem] where BundleID=-1

select count(*) from [dbo].[LineItem] where SKUID=-1
----------------------------------------------------------
select count(*) from [dbo].[LineItem];
----------------------------------------------------------
---------------------------------
select YEAR(date) as BillingStartYear, MONTH(date) BillingStartMonth, sum(OriginalMonthlyPrice) as Amount 
from [dbo].[LineItem] 
--where SKUID=-1
group by YEAR(date), MONTH(date)
order by YEAR(date),MONTH(date)
--------------------------------
select count(*) from [dbo].[LineItem] where BundleID<>-1 and SKUID=-1 
---------------------------------
exec [dbo].[uspLOAD_LineItem]


select count(distinct SKUID) from LineItem where SKUID<>-1
select count(distinct ) 
select count(distinct ContractID) from LineItem where BundleID<>-1
select count(*) from lineitem where SKUID<>-1 and BundleID=-1
------------------------------------------------------------------
------------------------------------------------------------------
select count(*) from lineitem
select count(*) from lineitem where SKUID<>-1
---1,028,567
---1,028,567
---535,100
-------------------------------------------------------------------------------------------------------------
select count(*) from lineItem where BundleID<>-1;-------------------------------------------------------------
select lineItemid from Lineitem where LIneitemid not in (select LineItemID from [cube].[F_ProductRevenueENT])
select lineItemid from Lineitem where LIneitemid not in (select LineItemID from [cube].[F_ProductRevenueNAV])
--------------------------------------------------------------------------------------------------------------
select distinct [SKUID] from [cube].[F_ProductRevenueENT];
select * from [revenue].[SkuPrice];
--------------------------------------------------------------------------------------------------------------
select * from [revenue].[Sku];
--------------------------------------------------------------------------------------------------------------
--------------------- REVENUE CAPTURE BY MONTH ---------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
select count(distinct skuid) sku_count,count(distinct contractid) contract_count, 
SUM(CAST([GrossMonthlyPrice] as money)-CAST([DiscountAmount] as money)-CAST([SalesTaxAmount] as money)) as Amt
 from [cube].[F_ProductRevenueENT] where [ChargeYear]=2017 and [ChargeMonth]=6
 --$61,179,773.66 -- JUNE 2017

select count(distinct skuid) sku_count,count(distinct contractid) contract_count, 
SUM(CAST([GrossMonthlyPrice] as money)-CAST([DiscountAmount] as money)-CAST([SalesTaxAmount] as money)) as Amt
 from [cube].[F_ProductRevenueENT] where [ChargeYear]=2017 and [ChargeMonth]=5
 --$62,415,832.7898 --- MAY 2017

 select count(distinct skuid) sku_count,count(distinct contractid) contract_count, 
SUM(CAST([GrossMonthlyPrice] as money)-CAST([DiscountAmount] as money)-CAST([SalesTaxAmount] as money)) as Amt
 from [cube].[F_ProductRevenueENT] where [ChargeYear]=2017 and [ChargeMonth]=4
 --$60,976,282.86  ---  APRIL 2017

 select count(distinct skuid) sku_count,count(distinct contractid) contract_count, 
SUM(CAST([GrossMonthlyPrice] as money)-CAST([DiscountAmount] as money)-CAST([SalesTaxAmount] as money)) as Amt
 from [cube].[F_ProductRevenueENT] where [ChargeYear]=2017 and [ChargeMonth]=3
 --$58,830,052.63  -- MARCH 2017
 -----------------------------------------------------------------------------------------------------------------
 -----------------------------------------------------------------------------------------------------------------
 -----------------------------------------------------------------------------------------------------------------


 select * from [revenue].[SkuPrice] where [Price]=0


 SELECT SUM(CurrentMonthlyPrice) AS CurrentMonthlyPrice, SUM(DiscountedMonthlyPrice) AS DiscountedMonthlyPrice
FROM [DCSQLPRD104].Enterprise.dbo.LineItem
--WHERE CurrentMonthlyPrice < 0 --<> OriginalMonthlyPrice
WHERE CurrentTermStartDate <
--AND LineItemStatusID = 1

--65,801,642.154
--61,951,274.72
--2,018,210.081

SELECT LineItemID
INTO err.LineItemCurrent
FROM [DCSQLPRD104].Enterprise.dbo.LineItem
--WHERE CurrentMonthlyPrice < 0 --<> OriginalMonthlyPrice
WHERE CurrentTermStartDate > '2016-07-01'
AND LineItemStatusID = 1
---------------------------------------------
---------------------------------------------
select LC.lineitemID,LI.CurrentMonthlyPrice as AmtAboveZero  from err.LineItemCurrent LC 
JOIN [DCSQLPRD104].Enterprise.dbo.LineItem LI on LC.LineItemID=LI.LineItemID
 where LC.lineitemid not in (select lineitemid from [cube].[F_ProductRevenueENT])
and LI.CurrentMonthlyPrice>0
-------------------------------------------------------------------------
select count(*) from [cube].[F_ProductRevenueENT] where [MonthlyPrice]=0;
-------------------------------------------------------------------------
--2,399,527;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
select distinct LI.[LineItemID],LI.ContractID,LI.CurrentMonthlyPrice 
INTO [err].[LineItemCurrent]
from [DCSQLPRD104].Enterprise.dbo.LineItem LI
where  LI.CurrentTermStartDate > '2016-07-01' AND  LI.LineItemStatusID = 1 AND
LI.lineitemid not in (
select lineItemid from revenue.SkuBridge) 
ORDER BY LI.ContractID
----------------------------------------------------------------
---select * from;-----------------------------------------------
---------------------------------------------------------------
FROM [DCSQLPRD104].Enterprise.dbo.LineItem
--WHERE CurrentMonthlyPrice < 0 --<> OriginalMonthlyPrice
WHERE CurrentTermStartDate > '2016-07-01';
AND LineItemStatusID = 1;---------------------------------------------------
----------------------------------------------------------------------------
select distinct contractid from [cube].[F_ProductRevenueENT] where contractid  in (
select distinct contractid from [err].[LineItemCurrent])
-----------------------------------------------------------------------------
select distinct contractid from [err].[LineItemCurrent] where contractid not  in (
select distinct contractid from  [cube].[F_ProductRevenueENT] );
------------------------------------------------------------------------------
select distinct LineItemID from [err].[LineItemCurrent] where LineItemID in (
Select distinct LineItemID from [cube].[F_ProductRevenueENT] );
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
select SUM(Case [CurrentMonthlyPrice] WHEN 0  THEN 0 ELSE 1 END) AS Cnt
from [err].[LineItemCurrent]
--group by LineItemID 
having SUM(Case [CurrentMonthlyPrice] WHEN 0  THEN 0 ELSE 1 END)>1
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
select * from [err].[LineItemX] where LineItemID in (select lineitemid from revenue.SkuBridge);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------




exec [dbo].[uspLOAD_LineItem]

delete from dbo.LineItem where BundleID=-1;

select * from dbo.LineItem
order by ContractID, ProductID


insert [dbo].[Contract_Input_List]([ContractID])
select distinct contractid from dbo.LineItem order by contractid;

select * from [dbo].[Contract_Input_List]

select * from dbo.SkuPrice
--11,138
select * from dbo.Sku
--81,099

exec [dbo].[uspProcessContracts]
---------------------------------------------------------------------
SELECT 
ContractID,
ProductID,
DATE,
ROW_NUMBER() OVER (PARTITION BY CONTRACTID,DATE ORDER BY CONTRACTID,DATE) as BundleID,
Amount
FROM dbo.lineItem
----------------------------------------------------------------------

SELECT *
INTO err.LineItemX24134NoSkuID 
FROM dbo.LineItem where SKUID=-1

SELECT LineItemID, SKUID 
INTO [revenue].[SkuBridgeX]
from dbo.LineItem where SKUID<>-1
---------------------------------------------------------------------
--84,897
select distinct lineitemid from [revenue].[SkuBridgeX]

with dups as (
select LineItemid, ROW_NUMBER() OVER (PARTITION BY LineItemID order by Date) as rn from dbo.LineItem
)
delete from dups where rn>1;

select * from [revenue].[SkuBridgeX] order by SKUID
-------------------------------------------------------

select count(*) from  [revenue].[SkuBridgeX] 

select * 

from dbo.sku where SKUID NOT IN (select skuid from revenue.SkuPrice)

select * 
INTO dbo.SkuPriceX
from dbo.SkuPrice where SKUID NOT IN (select SKUID from revenue.SkuPrice)
order by SKUID
-----------------------
select * 
INTO dbo.SkuX
from dbo.Sku where SKUID NOT IN (select distinct SKUID from revenue.Sku)
order by SKUID
-----------------------

select Distinct [LineItemID],[SKUID] 
into dbo.SkuBridgeX
from dbo.LineItem where SKUID NOT IN (select distinct SKUID from revenue.sku) and SKUID<>-1

select distinct skuid from #SkuBridgeX

select * INTO [revenue].[SkuX] from [dbo].[SkuX];
select * INTO [revenue].[SkuPriceX] from [dbo].[SkuPriceX];

select * INTO [revenue].[SkuBridgeX] from [dbo].[SkuBridgeX];

select distinct skuid from revenue.SkuBridgeX
---------------------------------------------------------------
---------------------------------------------------------------

EXEC [dbo].[uspLOAD_LineItem];


delete from [dbo].LineItem where LineItemID IN (select distinct LineItemID from revenue.SkuBridgeX)

select distinct LineItemID from  [dbo].LineItem;

delete from [dbo].LineItem where BundleID<>-1

select * from  [dbo].LineItem;
---------------------------------------------------------------

SELECT 
ContractID,
ProductID,
DATE,
ROW_NUMBER() OVER (PARTITION BY DATE ORDER BY ContractID) as BundleID,
Amount
--INTO #LineItemX
FROM dbo.lineItem
ORDER BY ContractID,ProductID,DATE
--------------------------------------------------------------------------

select * from #LineItemX

select 
ContractID, 
Date, 
rank() Over (partition by Contractid,Date order by Contractid,Date) as BundleID
from dbo.LineItem
----------------------



select contractid, date, count(*) as BundleID
INTO #LineItemUpateBundle
 from dbo.LineItem
 group by  contractid, date
order by Contractid, date, count(*);

update LI
SET LI.BundleID=LIB.BundleID
from dbo.LineItem LI JOIN #LineItemUpateBundle LIB ON LI.ContractID=LIB.ContractID AND LI.Date=LIB.Date;

drop table #LineItemUpateBundle;
---------------------------------------------

select * from dbo.LineItem order by Contractid, Date
----------------------------------------------


truncate table [dbo].[Contract_Input_List]

insert [dbo].[Contract_Input_List]([ContractID])
select distinct ContractID from dbo.LineItem
order by ContractID

select count(*) from dbo.SkuPrice --11,737
select count(*) from dbo.Sku --84,695

select count(*) from dbo.LineItem

select * from dbo.LineItem where ContractID=83492
order by BundleID

delete from dbo.LineItem where BundleID=-1


EXEC [dbo].[uspProcessContracts]

select * from dbo.LineItem 
where SKUID<>-1


update dbo.LineItem set SKUID=-1 where SKUID<>-1

select distinct contractid from dbo.LineItem
select distinct contractid from dbo.Contract_Input_List


INSERT [revenue].[SkuBridgeX](LineItemID,  SKUID )
select distinct LineItemID,  SKUID 
from dbo.LineItem where SKUID<>-1

drop table #LenderSku

select SKUID,SkuName, -1 as LineItemID
into #LenderSku
from [revenue].[SkuPrice] where SkuName like '%Lender%' and SKUID not in (
select distinct SKUID from [dbo].[616Sku])

select * from #LenderSku

update LS
set LS.LineItemID=SB.LineItemID
from #LenderSku LS JOIN revenue.SkuBridge SB ON LS.SKUID=SB.SKUID

select * 
into price.LenderSku
from #LenderSku

select * from Price.LenderSku



select * from [revenue].[SkuPrice]

select * from [cube].[F_ProductPrice] where SKUID=11020

select * 

from #LenderSku


delete from [dbo].[Contract_Input_List] where ContractID in (
select distinct ContractID from dbo.LineItem where SKUID<>-1)


select * from [dbo].[Contract_Input_List] 

select distinct skuid from dbo.LineItem


INSERT revenue.[SkuX] (
       [SKUID]
      ,[SkuName]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[Amount]
      ,[GLAccountName]
)

SELECT [SKUID]
      ,[SkuName]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[Amount]
      ,[GLAccountName]
from [dbo].[Sku] where SKUID IN (select distinct SKUID from dbo.LineItem where SKUID<>-1)
---------------------------------------------------------------------------------------------

INSERT [revenue].[SkuPrice] (
        [SKUID]
      ,[SkuName]
      ,[Price]
      ,[Listed_Price]
      ,[LastUpdateDate]
      ,[GLAccountName]
      
 
)
SELECT [SKUID]
      ,[SkuName]
      ,[Price]
      ,[Listed_Price]
      ,[LastUpdateDate]
      ,[GLAccountName]
      
  FROM dbo.[SkuPrice] where SKUID IN (select distinct SKUID from dbo.LineItem where SKUID<>-1)

  select * from dbo.sku

  delete from dbo.sku where skuid



USE master;

GO

ALTER DATABASE CoStar

Modify Name = CoStar0707 ;

GO







select distinct lineitemid from [err].[LineItemX]

select count(*) from dbo.sku
select count(*) from revenue.Sku
-----
select count(*) from dbo.SkuPrice

select distinct skuid from dbo.SkuPrice
select distinct SKUID from revenue.SkuPrice
------------------------------------------------
select count(*) from  revenue.SkuPrice;
------------------------------------------------
------------------------------------------------
WITH dups as
(
select SKUID, ROW_NUMBER() OVER (PARTITION BY SKUID ORDER BY SKUID) as rn
from revenue.SkuPrice 
)
select *  FROM dups where rn>1;
DELETE FROM dups where rn>1;
-------------------------------------------------------
------------------------------------------------------


INSERT revenue.SkuPrice (
        [SKUID]
      ,[SkuName]
      ,[Price]
      ,[Listed_Price]
      ,[LastUpdateDate]
      ,[GLAccountName]
)
select 
       [SKUID]
      ,[SkuName]
      ,[Price]
      ,[Listed_Price]
      ,[LastUpdateDate]
      ,[GLAccountName]
 from dbo.SkuPrice where SKUID not in  (
select distinct SKUID from revenue.SkuPrice)
-------------------------------------------------------
-------------------------------------------------------
select PP.SKUID, SP.SkuName, SP.CustomerPricingCategory,SP.ProductCategory, PP.AvgInvoicePriceAmt 
from [cube].[F_ProductPrice] PP JOIN revenue.SkuPrice SP ON 
PP.SKUID=SP.SKUID where AvgInvoicePriceAmt>20 
order by SP.CustomerPricingCategory;
--------------------------------------------------------
/* add the missing sku's to the dbo.SkuPrice table */
--------------------------------------------------------
--------------------------------------------------------
select SP.skuid, SP.skuname 
from revenue.SkuPrice SP JOIN [dbo].[616Sku] S ON SP.SKUID=S.SKUID
UNION
select skuid, SkuName from revenue.SkuPrice where ProductCategory='Apartments' and Price is not null
--------------------------------------------------------
--Order by SkuName DESC---------------------------------
--------------------------------------------------------
select * from revenue.SkuPrice;
--------------------------------------------------------
-- /* THIS IS THE WHOLE AREA THAT I WANT TO ADDRESS  */


select count(*) from dbo.SkuPrice;
select count(distinct SKUID) from dbo.SkuPrice;
-----------------
select count(*) from revenue.SkuPrice;
select count(distinct SKUID) from revenue.SkuPrice;
-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
---- SYNC THE SKU DETAILS TABLES --------------------
-----------------------------------------------------
-----------------------------------------------------
-- 11,150 - TOTAL SKU COUNT 07.10.17-----------------
-----------------------------------------------------
select count(*) from dbo.Sku;
select count(distinct SKUID) from dbo.Sku;
-----------------
select count(*) from revenue.Sku;
select count(distinct SKUID) from revenue.Sku;
-----------------
INSERT [revenue].[Sku] (
       [SKUID]
      ,[SkuName]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[Amount]
      ,[GLAccountName]
)
select 
      [SKUID]
      ,[SkuName]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[Amount]
      ,[GLAccountName]
 from dbo.Sku where SKUID not in  (
select distinct SKUID from revenue.Sku)
-------------------------------------------
--------------------------------------------------------
--- SYNC THE SKU_BRIDGES -------------------------------
--------------------------------------------------------
--------------------------------------------------------
select count(*) from dbo.SkuBridge;
select count(distinct SKUID) from dbo.SkuBridge;
--------------------------------------------------------
select count(*) from revenue.SkuBridge;
select count(distinct SKUID) from revenue.SkuBridge;
--------------------------------------------------------
WITH dups as
(
select LineItemID, ROW_NUMBER() OVER (PARTITION BY LineItemID ORDER BY SKUID) as rn
from revenue.SkuBridge
)
select *  FROM dups where rn>1;
--DELETE FROM dups where rn>1;

select * 
INTO dbo.SkuBridge
from revenue.SkuBridge order by SKUID
-----------------------------------------------------------------------------------------------------
----- flush out the no-name sku's into their separate table in case you need to un-do the nameing----
------------------------------------------------------------------------------------------------------
select count(distinct skuid) from dbo.SkuPrice where SkuName is null;
select count(distinct skuid) from dbo.Sku where SkuName is null; 
-----
select count(distinct skuid) from revenue.SkuPrice where SkuName is null;
select count(distinct skuid) from revenue.Sku where SkuName is null; 

select distinct SKUID from dbo.sku where SKUID not in (select distinct skuid from dbo.SkuPrice where SkuName is null)
and SkuName is null

select * from dbo.sku where SKUID=999999999
select * from dbo.SkuPrice where SKUID=999999999

update S
set S.SkuName='999999999-Unknown' from revenue.Sku S where SKUID=999999999


select * 
INTO err.SkuNoName5479
from revenue.Sku where SkuName is null;

select * from [err].[SkuNoName5479]

select * from [err].[SkuPriceNoName1439]
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------- SKU NAMING RESIDUAL --------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
select count(*) from err.SkuPriceNoName1439

SELECT NN.SKUID,NN.MarketID, COUNT(*) CNT
--INTO #TEMP_SKU2
FROM 

(

SELECT DISTINCT 
SKUID, 
CAST(SKUID AS VARCHAR(20)) +'-'+ 

(SELECT TOP 1 P.ProductDesc from err.SkuNoName5479 S5 JOIN dbo.Product P ON S5.ProductID=P.ProductID
where S5.SKUID=S1.SKUID)  +'-'+

CAST(
(SELECT TOP 1 M.MarketName from err.SkuNoName5479 S2 JOIN dbo.Market M ON S2.MarketID=M.MarketID
 where S2.SKUID=S1.SKUID) AS VARCHAR(100) ) +'-'+
CAST(
(SELECT TOP 1 UserCount from err.SkuNoName5479 S3  
where S3.SKUID=S1.SKUID) as Varchar(100)) +'-'+
CAST(
(SELECT TOP 1 BTC.BusinessTypeCategory from err.SkuNoName5479 S4 
JOIN dbo.BusinessTypeCategory BTC ON 
S4.CustomerType=BTC.BusinessTypeCategoryID
where S4.SKUID=S1.SKUID) as Varchar(100))
as SkuName 
INTO #tempSkuName2
FROM [err].[SkuNoName5479] S1 
WHERE S1.SkuName IS NULL and S1.SKUID NOT IN (SELECT DISTINCT SKUID FROM [err].[SkuNonSingle19])  

----------------------------------------------------------------------------------------------------

delete from #tempSkuName2 where SkuName is null

--select * from [dbo].[BusinessType]

update SP
set SP.SkuName=T.SkuName
from [err].[SkuPriceNoName1439] SP JOIN #tempSkuName2 T ON SP.SKUID=T.SKUID

select 
S.SKUID,
S.SkuName,
S.MarketID,
S.ProductID
into #tempProbSku
from [err].[SkuNoName5479] S JOIN [err].[SkuPriceNoName1439] SP ON S.SKUID=SP.SKUID 
where SP.SkuName is null

select SKUID, count(*) as cnt 
INTO err.SkuNonSingle19
from #tempProbSku
group by SKUID
having count(*)>1
-------------------------------

select * from [err].[SkuNonSingle19]

update S
SET S.SkuName=SP.SkuName
FROM [err].[SkuNoName5479] S JOIN [err].[SkuPriceNoName1439] SP ON S.SKUID=SP.SKUID

[err].[SkuNoName5479]

select count(*) from [err].[SkuNoName5479] where SkuName is null
select count(*) from [err].[SkuPriceNoName1439] where SkuName is null

select * from dbo.Sku where SkuName like '%99999%'

select * from [err].[SkuPriceNoName1439]
--select * from revenue.SkuPrice

--999999999	999999999-Unknown

update S
set 
S.[SkuName]=CAST(SKUID as Varchar(100)) +'-'+'Unknown'
 FROM [err].[SkuPriceNoName1439] S where SkuName is null
 -------------

 select CAST(SKUID as Varchar(100)) +'-'+'Unknown' from [err].[SkuPriceNoName1439] S where SkuName is null



) NN
--WHERE NN.PRODUCTID IN (1,2,5)
GROUP BY NN.SKUID,NN.MarketID
--ORDER BY SKUID
--HAVING COUNT(*)>1;

SELECT * 
INTO #TEMP_SKU3
FROM #TEMP_SKU2
ORDER BY SKUID, MarketID

SELECT SKUID,COUNT(*)
FROM #TEMP_SKU3
GROUP BY SKUID
HAVING COUNT(*)>1

SELECT * FROM #TEMP_SKU3


select * from dbo.Market


select count(*) from [err].[SkuPriceNoName1439] where SkuName is null
select count(*) from [err].[SkuNoName5479] where SkuName is null

update S
set S.SkuName=S1.SkuName
from dbo.Sku S JOIN [err].[SkuNoName5479] S1 ON S.SKUID=S1.SKUID
-------------
update SP
set SP.SkuName=SP1.SkuName
from dbo.SkuPrice SP JOIN [err].[SkuPriceNoName1439] SP1 ON SP.SKUID=SP1.SKUID
---------------------------------------------------------------------------

select * from revenue.SkuPrice where CustomerPricingCategory='Undefined' and SkuName NOT like'%Unknown%'


----------------------------------------------------------------------------
update S
set S.SkuName=S1.SkuName
from revenue.Sku S JOIN [err].[SkuNoName5479] S1 ON S.SKUID=S1.SKUID
-------------
update SP
set SP.SkuName=SP1.SkuName
from revenue.SkuPrice SP JOIN [err].[SkuPriceNoName1439] SP1 ON SP.SKUID=SP1.SKUID

select * from [revenue].[SkuPrice]select * from dbo.SkuPrice

select ProductCategory, count(*) 
from revenue.SkuPrice 
group by ProductCategory

select SKUID 
INTO err.SkuUndefCategory
from revenue.SkuPrice where ProductCategory='Undef'
order by SKUID

update SP
set ProductCategory='Other' from revenue.SkuPrice SP where ProductCategory is null


update SP
set CustomerPricingCategory='Lender' from revenue.SkuPrice SP where SKUID IN (select SKUID from err.SkuUndefCategory)
and SkuName LIKE '%Lender%'

select * from revenue.SkuPrice where SKUID IN (select SKUID from err.SkuUndefCategory)
and SkuName LIKE '%Lender%'

---75808-Suite-Northern Virginia-1-Brokerage/Consultants
--80540-Unknown
---80863-Suite-San Antonio-4-Appraisal/Valuation/Tax Appeal
-------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
select count(distinct SKUID) from [revenue].[Sku];
select count(distinct SKUID) from revenue.SkuPrice;
select count(distinct skuid) from revenue.SkuBridge;
--------------------------------------------------------------
USE [CoStar]
GO

INSERT INTO [revenue].[Sku]
           ([SKUID]
           ,[SkuName]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[Amount]
           ,[GLAccountName])
     select 
           [SKUID]
           ,[SkuName]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[Amount]
           ,[GLAccountName]
from dbo.Sku where SkuName is null


select * 
INTO #TempSkuName
from revenue.Sku where SkuName is null
---------------------
select  * from #TempSkuName
-----------------------------------------------------------------------------------


SELECT DISTINCT 
SKUID, 
CAST(SKUID AS VARCHAR(20)) +'-Suite-'+ CAST(
(SELECT TOP 1 M.MarketName from #TempSkuName S2 JOIN dbo.Market M ON S2.MarketID=M.MarketID
 where S2.SKUID=S1.SKUID) AS VARCHAR(100) ) +'-'+
CAST(
(SELECT TOP 1 UserCount from #TempSkuName S3  
where S3.SKUID=S1.SKUID) as Varchar(100)) +'-'+
CAST(
(SELECT TOP 1 BTC.BusinessTypeCategory from #TempSkuName S4 
JOIN dbo.BusinessTypeCategory BTC ON 
S4.CustomerType=BTC.BusinessTypeCategoryID
where S4.SKUID=S1.SKUID) as Varchar(100))
as SkuName 
INTO ##TempSkuName2
FROM #TempSkuName S1 
WHERE S1.PRODUCTID IN (1,2,5)  


select * from ##TempSkuName2

update S
Set S.SkuName=T.SkuName
from dbo.Sku S JOIN ##TempSkuName2 T ON S.SKUID=T.SKUID
--------------

update S
Set S.SkuName=T.SkuName
from dbo.SkuPrice S JOIN ##TempSkuName2 T ON S.SKUID=T.SKUID
--------------------------------------------------------------

select * from revenue.Sku where SkuName is null;


delete from dbo.LineItem where SKUID<>-1
---114,692

select * from [dbo].[LineItemGoodSKU114k]

select * from revenue.SkuBridge order by SKUID
----------------------------------------------------------
select distinct LineItemID from [dbo].[LineItemLEFTTOSKU];
----------------------------------------------------------
----------------------------------------------------------
select count(*) from dbo.Sku;
select count(*) from revenue.Sku;
----------------------------------------------------------
select count(*) from dbo.SkuPrice;
select count(*) from revenue.SkuPrice;
---------------------------------------------------------
select count(*) from dbo.SkuBridge;
select count(*) from revenue.SkuBridge;
---------------------------------------------------------
---------------------------------------------------------
-----------------------------------------------------------select * from [revenue].[SkuPrice] where SkuName is not null and price>1

update R
set R.AvgPrice=NULL from revenue.SkuPrice R where R.AvgPrice is not null;
--------
update R
set R.AvgPrice=PP.[AvgInvoicePriceAmt] from revenue.SkuPrice R JOIN [cube].[F_ProductPrice] PP
ON R.SKUID=PP.SKUID 

where R.AvgPrice is not null;
--------------------------------------
select * from revenue.SkuPrice

update R
set R.Price=[AvgInvoicePriceAmt]*1.31 from [revenue].[SkuPrice] R where [AvgInvoicePriceAmt] is not null;

select * from revenue.SkuPrice where SkuName is not null and [AvgInvoicePriceAmt]>20

select * from [dbo].[SkuListPriced]

update R
set R.[ListPrice]=SLP.ListPrice from revenue.SkuPrice R JOIN [dbo].[SkuListPriced] SLP ON R.SKUID=SLP.SKUID

 where R.[ListedPrice]  is  null;


 select * from revenue.SkuPrice where(ListPrice<>'0.00')


 update r
 set r.LastUpdatedate= CONVERT(VARCHAR(10),GETDATE(),102) 
 from [revenue].[SkuPrice] r where LastUpdateDate is null
 
 select * from revenue.SkuPrice where SkuName is not null and ListPrice<>'0.00'
 
 
 SELECT CONVERT(VARCHAR(10),GETDATE()
 ,102)


 update r
 set r.GLAccountName='3032' from [revenue].[SkuPrice] r where GLAccountName is null;

 select * from revenue.SkuPrice where SkuName is not null 
 ----------------------
 ----------------------
 ----------------------
  select * from revenue.SkuPrice where SkuName is not null ;
  --and 
  --[AvgInvoicePriceAmt]>20
  --and ListPrice<>'0.00'


Update r
set r.ProductCategory='REA' from revenue.SkuPrice r 
 --select * from revenue.SkuPrice 
  where r.SkuName like '%REA%' and r.SKUID NOT IN (
933,
1636,
2043,
2682,
2932,
3566,
3659,
4092,
4568,
4667,
4699,
4795,
27706,
27807,
27867,
28053,
28221,
28323,
28393,
28712,
29224,
26885,
7569,
19249,
29130
  );
  ---------------------------------

  select * from revenue.SkuPrice where SkuName is not null and AvgInvoicePriceAmt>20
  --ListPrice<>0.00

  select * from revenue.SkuPrice where SkuName like '%-PPR%' 
  
  and SKUID not in (71648)


  Update r
set r.ProductCategory='PPR' from revenue.SkuPrice r 
  where r.SkuName like '%-PPR%' 
  --------------------------------------------------------------

  select count(*) from revenue.SkuPrice
  select count(*) from dbo.SkuPrice

  select * 
  INTO dbo.SkuPrice
  from revenue.SkuPrice
  ----------------------
  -----------------------------------------------------------
  -----------------------------------------------------------
    select * from revenue.SkuPrice where SkuName is not null and AvgInvoicePriceAmt>20 and SkuName like '%Lender%'
  --ListPrice<>0.00
  ---------------------------
  select * from 
  ---------------------------------------------
  ---16553-Suite-(SQF_bucket(1-20))-OwnerPMC
  --------------------------------------------
  ---16489-Suite-(#ofSitesBucket(1-9))-Retailer&CorporateREPricing
  -------------------------------------------


	
 

declare @table varchar(50)='bug.SkuExists'
 
 select 
 
  substring(@table, charindex('.',@table)+1,ABS(
  
  charindex('.',@table)
  
  -charindex('.',@table)-1))
;
------------------------------------------------------------------------
 select distinct 
 SKUID,
 
 --SkuName,  
  
 --substring(Skuname,

 --charindex('-Suite-',Skuname)+7,3) AS MarketID, 

 --M.MarketName AS FormattedMarketName, 

 --substring(Skuname,1,charindex('-Suite-',Skuname)+6) AS FirstPartBeforeMarket,

 substring(Skuname,1,charindex('-Suite-',Skuname)+6)+M.MarketName+'-'+CAST(S.UserCount as varchar(10))+'-'+BTC.BusinessTypeCategory  AS NewSkuName

--S.CustomerType
 INTO ##SkuLongMarket
 from dbo.sku s JOIN dbo.Market m ON 
 m.MarketID=substring(Skuname,charindex('-Suite-',Skuname)+7,3) JOIN dbo.BusinessType BT ON S.CustomerType=BT.BusinessTypeID JOIN dbo.BusinessTypeCategory BTC ON BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
 -------------------------------------------------------------------
 --select top 10 
 --LEN(SkuName)-(LEN(substring(Skuname,1,charindex('-Suite-',Skuname)+7))+LEN( charindex('-Suite-',Skuname)+7,3)))
 --from dbo.Sku


 update S
 set S.SkuName=SML.NewSkuName
 from revenue.SkuPrice S JOIN ##SkuLongMarket SML ON S.SKUID=SML.SKUID
 ------------------------------

 update S
 set S.SkuName=SP.SkuName
 from dbo.Sku S JOIN dbo.SkuPrice SP ON S.SKUID=SP.SKUID
 -----------------------------
 
 update S
 set S.SkuName=SP.SkuName
 from revenue.Sku S JOIN revenue.SkuPrice SP ON S.SKUID=SP.SKUID
 -------------------------------------------------------------
  Update S
 set S.CustomerPricingCategory='Lender' from revenue.SkuPrice S where SKUID IN (

 select * from revenue.SkuPrice where SkuName is not null and AvgInvoicePriceAmt>20 and SkuName like '%Lender%'
 and SKUID not in (select SKUID from dbo.SkuListPriced)

 )
 ---------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------
  /* FIND OUT ABOUT THE MARKET TIERS AND HOW TO EFFECTIVELY BRING THEM INTO THE SKU
    DEFINITIONS FOR THE CORPORATE RE AND THE OWNER PMC CLIENTS; */
  --------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------

  alter table dbo.lineitem add DateNum varchar(8) null;

  update L
  set L.DateNum=CONVERT(VARCHAR(8),date,112)
  from dbo.LineItem L

  select * from dbo.LineItem

  SELECT * 
  INTO dbo.LineItem
  FROM 
  
  [dbo].[LineItemLEFTTOSKU] order by Contractid, ProductID
  ---- contract: 41938

  update L
  set L.BundleID=-1
  from dbo.LineItem L where BundleID>7000000

  select * from dbo.LineItem 
  --where BundleID>7000000

  select contractid, CONVERT(VARCHAR(8),date,112) as Date, count(*)+7000000 as BundleID
INTO ##LineItemUpateBundle1
 from dbo.LineItem
 group by  contractid, CONVERT(VARCHAR(8),date,112)
order by Contractid, CONVERT(VARCHAR(8),date,112), count(*);

update L
set L.BundleID=UB.BundleID
from dbo.LineItem L JOIN ##LineItemUpateBundle1 UB ON L.ContractID=UB.ContractID and L.DateNum=UB.Date
and L.ContractID=41938

------------------------

select * from dbo.LineItem where ContractID=41938

select * from ##LineItemUpateBundle where ContractID=41938
-------------------------------------------------------------

 SELECT CONVERT(VARCHAR(8),date,112) as trueDate, date  
 from ##LineItemUpateBundle where ContractID=41938

 select * from ##LineItemUpateBundle1 where ContractID=41938
















 select count(*) from dbo.sku
 select count(*) from dbo.SkuPrice
 ------------
  select count(*) from revenue.sku
 select count(*) from revenue.SkuPrice
 ----------------------------------------------
 -----------------------------------------------
  select distinct contractid from dbo.LineItem order by ContractID
  -----------------------------------------------

  INSERT  [dbo].[Contract_Input_List] (ContractID)
    select distinct contractid from dbo.LineItem order by ContractIDUSE [CoStar]
GO

SELECT [SKUID]
      ,[SkuName]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[Amount]
INTO dbo.Sku1      
  FROM [dbo].[Sku]
GO


select * 
INTO dbo.SkuBridge1
from dbo.SkuBridge

select * INTO revenue.Sku from dbo.Sku1;
select * INTO revenue.SkuPrice from dbo.SkuPrice1;
select * INTO revenue.SkuBridge from dbo.SkuBridge1;

select * from dbo.SkuApptsFinal
select * from dbo.SkuPrice where ProductCategory='Apartments'

select * from dbo.SkuName

select * from dbo.SkuListPriced
-----------------------------------
select * from revenue.SkuPrice
-----------------------------------

select MIN(SKUID), MAX(SKUID) from dbo.SkuPrice where flg='B'
select SKUID from dbo.SkuPrice where flg='A' order by SKUID desc
-------------------------------------------------------------------

select count(*) from revenue.SkuBridge














SELECT * FROM revenue.SkuPrice

SELECT SKUID, COUNT(DISTINCT ContractID) CNT
FROM [cube].[F_ProductRevenueNAV]
GROUP BY SKUID
HAVING COUNT(DISTINCT ContractID)>1
ORDER BY COUNT(DISTINCT ContractID) DESC-----------------------------------------------------------------------------------
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

select * from cube.D_Location--16092


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
��/ * * * * * *   S c r i p t   f o r   S e l e c t T o p N R o w s   c o m m a n d   f r o m   S S M S     * * * * * * /  
 S E L E C T   T O P   1 0 0 0   [ Y e a r M o n t h ]  
             , [ Y e a r M o n t h N a m e ]  
             , [ Y e a r Q u a r t e r N a m e ]  
     F R O M   [ C o S t a r ] . [ c u b e ] . D _ P e r i o d Y e a r M o n t h  
     o r d e r   b y   [ Y e a r M o n t h ]   d e s c  
  
  
     a l t e r   t a b l e   [ c u b e ] . [ D _ P e r i o d Y e a r M o n t h ]   a d d   Y e a r Q u a r t e r S o r t   i n t   n u l l ;  
     a l t e r   t a b l e   [ c u b e ] . [ D _ P e r i o d Y e a r M o n t h ]   a d d   [ Y e a r ]   i n t   n u l l ;  
     a l t e r   t a b l e   [ c u b e ] . [ D _ P e r i o d Y e a r M o n t h ]   a d d   Y e a r S o r t   i n t   n u l l ;  
  
     s e l e c t   *    
     i n t o   [ c u b e ] . [ D _ P e r i o d Y e a r M o n t h 1 ]  
     f r o m   [ c u b e ] . [ D _ P e r i o d Y e a r M o n t h ]  
     - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
     t r u n c a t e   t a b l e   [ c u b e ] . [ D _ P e r i o d Y e a r M o n t h ]  
     s e l e c t   *   f r o m    
     - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
     s e l e c t   *   f r o m   [ s t u b ] . [ S t u b A m o u n t b y M o n t h Y e a r ] ;  
     s e l e c t   t o p   1 0   *   f r o m   [ s t u b ] . [ R a w I n p u t I n v o i c e D e t a i l ] ;  
     - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
     s e l e c t   c o u n t ( d i s t i n c t   [ C o n t r a c t I D ] )   f r o m   [ c u b e ] . [ F _ P r o d u c t R e v e n u e N A V ] ;  
         s e l e c t   c o u n t ( d i s t i n c t   [ C o n t r a c t I D ] )   f r o m   [ c u b e ] . [ F _ P r o d u c t R e v e n u e E N T ] ;  
  
 s e l e c t   c o u n t ( * )   f r o m   [ r e v e n u e ] . [ S k u B r i d g e ] - - 6 1 0 , 4 9 0  
 s e l e c t   c o u n t ( * )   f r o m   [ r e v e n u e ] . [ S k u ] - - - 1 3 7 , 2 3 7  
 s e l e c t   c o u n t ( * )   f r o m   [ r e v e n u e ] . [ S k u P r i c e ] - - - 1 4 , 8 8 2  
  
  
  
 s e l e c t    
 d i s t i n c t   C o n t r a c t I D    
 I N T O   d i f f . C o n t r a c t s  
 f r o m   [ c u b e ] . [ F _ P r o d u c t R e v e n u e E N T ]   w h e r e   C o n t r a c t I D   n o t   i n   (  
 s e l e c t   d i s t i n c t   C o n t r a c t I D   f r o m   [ c u b e ] . [ F _ P r o d u c t R e v e n u e N A V ]  
 ) ;  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 s e l e c t   S P . P r o c e s s i n g T i e r f l g , [ C h a r g e Y e a r ] , [ C h a r g e M o n t h ] ,  
 s u m ( [ G r o s s M o n t h l y P r i c e ] ) - s u m ( [ S a l e s T a x A m o u n t ] ) - s u m ( [ D i s c o u n t A m o u n t ] )   a s   T o t a l  
 f r o m   [ c u b e ] . [ F _ P r o d u c t R e v e n u e E N T ]   P R   J O I N   [ d i f f ] . [ C o n t r a c t s ]   C   o n   P R . C o n t r a c t I D = C . C o n t r a c t I D   J O I N  
 [ r e v e n u e ] . [ S k u P r i c e ]   S P   O N   P R . S K U I D = S P . S K U I D    
 g r o u p   b y   [ C h a r g e Y e a r ] , [ C h a r g e M o n t h ] , S P . P r o c e s s i n g T i e r f l g  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - select * from [stub].[RawInputInvoiceDetail]

select
ContractID,
COUNT(Distinct BillingStartDate) as CNT
INTO stub.ContractsMoreThanOneBillStartDate
from [stub].[RawInputInvoiceDetail]
Group by ContractID
Having COUNT(Distinct BillingStartDate)>1
---------------------------------------------
---------------------------------------------


alter table [stub].[ContractsOnlyOneBillStartDate] drop column CNT

alter table [stub].[ContractsOnlyOneBillStartDate] add BillingStartDate date null;
alter table [stub].[ContractsOnlyOneBillStartDate] add BillingMonth INT null;
alter table [stub].[ContractsOnlyOneBillStartDate] add BillingYear INT null;
alter table [stub].[ContractsOnlyOneBillStartDate] add InvoiceID INT null;
alter table [stub].[ContractsOnlyOneBillStartDate] add InvoiceDetailID INT null;

----------------------------------------------------------[stub].[ContractsOnlyOneBillStartDate]------------------


select 
InvoiceDetailID,
InvoiceID,
ContractID,
MONTH(BillingStartDate) MTH,
YEAR(BillingStartDate) YR,
MIN(BillingStartDate) Min_Date,
SUM(StubAmount) as StubAmount
INTO stub.FlagOnlyOneBillStartDate
from [stub].[RawInputInvoiceDetail] where ContractID IN (select ContractID 
from [stub].[ContractsOnlyOneBillStartDate])
GROUP BY 
InvoiceDetailID,
InvoiceID,
ContractID,
MONTH(BillingStartDate),
YEAR(BillingStartDate)


alter table [stub].[RawInputInvoiceDetail] add StartType char(1) null;

select count(*) from [stub].[RawInputInvoiceDetail]

update R
set R.[StartType]='O'
from [stub].[RawInputInvoiceDetail] R where ContractID IN  (select ContractID from [stub].[ContractsOnlyOneBillStartDate])
----
update R
set R.[StartType]='M'
from [stub].[RawInputInvoiceDetail] R where ContractID IN  (select ContractID from [stub].[ContractsMoreThanOneBillStartDate])

select * 
INTO [stub].[RawInputInvoiceDetail1]
from [stub].[RawInputInvoiceDetail]


update R
SET R.StubAmount=NULL
from [stub].[RawInputInvoiceDetail] R where R.StartType='O'

----------------------------

update R
SET R.StubAmount=F.StubAmount
FROM [stub].[RawInputInvoiceDetail] R JOIN stub.FlagOnlyOneBillStartDate F ON
R.InvoiceDetailID=F.InvoiceDetailID and R.InvoiceID=F.InvoiceID and R.ContractID=F.ContractID

select * from [stub].[StubAmountbyMonthYear]
order by StubAmount ASC


select E.ChargeMonth, E.ChargeYear, Sum(R.StubAmount) as StubAmount
from [cube].[F_ProductRevenueENT] E JOIN [stub].[RawInputInvoiceDetail] R ON E.InvoiceDetailID=R.InvoiceDetailID
group by E.ChargeMonth, E.ChargeYear








select Distinct 
--[InvoiceDetailID] ,
--[InvoiceID] ,
ContractID, [BillingStartDate] from [stub].[RawInputInvoiceDetail]
where ContractID IN (select ContractID from [stub].[ContractsMoreThanOneBillStartDate])
ORDER BY ContractID

select count(*) from [cube].[F_ProductRevenueENT] where StubAmount is null;
--1,696,431
select BillingStartDate  from [cube].[F_ProductRevenueENT] 
--where StubAmount is null;
--2,373,126


select TransactionID from [cube].[F_ProductRevenueENT]
where TransactionID is not null;

select * from [cube].[F_ProductRevenueENT]

alter table [cube].[F_ProductRevenueENT] drop column PreviousBalance;
alter table [cube].[F_ProductRevenueENT] drop column InvoiceText;

update R
set R.StubAmount=0.00
from [cube].[F_ProductRevenueENT] R where R.StubAmount IS NULL;  


select * from [stub].[RawInputInvoiceDetail] where InvoiceDetailID=38319931select LineItemID from [cube].[F_ProductRevenueNAV] where [StubAmount] is not null;

select count(*) from [cube].[F_ProductRevenueNAV]; 


SELECT 
ContractID as ContractID, 
LineItemID as LineItemID, 
BillingStartDate as BillingStartDate,
YEAR(BillingStartDate) as BillingYear,
MONTH( BillingStartDate) as BillingMonth
/*
DATEDIFF(day,BillingStartDate,
CAST(
CAST(YEAR(BillingStartDate) as char(4))+'/'+CAST(MONTH(BillingStartDate)+1 as char(2))+'/'+'01' 
AS DATE)
) as NumOfDaysTillInvStartMonth
*/
into stub.RawInput
FROM [DCSQLPRD104].Enterprise.dbo.LineItem  
where BillingStartDate 
BETWEEN '2016-07-01 00:00:00.000' and '2017-06-30 00:00:00.000'
AND ISDATE(BillingStartDate)=1
------------------------------------------------------------------

select top 10 BillingStartDate,

CAST(
CAST(YEAR(BillingStartDate) as char(4))+'/'+CAST(MONTH(BillingStartDate)+1 as char(2))+'/'+'01' 
AS DATE)

--+'/'+ CAST(MONTH(BillingStartDate)) as char(2)) +'/01'
 as BillingEndDate
 from [DCSQLPRD104].Enterprise.dbo.LineItem  
where BillingStartDate is not null;



select distinct ContractID from [stub].[RawInput]


select * from [stub].[RawInput]

Alter Table [stub].[RawInput] add NumOfDaysTillInvStartMonth INT NULL;

Alter Table [stub].[RawInput] add DollarValuePerDay Money NULL;

Alter Table
------------------------------
------------------------------
SELECT 
ContractID as ContractID, 
LineItemID as LineItemID, 
BillingStartDate as BillingStartDate,
--DATEDIFF(day,BillingStartDate,
CAST(
CAST(YEAR(BillingStartDate) as char(4))+'/'+CAST(MONTH(BillingStartDate)+1 as char(2))+'/'+'01' 
AS DATE)
--) 
as NumOfDaysTillInvStartMonth
FROM stub.RawInput 
where MONTH(BillingStartDate)+1<>13

alter table [stub].[RawInput] alter column [NumOfDaysTillInvStartMonth] date null;

alter table  [stub].[RawInput] add [BillingEndDate] date null;


update R
SET R.[BillingEndDate]= CAST(
CAST(YEAR(BillingStartDate) as char(4))+'/'+CAST(MONTH(BillingStartDate)+1 as char(2))+'/'+'01' 
AS DATE)
FROM [stub].[RawInput] R
where MONTH(R.BillingStartDate)+1<>13
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

update R 
SET R.NumOfDaysTillInvStartMonth=DATEDIFF(day,R.BillingStartDate,R.BillingEndDate)-1
from stub.RawInput R
where MONTH(R.BillingStartDate)+1<>13
---------------------------------------------------------------------------------------
select * from [stub].[RawInput]
--------------
update R 
SET R.NumOfDaysTillInvStartMonth=NULL
from stub.RawInput R
where MONTH(R.BillingStartDate)+1<>13
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
update R
SET R.[BillingEndDate]= CAST(
CAST(YEAR(BillingStartDate)+1 as char(4))+'/'+'01'+'/'+'01' 
AS DATE)
FROM [stub].[RawInput] R
where MONTH(R.BillingStartDate)=12
------------------
------------------
update R 
SET R.NumOfDaysTillInvStartMonth=DATEDIFF(day,R.BillingStartDate,R.BillingEndDate)-1
from stub.RawInput R
where MONTH(R.BillingStartDate)=12
----------------------------
select * from stub.RawInput
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
---------------------------- Do the same thing but with Invoice Detail --------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

SELECT 
[InvoiceDetailID] as InvoiceDetailID,
[InvoiceID] as InvoiceID,
ContractID as ContractID, 
LineItemID as LineItemID, 
BillingStartDate as BillingStartDate,
[GrossMonthlyPrice],
[DiscountAmount],
[SalesTaxAmount]
INTO [stub].[RawInputInvoiceDetail]
FROM [DCSQLPRD104].Enterprise.dbo.InvoiceDetail
where BillingStartDate 
BETWEEN '2016-07-01 00:00:00.000' and '2017-06-30 00:00:00.000'
and [InvoiceDetailID] IN (SELECT [InvoiceDetailID] from [cube].[F_ProductRevenueENT])


select count(*) from  [stub].[RawInputInvoiceDetail]

alter table [stub].[RawInputInvoiceDetail] add BillingEndDate date null;
alter table [stub].[RawInputInvoiceDetail] add NumOfDaysTillInvStartMonth int null;
alter table [stub].[RawInputInvoiceDetail] add DiscountedMonthlyPrice money null;
----------------------------------------------------------------------
update R
SET R.[BillingEndDate]= CAST(
CAST(YEAR(BillingStartDate) as char(4))+'/'+CAST(MONTH(BillingStartDate)+1 as char(2))+'/'+'01' 
AS DATE)
FROM [stub].[RawInputInvoiceDetail] R
where MONTH(R.BillingStartDate)+1<>13
----------------------------------------------------------------------
update R
SET R.[BillingEndDate]= CAST(
CAST(YEAR(BillingStartDate)+1 as char(4))+'/'+'01'+'/'+'01' 
AS DATE)
FROM [stub].[RawInputInvoiceDetail] R
where MONTH(R.BillingStartDate)=12
------------------------------------------------------------------

update R 
SET R.NumOfDaysTillInvStartMonth=DATEDIFF(day,R.BillingStartDate,R.BillingEndDate)-1
from [stub].[RawInputInvoiceDetail] R

---------------------------------------
update R 
SET R.[DiscountedMonthlyPrice]=([GrossMonthlyPrice]-[SalesTaxAmount]-[DiscountAmount])
from [stub].[RawInputInvoiceDetail] R
--------------------------------------------
update R 
SET R.[DiscountedMonthlyPrice]=([GrossMonthlyPrice]-[SalesTaxAmount]-[DiscountAmount])
from [stub].[RawInputInvoiceDetail] R
--------------------------------------------
alter table [stub].[RawInputInvoiceDetail] add StubAmount money null;
---------------------------------------------
update R 
SET R.[StubAmount]=([DiscountedMonthlyPrice]/30)*[NumOfDaysTillInvStartMonth]
from [stub].[RawInputInvoiceDetail] R
---------------------------------------------
---------------------------------------------
select sum([StubAmount]) from [stub].[RawInputInvoiceDetail]
--104,517,036.13
select * from [stub].[RawInputInvoiceDetail]

alter table [cube].[F_ProductRevenueENT]  add StubAmount money null;


update E
SET E.StubAmount=R.StubAmount
from 
[cube].[F_ProductRevenueENT] E  JOIN [stub].[RawInputInvoiceDetail] R
ON E.InvoiceDetailID=R.InvoiceDetailID and E.InvoiceID=R.InvoiceID and E.LineItemID=R.LineItemID


alter table [stub].[RawInputLineItem]  add StubAmount money null;
alter table [stub].[RawInputLineItem]  add DiscountedMonthlyPrice money null;

update R 
SET R.[StubAmount]=([DiscountedMonthlyPrice]/30)*[NumOfDaysTillInvStartMonth]
from [stub].[RawInputLineItem] R

update R
SET R.[DiscountedMonthlyPrice]=E.[CurrentMonthlyPrice]-[SalesTaxAmount]-[DiscountedMonthlyPrice]
from [stub].[RawInputLineItem] R JOIN [DCSQLPRD104].Enterprise.dbo.LineItem E
ON R.ContractID=E.Contractid and R.LineItemID=E.LineItemID and R.BillingStartDate=E.BillingStartDate
------------------------------------------------------------------------

update R 
SET R.[StubAmount]=([DiscountedMonthlyPrice]/30)*[NumOfDaysTillInvStartMonth]
from [stub].[RawInputLineItem] R
----------------------------------------------------------------------------
----------------------------------------------------------------------------
select sum([StubAmount]) from [stub].[RawInputLineItem]
--25,730,073.71
----------------------------------------------------------------------------
UPDATE R 
SET R.[StubAmount]=NULL,
    R.DiscountedMonthlyPrice=NULL
from [stub].[RawInputLineItem] R
---------------------------------------------------------------------------
select top 100 * from [DCSQLPRD104].Enterprise.dbo.LineItem;
---------------------------------------------------------------------------




------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
select count(distinct SKUID) from [cube].[F_ProductRevenueENT];---
select count(distinct SKUID) from [cube].[F_ProductRevenueNAV];---
select count(distinct SKUID) from [cube].[F_ProductRevenueENTX];--
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
/* Objective - Build Power BI front 
   applications to the Revenue 
   backend that you have 
   ----------------------------
   Create Another Visalization;
   ----------------------------
*/-----------------------------------------------------------------
-------------------------------------------------------------------

alter table [cube].[F_ProductRevenueENT] add BillingStartDate date null;

update E
SET E.BillingStartDate=I.BillingStartDate
from [cube].[F_ProductRevenueENT] E JOIN [DCSQLPRD104].Enterprise.dbo.InvoiceDetail I
on E.InvoiceID=I.InvoiceID and E.InvoiceDetailID=I.InvoiceDetailID and E.LineItemID=I.LineItemID
---------

select ContractID, Min([BillingStartDate]) As FirstDate
INTO ##ContStart
from [cube].[F_ProductRevenueENT]
group by ContractID

select * from ##ContStart

alter table ##ContStart add FirstInvDate date null;

update CS
SET CS.FirstInvDate=DATEADD(DAY,30,CS.FirstDate)
from ##ContStart CS
---------------------

SELECT * FROM ##ContStart

UPDATE E
SET E.[StubAmount]=0.00
FROM [cube].[F_ProductRevenueENT] E EXCEPT SELECT 


SELECT [InvoiceDetailID],[InvoiceID],[LineItemID],E.[ContractID],[StubAmount]
into ##StubAmounts
FROM [cube].[F_ProductRevenueENT] E join ##ContStart S on E.ContractID=S.ContractID AND 
E.InvoiceMonth=Month(S.FirstInvDate) and InvoiceYear=Year(S.FirstInvDate)

select sum(StubAmount) from ##StubAmounts
--19,720,400.0731

update E
set E.StubAmount=0.00
from [cube].[F_ProductRevenueENT] E

update E
set E.StubAmount=SA.StubAmount
from [cube].[F_ProductRevenueENT] E JOIN ##StubAmounts SA ON E.InvoiceID=SA.InvoiceID and
E.InvoiceDetailID=SA.InvoiceDetailID and E.ContractID=SA.ContractID and E.LineItemID=SA.LineItemID

select sum(StubAmount) from [cube].[F_ProductRevenueENT]

---$19,720,400.0731






-------------------------------------------------------------------------------------
SELECT ID.InvoiceDetailID,ID.InvoiceID, ID.ChargeYear, ID.ChargeMonth, ID.LineItemID
FROM WorkingData..MissingSKU_LineItemID MLI
	JOIN InvoiceDetail ID
		ON MLI.LineItemID = ID.LineItemID
		AND MONTH(MAX_CurrentTermStartDate) = ID.ChargeMonth
		AND YEAR(MAX_CurrentTermStartDate) = ID.ChargeYear 
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
------------------------------------------------------------------------------
select distinct  GLAccount from [cube].[F_PO] where GLAccount not in (select 
GLAccount from [cube].[D_GLAccount]);
---------------------------------------

select distinct [PostingYearMonth]  from [cube].[F_PO] where [PostingYearMonth] not in (select 
[YearMonthName] from [cube].[D_PeriodYearMonth]);
--2016-Sep
----------------------------------------

select distinct [VendorNumber]  from [cube].[F_PO] where [VendorNumber] not in (select 
[VendorNumber] from [cube].[D_Vendor]);
--2016-Sep

select * from [cube].[D_PeriodYearMonth]


update PO
set PO.[PostingYearMonth]='2016-Sept' from [cube].[F_PO] PO where [PostingYearMonth]='2016-Sep'


alter table [cube].[F_PO] alter column [PostingYearMonth] varchar(9) 
-----------------------------------------------

 update E
  set E.[PostingYearMonth]=
     CAST([PostingYear] as char(4))+
CASE CAST([PostingMonth] as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
				   WHEN '3' THEN '03'
				   WHEN '4' THEN '04'
				   WHEN '5' THEN '05'
				   WHEN '6' THEN '06'
				   WHEN '7' THEN '07'
				   WHEN '8' THEN '08'
				   WHEN '9' THEN '09'
ELSE CAST([PostingMonth] as char(2)) END
FROM [cube].[F_PO] E
-----------------------------------------

alter table [cube].[F_PO] alter column PostingYearMonth varchar(10) null;



select [VendorNumber], count(*) cnt
from [cube].[D_Vendor]
group by [VendorNumber]
having count(*)>1

with dups as (
select [VendorNumber], ROW_NUMBER() OVER (Partition by [VendorNumber] ORDER BY [VendorNumber]) rn
from [cube].[D_Vendor]
)
delete from dups where rn>1
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
USE [RevPro]
GO

/****** Object:  Table [dbo].[C]    Script Date: 8/8/2017 4:25:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NewApts](
	[SKUID] [int] NULL,
	OldSkuName Varchar(50) null,
	NewSkuName Varchar(50) null
) ON [PRIMARY]

GO

delete from dbo.NewApts where SKUID in (
30046,
30047,
30105
);


update SP
SET SP.SkuName=CAST(SP.SKUID as varchar(20))+'-'+NA.NewSkuName
from [dbo].[SkuPrice] SP JOIN [dbo].[NewApts] NA ON SP.SKUID=NA.SKUID
----------------

update S
SET S.SkuName=SP.SkuName
from [dbo].[SkuPrice] SP JOIN dbo.Sku S ON SP.SKUID=S.SKUID 
where S.SKUID IN (select distinct SKUID from [dbo].[NewApts])
-------------

select * from dbo.SkuPrice where SkuName like '%Apt%'
UNION
select * from dbo.SkuPrice where SkuName like '%Find%'
----------------------------------------------------------

select * from dbo.Sku where SkuName like '%Apt%'
UNION
select * from dbo.Sku where SkuName like '%Find%'





select top 100 [InvoiceNumber] from [cube].[XD_InvoiceNumber] where InvoiceNumber like '%-%'


drop table dbo.InvoiceBridge 

select distinct CAST(LEFT(InvoiceNumber,CHARINDEX('-',InvoiceNumber)-1) AS INT) as FixedInvoice, InvoiceNumber
INTO dbo.InvoiceBridge 
 from [cube].[XD_InvoiceNumber] where InvoiceNumber like '%-%'
 UNION
select distinct CAST(LEFT(InvoiceNumber,6) as INT)  as FixedInvoice, InvoiceNumber from [cube].[XD_InvoiceNumber] where ISNUMERIC(InvoiceNumber)=0
AND InvoiceNumber not like '%-%'
UNION
select distinct CAST(InvoiceNumber as INT)  as FixedInvoice, InvoiceNumber from [cube].[XD_InvoiceNumber] WHERE ISNUMERIC(InvoiceNumber)=1




select InvoiceNumber as FixedInvoice, InvoiceNumber
into dbo.InvoiceBridge1
from 
[cube].[XD_InvoiceNumber] EXCEPT SELECT FixedInvoice, InvoiceNumber from dbo.InvoiceBridge

--where InvoiceNumber like '%-%'

update N
set N.[ChargeYearMonth]=NULL from [cube].[F_ProductRevenueNAV] N
where N.ChargeYearMonth IS NOT NULL

alter table [cube].[F_ProductRevenueNAV] add InvoiceID int null;

update N
set N.[InvoiceID]=B.FixedInvoice
from  [cube].[F_ProductRevenueNAV] N JOIN dbo.InvoiceBridge B ON N.InvoiceNumber=B.InvoiceNumber
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

update N
set N.[ChargeYearMonth]=E.[ChargeYearMonth]
FROM [cube].[F_ProductRevenueNAV] N JOIN [cube].[F_ProductRevenueENT] E
ON N.ContractID=E.ContractID AND
   N.InvoiceID=E.InvoiceID AND
   N.LineItemID=E.LineItemID 
   ------------------------------------------------------------------

   select E.InvoiceID,E.InvoiceYearMonth ,E.[ChargeYearMonth], E.LineItemID, N.PostingYearMonth,N.ChargeYearMonth,N.InvoiceID
   from [cube].[F_ProductRevenueENT] E JOIN [cube].[F_ProductRevenueNAV] N ON 
   E.ContractID=N.ContractID AND
   E.LineItemID=N.LineItemID AND
   E.InvoiceID=N.InvoiceID AND
   N.PostingYearMonth=201703
   where E.[ChargeYearMonth]<>N.ChargeYearMonth

   --select distinct PostingYearMonth from cube.F_ProductRevenueNAV

   select
   [InvoiceNumber],[InvoiceID]
       from  [cube].[F_ProductRevenueNAV]



	 UPDATE N
	 SET N.ChargeYearMonth=E.ChargeYearMonth
	   --select E.InvoiceID,E.InvoiceYearMonth ,E.[ChargeYearMonth], E.LineItemID, N.PostingYearMonth,N.ChargeYearMonth,N.InvoiceID
   from [cube].[F_ProductRevenueENT] E JOIN [cube].[F_ProductRevenueNAV] N ON 
   E.ContractID=N.ContractID AND
   E.LineItemID=N.LineItemID AND
   E.InvoiceID=N.InvoiceID AND
   --N.PostingYearMonth=201703
   E.[ChargeYearMonth]<>N.ChargeYearMonth



alter table  [cube].[XD_InvoiceNumber] add InvoiceID int null;
  ------------------------------------------------------------------------
  update I
  set I.[InvoiceID]=B.FixedInvoice
  from [cube].[XD_InvoiceNumber] I JOIN [dbo].[InvoiceBridge] B ON 
  I.InvoiceNumber=B.InvoiceNumber
  ------------------------------------------------------------------------
--------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30018,30040); 
update SB SET SB.SKUID=30018 FROM dbo.SkuBridge SB WHERE SB.SKUID=30040 ;
delete from dbo.SkuPrice where SKUID=30040; 
delete from dbo.Sku where SKUID=30040;
-------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30019,30041)
update SB SET SB.SKUID=30019 FROM dbo.SkuBridge SB WHERE SB.SKUID=30041 ;
delete from dbo.SkuPrice where SKUID=30041; 
delete from dbo.Sku where SKUID=30041;
----------------------------------------------------------------------;
select * from dbo.SkuPrice where SKUID in (30020,30042)
update SB SET SB.SKUID=30020 FROM dbo.SkuBridge SB WHERE SB.SKUID=30042 ;
delete from dbo.SkuPrice where SKUID=30042; 
delete from dbo.Sku where SKUID=30042;
----------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30021,30043)
update SB SET SB.SKUID=30021 FROM dbo.SkuBridge SB WHERE SB.SKUID=30043;
delete from dbo.SkuPrice where SKUID=30043; 
delete from dbo.Sku where SKUID=30043;
------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30022,30044)
update SB SET SB.SKUID=30022 FROM dbo.SkuBridge SB WHERE SB.SKUID=30044;
delete from dbo.SkuPrice where SKUID=30044; 
delete from dbo.Sku where SKUID=30044;
----------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30023,30045)
update SB SET SB.SKUID=30023 FROM dbo.SkuBridge SB WHERE SB.SKUID=30045;
delete from dbo.SkuPrice where SKUID=30045; 
delete from dbo.Sku where SKUID=30045;
-----------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30074,30099)
update SB SET SB.SKUID=30074 FROM dbo.SkuBridge SB WHERE SB.SKUID=30099;
delete from dbo.SkuPrice where SKUID=30099; 
delete from dbo.Sku where SKUID=30099;
------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30075,30100)
update SB SET SB.SKUID=30075 FROM dbo.SkuBridge SB WHERE SB.SKUID=30100;
delete from dbo.SkuPrice where SKUID=30100; 
delete from dbo.Sku where SKUID=30100;
--------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30076,30101)
update SB SET SB.SKUID=30076 FROM dbo.SkuBridge SB WHERE SB.SKUID=30101;
delete from dbo.SkuPrice where SKUID=30101; 
delete from dbo.Sku where SKUID=30101;
---------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30077,30102)
update SB SET SB.SKUID=30077 FROM dbo.SkuBridge SB WHERE SB.SKUID=30102;
delete from dbo.SkuPrice where SKUID=30102; 
delete from dbo.Sku where SKUID=30102;
------------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30078,30103)
update SB SET SB.SKUID=30078 FROM dbo.SkuBridge SB WHERE SB.SKUID=30103;
delete from dbo.SkuPrice where SKUID=30103; 
delete from dbo.Sku where SKUID=30103;
-----------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30079,30104)
update SB SET SB.SKUID=30079 FROM dbo.SkuBridge SB WHERE SB.SKUID=30104;
delete from dbo.SkuPrice where SKUID=30104; 
delete from dbo.Sku where SKUID=30104;
------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30003,30030)
update SB SET SB.SKUID=30003 FROM dbo.SkuBridge SB WHERE SB.SKUID=30030;
delete from dbo.SkuPrice where SKUID=30030; 
delete from dbo.Sku where SKUID=30030;
--------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30004,30031)
update SB SET SB.SKUID=30004 FROM dbo.SkuBridge SB WHERE SB.SKUID=30031;
delete from dbo.SkuPrice where SKUID=30031; 
delete from dbo.Sku where SKUID=30031;
--------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30005,30032)
update SB SET SB.SKUID=30005 FROM dbo.SkuBridge SB WHERE SB.SKUID=30032;
delete from dbo.SkuPrice where SKUID=30032; 
delete from dbo.Sku where SKUID=30032;
---------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30006,30024,30033)
update SB SET SB.SKUID=30006 FROM dbo.SkuBridge SB WHERE SB.SKUID IN (30024,30033);
delete from dbo.SkuPrice where SKUID IN (30024,30033); 
delete from dbo.Sku where SKUID IN (30024,30033);
---------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30007,30034)
update SB SET SB.SKUID=30007 FROM dbo.SkuBridge SB WHERE SB.SKUID=30034;
delete from dbo.SkuPrice where SKUID=30034; 
delete from dbo.Sku where SKUID=30034;
---------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30057,30087)
update SB SET SB.SKUID=30057 FROM dbo.SkuBridge SB WHERE SB.SKUID=30087;
delete from dbo.SkuPrice where SKUID=30087; 
delete from dbo.Sku where SKUID=30087;
--------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30058,30088)
update SB SET SB.SKUID=30058 FROM dbo.SkuBridge SB WHERE SB.SKUID=30088;
delete from dbo.SkuPrice where SKUID=30088; 
delete from dbo.Sku where SKUID=30088;
-------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30059,30089)
update SB SET SB.SKUID=30059 FROM dbo.SkuBridge SB WHERE SB.SKUID=30089;
delete from dbo.SkuPrice where SKUID=30089; 
delete from dbo.Sku where SKUID=30089;
------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30059,30089)
update SB SET SB.SKUID=30059 FROM dbo.SkuBridge SB WHERE SB.SKUID=30089;
delete from dbo.SkuPrice where SKUID=30089; 
delete from dbo.Sku where SKUID=30089;
-----------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30060,30080,30090)
update SB SET SB.SKUID=30060 FROM dbo.SkuBridge SB WHERE SB.SKUID IN (30080,30090);
delete from dbo.SkuPrice where SKUID IN (30080,30090); 
delete from dbo.Sku where SKUID IN (30080,30090);
-------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30061,30091)
update SB SET SB.SKUID=30061 FROM dbo.SkuBridge SB WHERE SB.SKUID=30091;
delete from dbo.SkuPrice where SKUID=30091; 
delete from dbo.Sku where SKUID=30091;
-----------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30062,30081,30092)
update SB SET SB.SKUID=30062 FROM dbo.SkuBridge SB WHERE SB.SKUID IN (30081,30092);
delete from dbo.SkuPrice where SKUID IN (30081,30092); 
delete from dbo.Sku where SKUID IN (30081,30092);
-----------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30013,30035)
update SB SET SB.SKUID=30013 FROM dbo.SkuBridge SB WHERE SB.SKUID=30035;
delete from dbo.SkuPrice where SKUID=30035; 
delete from dbo.Sku where SKUID=30035;
------------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30014,30036)
update SB SET SB.SKUID=30014 FROM dbo.SkuBridge SB WHERE SB.SKUID=30036;
delete from dbo.SkuPrice where SKUID=30036; 
delete from dbo.Sku where SKUID=30036;
---------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30015,30037)
update SB SET SB.SKUID=30015 FROM dbo.SkuBridge SB WHERE SB.SKUID=30037;
delete from dbo.SkuPrice where SKUID=30037; 
delete from dbo.Sku where SKUID=30037;
--------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30016,30038)
update SB SET SB.SKUID=30016 FROM dbo.SkuBridge SB WHERE SB.SKUID=30038;
delete from dbo.SkuPrice where SKUID=30038; 
delete from dbo.Sku where SKUID=30038;
------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30017,30039)
update SB SET SB.SKUID=30017 FROM dbo.SkuBridge SB WHERE SB.SKUID=30039;
delete from dbo.SkuPrice where SKUID=30039; 
delete from dbo.Sku where SKUID=30039;
---------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30068,30093)
update SB SET SB.SKUID=30068 FROM dbo.SkuBridge SB WHERE SB.SKUID=30093;
delete from dbo.SkuPrice where SKUID=30093; 
delete from dbo.Sku where SKUID=30093;
---------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30069,30094)
update SB SET SB.SKUID=30069 FROM dbo.SkuBridge SB WHERE SB.SKUID=30094;
delete from dbo.SkuPrice where SKUID=30094; 
delete from dbo.Sku where SKUID=30094;
------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30070,30095)
update SB SET SB.SKUID=30070 FROM dbo.SkuBridge SB WHERE SB.SKUID=30095;
delete from dbo.SkuPrice where SKUID=30095; 
delete from dbo.Sku where SKUID=30095;
------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30071,30096)
update SB SET SB.SKUID=30071 FROM dbo.SkuBridge SB WHERE SB.SKUID=30096;
delete from dbo.SkuPrice where SKUID=30096; 
delete from dbo.Sku where SKUID=30096;
--------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30072,30097)
update SB SET SB.SKUID=30072 FROM dbo.SkuBridge SB WHERE SB.SKUID=30097;
delete from dbo.SkuPrice where SKUID=30097; 
delete from dbo.Sku where SKUID=30097;
---------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30073,30098)
update SB SET SB.SKUID=30073 FROM dbo.SkuBridge SB WHERE SB.SKUID=30098;
delete from dbo.SkuPrice where SKUID=30098; 
delete from dbo.Sku where SKUID=30098;
----------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30008,30025,30050)
update SB SET SB.SKUID=30008 FROM dbo.SkuBridge SB WHERE SB.SKUID IN (30025,30050);
delete from dbo.SkuPrice where SKUID IN (30025,30050); 
delete from dbo.Sku where SKUID IN (30025,30050);
----------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30009,30026,30051)
update SB SET SB.SKUID=30009 FROM dbo.SkuBridge SB WHERE SB.SKUID IN (30026,30051);
delete from dbo.SkuPrice where SKUID IN (30026,30051); 
delete from dbo.Sku where SKUID IN (30026,30051);
---------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30010,30027)
update SB SET SB.SKUID=30010 FROM dbo.SkuBridge SB WHERE SB.SKUID=30027;
delete from dbo.SkuPrice where SKUID=30027; 
delete from dbo.Sku where SKUID=30027;
---------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30011,30028,30048,30052)
update SB SET SB.SKUID=30011 FROM dbo.SkuBridge SB WHERE SB.SKUID IN (30028,30048,30052);
delete from dbo.SkuPrice where SKUID IN (30028,30048,30052); 
delete from dbo.Sku where SKUID IN (30028,30048,30052);
--------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30012,30029,30049,30053)
update SB SET SB.SKUID=30012 FROM dbo.SkuBridge SB WHERE SB.SKUID IN (30029,30049,30053);
delete from dbo.SkuPrice where SKUID IN (30029,30049,30053); 
delete from dbo.Sku where SKUID IN (30029,30049,30053);
----------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30114,30115)
update SB SET SB.SKUID=30114 FROM dbo.SkuBridge SB WHERE SB.SKUID=30115;
delete from dbo.SkuPrice where SKUID=30115; 
delete from dbo.Sku where SKUID=30115;
------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30063,30082,30107,30110)
update SB SET SB.SKUID=30063 FROM dbo.SkuBridge SB WHERE SB.SKUID IN (30082,30107,30110);
delete from dbo.SkuPrice where SKUID IN (30082,30107,30110); 
delete from dbo.Sku where SKUID IN (30082,30107,30110);
----------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30064,30083,30111)
update SB SET SB.SKUID=30064 FROM dbo.SkuBridge SB WHERE SB.SKUID IN (30083,30111);
delete from dbo.SkuPrice where SKUID IN (30083,30111); 
delete from dbo.Sku where SKUID IN (30083,30111);
----------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30065,30084)
update SB SET SB.SKUID=30065 FROM dbo.SkuBridge SB WHERE SB.SKUID=30084;
delete from dbo.SkuPrice where SKUID=30084; 
delete from dbo.Sku where SKUID=30084;
-----------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30066,30085,30108,30112)
update SB SET SB.SKUID=30066 FROM dbo.SkuBridge SB WHERE SB.SKUID IN (30085,30108,30112);
delete from dbo.SkuPrice where SKUID IN (30085,30108,30112); 
delete from dbo.Sku where SKUID IN (30085,30108,30112);
---------------------------------------------------------------------
select * from dbo.SkuPrice where SKUID in (30067,30086,30109,30113)
update SB SET SB.SKUID=30067 FROM dbo.SkuBridge SB WHERE SB.SKUID IN (30086,30109,30113);
delete from dbo.SkuPrice where SKUID IN (30086,30109,30113); 
delete from dbo.Sku where SKUID IN (30086,30109,30113);
--------------------------------------------------------------------

select * from dbo.SkuPrice where SKUID in (30054,30106)
update SB SET SB.SKUID=30054 FROM dbo.SkuBridge SB WHERE SB.SKUID=30106;
delete from dbo.SkuPrice where SKUID=30106; 
delete from dbo.Sku where SKUID=30106;
---------------------------------------------------------------------




select * from dbo.SkuPrice where SKUID=30011
select * from [dbo].[NewApts]select count(*) from [dbo].[Invoice_Feed]
select count(*) from [dbo].[Invoice_Feed1]

select count(*) from [dbo].[Sales_Order_Feed] 
select count(*) from [dbo].[Sales_Order_Feed1]

select count(*) from [dbo].[Credit_Memo_Feed]
select count(*) from [dbo].[Credit_Memo_Feed1]
-----------
select SALES_ORDER_LINE_ID from [dbo].[Invoice_Feed] where SALES_ORDER_LINE_ID not in 
(select distinct SALES_ORDER_LINE_ID from [dbo].[Sales_Order_Feed]);
--------------
select SALES_ORDER_LINE_ID from [dbo].[Invoice_Feed] where SALES_ORDER_LINE_ID not in 
(select distinct SALES_ORDER_LINE_ID from RevPro..[Invoice_Raw]);

select distinct SALES_ORDER_LINE_ID from [dbo].[Invoice_Feed] 


 
 select [document No_] as InvoiceNumber,
 [Bill-to Customer No_] as ParentHQID,
 [Shortcut Dimension 1 Code] as Market, 
  DVM.[Name] as MarketName, 
  [Shortcut Dimension 2 Code] as Department,
    DVD.[Name]  as DepartmentName
  --INTO cube.D_MarketLookup
 from 
 [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] SIL LEFT JOIN
  [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Dimension Value] DVM ON 
  SIL.[Shortcut Dimension 1 Code] = DVM.Code LEFT JOIN 
  [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Dimension Value] DVD ON 
   SIL.[Shortcut Dimension 2 Code] = DVD.[Code]

 where YEAR([Posting Date])=2017 AND MONTH([Posting Date])=8

 select top 100 * from  
 [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] 

 select top 100 * from 
  [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Dimension Value]SELECT 			
              -- IL.CustomerAccountName AS [CUSTOMER ACCOUNT NAME],
              -- IL.CustomerAccountCode AS [CUSTOMER ACCOUNT ID],   
              -- IH.[Customer Posting Group] AS [CUSTOMER POSTING GROUP],
              IH.[Bill-to Name] AS [Parent Company Name],     
               --IL.[Bill-to Customer No_] AS [Parent Company LOC ID],
              -- IL.[Description] As [Product Name],
              -- IL.[Business Unit Code] as [Product Code],
              -- IL.[Contract ID] as [Contract ID],
             ----  IL.[Site ID] as [Site Location ID],
             --  IL.[Site Name] as [Site Name],
			  -- IL.[Line Item ID] As [Linte Item ID],
              -- IL.[Description 3] as [Billing Period],
              -- IL.[Document No_] as [Invoice No],
			 -- CAST(CONVERT(VARCHAR(10),IL.[Posting Date],101)AS NVARCHAR(10)) as [Posting Date],                          
              SUM(convert(money,IL.[Amount])) as [Amount]                     
             --  IL.[Gen_ Prod_ Posting Group] as [Product Posting Group] 
                                  		
  FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] IL
  INNER JOIN [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Header] IH ON IL.[Document No_] = IH.No_
  WHERE [Business Unit Code] IN
  ('AFPAK','AFPLUS','AFPRO','AFPROODD','APN','APT','APT001','APT002','APT003', 
'APT004','APT005','APTSDIAMDA','APTSDIAMON','APTSGOLD','APTSGOLDA','APTSMYMEA','APTSMYMED',
'APTSPHTRTK','APTSPLATIN','APTSPLATNA','APTSSILVER','APTSSILVRA','APTSVDRSHT')
  --AND IL.[Posting Date]  BETWEEN @Fdaymonth AND @Ldaymonth  
    AND IL.[Posting Date]  BETWEEN '08/01/2017' AND '08/31/2017' 
GROUP BY   IH.[Bill-to Name] 


  --AND IL.[Document No_] = '103285286-1'
  order by IH.[Bill-to Name] 
  ----------------------------------------------------------------------------------

  --select 
  
  Update C
  SET C.ParentCustomerName =LEFT(CustomerName, CHARINDEX('-',CustomerName)-1) 
  from [cube].[D_Customer] C where CustomerName like '%-%'
  ------------
   Update C
  SET C.ParentCustomerName = C.CustomerName
  from [cube].[D_Customer] C where C.ParentCustomerName IS NULL;
  ---------------------------------------------------------------------
  ---------------------------------------------------------------------
  ALTER TABLE [cube].[D_Customer] ADD ParentCustomerName varchar(150) null;
  --------------------------------------------------------------------------
  SELECT CustomerName, LEFT(CustomerName, CHARINDEX('-',CustomerName)-1) FROM [cube].[D_Customer]
  WHERE CustomerName like '%-%'
  ��U S E   [ S t a g i n g ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p _ C r e a t e R e p o r t F o r L e g a l _ S I L ]         S c r i p t   D a t e :   8 / 2 3 / 2 0 1 7   3 : 3 7 : 4 4   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 / *  
  
 E X E C   [ d b o ] . [ u s p _ C r e a t e R e p o r t F o r L e g a l _ S I L ]  
 s e l e c t   *   f r o m   d b o . R e v e n u R p t L e g a l  
  
 * /  
  
 A L T E R   p r o c   [ d b o ] . [ u s p _ C r e a t e R e p o r t F o r L e g a l _ S I L ]  
 A S  
  
 I F   O B J E C T _ I D ( ' t e m p d b . . T e m p A p t s 1 ' ,   ' U ' )   I S   N O T   N U L L   D R O P   T A B L E   t e m p d b . . T e m p A p t s 1 ;  
 I F   O B J E C T _ I D ( ' t e m p d b . . T e m p A p t s 2 ' ,   ' U ' )   I S   N O T   N U L L   D R O P   T A B L E   t e m p d b . . T e m p A p t s 2 ;  
 I F   O B J E C T _ I D ( ' d b o . R e v e n u R p t L e g a l ' ,   ' U ' )   I S   N O T   N U L L   D R O P   T A B L E   d b o . R e v e n u R p t L e g a l ;  
  
 S E L E C T    
 C u s t o m e r N a m e   a s   C u s t o m e r H Q   ,      
 C u s t o m e r I D   a s   C u s t o m e r N u m b e r ,  
 P a r e n t C o m p a n y L o c I D   a s   C u s t o m e r P a r e n t I D ,  
 P a r e n t C o m p a n y N a m e   a s   C u s t o m e r P a r e n t N a m e ,  
 P r o d u c t   a s   P r o d u c t ,  
 [ 2 0 1 6 0 1 ]   a s   ' 2 0 1 6 - J A N ' ,    
 [ 2 0 1 6 0 2 ]   a s   ' 2 0 1 6 - F E B ' ,    
 [ 2 0 1 6 0 3 ]   a s   ' 2 0 1 6 - M A R ' ,  
 [ 2 0 1 6 0 4 ]   a s   ' 2 0 1 6 - A P R ' ,  
 [ 2 0 1 6 0 5 ]   A S   ' 2 0 1 6 - M A Y ' ,  
 [ 2 0 1 6 0 6 ]   a s   ' 2 0 1 6 - J U N ' ,    
 [ 2 0 1 6 0 7 ]   a s   ' 2 0 1 6 - J U L ' ,    
 [ 2 0 1 6 0 8 ]   a s   ' 2 0 1 6 - A U G ' ,  
 [ 2 0 1 6 0 9 ]   a s   ' 2 0 1 6 - S E P T ' ,  
 [ 2 0 1 6 1 0 ]   A S   ' 2 0 1 6 - O C T ' ,    
 [ 2 0 1 6 1 1 ]   a s   ' 2 0 1 6 - N O V ' ,  
 [ 2 0 1 6 1 2 ]   A S   ' 2 0 1 6 - D E C '    
 I N T O   # T e m p A p t s 1  
 F R O M        
 ( S E L E C T  
 c o n v e r t ( m o n e y , I L . [ A m o u n t ] )   a s   I n v o i c e d A m o u n t ,  
 C A S T ( Y E A R ( I L . [ P o s t i n g   D a t e ] )   a s   c h a r ( 4 ) ) +  
 C A S E   C A S T ( M O N T H ( I L . [ P o s t i n g   D a t e ] )   a s   c h a r ( 2 ) )     W H E N   ' 1 '   T H E N   ' 0 1 '  
                                       W H E N   ' 2 '   T H E N   ' 0 2 '  
                                                                 W H E N   ' 3 '   T H E N   ' 0 3 '  
                                                                 W H E N   ' 4 '   T H E N   ' 0 4 '  
                                                                 W H E N   ' 5 '   T H E N   ' 0 5 '  
                                                                 W H E N   ' 6 '   T H E N   ' 0 6 '  
                                                                 W H E N   ' 7 '   T H E N   ' 0 7 '  
                                                                 W H E N   ' 8 '   T H E N   ' 0 8 '  
                                                                 W H E N   ' 9 '   T H E N   ' 0 9 '  
 E L S E   C A S T ( M O N T H ( I L . [ P o s t i n g   D a t e ] )   a s   c h a r ( 2 ) )   E N D   A S   Y e a r M o n t h   ,    
 I L . C u s t o m e r A c c o u n t N a m e   a s   C u s t o m e r N a m e ,  
 I L . C u s t o m e r A c c o u n t C o d e   a s   C u s t o m e r I D ,  
 I L . [ B i l l - t o   C u s t o m e r   N o _ ]   a s   [ P a r e n t C o m p a n y L o c I D ] ,  
 I H . [ B i l l - t o   N a m e ]   a s   [ P a r e n t C o m p a n y N a m e ] ,  
 [ B u s i n e s s   U n i t   C o d e ]   a s   P r o d u c t  
 F R O M   [ D C S Q L D E V 1 3 5 \ A C C T ] . [ N A V I S I O N D B 2 6 0 _ P R D ] . [ d b o ] . [ R I G $ S a l e s   I n v o i c e   L i n e ]   I L   I N N E R   J O I N    
 [ D C S Q L D E V 1 3 5 \ A C C T ] . [ N A V I S I O N D B 2 6 0 _ P R D ] . [ d b o ] . [ R I G $ S a l e s   I n v o i c e   H e a d e r ]   I H   O N    
 I L . [ D o c u m e n t   N o _ ]   =   I H . N o _   L E F T   J O I N  
  
  
     W H E R E   [ B u s i n e s s   U n i t   C o d e ]   I N  
  
 (  
 ' A F P L U S ' ,  
 ' A P T S D I A M O N ' ,  
 ' A P T S G O L D A ' ,  
 ' A F P R O ' ,  
 ' A P T S D I A M D A ' ,  
 ' A P T S M Y M E D ' ,  
 ' A P T S P L A T I N ' ,  
 ' A P T S P L A T N A ' ,  
 ' A F P A K ' ,  
 ' A P T S G O L D ' ,  
 ' A P T S S I L V E R ' ,  
 ' A P T S S I L V R A ' ,  
 ' A F P R O O D D ' ,  
 ' A P T S P H T R T K '  
 )  
  
 - -     ( ' A F P A K ' , ' A F P L U S ' , ' A F P R O ' , ' A F P R O O D D ' , ' A P N ' , ' A P T ' , ' A P T 0 0 1 ' , ' A P T 0 0 2 ' , ' A P T 0 0 3 ' ,    
 - - ' A P T 0 0 4 ' , ' A P T 0 0 5 ' , ' A P T S D I A M D A ' , ' A P T S D I A M O N ' , ' A P T S G O L D ' , ' A P T S G O L D A ' , ' A P T S M Y M E A ' , ' A P T S M Y M E D ' ,  
 - - ' A P T S P H T R T K ' , ' A P T S P L A T I N ' , ' A P T S P L A T N A ' , ' A P T S S I L V E R ' , ' A P T S S I L V R A ' , ' A P T S V D R S H T ' )  
  
 )   p      
 P I V O T      
 (      
 S U M ( I n v o i c e d A m o u n t )      
 F O R   Y e a r M o n t h   I N    
 (    
     [ 2 0 1 6 0 1 ] , [ 2 0 1 6 0 2 ] , [ 2 0 1 6 0 3 ] ,  
     [ 2 0 1 6 0 4 ] , [ 2 0 1 6 0 5 ] , [ 2 0 1 6 0 6 ] ,  
     [ 2 0 1 6 0 7 ] , [ 2 0 1 6 0 8 ] , [ 2 0 1 6 0 9 ] ,  
     [ 2 0 1 6 1 0 ] , [ 2 0 1 6 1 1 ] ,   [ 2 0 1 6 1 2 ]    
    
     )      
 )   A S   p v t      
 O R D E R   B Y   p v t . C u s t o m e r N a m e ;      
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S E L E C T    
 C u s t o m e r H Q ,  
 P r o d u c t ,  
 S U M ( [ 2 0 1 6 - J A N ] )   A S   J A N _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - F E B ] )   A S   F E B _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - M A R ] )   A S   M A R _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - A P R ] )   A S   A P R _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - M A Y ] )   A S   M A Y _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - J U N ] )   A S   J U N _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - J U L ] )   A S   J U L _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - A U G ] )   A S   A U G _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - S E P T ] )   A S   S E P T _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - O C T ] )   A S   O C T _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - N O V ] )   A S   N O V _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - D E C ] )   A S   D E C _ 2 0 1 6 ,  
 I S N U L L ( S U M ( [ 2 0 1 6 - J A N ] ) , 0 ) +   I S N U L L ( S U M ( [ 2 0 1 6 - F E B ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - M A R ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - A P R ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - M A Y ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - J U N ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - J U L ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - A U G ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - S E P T ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - O C T ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - N O V ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - D E C ] ) , 0 )   A S   T O T A L  
 I N T O   # T e m p A p t s 2  
 F R O M   # T e m p A p t s 1    
 G R O U P   b y   C u s t o m e r H Q , P r o d u c t ;  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S E L E C T    
 C u s t o m e r H Q ,  
 [ J A N _ 2 0 1 6 ] ,  
 [ F E B _ 2 0 1 6 ] ,  
 [ M A R _ 2 0 1 6 ] ,  
 [ A P R _ 2 0 1 6 ] ,  
 [ M A Y _ 2 0 1 6 ] ,  
 [ J U N _ 2 0 1 6 ] ,  
 [ J U L _ 2 0 1 6 ] ,  
 [ A U G _ 2 0 1 6 ] ,  
 [ S E P T _ 2 0 1 6 ] ,  
 [ O C T _ 2 0 1 6 ] ,  
 [ N O V _ 2 0 1 6 ] ,  
 [ D E C _ 2 0 1 6 ] ,  
 T O T A L  
 I N T O   R e v e n u R p t L e g a l  
 F R O M   # T e m p A p t s 2    
 W H E R E   T O T A L > 0  
 O R D E R   B Y   T O T A L ;  
  
 s e l e c t   *   f r o m   R e v e n u R p t L e g a l  
  
 s e l e c t   *   f r o m   # T e m p A p t s 1   w h e r e   C u s t o m e r H Q = ' '  
  
 s e l e c t   t o p   1 0 0   d e s c r i p t i o n   f r o m   [ D C S Q L D E V 1 3 5 \ A C C T ] . [ N A V I S I O N D B 2 6 0 _ P R D ] . [ d b o ] . [ R I G $ S a l e s   I n v o i c e   L i n e ] ;  
 s e l e c t   t o p   1 0 0   *   f r o m       [ D C S Q L D E V 1 3 5 \ A C C T ] . [ N A V I S I O N D B 2 6 0 _ P R D ] . [ d b o ] . [ R I G $ S a l e s   I n v o i c e   H e a d e r ] ;  
  
  
  
  
  
 --------------------------------------------------------------------------
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


��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p _ C r e a t e R e p o r t F o r L e g a l _ b y H Q ]         S c r i p t   D a t e :   9 / 6 / 2 0 1 7   2 : 4 1 : 5 2   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 - - E X E C   [ d b o ] . [ u s p _ C r e a t e R e p o r t F o r L e g a l _ b y H Q ]  
  
  
 A L T E R   p r o c   [ d b o ] . [ u s p _ C r e a t e R e p o r t F o r L e g a l _ b y H Q ]  
 A S  
  
 I F   O B J E C T _ I D ( ' t e m p d b . . T e m p A p t s 1 ' ,   ' U ' )   I S   N O T   N U L L   D R O P   T A B L E   t e m p d b . . T e m p A p t s 1 ;  
 I F   O B J E C T _ I D ( ' t e m p d b . . T e m p A p t s 2 ' ,   ' U ' )   I S   N O T   N U L L   D R O P   T A B L E   t e m p d b . . T e m p A p t s 2 ;  
 I F   O B J E C T _ I D ( ' d b o . R e v e n u R p t L e g a l 2 ' ,   ' U ' )   I S   N O T   N U L L   D R O P   T A B L E   d b o . R e v e n u R p t L e g a l 2 ;  
  
 S E L E C T    
 C u s t o m e r N a m e   a s   C u s t o m e r H Q   ,      
 C u s t o m e r I D   a s   C u s t o m e r N u m b e r ,  
 P a r e n t C o m p a n y L o c I D   a s   C u s t o m e r P a r e n t I D ,  
 P a r e n t C o m p a n y N a m e   a s   C u s t o m e r P a r e n t N a m e ,  
 [ 2 0 1 6 0 1 ]   a s   ' 2 0 1 6 - J A N ' ,    
 [ 2 0 1 6 0 2 ]   a s   ' 2 0 1 6 - F E B ' ,    
 [ 2 0 1 6 0 3 ]   a s   ' 2 0 1 6 - M A R ' ,  
 [ 2 0 1 6 0 4 ]   a s   ' 2 0 1 6 - A P R ' ,  
 [ 2 0 1 6 0 5 ]   A S   ' 2 0 1 6 - M A Y ' ,  
 [ 2 0 1 6 0 6 ]   a s   ' 2 0 1 6 - J U N ' ,    
 [ 2 0 1 6 0 7 ]   a s   ' 2 0 1 6 - J U L ' ,    
 [ 2 0 1 6 0 8 ]   a s   ' 2 0 1 6 - A U G ' ,  
 [ 2 0 1 6 0 9 ]   a s   ' 2 0 1 6 - S E P T ' ,  
 [ 2 0 1 6 1 0 ]   A S   ' 2 0 1 6 - O C T ' ,    
 [ 2 0 1 6 1 1 ]   a s   ' 2 0 1 6 - N O V ' ,  
 [ 2 0 1 6 1 2 ]   A S   ' 2 0 1 6 - D E C '    
 I N T O   # T e m p A p t s 1  
 F R O M        
 ( S E L E C T  
 C O N V E R T ( m o n e y , I L . [ A m o u n t ] )   a s   I n v o i c e d A m o u n t ,  
 C A S T ( Y E A R ( I L . [ P o s t i n g   D a t e ] )   a s   c h a r ( 4 ) ) +  
 C A S E   C A S T ( M O N T H ( I L . [ P o s t i n g   D a t e ] )   a s   c h a r ( 2 ) )     W H E N   ' 1 '   T H E N   ' 0 1 '  
                                       W H E N   ' 2 '   T H E N   ' 0 2 '  
                                                                 W H E N   ' 3 '   T H E N   ' 0 3 '  
                                                                 W H E N   ' 4 '   T H E N   ' 0 4 '  
                                                                 W H E N   ' 5 '   T H E N   ' 0 5 '  
                                                                 W H E N   ' 6 '   T H E N   ' 0 6 '  
                                                                 W H E N   ' 7 '   T H E N   ' 0 7 '  
                                                                 W H E N   ' 8 '   T H E N   ' 0 8 '  
                                                                 W H E N   ' 9 '   T H E N   ' 0 9 '  
 E L S E   C A S T ( M O N T H ( I L . [ P o s t i n g   D a t e ] )   a s   c h a r ( 2 ) )   E N D   A S   Y e a r M o n t h   ,    
 C A S E   W H E N   ( I L . C u s t o m e r A c c o u n t N a m e = ' ' )   T H E N   ( I H . [ B i l l - t o   N a m e ] )   E L S E   ( I L . C u s t o m e r A c c o u n t N a m e )   E N D   A S   C u s t o m e r N a m e ,  
 C A S E   W H E N   ( I L . C u s t o m e r A c c o u n t C o d e = ' ' )   T H E N   ( I L . [ B i l l - t o   C u s t o m e r   N o _ ] )   E L S E   ( I L . C u s t o m e r A c c o u n t C o d e )   E N D   A S   C u s t o m e r I D ,  
 - - C O A L E S C E ( I L . C u s t o m e r A c c o u n t N a m e , I H . [ B i l l - t o   N a m e ] )   a s   C u s t o m e r N a m e ,  
 - - C O A L E S C E ( I L . C u s t o m e r A c c o u n t C o d e , I L . [ B i l l - t o   C u s t o m e r   N o _ ] )   a s   C u s t o m e r I D ,  
 I L . [ B i l l - t o   C u s t o m e r   N o _ ]   a s   [ P a r e n t C o m p a n y L o c I D ] ,  
 I H . [ B i l l - t o   N a m e ]   a s   [ P a r e n t C o m p a n y N a m e ]  
 F R O M   [ D C S Q L D E V 1 3 5 \ A C C T ] . [ N A V I S I O N D B 2 6 0 _ P R D ] . [ d b o ] . [ R I G $ S a l e s   I n v o i c e   L i n e ]   I L   I N N E R   J O I N    
 [ D C S Q L D E V 1 3 5 \ A C C T ] . [ N A V I S I O N D B 2 6 0 _ P R D ] . [ d b o ] . [ R I G $ S a l e s   I n v o i c e   H e a d e r ]   I H   O N    
 I L . [ D o c u m e n t   N o _ ]   =   I H . N o _  
     W H E R E   [ B u s i n e s s   U n i t   C o d e ]   I N  
  
 (  
 ' A F P L U S ' ,  
 ' A P T S D I A M O N ' ,  
 ' A P T S G O L D A ' ,  
 ' A F P R O ' ,  
 ' A P T S D I A M D A ' ,  
 ' A P T S M Y M E D ' ,  
 ' A P T S P L A T I N ' ,  
 ' A P T S P L A T N A ' ,  
 ' A F P A K ' ,  
 ' A P T S G O L D ' ,  
 ' A P T S S I L V E R ' ,  
 ' A P T S S I L V R A ' ,  
 ' A F P R O O D D ' ,  
 ' A P T S P H T R T K '  
 )  
  
 - -     ( ' A F P A K ' , ' A F P L U S ' , ' A F P R O ' , ' A F P R O O D D ' , ' A P N ' , ' A P T ' , ' A P T 0 0 1 ' , ' A P T 0 0 2 ' , ' A P T 0 0 3 ' ,    
 - - ' A P T 0 0 4 ' , ' A P T 0 0 5 ' , ' A P T S D I A M D A ' , ' A P T S D I A M O N ' , ' A P T S G O L D ' , ' A P T S G O L D A ' , ' A P T S M Y M E A ' , ' A P T S M Y M E D ' ,  
 - - ' A P T S P H T R T K ' , ' A P T S P L A T I N ' , ' A P T S P L A T N A ' , ' A P T S S I L V E R ' , ' A P T S S I L V R A ' , ' A P T S V D R S H T ' )  
  
 )   p      
 P I V O T      
 (      
 S U M ( I n v o i c e d A m o u n t )      
 F O R   Y e a r M o n t h   I N    
 (    
     [ 2 0 1 6 0 1 ] , [ 2 0 1 6 0 2 ] , [ 2 0 1 6 0 3 ] ,  
     [ 2 0 1 6 0 4 ] , [ 2 0 1 6 0 5 ] , [ 2 0 1 6 0 6 ] ,  
     [ 2 0 1 6 0 7 ] , [ 2 0 1 6 0 8 ] , [ 2 0 1 6 0 9 ] ,  
     [ 2 0 1 6 1 0 ] , [ 2 0 1 6 1 1 ] ,   [ 2 0 1 6 1 2 ]    
    
     )      
 )   A S   p v t      
 O R D E R   B Y   p v t . C u s t o m e r N a m e ;      
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 u p d a t e   T    
 S E T   T . C u s t o m e r H Q = N . H Q N a m e  
 - - ,    
 - - T . C u s t o m e r N u m b e r = N . N e w H Q I D  
 f r o m   # T e m p A p t s 1   T   J O I N   [ d b o ] . [ N e w H Q M a t c h N a m e ]   N    
 O N   C A S T ( T . C u s t o m e r P a r e n t I D   A S   V A R C H A R ( 2 5 ) ) = C A S T ( N . B i l l i n g L o c I D   A S   V A R C H A R ( 2 5 ) )  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S E L E C T    
 C u s t o m e r H Q ,  
 S U M ( [ 2 0 1 6 - J A N ] )   A S   J A N _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - F E B ] )   A S   F E B _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - M A R ] )   A S   M A R _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - A P R ] )   A S   A P R _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - M A Y ] )   A S   M A Y _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - J U N ] )   A S   J U N _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - J U L ] )   A S   J U L _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - A U G ] )   A S   A U G _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - S E P T ] )   A S   S E P T _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - O C T ] )   A S   O C T _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - N O V ] )   A S   N O V _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - D E C ] )   A S   D E C _ 2 0 1 6 ,  
 I S N U L L ( S U M ( [ 2 0 1 6 - J A N ] ) , 0 ) +   I S N U L L ( S U M ( [ 2 0 1 6 - F E B ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - M A R ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - A P R ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - M A Y ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - J U N ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - J U L ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - A U G ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - S E P T ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - O C T ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - N O V ] ) , 0 ) + I S N U L L ( S U M ( [ 2 0 1 6 - D E C ] ) , 0 )   A S   T O T A L  
 I N T O   # T e m p A p t s 2  
 F R O M   # T e m p A p t s 1    
 G R O U P   b y   C u s t o m e r H Q ;  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S E L E C T    
 C u s t o m e r H Q ,  
 [ J A N _ 2 0 1 6 ] ,  
 [ F E B _ 2 0 1 6 ] ,  
 [ M A R _ 2 0 1 6 ] ,  
 [ A P R _ 2 0 1 6 ] ,  
 [ M A Y _ 2 0 1 6 ] ,  
 [ J U N _ 2 0 1 6 ] ,  
 [ J U L _ 2 0 1 6 ] ,  
 [ A U G _ 2 0 1 6 ] ,  
 [ S E P T _ 2 0 1 6 ] ,  
 [ O C T _ 2 0 1 6 ] ,  
 [ N O V _ 2 0 1 6 ] ,  
 [ D E C _ 2 0 1 6 ] ,  
 T O T A L  
 I N T O   R e v e n u R p t L e g a l 6 6  
 F R O M   d b o . T e m p A p t s 6 6    
 W H E R E   T O T A L > 0  
 O R D E R   B Y   T O T A L   D E S C ;  
  
  
  
 select count(*) from cube.F_ProductRevenueNAV
--1,911,361
select count(distinct InvoiceNumber) from cube.F_ProductRevenueNAV
select count(distinct contractid) from cube.F_ProductRevenueNAV

-- 175582 

select * from [DCSQLPRD104].Enterprise.dbo.LineItem where 
lineitemid in (3005722,3005740)


ContractID=175582;
select * from [DCSQLPRD104].Enterprise.dbo.Contract where ContractID=175582;

select min([BillingStartDate]),max([BillingStartDate])  from [cube].[F_ProductRevenueENT]
--- max >> 2017-06-07
------------------------------------------------------------------------------------------
--3005722	9563
--3005740	9563

select * from 


select count(*) from dbo.SkuBridge

select * from dbo.SkuBridge where 
LineItemID IN (
3005744,
3005745,
3005718,
3005719,
3005720,
3005721,
3005722,
3005723,
3005724,
3005725,
3005726,
3005727,
3005728,
3005729,
3005730,
3005731,
3005732,
3005733,
3005736,
3005737,
3005738,
3005739,
3005740,
3005741,
3005742,
3005743,
3005746,
3005747,
3005748,
3005749,
3005750,
3005751,
3005752,
3005753,
3005754,
3005755,
3005756,
3005757,
3005758,
3005759,
3005760,
3005761,
3005762,
3005763,
3005764,
3005765
);
--------------------------------------------------------------------------
--Start the skuing logic for picking up the values of the system;---------
--this is what needs to be done in order to provide the best possible-----
--value for what you have;------------------------------------------------
--------------------------------------------------------------------------
/*
----------------------------------------------------------------------------------------
start at least the broad outlines of the incremental logic for you to incorporate
this will just be the case for each and every  value that is needed for what we have;
----------------------------------------------------------------------------------------
*/

select * from [cube].[D_Product] 



SELECT 
C.CustomerName,[ChargeYearMonth],P.ProductCategory,COUNT(*) AS CNT
FROM        [cube].[F_ProductRevenueNAV] N LEFT JOIN 
            [cube].[D_Product]  P ON N.SKUID=P.SKUID LEFT JOIN 
			[cube].[D_Customer] C ON N.LocationID=C.LocationID
WHERE P.ProductCategory IN ('Apartments','Suite')
GROUP BY C.CustomerName,[ChargeYearMonth],P.ProductCategory
ORDER BY COUNT(*) DESC, C.CustomerName
----------------------------------------------------
select L.LocationID,L.LocationPhone from 
[DCSQLPRD104].Enterprise.dbo.Location L where CAST(L.LocationID as varchar(50)) IN (
select  CAST(HQCustomerNumber as varchar(50)) from [dbo].[NewHQMatchName3])
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
select DISTINCT L.LocationID,NN.[HQCustomerNameLong] ,L.LocationPhone from 
[DCSQLPRD104].Enterprise.dbo.LocationProfile L LEFT JOIN [dbo].[NewHQMatchName3] NN ON 
CAST(L.LocationID as varchar(50))= CAST(NN.HQCustomerNumber as varchar(50))
------------------------------------------------------------------------------->>>
------------------------------------------------------------------------------->>>
------------------------------------------------------------------------------->>>
------------------------------------------------------------------------------->>>
where CAST(LocationID as varchar(50)) in (
select distinct CAST(HQCustomerNumber as varchar(50)) from [dbo].[NewHQMatchName3] NN)

select [HQCustomerNumber],[HQCustomerNameLong] from [dbo].[NewHQMatchName3]


select * from [dbo].[NewHQMatchName3]/* 
---------------------------------
----Objectives for the day:------
---------------------------------
---------------------------------
1. Assemble the list of Customers; (Done)

2. Map the reporting elements from; (Working)
   the requirements list to the columns;

3. Write SQL for the report;
 
--------------------------------
*/

select * from [dbo].[NewHQMatchName2] 
select * from [cube].[D_Customer] WHERE CustomerName IN (
'Strategic Diversified Real Estate Holdings',
'Flourish Living',
'Realty Center Management, Inc.',
'Black Oak Knoxville Partners',
'McKinley, Inc.',
'ParaWest Management',
'JJS Property Management',
'Village Green',
'Lighthouse Management Services, LLC',
'Milestone'
);

select * from [cube].[D_Customer] WHERE CustomerName LIKE '%Flourish Living%';
select * from [cube].[D_Customer] WHERE CustomerName LIKE '%Black Oak Knoxville Partners%';

/* 


/*
----------------- ORIGINAL LIST OF  LOCID's to be used for the POC for the Apartments Report --------------------
392250
748376
36109921
55652401
23736558
290881
413205
37323391
-------------------------------------------------------------------------------------------
*/


*/



/*

------------------------------------------ Company Names to be used for the report -------------
Strategic Diversified Real Estate Holdings
Realty Center Management, Inc.
McKinley, Inc.
ParaWest Management
JJS Property Management
--Village Green ( This is a PMC )
Lighthouse Management Services, LLC
Milestone


*/

SELECT * FROM [dbo].[NewHQMatchName2] WHERE BillingLocID
IN (
'392250',
'748376',
'36109921',
'55652401',
'23736558',
'290881',
'413205',
'37323391'
);
------------------------------------------------------------
SELECT * FROM [dbo].[NewHQMatchName2] WHERE NewHQID
IN (
--'392250',
'748376',
'36109921',
'55652401',
'23736558',
'290881',
'413205',
'37323391'
);
-------------------------------------------------------
SELECT * FROM [cube].[D_Customer] WHERE LocationID
IN (
'748376',
'36109921',
'55652401',
'23736558',
'290881',
'413205',
'37323391'
);
---------------------------------------------------------

--------------------------------------------------------- 
/*
---- Updated POC Customer ID listings -------------------

748376
36109921
55652401
23736558
290881
413205
37323391

---------------------------------------------------------
*/
SELECT 
C.NAME AS COLUMN_NAME,
T.NAME AS TABLE_NAME 
	FROM 
[DCSQLPRD104].EnterpriseSub.SYS.columns C JOIN 
[DCSQLPRD104].EnterpriseSub.SYS.TABLES T 
	ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN 
[DCSQLPRD104].EnterpriseSub.SYS.schemas S 
	ON T.[SCHEMA_ID]=S.[schema_id]
	WHERE
--C.NAME like '%Sales%'
T.NAME like 'SalesTerritory' 
--AND 
--	ORDER BY C.COLUMN_ID
	------------------------------------
------------------------------------------------------------
select * from [DCSQLPRD104].Enterprise.dbo.SalesFunnel
-------------------------------------------------------------
-------------------------------------------------------------
select * from [DCSQLPRD104].Enterprise.dbo.CostarDepartment;
select * from [DCSQLPRD104].Enterprise.dbo.Contact;
select * from [DCSQLPRD104].Enterprise.dbo.SalesTerritoryArea;
select * from [DCSQLPRD104].Enterprise.dbo.rptBookofBusinessBySalesAESnapShot
select top 10 * from [DCSQLPRD104].Enterprise.dbo.SalesUnit;
--------------------------------------------------------------------
--------------------------------------------------------------------
SELECT TOP 10 * ----------------------------------------------------
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Customer];---
---------------------------------------------------------------------
---------------------------------------------------------------------
--AEContactId
Create proc [dbo].[uspCREATE_Reps]
AS
select C.ContactID, ST.SalesTerritoryDesc, C.FirstName, C.LastName 
INTO cube.D_Reps
from [DCSQLPRD104].Enterprise.dbo.SalesTerritory ST LEFT JOIN
               [DCSQLPRD104].Enterprise.dbo.Contact C ON C.ContactID=ST.AEContactID
--------------------------------------------------------------------------------------------

delete from [cube].[D_Reps] where ContactID is null;

select * from 	[cube].[D_Reps]		
-------------------------------------------------------------------------------------------
alter table [cube].[F_ProductRevenueENT] add [DiscountAmountAdj] numeric(38,20) null;
alter table [cube].[F_ProductRevenueENT] add [GrossMonthlyPriceAdj] numeric(38,20) null;
alter table [cube].[F_ProductRevenueENT] add [MonthlyPriceAdj] numeric(38,20) null;
alter table [cube].[F_ProductRevenueENT] add [SalesTaxAmountAdj] numeric(38,20) null;
alter table [cube].[F_ProductRevenueENT] add [TotalMonthlyPriceAdj] numeric(38,20) null;
alter table [cube].[F_ProductRevenueENT] add [ListedAmountAdj] numeric(38,20) null;
------------------------------------------------------------------------------------------

drop table #TempStubs

select 
[InvoiceDetailID],
[LineItemID],
[ContractID],
[ChargeYearMonth], 
LEFT(ChargeYearMonth,4)+ CAST((CAST(RIGHT(ChargeYearMonth,2) AS INT)+1) as VARCHAR(2)) as NewChargeYearMonth,
[StubAmount]
from #TempStubs


Into #TempStubs
from [cube].[F_ProductRevenueENT]
where [StubAmount]>0
--2,373,126
--2,373,126
select count(*) from [cube].[F_ProductRevenueENT]

select * from #TempStubs
create proc [dbo].[uspCREATE_StubAmountAdj]
AS
update E
SET E.[MonthlyPriceAdj]=E.[MonthlyPrice]-T.[StubAmount]
FROM [cube].[F_ProductRevenueENT] E JOIN #TempStubs T
ON 
E.InvoiceDetailID=T.InvoiceDetailID AND
E.LineItemID=T.LineItemID AND
E.ContractID=T.ContractID AND
E.ChargeYearMonth=T.ChargeYearMonth
-------------------------------------------
GO

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
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




----------------------------------------------------------
SELECT TOP 10 * FROM LINEITEM-----------------------------
SELECT * FROM [dbo].[MajorMarket]-------------------------
SELECT COUNT(*) FROM [dbo].[Location]--23,620,205---------
----------------------------------------------------------
----------------------------------------------------------
SELECT 
--C.NAME AS COLUMN_NAME,
T.NAME AS TABLE_NAME 
FROM SYS.columns C JOIN SYS.TABLES T 
ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN SYS.schemas S 
ON T.[SCHEMA_ID]=S.[schema_id]
WHERE
C.NAME='BUNDLEID'
--T.NAME='LOCATION' AND 
ORDER BY C.COLUMN_ID
-------------------------------------------------------------
---------------- NEWER VERSION WITH TYPES BELOW -------------
---------------------------------------------------------------
SELECT 
C.NAME AS COLUMN_NAME,
ST.name AS COLUMN_TYPE, 
T.NAME AS TABLE_NAME
FROM SYS.columns C JOIN SYS.TABLES T 
ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN SYS.schemas S 
ON T.[SCHEMA_ID]=S.[schema_id] JOIN  SYS.TYPES ST ON
C.system_type_id=ST.system_type_id
WHERE
ST.name='numeric'
--(C.NAME LIKE '%total area%') OR (C.NAME LIKE '%sq foot%') OR (C.NAME LIKE '%square%')
--T.NAME='LOCATION' AND 
ORDER BY C.Name

--------------------------------------------------------------
SELECT TOP 10 * FROM SYS.TABLES 
SELECT TOP 10 * FROM SYS.COLUMNS
SELECT TOP 10 * FROM SYS.SCHEMAS
SELECT TOP 10 * FROM REGION;
---------------------------------------------------------------
SELECT TOP 10 * FROM [dbo].[MajorMarket]
SELECT TOP 10 * FROM [dbo].[Metro]
SELECT TOP 10 * FROM [dbo].[Property]
SELECT TOP 10 * FROM [dbo].[PropertyUpdateEvent]
----------------------------------------------------------------

SELECT TOP 10 * FROM [dbo].[Region]


SELECT DISTINCT PRODUCTID FROM LINEITEM WHERE PRODUCTID NOT IN (
SELECT PRODUCTID FROM BundleTypeProduct)
-----------------------------------------------------------------
SELECT DISTINCT PRODUCTID  FROM PRODUCT; 
SELECT TOP 10 * FROM LINEITEMAUDIT;
-------------------------------------

SELECT DISTINCT CoStarMarket FROM COSTARMARKET
SELECT * FROM COSTARMARKET
-------------------------------------------
-------------------------------------------
SELECT * FROM [dbo].[CostarDepartment]
SELECT * FROM [dbo].[CostarLocation]
-------------------------------------------

--- Objectives for Today:
--- Figure out the table design for the new SKU'ing mechanizm
--- three table design: --------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
-------------->>> SKUING ENGINE STRUCTURES: <<<----------------------------
--------------------------------------------------------------------
----------------- ADDITIONAL TABLES: -------------------------------
-------------------------------------------------------------------
--- SKU_MSTR_DTL
--- SKU_HIST_DTL 
--- SKU_LP
----------------->>> ADDITIONAL STORED PROCEDURES: <<<--------------------
--- uspSKU_MSTR
--- uspSKU_HIST
--- uspSKU_LP
------------------>>> ADDITIONAL COLUMNS IN EXISITING STRUCTURES: <<<------
-- COLUMN ADDITIONS:
-- IN TALBE LINEITEM COLUMN TO ADD: SKU
-- IN TABLE INVOICEDETAIL COLUMN TO ADD: SKU
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------SELECT BundleID, ContractID, Count(*) as cnt FROM [dbo].[LineItem]
group by BundleID, ContractID
order by BundleID

SELECT 
[ContractID],
[BundleID],
[ProductID],
[MarketID],
[UserCount],
[SKUID]
INTO [dbo].[LineItem1
FROM [dbo].[LineItem] where ContractID in (152472,144831,152562,83492)

select * from [dbo].[LineItem1]

/*
-- Contract_ID's to pick
--152472 ( 2 bundles - 3, 8 in each )
--144831 ( 1 bundle - 3 in it )
--152562 ( 2 bundles - 2 in each )
--83492  ( 1 bundles - 2 in it )



*/��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p L O A D _ L i n e I t e m ]         S c r i p t   D a t e :   3 / 2 7 / 2 0 1 7   2 : 3 8 : 1 1   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
  
  
 A L T E R   P R O C E D U R E   [ d b o ] . [ u s p L O A D _ L i n e I t e m ]  
 A S  
  
 T R U N C A T E   T A B L E   L i n e I t e m ;  
  
 I N S E R T   L i n e I t e m   (  
                         [ C o n t r a c t I D ]  
                       , [ B u n d l e I D ]  
                       , [ P r o d u c t I D ]  
                       , [ M a r k e t I D ]  
                       , [ U s e r C o u n t ]  
                       , [ C u s t o m e r T y p e ]  
                       , [ D a t e ]  
                       , [ S K U I D ]  
                       , [ A m o u n t ] )  
  
 S E L E C T    
 C o n t r a c t I D ,  
 B u n d l e I D ,  
 P r o d u c t I D ,  
 P r o d u c t M a r k e t   a s   M a r k e t I D ,  
 0   a s   U s e r C o u n t ,  
 0   a s   C u s t o m e r T y p e ,    
 B i l l i n g S t a r t D a t e   a s   [ D a t e ] ,    
 0   a s   S K U I D   ,  
 C A S T   ( O r i g i n a l M o n t h l y P r i c e   A S   d e c i m a l ( 1 0 , 2 ) )   a s   A m o u n t  
 F R O M   E n t e r p r i s e . d b o . L i n e I t e m   L I   J O I N  
 E n t e r p r i s e S u b . d b o . S a l e s U n i t P r o d u c t M a r k e t   S U P M   o n   L I . S a l e s U n i t I D = S U P M . S a l e s U n i t I D  
 W H E R E   Y E A R ( B i l l i n g S t a r t D a t e )   i n   ( 2 0 1 6 , 2 0 1 7 )   A N D   B U N D L E I D   I S   N O T   N U L L  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 ��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p L O A D _ L i n e I t e m ]         S c r i p t   D a t e :   3 / 2 7 / 2 0 1 7   2 : 5 9 : 0 5   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
  
  
 A L T E R   P R O C E D U R E   [ d b o ] . [ u s p L O A D _ L i n e I t e m ]  
 A S  
  
 T R U N C A T E   T A B L E   L i n e I t e m ;  
  
 I N S E R T   L i n e I t e m   (  
                         [ C o n t r a c t I D ]  
                       , [ B u n d l e I D ]  
                       , [ P r o d u c t I D ]  
                       , [ M a r k e t I D ]  
                       , [ U s e r C o u n t ]  
                       , [ C u s t o m e r T y p e ]  
                       , [ D a t e ]  
                       , [ S K U I D ]  
                       , [ A m o u n t ] )  
  
 S E L E C T    
 C o n t r a c t I D ,  
 B u n d l e I D ,  
 P r o d u c t I D ,  
 P r o d u c t M a r k e t   a s   M a r k e t I D ,  
 N u m b e r O f U s e r s   a s   U s e r C o u n t ,  
 0   a s   C u s t o m e r T y p e ,    
 B i l l i n g S t a r t D a t e   a s   [ D a t e ] ,    
 0   a s   S K U I D   ,  
 C A S T   ( O r i g i n a l M o n t h l y P r i c e   A S   d e c i m a l ( 1 0 , 2 ) )   a s   A m o u n t  
 F R O M   E n t e r p r i s e . d b o . L i n e I t e m   L I   J O I N  
 E n t e r p r i s e S u b . d b o . S a l e s U n i t P r o d u c t M a r k e t   S U P M   o n   L I . S a l e s U n i t I D = S U P M . S a l e s U n i t I D  
 W H E R E   Y E A R ( B i l l i n g S t a r t D a t e )   i n   ( 2 0 1 6 , 2 0 1 7 )   A N D   B U N D L E I D   I S   N O T   N U L L  
 U N I O N  
 S E L E C T    
 C o n t r a c t I D ,  
 B u n d l e I D ,  
 P r o d u c t I D ,  
 P r o d u c t M a r k e t   a s   M a r k e t I D ,  
 N u m b e r O f U s e r s   a s   U s e r C o u n t ,  
 0   a s   C u s t o m e r T y p e ,    
 B i l l i n g S t a r t D a t e   a s   [ D a t e ] ,    
 0   a s   S K U I D   ,  
 C A S T   ( O r i g i n a l M o n t h l y P r i c e   A S   d e c i m a l ( 1 0 , 2 ) )   a s   A m o u n t  
 F R O M   E n t e r p r i s e . d b o . L i n e I t e m   L I   J O I N  
 E n t e r p r i s e S u b . d b o . S a l e s U n i t P r o d u c t M a r k e t   S U P M   o n   L I . S a l e s U n i t I D = S U P M . S a l e s U n i t I D  
 W H E R E   Y E A R ( B i l l i n g S t a r t D a t e )   i n   ( 2 0 1 6 , 2 0 1 7 )   A N D   B U N D L E I D   I S   N U L L  
  
  
 SELECT * FROM LineItem

SELECT * FROM SKU

SELECT DISTINCT BUNDLEID FROM LineItem

SELECT      [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount]
INTO [dbo].LineItem_Exception
FROM [dbo].[LineItem]
WHERE SKUID=-1

SELECT COUNT(*) FROM LineItem WHERE SKUID='-1'
SELECT COUNT(*) FROM LineItem

SELECT * FROM [dbo].[LineItem_Exception]


SELECT * FROM [dbo].[SkuPrice]

SELECT * 
INTO
#LI1
FROM [dbo].[LineItem_Exception] 
WHERE Amount<>0
ORDER BY ContractID, BundleID, ProductID

SELECT * FROM LINEITEM_EXCEPTION WHERE Amount=0

SELECT * 
INTO LineItemx
FROM #LI1 ORDER BY ContractID, BundleID, ProductID

SELECT * FROM LineItemx

SELECT * FROM LineItem WHERE SKUID IN (
0,
8,
16,
24,
34,
43
)
AND AMOUNT<>0
ORDER BY CONTRACTID, BUNDLEID, PRODUCTID

SELECT * FROM SkuPrice WHERE SKUID IN (
0,
8,
16,
24,
34,
43
)
ORDER BY SKUID

SELECT SKUID, COUNT(*) AS CNT, SUM(AMOUNT) AS TOTAL
FROM LineItem
GROUP BY SKUID

SELECT * FROM SkuPrice


SELECT * FROM [dbo].[SkuPrice]


SELECT SKUID, date, 
SUM(Amount) as Amt 
INTO #skulist 
FROM LineItem WHERE skuid<>-1 
GROUP BY SKUID, date 
HAVING SKUID>1

SELECT SKUID,DATE , AMT
FROM #skulist
WHERE Amt<>0
ORDER BY SKUID,DATE DESC , AMT
select 
[InvoiceYear],
sum([TotalMonthlyPrice]) as TotalMonthlyPrice,
sum([SalesTaxAmount]) as SalesTaxAmount,
sum([DiscountAmount]) as DiscountAmount
from [dbo].[InvoiceDetail]
group by [InvoiceYear]
order by  [InvoiceYear]

--$36,262,642.34675000000000000000
--$268,127,822.17020900000000000000
--$5,522,737.44787700000000000000
--$24,329,307.46238683787227264458


--226,324,233.8

select count(*) from [dbo].[InvoiceDetail]
where [InvoiceYear]=2017

--------------------------

select count(*) from [dbo].[InvoiceDetail]
where [InvoiceYear]=2017
------------------

SELECT 
      
        SUM([Amount])
      , SUM([Amount Including VAT])
      
  FROM [NavisionDB260].[dbo].[RIG$Sales Invoice Line]

  WHERE year([Posting Date])=2017 
  -----------------------------------

  SELECT 
      
       count(*)
      
  FROM [NavisionDB260].[dbo].[RIG$Sales Invoice Line]

  WHERE year([Posting Date])=2017 
  --------------------------------------



SELECT 
DISTINCT SKUID
 FROM LineItem
WHERE YEAR([Date])=2017
AND Amount >10

DROP TABLE #TEMPSKU

SELECT TOP 2500  SKUID 
INTO #TEMPSKU
FROM SKU WHERE SKUID IN (
SELECT 
DISTINCT SKUID
 FROM LineItem
WHERE YEAR([Date])=2017
) ORDER BY SKUID


SELECT * 
INTO SKU1
FROM SKU WHERE SKUID IN (
SELECT DISTINCT SKUID FROM #TEMPSKU)
ORDER BY SKUID, ProductID, MarketID

select s.SKUID, count(*) cnt
from 
(
SELECT ContractID, BundleID, SKUID, Amount FROM LineItem where skuid  in
(SELECT DISTINCT SKUID FROM Sku) AND Amount>1) s
group by s.SKUID
order by count(*) DESC
-----------------------------------------------------------------
SELECT L.ContractID, L.BundleID, L.SKUID, L.AMOUNT
INTO #LEFT
 FROM
LineItem L where L.SKUID NOT IN (SELECT DISTINCT SKUID FROM [dbo].[Sku_500Most])
AND L.Amount>1

SELECT DISTINCT  SKUID 
INTO Sku_1500WORST
FROM #LEFT

select * from [dbo].[Sku_1500WORST]


select sum(amount) from #LEFT

select sum(amount) from [dbo].[Sku_500Most]


 SELECT SKUID FROM Sku_Most WHERE SKUID NOT IN (SELECT DISTINCT SKUID FROM Sku_Most1);
 SELECT SKUID FROM Sku_Most1 WHERE SKUID NOT IN (SELECT DISTINCT SKUID FROM Sku_Most);

 select sum(amount) from LineItem where SKUID in  ( select distinct SKUID from [dbo].[Sku_500Most]);
 select sum(amount) from LineItem where SKUID in  ( select distinct SKUID from [dbo].[Sku_1500WORST]);

 SELECT * FROM LineItem WHERE SKUID IN (SELECT DISTINCT SKUID FROM [dbo].[Sku_1500WORST])
 AND AMOUNT>1
 ORDER BY Amount DESC
 --------------------------------------------------------------------------------------------
 SELECT * FROM LineItem WHERE SKUID IN (SELECT DISTINCT SKUID FROM [Sku_500Most])
 AND AMOUNT>1
 ORDER BY Amount DESC
 --------------------------------------------------------------------------------------------




select skuid , sum(amount) Amount from LineItem where SKUID in (
select distinct SKUID from Sku_1500WORST)
group by SKUID 
order by sum(amount) desc
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
select count(distinct skuid) skuid, sum(amount) amount from lineitem where skuid not in
(select distinct skuid from [dbo].[Sku_500MOST]
union
select distinct skuid from [dbo].[Sku_100TOPWORST])
and Amount>1;
-------------------------------------------------------
--2,048,056.72-----------------------------------------
-------------------------------------------------------


SELECT SKUID,MarketID, COUNT(*) CNT
INTO #TEMP_SKU2
FROM SKU
WHERE PRODUCTID IN (1,2,5)
GROUP BY SKUID,MarketID
--ORDER BY SKUID
HAVING COUNT(*)=3;

SELECT * 
INTO #TEMP_SKU3
FROM #TEMP_SKU2
ORDER BY SKUID, MarketID

SELECT SKUID,COUNT(*)
FROM #TEMP_SKU3
GROUP BY SKUID
HAVING COUNT(*)>1

SELECT * FROM #TEMP_SKU3

DELETE FROM #TEMP_SKU3 WHERE SKUID IN (
933,
3308,
3349,
4092,
4218,
7569,
19249
)

SELECT SKUID, 
CAST(SKUID AS VARCHAR(20))+'-'+
'Suite-'+
CAST([MarketID] AS VARCHAR(20))+'-'+
CAST([UserCount] AS VARCHAR(20))+'-'+
CAST([CustomerType] AS VARCHAR(20)) SKU_NAME
into #sku_name1
FROM SKU 
WHERE SKUID IN (SELECT DISTINCT SKUID FROM #TEMP_SKU3)

select distinct skuid, Sku_name
into #sku_name2
from #sku_name1
order by skuid

select distinct SKUID from #sku_name2
select * from #sku_name2

select * from SkuPrice

update s
set s.SkuName=t.Sku_name
from SkuPrice s join #sku_name2 t on s.SKUID=t.SKUID

select * from SkuPrice
order by skuid 

select * from
SkuPrice where 
price >4
and SkuName is not null 
and SkuName like '%--1%'
order by SKUID

---------------------- MIXED MARKET SKU'S ----------------
/*

933
3308
3349
4092
4218
7569
19249

*/
----------------------------------------------------------
/*
PROBLEM SKUS

10124
10154
10290
10428
10702
10937
11401
11507
12328
13484
14762
14886
15060
15541
15892
16019
16329
16496
17841
18707
19025
19793
19813
21124
21195
21333
21504
21765
21893
23065
23605
24099
24153


*/

SELECT * FROM SKU WHERE SKUID IN (5594)
select * from SkuPrice where SKUID in (5594)

SELECT * FROM SkuPrice WHERE SKUID IN (SELECT DISTINCT SKUID FROM #TEMP_SKU)
ORDER BY SKUID

select * from CustomerType

select * from [dbo].[sku_name1]

select * from sku where skuid in (24,34,59,92,152,167,176,193)












select * from sku where skuid in (608)
order by ProductID


update s
set s.SkuName='24-Suite-FL1-5-14'
from skuPrice s
where SKUID in (24)

select * from SkuPrice where SKUID=24
----------------------------------------
update s
set s.SkuName='34-Suite-FL1-1-12'
from skuPrice s
where SKUID in (34)

select * from SkuPrice where SKUID=34
----------------------------------------
update s
set s.SkuName='59-Suite-LAX-3-0'
from skuPrice s
where SKUID in (59)

select * from SkuPrice where SKUID=59
------------------------------------------
update s
set s.SkuName='92-Suite-DFW-2-12'
from skuPrice s
where SKUID in (92)

select * from SkuPrice where SKUID=92
-------------------------------------------
update s
set s.SkuName='152-Suite-MN1-4-9'
from skuPrice s
where SKUID in (152)

select * from SkuPrice where SKUID=152
---------------------------------------------
update s
set s.SkuName='193-Suite-USA-15-0'
from skuPrice s
where SKUID in (193)

select * from SkuPrice where SKUID=193
---------------------------------------------
----------------------------------------------
update s
set s.SkuName='176-Suite-MIN-8-0'
from skuPrice s
where SKUID in (176)

select * from SkuPrice where SKUID=176
-----------------------------------------------
update s
set s.SkuName='176-Suite-MIN-8-0'
from skuPrice s
where SKUID in (176)

select * from SkuPrice where SKUID=176
------------------------------------------------
------------------------------------------------
------------------------------------------------
------------------------------------------------
update s
set s.SkuName='167-Suite-USA-11-0'
from skuPrice s
where SKUID in (167)

select * from SkuPrice where SKUID=167
SELECT * FROM SKU WHERE SKUID=167
--------------------------------------------------
update s
set s.SkuName='229-Suite-USA-7-0'
from skuPrice s
where SKUID in (229)

select * from SkuPrice where SKUID=229
SELECT * FROM SKU WHERE SKUID=229
-----------------------------------------------
update s
set s.SkuName='246-Suite-WAS-16-4'
from skuPrice s
where SKUID in (246)

select * from SkuPrice where SKUID=246
SELECT * FROM SKU WHERE SKUID=246
----------------------------------------------
update s
set s.SkuName='255-Suite-USA-24-10'
from skuPrice s
where SKUID in (255)

select * from SkuPrice where SKUID=255
SELECT * FROM SKU WHERE SKUID=255
--------------------------------------------
update s
set s.SkuName='264-Suite-WAS-8-7'
from skuPrice s
where SKUID in (264)

select * from SkuPrice where SKUID=264
SELECT * FROM SKU WHERE SKUID=264
---------------------------------------------
update s
set s.SkuName='281-Suite-EBY-7-4'
from skuPrice s
where SKUID in (281)

select * from SkuPrice where SKUID=281
SELECT * FROM SKU WHERE SKUID=281
---------------------------------------------
update s
set s.SkuName='290-Suite-SNY-32-0'
from skuPrice s
where SKUID in (290)

select * from SkuPrice where SKUID=290
SELECT * FROM SKU WHERE SKUID=290
----------------------------------------------
update s
set s.SkuName='307-Suite-USA-3-7'
from skuPrice s
where SKUID in (307)

select * from SkuPrice where SKUID=307
SELECT * FROM SKU WHERE SKUID=307
---------------------------------------------
update s
set s.SkuName='349-Suite-USA-5-0'
from skuPrice s
where SKUID in (349)

select * from SkuPrice where SKUID=349
SELECT * FROM SKU WHERE SKUID=349
--------------------------------------------
update s
set s.SkuName='391-Suite-NC1-5-7'
from skuPrice s
where SKUID in (391)

select * from SkuPrice where SKUID=391
SELECT * FROM SKU WHERE SKUID=391
--------------------------------------------
update s
set s.SkuName='401-Suite-USA-2-7'
from skuPrice s
where SKUID in (401)

select * from SkuPrice where SKUID=401
SELECT * FROM SKU WHERE SKUID=401
---------------------------------------------
update s
set s.SkuName='410-Suite-USA-15-4'
from skuPrice s
where SKUID in (410)

select * from SkuPrice where SKUID=410
SELECT * FROM SKU WHERE SKUID=410
-------------------------------------------
update s
set s.SkuName='429-Suite-USA-5-4'
from skuPrice s
where SKUID in (429)

select * from SkuPrice where SKUID=429
SELECT * FROM SKU WHERE SKUID=429
------------------------------------------
update s
set s.SkuName='441-Suite-USA-13-0'
from skuPrice s
where SKUID in (441)

select * from SkuPrice where SKUID=441
SELECT * FROM SKU WHERE SKUID=441
----------------------------------------
update s
set s.SkuName='474-Suite-USA-7-7'
from skuPrice s
where SKUID in (474)

select * from SkuPrice where SKUID=474
SELECT * FROM SKU WHERE SKUID=474
-----------------------------------------
update s
set s.SkuName='499-Suite-USA-4-7'
from skuPrice s
where SKUID in (499)

select * from SkuPrice where SKUID=499
SELECT * FROM SKU WHERE SKUID=499
-------------------------------------
update s
set s.SkuName='508-Suite-USA-12-7'
from skuPrice s
where SKUID in (508)

select * from SkuPrice where SKUID=508
SELECT * FROM SKU WHERE SKUID=508
----------------------------------------
update s
set s.SkuName='517-Suite-USA-18-0'
from skuPrice s
where SKUID in (517)

select * from SkuPrice where SKUID=517
SELECT * FROM SKU WHERE SKUID=517
---------------------------------------
update s
set s.SkuName='541-Suite-MIN-6-4'
from skuPrice s
where SKUID in (541)

select * from SkuPrice where SKUID=541
SELECT * FROM SKU WHERE SKUID=541
----------------------------------------
update s
set s.SkuName='550-Suite-USA-9-7'
from skuPrice s
where SKUID in (550)

select * from SkuPrice where SKUID=550
SELECT * FROM SKU WHERE SKUID=550
---------------------------------------
update s
set s.SkuName='559-Suite-USA-60-0'
from skuPrice s
where SKUID in (559)

select * from SkuPrice where SKUID=559
SELECT * FROM SKU WHERE SKUID=559
-----------------------------------------
update s
set s.SkuName='608-Suite-USA-9-4'
from skuPrice s
where SKUID in (608)

select * from SkuPrice where SKUID=608
SELECT * FROM SKU WHERE SKUID=608
------------------------------------------
update s
set s.SkuName='642-Suite-USA-114-4'
from skuPrice s
where SKUID in (642)

select * from SkuPrice where SKUID=642
SELECT * FROM SKU WHERE SKUID=642
------------------------------------------
update s
set s.SkuName='651-Suite-PHI-11-7'
from skuPrice s
where SKUID in (651)

select * from SkuPrice where SKUID=651
SELECT * FROM SKU WHERE SKUID=651
--------------------------------------------
update s
set s.SkuName='671-Suite-USA-250-0'
from skuPrice s
where SKUID in (671)

select * from SkuPrice where SKUID=671
SELECT * FROM SKU WHERE SKUID=671
--------------------------------------------
update s
set s.SkuName='680-Suite-VA1-3-6'
from skuPrice s
where SKUID in (680)

select * from SkuPrice where SKUID=680
SELECT * FROM SKU WHERE SKUID=680
--------------------------------------------
update s
set s.SkuName='697-Suite-HOU-20-0'
from skuPrice s
where SKUID in (697)

select * from SkuPrice where SKUID=697
SELECT * FROM SKU WHERE SKUID=697
-------------------------------------------
update s
set s.SkuName='734-Suite-USA-14-7'
from skuPrice s
where SKUID in (734)

select * from SkuPrice where SKUID=734
SELECT * FROM SKU WHERE SKUID=734
-------------------------------------------
update s
set s.SkuName='743-Suite-USA-20-2'
from skuPrice s
where SKUID in (743)

select * from SkuPrice where SKUID=743
SELECT * FROM SKU WHERE SKUID=743
-------------------------------------------
update s
set s.SkuName='752-Suite-OR1-4-10'
from skuPrice s
where SKUID in (752)

select * from SkuPrice where SKUID=752
SELECT * FROM SKU WHERE SKUID=752
-------------------------------------------
update s
set s.SkuName='761-Suite-USA-9-0'
from skuPrice s
where SKUID in (761)

select * from SkuPrice where SKUID=761
SELECT * FROM SKU WHERE SKUID=761
--------------------------------------------
update s
set s.SkuName='778-Suite-USA-25-10'
from skuPrice s
where SKUID in (778)

select * from SkuPrice where SKUID=778
SELECT * FROM SKU WHERE SKUID=778
--------------------------------------------
update s
set s.SkuName='814-Suite-USA-21-14'
from skuPrice s
where SKUID in (814)

select * from SkuPrice where SKUID=814
SELECT * FROM SKU WHERE SKUID=814
--------------------------------------------
update s
set s.SkuName='849-Suite-VA1-7-10'
from skuPrice s
where SKUID in (849)

select * from SkuPrice where SKUID=849
SELECT * FROM SKU WHERE SKUID=849
--------------------------------------------
update s
set s.SkuName='867-Suite-WAS-6-13'
from skuPrice s
where SKUID in (867)

select * from SkuPrice where SKUID=867
SELECT * FROM SKU WHERE SKUID=867
---------------------------------------------
update s
set s.SkuName='899-Suite-USA-11-14'
from skuPrice s
where SKUID in (899)

select * from SkuPrice where SKUID=899
SELECT * FROM SKU WHERE SKUID=899
---------------------------------------------
update s
set s.SkuName='924-Suite-TX1-10-12'
from skuPrice s
where SKUID in (924)

select * from SkuPrice where SKUID=924
SELECT * FROM SKU WHERE SKUID=924
----------------------------------------------
update s
set s.SkuName='965-Suite-USA-13-14'
from skuPrice s
where SKUID in (965)

select * from SkuPrice where SKUID=965
SELECT * FROM SKU WHERE SKUID=965
----------------------------------------------
update s
set s.SkuName='991-Suite-USA-10-7'
from skuPrice s
where SKUID in (991)

select * from SkuPrice where SKUID=991
SELECT * FROM SKU WHERE SKUID=991
----------------------------------------------
update s
set s.SkuName='1008-Suite-USA-18-4'
from skuPrice s
where SKUID in (1008)

select * from SkuPrice where SKUID=1008
SELECT * FROM SKU WHERE SKUID=1008
-----------------------------------------------
update s
set s.SkuName='1017-Suite-USA-15-7'
from skuPrice s
where SKUID in (1017)

select * from SkuPrice where SKUID=1017
SELECT * FROM SKU WHERE SKUID=1017
----------------------------------------------
update s
set s.SkuName='1095-Suite-UT1-12-0'
from skuPrice s
where SKUID in (1095)

select * from SkuPrice where SKUID=1095
SELECT * FROM SKU WHERE SKUID=1095
----------------------------------------------
update s
set s.SkuName='1123-Suite-COL-10-4'
from skuPrice s
where SKUID in (1123)

select * from SkuPrice where SKUID=1123
SELECT * FROM SKU WHERE SKUID=1123
---------------------------------------------
update s
set s.SkuName='1132-Suite-ATL-10-0'
from skuPrice s
where SKUID in (1132)

select * from SkuPrice where SKUID=1132
SELECT * FROM SKU WHERE SKUID=1132
----------------------------------------------
update s
set s.SkuName='1147-Suite-TX1-4-3'
from skuPrice s
where SKUID in (1147)

select * from SkuPrice where SKUID=1147
SELECT * FROM SKU WHERE SKUID=1147
---------------------------------------------
update s
set s.SkuName='1167-Suite-PHI-6-10'
from skuPrice s
where SKUID in (1167)

select * from SkuPrice where SKUID=1167
SELECT * FROM SKU WHERE SKUID=1167
---------------------------------------------
update s
set s.SkuName='1227-Suite-USA-21-0'
from skuPrice s
where SKUID in (1227)

select * from SkuPrice where SKUID=1227
SELECT * FROM SKU WHERE SKUID=1227
-------------------------------------------
update s
set s.SkuName='1305-Suite-USA-26-0'
from skuPrice s
where SKUID in (1305)

select * from SkuPrice where SKUID=1305
SELECT * FROM SKU WHERE SKUID=1305
--------------------------------------------
update s
set s.SkuName='1355-Suite-EBY-4-12'
from skuPrice s
where SKUID in (1355)

select * from SkuPrice where SKUID=1355
SELECT * FROM SKU WHERE SKUID=1355
--------------------------------------------
update s
set s.SkuName='1388-Suite-USA-8-13'
from skuPrice s
where SKUID in (1388)

select * from SkuPrice where SKUID=1388
SELECT * FROM SKU WHERE SKUID=1388
---------------------------------------------
update s
set s.SkuName='1446-Suite-USA-56-7'
from skuPrice s
where SKUID in (1446)

select * from SkuPrice where SKUID=1446
SELECT * FROM SKU WHERE SKUID=1446
----------------------------------------------
update s
set s.SkuName='1455-Suite-WI1-13-4'
from skuPrice s
where SKUID in (1455)

select * from SkuPrice where SKUID=1455
SELECT * FROM SKU WHERE SKUID=1455
----------------------------------------------
update s
set s.SkuName='1464-Suite-AUS-20-10'
from skuPrice s
where SKUID in (1464)

select * from SkuPrice where SKUID=1464
SELECT * FROM SKU WHERE SKUID=1464
----------------------------------------------
update s
set s.SkuName='1481-Suite-EBY-23-4'
from skuPrice s
where SKUID in (1481)

select * from SkuPrice where SKUID=1481
SELECT * FROM SKU WHERE SKUID=1481
-----------------------------------------------
update s
set s.SkuName='1498-Suite-NNJ-2-5'
from skuPrice s
where SKUID in (1498)

select * from SkuPrice where SKUID=1498
SELECT * FROM SKU WHERE SKUID=1498
-----------------------------------------------
update s
set s.SkuName='1540-Suite-USA-19-7'
from skuPrice s
where SKUID in (1540)

select * from SkuPrice where SKUID=1540
SELECT * FROM SKU WHERE SKUID=1540
------------------------------------------------
update s
set s.SkuName='1549-Suite-CO1-6-7'
from skuPrice s
where SKUID in (1549)

select * from SkuPrice where SKUID=1549
SELECT * FROM SKU WHERE SKUID=1549
-------------------------------------------------
update s
set s.SkuName='1558-Suite-USA-22-7'
from skuPrice s
where SKUID in (1558)

select * from SkuPrice where SKUID=1558
SELECT * FROM SKU WHERE SKUID=1558
---------------------------------------------------
update s
set s.SkuName='1627-Suite-USA-19-4'
from skuPrice s
where SKUID in (1627)

select * from SkuPrice where SKUID=1627
SELECT * FROM SKU WHERE SKUID=1627
--------------------------------------------------
update s
set s.SkuName='1694-Suite-USA-25-7'
from skuPrice s
where SKUID in (1694)

select * from SkuPrice where SKUID=1694
SELECT * FROM SKU WHERE SKUID=1694
-----------------------------------------------------
update s
set s.SkuName='1876-Suite-USA-17-13'
from skuPrice s
where SKUID in (1876)

select * from SkuPrice where SKUID=1876
SELECT * FROM SKU WHERE SKUID=1876
-----------------------------------------------------
update s
set s.SkuName='1885-Suite-USA-50-0'
from skuPrice s
where SKUID in (1885)

select * from SkuPrice where SKUID=1885
SELECT * FROM SKU WHERE SKUID=1885
-------------------------------------------------------
update s
set s.SkuName='1894-Suite-USA-20-7'
from skuPrice s
where SKUID in (1894)

select * from SkuPrice where SKUID=1894
SELECT * FROM SKU WHERE SKUID=1894
-------------------------------------------------------
update s
set s.SkuName='1911-Suite-USA-60-4'
from skuPrice s
where SKUID in (1911)

select * from SkuPrice where SKUID=1911
SELECT * FROM SKU WHERE SKUID=1911
-------------------------------------------------------
update s
set s.SkuName='1993-Suite-ATL-17-4'
from skuPrice s
where SKUID in (1993)

select * from SkuPrice where SKUID=1993
SELECT * FROM SKU WHERE SKUID=1993
------------------------------------------------------
update s
set s.SkuName='2027-Suite-DEN-40-4'
from skuPrice s
where SKUID in (2027)

select * from SkuPrice where SKUID=2027
SELECT * FROM SKU WHERE SKUID=2027
------------------------------------------------------
update s
set s.SkuName='2151-Suite-USA-18-14'
from skuPrice s
where SKUID in (2151)

select * from SkuPrice where SKUID=2151
SELECT * FROM SKU WHERE SKUID=2151
-----------------------------------------------------
update s
set s.SkuName='2168-Suite-FL1-39-4'
from skuPrice s
where SKUID in (2168)

select * from SkuPrice where SKUID=2168
SELECT * FROM SKU WHERE SKUID=2168
-----------------------------------------------------
update s
set s.SkuName='2177-Suite-USA-59-7'
from skuPrice s
where SKUID in (2177)

select * from SkuPrice where SKUID=2177
SELECT * FROM SKU WHERE SKUID=2177
-----------------------------------------------------
update s
set s.SkuName='2214-Suite-BFL-21-4'
from skuPrice s
where SKUID in (2214)

select * from SkuPrice where SKUID=2214
SELECT * FROM SKU WHERE SKUID=2214
---------------------------------------------------
update s
set s.SkuName='2251-Suite-USA-9-12'
from skuPrice s
where SKUID in (2251)

select * from SkuPrice where SKUID=2251
SELECT * FROM SKU WHERE SKUID=2251
---------------------------------------------------
update s
set s.SkuName='2268-Suite-USA-14-4'
from skuPrice s
where SKUID in (2268)

select * from SkuPrice where SKUID=2268
SELECT * FROM SKU WHERE SKUID=2268
-------------------------------------------------
update s
set s.SkuName='2311-Suite-PHI-7-9'
from skuPrice s
where SKUID in (2311)

select * from SkuPrice where SKUID=2311
SELECT * FROM SKU WHERE SKUID=2311
------------------------------------------------
update s
set s.SkuName='2442-Suite-USA-46-0'
from skuPrice s
where SKUID in (2442)

select * from SkuPrice where SKUID=2442
SELECT * FROM SKU WHERE SKUID=2442
-----------------------------------------------
update s
set s.SkuName='2545-Suite-USA-80-0'
from skuPrice s
where SKUID in (2545)

select * from SkuPrice where SKUID=2545
SELECT * FROM SKU WHERE SKUID=2545
----------------------------------------------
update s
set s.SkuName='2554-Suite-USA-83-0'
from skuPrice s
where SKUID in (2554)

select * from SkuPrice where SKUID=2554
SELECT * FROM SKU WHERE SKUID=2554
----------------------------------------------
update s
set s.SkuName='2641-Suite-WA1-14-5'
from skuPrice s
where SKUID in (2641)

select * from SkuPrice where SKUID=2641
SELECT * FROM SKU WHERE SKUID=2641
----------------------------------------------
update s
set s.SkuName='2666-Suite-WAS-21-7'
from skuPrice s
where SKUID in (2666)

select * from SkuPrice where SKUID=2666
SELECT * FROM SKU WHERE SKUID=2666
----------------------------------------------
update s
set s.SkuName='2714-Suite-USA-26-12'
from skuPrice s
where SKUID in (2714)

select * from SkuPrice where SKUID=2714
SELECT * FROM SKU WHERE SKUID=2714
----------------------------------------------
update s
set s.SkuName='2786-Suite-USA-31-0'
from skuPrice s
where SKUID in (2786)

select * from SkuPrice where SKUID=2786
SELECT * FROM SKU WHERE SKUID=2786
-----------------------------------------------
update s
set s.SkuName='2795-Suite-USA-38-0'
from skuPrice s
where SKUID in (2795)

select * from SkuPrice where SKUID=2795
SELECT * FROM SKU WHERE SKUID=2795
-----------------------------------------------
update s
set s.SkuName='2852-Suite-USA-50-12'
from skuPrice s
where SKUID in (2852)

select * from SkuPrice where SKUID=2852
SELECT * FROM SKU WHERE SKUID=2852
-----------------------------------------------
update s
set s.SkuName='2899-Suite-USA-28-4'
from skuPrice s
where SKUID in (2899)

select * from SkuPrice where SKUID=2899
SELECT * FROM SKU WHERE SKUID=2899
-----------------------------------------------
update s
set s.SkuName='2956-Suite-USA-12-4'
from skuPrice s
where SKUID in (2956)

select * from SkuPrice where SKUID=2956
SELECT * FROM SKU WHERE SKUID=2956
------------------------------------------------
update s
set s.SkuName='2973-Suite-HOU-9-10'
from skuPrice s
where SKUID in (2973)

select * from SkuPrice where SKUID=2973
SELECT * FROM SKU WHERE SKUID=2973
-----------------------------------------------
update s
set s.SkuName='2982-Suite-RIV-10-10'
from skuPrice s
where SKUID in (2982)

select * from SkuPrice where SKUID=2982
SELECT * FROM SKU WHERE SKUID=2982
--------------------------------------------
update s
set s.SkuName='3007-Suite-USA-18-7'
from skuPrice s
where SKUID in (3007)

select * from SkuPrice where SKUID=3007
SELECT * FROM SKU WHERE SKUID=3007
--------------------------------------------
update s
set s.SkuName='3041-Suite-USA-35-7'
from skuPrice s
where SKUID in (3041)

select * from SkuPrice where SKUID=3041
SELECT * FROM SKU WHERE SKUID=3041
---------------------------------------------
update s
set s.SkuName='3074-Suite-USA-45-7'
from skuPrice s
where SKUID in (3074)

select * from SkuPrice where SKUID=3074
SELECT * FROM SKU WHERE SKUID=3074
---------------------------------------------
update s
set s.SkuName='3083-Suite-USA-42-4'
from skuPrice s
where SKUID in (3083)

select * from SkuPrice where SKUID=3083
SELECT * FROM SKU WHERE SKUID=3083
----------------------------------------------
update s
set s.SkuName='3168-Suite-USA-29-4'
from skuPrice s
where SKUID in (3168)

select * from SkuPrice where SKUID=3168
SELECT * FROM SKU WHERE SKUID=3168
---------------------------------------------
update s
set s.SkuName='3177-Suite-USA-24-12'
from skuPrice s
where SKUID in (3177)

select * from SkuPrice where SKUID=3177
SELECT * FROM SKU WHERE SKUID=3177
---------------------------------------------
update s
set s.SkuName='3234-Suite-USA-41-0'
from skuPrice s
where SKUID in (3234)

select * from SkuPrice where SKUID=3234
SELECT * FROM SKU WHERE SKUID=3234
---------------------------------------------
update s
set s.SkuName='3340-Suite-USA-41-4'
from skuPrice s
where SKUID in (3340)

select * from SkuPrice where SKUID=3340
SELECT * FROM SKU WHERE SKUID=3340
--------------------------------------------
update s
set s.SkuName='3405-Suite-CA1-4-6'
from skuPrice s
where SKUID in (3405)

select * from SkuPrice where SKUID=3405
SELECT * FROM SKU WHERE SKUID=3405
--------------------------------------------
update s
set s.SkuName='3480-Suite-EBY-76-4'
from skuPrice s
where SKUID in (3480)

select * from SkuPrice where SKUID=3480
SELECT * FROM SKU WHERE SKUID=3480
---------------------------------------------
update s
set s.SkuName='3557-Suite-USA-24-7'
from skuPrice s
where SKUID in (3557)

select * from SkuPrice where SKUID=3557
SELECT * FROM SKU WHERE SKUID=3557
-----------------------------------------------
update s
set s.SkuName='3590-Suite-USA-16-7'
from skuPrice s
where SKUID in (3590)

select * from SkuPrice where SKUID=3590
SELECT * FROM SKU WHERE SKUID=3590
-------------------------------------------------
update s
set s.SkuName='3737-Suite-USA-100-7'
from skuPrice s
where SKUID in (3737)

select * from SkuPrice where SKUID=3737
SELECT * FROM SKU WHERE SKUID=3737
------------------------------------------------
update s
set s.SkuName='3746-Suite-USA-37-7'
from skuPrice s
where SKUID in (3746)

select * from SkuPrice where SKUID=3746
SELECT * FROM SKU WHERE SKUID=3746
-------------------------------------------------
update s
set s.SkuName='3763-Suite-USA-141-0'
from skuPrice s
where SKUID in (3763)

select * from SkuPrice where SKUID=3763
SELECT * FROM SKU WHERE SKUID=3763
----------------------------------------------------
update s
set s.SkuName='3794-Suite-USA-130-7'
from skuPrice s
where SKUID in (3794)

select * from SkuPrice where SKUID=3794
SELECT * FROM SKU WHERE SKUID=3794
---------------------------------------------------
update s
set s.SkuName='3819-Suite-AZ1-23-7'
from skuPrice s
where SKUID in (3819)

select * from SkuPrice where SKUID=3819
SELECT * FROM SKU WHERE SKUID=3819
--------------------------------------------------
update s
set s.SkuName='3877-Suite-USA-17-7'
from skuPrice s
where SKUID in (3877)

select * from SkuPrice where SKUID=3877
SELECT * FROM SKU WHERE SKUID=3877
-------------------------------------------------
update s
set s.SkuName='3900-Suite-NY1-7-12'
from skuPrice s
where SKUID in (3900)

select * from SkuPrice where SKUID=3900
SELECT * FROM SKU WHERE SKUID=3900
-------------------------------------------------
update s
set s.SkuName='3949-Suite-SFL-2-3'
from skuPrice s
where SKUID in (3949)

select * from SkuPrice where SKUID=3949
SELECT * FROM SKU WHERE SKUID=3949
---------------------------------------------------
update s
set s.SkuName='3974-Suite-USA-5-9'
from skuPrice s
where SKUID in (3974)

select * from SkuPrice where SKUID=3974
SELECT * FROM SKU WHERE SKUID=3974
--------------------------------------------------
update s
set s.SkuName='4047-Suite-USA-26-7'
from skuPrice s
where SKUID in (4047)

select * from SkuPrice where SKUID=4047
SELECT * FROM SKU WHERE SKUID=4047
---------------------------------------------------
update s
set s.SkuName='4299-Suite-POR-23-0'
from skuPrice s
where SKUID in (4299)

select * from SkuPrice where SKUID=4299
SELECT * FROM SKU WHERE SKUID=4299
---------------------------------------------------
update s
set s.SkuName='4315-Suite-USA-70-7'
from skuPrice s
where SKUID in (4315)

select * from SkuPrice where SKUID=4315
SELECT * FROM SKU WHERE SKUID=4315
--------------------------------------------------
update s
set s.SkuName='4315-Suite-USA-70-7'
from skuPrice s
where SKUID in (4315)

select * from SkuPrice where SKUID=4315
SELECT * FROM SKU WHERE SKUID=4315
--------------------------------------------------
update s
set s.SkuName='4385-Suite-USA-187-12'
from skuPrice s
where SKUID in (4385)

select * from SkuPrice where SKUID=4385
SELECT * FROM SKU WHERE SKUID=4385
---------------------------------------------------
update s
set s.SkuName='4491-Suite-USA-50-4'
from skuPrice s
where SKUID in (4491)

select * from SkuPrice where SKUID=4491
SELECT * FROM SKU WHERE SKUID=4491
----------------------------------------------------
update s
set s.SkuName='4500-Suite-AUS-20-12'
from skuPrice s
where SKUID in (4500)

select * from SkuPrice where SKUID=4500
SELECT * FROM SKU WHERE SKUID=4500
----------------------------------------------------
update s
set s.SkuName='4509-Suite-LVG-14-9'
from skuPrice s
where SKUID in (4509)

select * from SkuPrice where SKUID=4509
SELECT * FROM SKU WHERE SKUID=4509
---------------------------------------------------
update s
set s.SkuName='4535-Suite-BLT-32-7'
from skuPrice s
where SKUID in (4535)

select * from SkuPrice where SKUID=4535
SELECT * FROM SKU WHERE SKUID=4535
---------------------------------------------------
update s
set s.SkuName='4779-Suite-USA-20-14'
from skuPrice s
where SKUID in (4779)

select * from SkuPrice where SKUID=4779
SELECT * FROM SKU WHERE SKUID=4779
--------------------------------------------------
update s
set s.SkuName='4853-Suite-USA-35-4'
from skuPrice s
where SKUID in (4853)

select * from SkuPrice where SKUID=4853
SELECT * FROM SKU WHERE SKUID=4853
--------------------------------------------------
update s
set s.SkuName='4870-Suite-USA-15-14'
from skuPrice s
where SKUID in (4870)

select * from SkuPrice where SKUID=4870
SELECT * FROM SKU WHERE SKUID=4870
----------------------------------------------------
update s
set s.SkuName='5009-Suite-USA-36-14'
from skuPrice s
where SKUID in (5009)

select * from SkuPrice where SKUID=5009
SELECT * FROM SKU WHERE SKUID=5009
-----------------------------------------------------
update s
set s.SkuName='5055-Suite-LAX-4-0'
from skuPrice s
where SKUID in (5055)

select * from SkuPrice where SKUID=5055
SELECT * FROM SKU WHERE SKUID=5055
---------------------------------------------------
update s
set s.SkuName='5216-Suite-CA1-8-4'
from skuPrice s
where SKUID in (5216)

select * from SkuPrice where SKUID=5216
SELECT * FROM SKU WHERE SKUID=5216
--------------------------------------------------
update s
set s.SkuName='5249-Suite-WAS-2-4'
from skuPrice s
where SKUID in (5249)

select * from SkuPrice where SKUID=5249
SELECT * FROM SKU WHERE SKUID=5249
--------------------------------------------------
update s
set s.SkuName='5278-Suite-USA-2-0'
from skuPrice s
where SKUID in (5278)

select * from SkuPrice where SKUID=5278
SELECT * FROM SKU WHERE SKUID=5278
-----------------------------------------------------
update s
set s.SkuName='5594-Suite-DFW-3-4'
from skuPrice s
where SKUID in (5594)

select * from SkuPrice where SKUID=5594
SELECT * FROM SKU WHERE SKUID=5594
-------------------------------------------------------
update s
set s.SkuName='5644-Suite-USA-22-4'
from skuPrice s
where SKUID in (5644)

select * from SkuPrice where SKUID=5644
SELECT * FROM SKU WHERE SKUID=5644
-----------------------------------------------------
update s
set s.SkuName='5998-Suite-AL1-14-0'
from skuPrice s
where SKUID in (5998)

select * from SkuPrice where SKUID=5998
SELECT * FROM SKU WHERE SKUID=5998
-----------------------------------------------------
update s
set s.SkuName='6281-Suite-USA-39-7'
from skuPrice s
where SKUID in (6281)

select * from SkuPrice where SKUID=6281
SELECT * FROM SKU WHERE SKUID=6281
-----------------------------------------------------
update s
set s.SkuName='7406-Suite-AL1-1-7'
from skuPrice s
where SKUID in (7406)

select * from SkuPrice where SKUID=7406
SELECT * FROM SKU WHERE SKUID=7406
---------------------------------------------------
update s
set s.SkuName='7446-Suite-USA-1-14'
from skuPrice s
where SKUID in (7446)

select * from SkuPrice where SKUID=7446
SELECT * FROM SKU WHERE SKUID=7446
---------------------------------------------------
update s
set s.SkuName='7482-Suite-WAS-20-4'
from skuPrice s
where SKUID in (7482)

select * from SkuPrice where SKUID=7482
SELECT * FROM SKU WHERE SKUID=7482
---------------------------------------------------
update s
set s.SkuName='8510-Suite-BLT-6-0'
from skuPrice s
where SKUID in (8510)

select * from SkuPrice where SKUID=8510
SELECT * FROM SKU WHERE SKUID=8510
---------------------------------------------------
update s
set s.SkuName='8525-Suite-TX1-2-13'
from skuPrice s
where SKUID in (8525)

select * from SkuPrice where SKUID=8525
SELECT * FROM SKU WHERE SKUID=8525
--------------------------------------------------
update s
set s.SkuName='8547-Suite-SAV-1-4'
from skuPrice s
where SKUID in (8547)

select * from SkuPrice where SKUID=8547
SELECT * FROM SKU WHERE SKUID=8547
--------------------------------------------------
update s
set s.SkuName='8555-Suite-GA1-0-0'
from skuPrice s
where SKUID in (8555)

select * from SkuPrice where SKUID=8555
SELECT * FROM SKU WHERE SKUID=8555
---------------------------------------------------
update s
set s.SkuName='8704-Suite-WAS-25-0'
from skuPrice s
where SKUID in (8704)

select * from SkuPrice where SKUID=8704
SELECT * FROM SKU WHERE SKUID=8704
---------------------------------------------------
update s
set s.SkuName='8838-Suite-USA-4-13'
from skuPrice s
where SKUID in (8838)

select * from SkuPrice where SKUID=8838
SELECT * FROM SKU WHERE SKUID=8838
----------------------------------------------------
update s
set s.SkuName='9007-Suite-USA-8-12'
from skuPrice s
where SKUID in (9007)

select * from SkuPrice where SKUID=9007
SELECT * FROM SKU WHERE SKUID=9007
------------------------------------------------------
update s
set s.SkuName='9193-Suite-FL1-5-10'
from skuPrice s
where SKUID in (9193)

select * from SkuPrice where SKUID=9193
SELECT * FROM SKU WHERE SKUID=9193
-----------------------------------------------------
update s
set s.SkuName='9299-Suite-WA1-1-13'
from skuPrice s
where SKUID in (9299)

select * from SkuPrice where SKUID=9299
SELECT * FROM SKU WHERE SKUID=9299
--------------------------------------------------
update s
set s.SkuName='9563-Suite-CO1-2-8'
from skuPrice s
where SKUID in (9563)

select * from SkuPrice where SKUID=9563
SELECT * FROM SKU WHERE SKUID=9563
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
update s
set s.SkuName='10124-Suite-USA-11-4'
from skuPrice s
where SKUID in (10124)

select * from SkuPrice where SKUID=10124
SELECT * FROM SKU WHERE SKUID=10124
--------------------------------------------------------
update s
set s.SkuName='10154-Suite-USA-30-7'
from skuPrice s
where SKUID in (10154)

select * from SkuPrice where SKUID=10154
SELECT * FROM SKU WHERE SKUID=10154
--------------------------------------------------
update s
set s.SkuName='10290-Suite-USA-36-7'
from skuPrice s
where SKUID in (10290)

select * from SkuPrice where SKUID=10290
SELECT * FROM SKU WHERE SKUID=10290
--------------------------------------------------
update s
set s.SkuName='10428-Suite-USA-2-10'
from skuPrice s
where SKUID in (10428)

select * from SkuPrice where SKUID=10428
SELECT * FROM SKU WHERE SKUID=10428
--------------------------------------------------
update s
set s.SkuName='10702-Suite-LAX-17-0'
from skuPrice s
where SKUID in (10702)

select * from SkuPrice where SKUID=10702
SELECT * FROM SKU WHERE SKUID=10702
--------------------------------------------------
update s
set s.SkuName='10937-Suite-EBY-27-4'
from skuPrice s
where SKUID in (10937)

select * from SkuPrice where SKUID=10937
SELECT * FROM SKU WHERE SKUID=10937
---------------------------------------------------
update s
set s.SkuName='11401-Suite-ATL-1-10'
from skuPrice s
where SKUID in (11401)

select * from SkuPrice where SKUID=11401
SELECT * FROM SKU WHERE SKUID=11401
----------------------------------------------------
update s
set s.SkuName='11507-Suite-WAS-24-4'
from skuPrice s
where SKUID in (11507)

select * from SkuPrice where SKUID=11507
SELECT * FROM SKU WHERE SKUID=11507
-----------------------------------------------------
update s
set s.SkuName='12328-Suite-AL1-16-0'
from skuPrice s
where SKUID in (12328)

select * from SkuPrice where SKUID=12328
SELECT * FROM SKU WHERE SKUID=12328
----------------------------------------------------
update s
set s.SkuName='13484-Suite-USA-9-13'
from skuPrice s
where SKUID in (13484)

select * from SkuPrice where SKUID=13484
SELECT * FROM SKU WHERE SKUID=13484
----------------------------------------------------
update s
set s.SkuName='14762-Suite-NSH-1-5'
from skuPrice s
where SKUID in (14762)

select * from SkuPrice where SKUID=14762
SELECT * FROM SKU WHERE SKUID=14762
----------------------------------------------------
update s
set s.SkuName='14886-Suite-USA-30-0'
from skuPrice s
where SKUID in (14886)

select * from SkuPrice where SKUID=14886
SELECT * FROM SKU WHERE SKUID=14886
----------------------------------------------------
update s
set s.SkuName='15060-Suite-USA-30-4'
from skuPrice s
where SKUID in (15060)

select * from SkuPrice where SKUID=15060
SELECT * FROM SKU WHERE SKUID=15060
---------------------------------------------------
update s
set s.SkuName='15541-Suite-USA-10-9'
from skuPrice s
where SKUID in (15541)

select * from SkuPrice where SKUID=15541
SELECT * FROM SKU WHERE SKUID=15541
--------------------------------------------------
update s
set s.SkuName='15541-Suite-USA-10-9'
from skuPrice s
where SKUID in (15541)

select * from SkuPrice where SKUID=15541
SELECT * FROM SKU WHERE SKUID=15541
---------------------------------------------------
update s
set s.SkuName='15892-Suite-WAS-8-10'
from skuPrice s
where SKUID in (15892)

select * from SkuPrice where SKUID=15892
SELECT * FROM SKU WHERE SKUID=15892
-------------------------------------------------
update s
set s.SkuName='16019-Suite-SFL-2-11'
from skuPrice s
where SKUID in (16019)

select * from SkuPrice where SKUID=16019
SELECT * FROM SKU WHERE SKUID=16019
------------------------------------------------
update s
set s.SkuName='16329-Suite-SFL-16-4'
from skuPrice s
where SKUID in (16329)

select * from SkuPrice where SKUID=16329
SELECT * FROM SKU WHERE SKUID=16329
-----------------------------------------------
update s
set s.SkuName='16496-Suite-HOU-2-16'
from skuPrice s
where SKUID in (16496)

select * from SkuPrice where SKUID=16496
SELECT * FROM SKU WHERE SKUID=16496
------------------------------------------------
update s
set s.SkuName='17841-Suite-USA-40-7'
from skuPrice s
where SKUID in (17841)

select * from SkuPrice where SKUID=17841
SELECT * FROM SKU WHERE SKUID=17841
------------------------------------------------
update s
set s.SkuName='18707-Suite-BOS-9-4'
from skuPrice s
where SKUID in (18707)

select * from SkuPrice where SKUID=18707
SELECT * FROM SKU WHERE SKUID=18707
------------------------------------------------
update s
set s.SkuName='19025-Suite-USA-25-14'
from skuPrice s
where SKUID in (19025)

select * from SkuPrice where SKUID=19025
SELECT * FROM SKU WHERE SKUID=19025
------------------------------------------------
update s
set s.SkuName='19793-Suite-USA-63-0'
from skuPrice s
where SKUID in (19793)

select * from SkuPrice where SKUID=19793
SELECT * FROM SKU WHERE SKUID=19793
--------------------------------------------------
update s
set s.SkuName='19813-Suite-USA-146-4'
from skuPrice s
where SKUID in (19813)

select * from SkuPrice where SKUID=19813
SELECT * FROM SKU WHERE SKUID=19813
--------------------------------------------------
update s
set s.SkuName='21124-Suite-USA-40-13'
from skuPrice s
where SKUID in (21124)

select * from SkuPrice where SKUID=21124
SELECT * FROM SKU WHERE SKUID=21124
---------------------------------------------------
update s
set s.SkuName='21195-Suite-USA-73-7'
from skuPrice s
where SKUID in (21195)

select * from SkuPrice where SKUID=21195
SELECT * FROM SKU WHERE SKUID=21195
------------------------------------------------
update s
set s.SkuName='21333-Suite-USA-252-7'
from skuPrice s
where SKUID in (21333)

select * from SkuPrice where SKUID=21333
SELECT * FROM SKU WHERE SKUID=21333
------------------------------------------------
update s
set s.SkuName='21504-Suite-USA-7-13'
from skuPrice s
where SKUID in (21504)

select * from SkuPrice where SKUID=21504
SELECT * FROM SKU WHERE SKUID=21504
-------------------------------------------------
update s
set s.SkuName='21765-Suite-USA-13-7'
from skuPrice s
where SKUID in (21765)

select * from SkuPrice where SKUID=21765
SELECT * FROM SKU WHERE SKUID=21765
--------------------------------------------------
update s
set s.SkuName='21893-Suite-USA-74-4'
from skuPrice s
where SKUID in (21893)

select * from SkuPrice where SKUID=21893
SELECT * FROM SKU WHERE SKUID=21893
-------------------------------------------------
update s
set s.SkuName='23065-Suite-HOU-22-16'
from skuPrice s
where SKUID in (23065)

select * from SkuPrice where SKUID=23065
SELECT * FROM SKU WHERE SKUID=23065
--------------------------------------------------
update s
set s.SkuName='23605-Suite-USA-13-12'
from skuPrice s
where SKUID in (23605)

select * from SkuPrice where SKUID=23605
SELECT * FROM SKU WHERE SKUID=23605
--------------------------------------------------
update s
set s.SkuName='24099-Suite-USA-220-0'
from skuPrice s
where SKUID in (24099)

select * from SkuPrice where SKUID=24099
SELECT * FROM SKU WHERE SKUID=24099
-----------------------------------------------
update s
set s.SkuName='24153-Suite-USA-38-4'
from skuPrice s
where SKUID in (24153)

select * from SkuPrice where SKUID=24153
SELECT * FROM SKU WHERE SKUID=24153
----------------------------------------------



























--------------------------------------------------------------------------
--------------------------------------------------------------------------
SELECT * FROM Sku WHERE SKUID=0 ORDER by ProductID;
SELECT * FROM LineItem WHERE SKUID=450 and amount>0 ORDER BY Amount DESC
---------------------------------------------------------------------------
---------------------------------------------------------------------------

/*
PROBLEM SKUS -- 3259,3324,15841,17012,17027,22492,22561,23355,24510,24696
*/
---------------------------------------------------------------------------

SELECT * FROM SKU WHERE SkuName IS NULL 
AND Amount>4 
--and SkuName not like '%COG%' 
ORDER BY SKUID, ProductID
----------------------------------------------------------------------------

SELECT P.ProductDesc, * FROM SKU S JOIN Product P ON S.ProductID=P.ProductID
WHERE S.SKUID=1144 ORDER BY S.ProductID
----------------------------------------------------------------------------
--SELECT * FROM SKU

UPDATE S
SET S.SkuName='68-Suite-UAL-2-0'
from Sku S
where S.skuid=68
----------------------------------------------------------------------------

UPDATE S
SET S.SkuName='76-Suite-UAL-1-0'
from Sku S
where S.skuid=76
--------------------------------------------------------------
UPDATE S
SET S.SkuName='101-Comps-HOU-2-7'
from Sku S
where S.skuid=101
------------------------------------------------------------
UPDATE S
SET S.SkuName='104-Suite-ULO-3-12'
from Sku S
where S.skuid=104
-------------------------------------------------------
UPDATE S
SET S.SkuName='112-Suite-USE-3-12'
from Sku S
where S.skuid=112
------------------------------------------------------
UPDATE S
SET S.SkuName='144-Suite-UMI-2-0'
from Sku S
where S.skuid=144
-----------------------------------------------------
UPDATE S
SET S.SkuName='144-Suite-UMI-2-0'
from Sku S
where S.skuid=144
----------------------------------------------------
UPDATE S
SET S.SkuName='161-UKN-UKN-1-0'
from Sku S
where S.skuid=161
-----------------------------------------
UPDATE S
SET S.SkuName='164-UKN-UKN-5-0'
from Sku S
where S.skuid=164
-----------------------------------------
UPDATE S
SET S.SkuName='213-Suite-ULO-1-0'
from Sku S
where S.skuid=213
----------------------------------------
----------------------------------------
UPDATE S
SET S.SkuName='221-Suite-USE-1-0'
from Sku S
where S.skuid=221
---------------------------------------
UPDATE S
SET S.SkuName='238-Suite-UAL-3-13'
from Sku S
where S.skuid=238
----------------------------------------
UPDATE S
SET S.SkuName='273-Suite-UNW-1-0'
from Sku S
where S.skuid=273
------------------------------------------
UPDATE S
SET S.SkuName='324-Suite-UAL-3-0'
from Sku S
where S.skuid=324
-----------------------------------------
UPDATE S
SET S.SkuName='332-Suite-UNW-2-0'
from Sku S
where S.skuid=332
-----------------------------------------
UPDATE S
SET S.SkuName='341-Suite-ULO-2-12'
from Sku S
where S.skuid=341
----------------------------------------
UPDATE S
SET S.SkuName='366-Suite-UMI-1-0'
from Sku S
where S.skuid=366
----------------------------------------
UPDATE S
SET S.SkuName='375-Suite-UAL-5-4'
from Sku S
where S.skuid=375
----------------------------------------
UPDATE S
SET S.SkuName='375-Suite-UAL-5-4'
from Sku S
where S.skuid=375
----------------------------------------
UPDATE S
SET S.SkuName='419-Combo-ATL-1-16'
from Sku S
where S.skuid=419
---------------------------------------
UPDATE S
SET S.SkuName='438-LNCombo-UKN-4-4'
from Sku S
where S.skuid=438
--------------------------------------
UPDATE S
SET S.SkuName='450-Suite-COG-1-0'
from Sku S
where S.skuid=450
--------------------------------------
UPDATE S
SET S.SkuName='483-Suite-USW-1-3'
from Sku S
where S.skuid=483
--------------------------------------
UPDATE S
SET S.SkuName='491-Suite-UAL-4-13'
from Sku S
where S.skuid=491
-------------------------------------
UPDATE S
SET S.SkuName='599-Suite-UAL-5-7'
from Sku S
where S.skuid=599
-------------------------------------
UPDATE S
SET S.SkuName='599-Suite-UAL-5-7'
from Sku S
where S.skuid=599
-------------------------------------
UPDATE S
SET S.SkuName='617-Suite-ULO-3-4'
from Sku S
where S.skuid=617
-------------------------------------
UPDATE S
SET S.SkuName='625-Suite-USE-3-4'
from Sku S
where S.skuid=625
------------------------------------
UPDATE S
SET S.SkuName='723-Suite-CHI-44-0'
from Sku S
where S.skuid=723
------------------------------------
UPDATE S
SET S.SkuName='795-Suite-ULO-2-0'
from Sku S
where S.skuid=795
------------------------------------
UPDATE S
SET S.SkuName='803-Suite-CHI-1-9'
from Sku S
where S.skuid=803
-------------------------------------
UPDATE S
SET S.SkuName='823-Combo-USA-11-7'
from Sku S
where S.skuid=823
-------------------------------------
UPDATE S
SET S.SkuName='826-Suite-UMI-3-0'
from Sku S
where S.skuid=826
-----------------------------------------
UPDATE S
SET S.SkuName='833-Suite-USC-2-4'
from Sku S
where S.skuid=833
-----------------------------------------
UPDATE S
SET S.SkuName='841-Suite-USC-1-0'
from Sku S
where S.skuid=841
------------------------------------------
UPDATE S
SET S.SkuName='908-Suite-ULO-1-4'
from Sku S
where S.skuid=908
------------------------------------------
UPDATE S
SET S.SkuName='916-Suite-UAL-17-4'
from Sku S
where S.skuid=916
------------------------------------------
UPDATE S
SET S.SkuName='1000-Suite-UMI-2-4'
from Sku S
where S.skuid=1000
------------------------------------------
UPDATE S
SET S.SkuName='1034-Suite-UAL-32-0'
from Sku S
where S.skuid=1034
------------------------------------------
UPDATE S
SET S.SkuName='1059-Suite-UAL-12-0'
from Sku S
where S.skuid=1059
------------------------------------------
UPDATE S
SET S.SkuName='1112-Suite-CHI-6-9'
from Sku S
where S.skuid=1112
------------------------------------------
UPDATE S
SET S.SkuName='1141-Comps-KAN-5-0'
from Sku S
where S.skuid=1141
-----------------------------------------
UPDATE S
SET S.SkuName='1141-Combo-NNJ-1-0'
from Sku S
where S.skuid=1141
--------------------------------------
UPDATE S
SET S.SkuName='1156-Suite-CHI-4-16'
from Sku S
where S.skuid=1156
--------------------------------------
UPDATE S
SET S.SkuName='1187-Suite-UAL-1-4'
from Sku S
where S.skuid=1187
--------------------------------------
UPDATE S
SET S.SkuName='1202-Suite-UAL-2-12'
from Sku S
where S.skuid=1202
-------------------------------------
UPDATE S
SET S.SkuName='1210-Suite-UAL-7-4'
from Sku S
where S.skuid=1210
-------------------------------------
UPDATE S
SET S.SkuName='1218-Suite-UAL-2-7'
from Sku S
where S.skuid=1218
-------------------------------------
UPDATE S
SET S.SkuName='1236-Suite-ULO-1-3'
from Sku S
where S.skuid=1236
-------------------------------------
UPDATE S
SET S.SkuName='1244-Suite-UAL-27-10'
from Sku S
where S.skuid=1244
----------------------------------------
UPDATE S
SET S.SkuName='1252-Suite-UAL-10-0'
from Sku S
where S.skuid=1252
----------------------------------------
UPDATE S
SET S.SkuName='1314-Suite-ULO-1-9'
from Sku S
where S.skuid=1314
-----------------------------------------
UPDATE S
SET S.SkuName='1322-Suite-UAL-4-0'
from Sku S
where S.skuid=1322
-------------------------------------------
UPDATE S
SET S.SkuName='1330-Suite-ULO-6-4'
from Sku S
where S.skuid=1330
------------------------------------------
UPDATE S
SET S.SkuName='1340-Suite-USW-1-0'
from Sku S
where S.skuid=1340
------------------------------------------------------------------------------------------------
--SELECT * FROM Product WHERE ProductID IN (1,2,5)-----------------------------------------------
--SELECT * FROM Product WHERE ProductID IN (166,167,168)
-------------------------------------------------------------------------------------------------
UPDATE S
SET S.SkuName='526-Suite-CHI-30-4'
from Sku S
where S.skuid=526
------------------------------------
UPDATE S
SET S.SkuName='1043-Suite-CTO-3-4'
from Sku S
where S.skuid=1043
-------------------------------------
UPDATE S
SET S.SkuName='1364-Suite-USC-3-9'
from Sku S
where S.skuid=1364
------------------------------------
UPDATE S
SET S.SkuName='1372-Suite-ULO-3-0'
from Sku S
where S.skuid=1372
------------------------------------
UPDATE S
SET S.SkuName='1372-Suite-ULO-3-0'
from Sku S
where S.skuid=1372
-----------------------------------
UPDATE S
SET S.SkuName='1405-Suite-UAL-5-0'
from Sku S
where S.skuid=1405
----------------------------------
UPDATE S
SET S.SkuName='1438-Suite-USC-3-4'
from Sku S
where S.skuid=1438
-----------------------------------
UPDATE S
SET S.SkuName='1438-Suite-USC-3-4'
from Sku S
where S.skuid=1438
----------------------------------
UPDATE S
SET S.SkuName='1508-Suite-UAL-1-7'
from Sku S
where S.skuid=1508
-----------------------------------
UPDATE S
SET S.SkuName='1516-Suite-UAL-35-4'
from Sku S
where S.skuid=1516
------------------------------------
UPDATE S
SET S.SkuName='1575-Suite-UAL-43-0'
from Sku S
where S.skuid=1575
------------------------------------
UPDATE S
SET S.SkuName='1575-Suite-UAL-43-0'
from Sku S
where S.skuid=1575
------------------------------------
UPDATE S
SET S.SkuName='1636-Suite-CTO-7-0'
from Sku S
where S.skuid=1636
-----------------------------------
UPDATE S
SET S.SkuName='1636-Suite-CTO-7-0'
from Sku S
where S.skuid=1636
-------------------------------------
UPDATE S
SET S.SkuName='1652-Suite-USC-1-12'
from Sku S
where S.skuid=1652
---------------------------------------
UPDATE S
SET S.SkuName='1678-Suite-UAL-23-4'
from Sku S
where S.skuid=1678
--------------------------------------
UPDATE S
SET S.SkuName='1678-Suite-UAL-23-4'
from Sku S
where S.skuid=1678
------------------------------------
UPDATE S
SET S.SkuName='1711-Suite-USE-8-4'
from Sku S
where S.skuid=1711
-----------------------------------
UPDATE S
SET S.SkuName='1727-Suite-UAL-1-5'
from Sku S
where S.skuid=1727
------------------------------------
UPDATE S
SET S.SkuName='1743-Suite-UAL-2-4'
from Sku S
where S.skuid=1743
------------------------------------
UPDATE S
SET S.SkuName='1784-Suite-UMI-1-12'
from Sku S
where S.skuid=1784
-------------------------------------
UPDATE S
SET S.SkuName='1804-Suite-UAL-2-13'
from Sku S
where S.skuid=1804
------------------------------------
UPDATE S
SET S.SkuName='1844-Suite-ULO-2-4'
from Sku S
where S.skuid=1844
-------------------------------------
UPDATE S
SET S.SkuName='1868-Suite-USE-5-0'
from Sku S
where S.skuid=1868
------------------------------------
UPDATE S
SET S.SkuName='1903-Suite-UAL-1-13'
from Sku S
where S.skuid=1903
------------------------------------
UPDATE S
SET S.SkuName='1920-Suite-UAL-2-9'
from Sku S
where S.skuid=1920
------------------------------------
UPDATE S
SET S.SkuName='1928-Suite-USE-5-9'
from Sku S
where S.skuid=1928
-----------------------------------
UPDATE S
SET S.SkuName='1928-Suite-USE-5-9'
from Sku S
where S.skuid=1928
------------------------------------
UPDATE S
SET S.SkuName='1936-Suite-UAL-1-15'
from Sku S
where S.skuid=1936
-------------------------------------
UPDATE S
SET S.SkuName='1936-Suite-UAL-1-15'
from Sku S
where S.skuid=1936
------------------------------------
UPDATE S
SET S.SkuName='1952-Suite-UAL-79-4'
from Sku S
where S.skuid=1952
-----------------------------------
UPDATE S
SET S.SkuName='1976-Suite-CGO-4-0'
from Sku S
where S.skuid=1976
-----------------------------------
UPDATE S
SET S.SkuName='2002-Suite-UAL-3-4'
from Sku S
where S.skuid=2002
------------------------------------
UPDATE S
SET S.SkuName='2010-Suite-UAL-8-4'
from Sku S
where S.skuid=2010
------------------------------------
UPDATE S
SET S.SkuName='2092-Suite-UAL-20-0'
from Sku S
where S.skuid=2092
-----------------------------------
UPDATE S
SET S.SkuName='2143-Suite-UAL-1-12'
from Sku S
where S.skuid=2143
-----------------------------------
UPDATE S
SET S.SkuName='2160-Suite-UAL-11-4'
from Sku S
where S.skuid=2160
------------------------------------
UPDATE S
SET S.SkuName='2160-Suite-UAL-11-4'
from Sku S
where S.skuid=2160
-----------------------------------
UPDATE S
SET S.SkuName='2186-Combo-SFL-2-0'
from Sku S
where S.skuid=2186
-----------------------------------
UPDATE S
SET S.SkuName='2190-Suite-UNO-2-9'
from Sku S
where S.skuid=2190
-----------------------------------
UPDATE S
SET S.SkuName='2260-Suite-UAL-3-7'
from Sku S
where S.skuid=2260
-------------------------------------
UPDATE S
SET S.SkuName='2277-Suite-UAL-5-6'
from Sku S
where S.skuid=2277
--------------------------------
UPDATE S
SET S.SkuName='2342-Combo-SFL-1-0'
from Sku S
where S.skuid=2342
--------------------------------
UPDATE S
SET S.SkuName='2359-Suite-CTO-4-3'
from Sku S
where S.skuid=2359
-----------------------------------
UPDATE S
SET S.SkuName='2359-Suite-CTO-4-3'
from Sku S
where S.skuid=2359
------------------------------------
UPDATE S
SET S.SkuName='2375-Suite-UNO-2-0'
from Sku S
where S.skuid=2375
-----------------------------------
UPDATE S
SET S.SkuName='2383-Suite-ULO-2-3'
from Sku S
where S.skuid=2383
-------------------------------------
UPDATE S
SET S.SkuName='2391-Suite-CTO-4-13'
from Sku S
where S.skuid=2391
-------------------------------------
UPDATE S
SET S.SkuName='2407-Suite-UAL-2-3'
from Sku S
where S.skuid=2407
----------------------------------------
UPDATE S
SET S.SkuName='2415-Suite-CHI-3-13'
from Sku S
where S.skuid=2415
----------------------------------------
UPDATE S
SET S.SkuName='2426-Suite-ULO-5-4'
from Sku S
where S.skuid=2426
---------------------------------------
UPDATE S
SET S.SkuName='2496-Suite-ULO-4-7'
from Sku S
where S.skuid=2496
--------------------------------------
UPDATE S
SET S.SkuName='2496-Suite-ULO-4-7'
from Sku S
where S.skuid=2496
--------------------------------------
UPDATE S
SET S.SkuName='2496-Suite-ULO-4-7'
from Sku S
where S.skuid=2496
-------------------------------------
UPDATE S
SET S.SkuName='2590-Suite-CTO-7-4'
from Sku S
where S.skuid=2590
-------------------------------------
UPDATE S
SET S.SkuName='2606-Suite-UAL-1-6'
from Sku S
where S.skuid=2606
-------------------------------------
UPDATE S
SET S.SkuName='2618-Suite-CCA-1-0'
from Sku S
where S.skuid=2618
-------------------------------------
UPDATE S
SET S.SkuName='2618-Suite-CCA-1-0'
from Sku S
where S.skuid=2618
--------------------------------------
UPDATE S
SET S.SkuName='2618-Suite-CCA-1-0'
from Sku S
where S.skuid=2618
--------------------------------------
UPDATE S
SET S.SkuName='2746-Suite-USC-8-12'
from Sku S
where S.skuid=2746
---------------------------------------
UPDATE S
SET S.SkuName='2762-Suite-USW-1-4'
from Sku S
where S.skuid=2762
-----------------------------------
UPDATE S
SET S.SkuName='2820-Suite-USE-4-0'
from Sku S
where S.skuid=2820
----------------------------------
UPDATE S
SET S.SkuName='2844-Suite-UAL-6-4'
from Sku S
where S.skuid=2844
---------------------------------
UPDATE S
SET S.SkuName='2861-Suite-UMI-1-4'
from Sku S
where S.skuid=2861
---------------------------------
UPDATE S
SET S.SkuName='2883-Suite-UAL-1-3'
from Sku S
where S.skuid=2883
-----------------------------------
UPDATE S
SET S.SkuName='2891-Suite-UAL-1-16'
from Sku S
where S.skuid=2891
------------------------------------
UPDATE S
SET S.SkuName='2908-Suite-UNW-1-4'
from Sku S
where S.skuid=2908
-----------------------------------
UPDATE S
SET S.SkuName='2916-Suite-UNO-2-4'
from Sku S
where S.skuid=2916
----------------------------------
UPDATE S
SET S.SkuName='3050-Suite-UNW-4-0'
from Sku S
where S.skuid=3050
----------------------------------
UPDATE S
SET S.SkuName='3108-Suite-UAL-10-6'
from Sku S
where S.skuid=3108
-------------------------------------
UPDATE S
SET S.SkuName='3194-Suite-UAL-25-4'
from Sku S
where S.skuid=3194
-------------------------------------
UPDATE S
SET S.SkuName='3218-Suite-CCA-2-6'
from Sku S
where S.skuid=3218
------------------------------------
UPDATE S
SET S.SkuName='3226-Suite-CVA-2-6'
from Sku S
where S.skuid=3226
------------------------------------
UPDATE S
SET S.SkuName='3243-Suite-ULO-4-12'
from Sku S
where S.skuid=3243
------------------------------------
UPDATE S
SET S.SkuName='3259-Suite-USA-2-0'
from Sku S
where S.skuid=3259
------------------------------------- 
UPDATE S
SET S.SkuName='3283-Suite-UMI-4-9'
from Sku S
where S.skuid=3283
-------------------------------------
UPDATE S
SET S.SkuName='3324-Suite-UAL-500-0'
from Sku S
where S.skuid=3324
-------------------------------------
UPDATE S
SET S.SkuName='3373-Suite-UNO-6-9'
from Sku S
where S.skuid=3373
--------------------------------------
UPDATE S
SET S.SkuName='3389-Suite-UNW-2-4'
from Sku S
where S.skuid=3389
-------------------------------------
UPDATE S
SET S.SkuName='3464-Suite-UAL-12-4'
from Sku S
where S.skuid=3464
------------------------------------
UPDATE S
SET S.SkuName='3489-Suite-UMI-4-4'
from Sku S
where S.skuid=3489
-------------------------------------
UPDATE S
SET S.SkuName='3505-Suite-ULO-23-4'
from Sku S
where S.skuid=3505
-------------------------------------
UPDATE S
SET S.SkuName='3520-Suite-UNO-1-0'
from Sku S
where S.skuid=3520
------------------------------------------
UPDATE S
SET S.SkuName='3540-Suite-UAL-85-0'
from Sku S
where S.skuid=3540
------------------------------------------
UPDATE S
SET S.SkuName='3705-Suite-UAL-3-12'
from Sku S
where S.skuid=3705
----------------------------------------
UPDATE S
SET S.SkuName='3713-Suite-UAL-50-16'
from Sku S
where S.skuid=3713
----------------------------------------
UPDATE S
SET S.SkuName='3755-Suite-UAL-18-4'
from Sku S
where S.skuid=3755
---------------------------------------
UPDATE S
SET S.SkuName='3778-Suite-UAL-4-9'
from Sku S
where S.skuid=3778
---------------------------------------
UPDATE S
SET S.SkuName='3803-Suite-UAL-8-0'
from Sku S
where S.skuid=3803
---------------------------------------
UPDATE S
SET S.SkuName='3835-Suite-UAL-9-4'
from Sku S
where S.skuid=3835
---------------------------------------
UPDATE S
SET S.SkuName='3852-Suite-UAL-5-12'
from Sku S
where S.skuid=3852
---------------------------------------
UPDATE S
SET S.SkuName='3860-Suite-UMI-3-4'
from Sku S
where S.skuid=3860
---------------------------------------
UPDATE S
SET S.SkuName='3869-Suite-UMI-9-4'
from Sku S
where S.skuid=3869
------------------------------------
UPDATE S
SET S.SkuName='3892-Suite-UMI-5-0'
from Sku S
where S.skuid=3892
-------------------------------------
UPDATE S
SET S.SkuName='3909-Suite-UNO-10-9'
from Sku S
where S.skuid=3909
------------------------------------
UPDATE S
SET S.SkuName='3925-Suite-USE-4-13'
from Sku S
where S.skuid=3925
------------------------------------
UPDATE S
SET S.SkuName='3941-Suite-UAL-7-6'
from Sku S
where S.skuid=3941
------------------------------------
UPDATE S
SET S.SkuName='3966-Suite-UAL-70-0'
from Sku S
where S.skuid=3966
------------------------------------
UPDATE S
SET S.SkuName='3983-Suite-UNO-1-4'
from Sku S
where S.skuid=3983
-------------------------------------
UPDATE S
SET S.SkuName='4017-Suite-USC-1-4'
from Sku S
where S.skuid=4017
--------------------------------------
UPDATE S
SET S.SkuName='4039-Suite-USE-4-3'
from Sku S
where S.skuid=4039
---------------------------------------
UPDATE S
SET S.SkuName='4073-Suite-USC-6-4'
from Sku S
where S.skuid=4073
---------------------------------------
UPDATE S
SET S.SkuName='4108-Suite-UAL-4-6'
from Sku S
where S.skuid=4108
--------------------------------------
UPDATE S
SET S.SkuName='4116-Suite-UAL-4-7'
from Sku S
where S.skuid=4116
--------------------------------------
UPDATE S
SET S.SkuName='4150-Suite-UAL-10-7'
from Sku S
where S.skuid=4150
--------------------------------------
UPDATE S
SET S.SkuName='4167-Suite-UNO-4-9'
from Sku S
where S.skuid=4167
--------------------------------------
UPDATE S
SET S.SkuName='4178-Suite-UMI-9-9'
from Sku S
where S.skuid=4178
--------------------------------------
UPDATE S
SET S.SkuName='4266-Suite-UAL-10-11'
from Sku S
where S.skuid=4266
--------------------------------------
UPDATE S
SET S.SkuName='4282-Suite-UMI-10-0'
from Sku S
where S.skuid=4282
--------------------------------------
UPDATE S
SET S.SkuName='4324-Suite-UAL-2-6'
from Sku S
where S.skuid=4324
--------------------------------------
UPDATE S
SET S.SkuName='4394-Suite-UAL-21-4'
from Sku S
where S.skuid=4394
---------------------------------------
UPDATE S
SET S.SkuName='4442-Suite-UMI-2-7'
from Sku S
where S.skuid=4442
---------------------------------------
UPDATE S
SET S.SkuName='4624-Suite-USE-1-12'
from Sku S
where S.skuid=4624
--------------------------------------
UPDATE S
SET S.SkuName='4640-Suite-USE-5-12'
from Sku S
where S.skuid=4640
--------------------------------------
UPDATE S
SET S.SkuName='4659-Suite-UAL-14-13'
from Sku S
where S.skuid=4659
--------------------------------------
UPDATE S
SET S.SkuName='4842-Suite-ULO-3-13'
from Sku S
where S.skuid=4842
--------------------------------------
UPDATE S
SET S.SkuName='4862-Suite-UNW-5-10'
from Sku S
where S.skuid=4862
--------------------------------------
UPDATE S
SET S.SkuName='4986-Suite-UNO-4-12'
from Sku S
where S.skuid=4986
------------------------------------
UPDATE S
SET S.SkuName='5018-Suite-UAL-6-3'
from Sku S
where S.skuid=5018
-------------------------------------
UPDATE S
SET S.SkuName='5239-Combo-CHI-4-4'
from Sku S
where S.skuid=5239
-------------------------------------
UPDATE S
SET S.SkuName='5659-Combo-WAS-1-0'
from Sku S
where S.skuid=5659
--------------------------------------
UPDATE S
SET S.SkuName='5659-Combo-WAS-1-0'
from Sku S
where S.skuid=5659
-------------------------------------
UPDATE S
SET S.SkuName='6084-Suite-CHI-2-0'
from Sku S
where S.skuid=6084
-------------------------------------
UPDATE S
SET S.SkuName='6688-Suite-SFO-6-4'
from Sku S
where S.skuid=6688
-------------------------------------
UPDATE S
SET S.SkuName='6710-Combo-CHI-1-4'
from Sku S
where S.skuid=6710
-------------------------------------
UPDATE S
SET S.SkuName='6732-Combo-GA1-1-0'
from Sku S
where S.skuid=6732
-------------------------------------
UPDATE S
SET S.SkuName='7180-Property-SBA-2-0'
from Sku S
where S.skuid=7180
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
----------------------------  LAST PLACE TO START FROM 04.11.17 ----------------------------------------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
UPDATE S
SET S.SkuName='3629-Suite-USC-2-5'
from Sku S
where S.skuid=3629
----------------------------------------------------------
UPDATE S
SET S.SkuName='4690-Suite-ULO-4-0'
from Sku S
where S.skuid=4690
-----------------------------------------------------------
UPDATE S
SET S.SkuName='4811-Suite-CCA-4-7'
from Sku S
where S.skuid=4811
------------------------------------------------------------
UPDATE S
SET S.SkuName='4819-Suite-CVA-4-7'
from Sku S
where S.skuid=4819
------------------------------------------------------------
UPDATE S
SET S.SkuName='4827-Suite-CGO-4-7'
from Sku S
where S.skuid=4827
------------------------------------------------------------
UPDATE S
SET S.SkuName='9579-Suite-SFO-2-4'
from Sku S
where S.skuid=9579
------------------------------------------------------------
UPDATE S
SET S.SkuName='9594-Combo-NNJ-1-0'
from Sku S
where S.skuid=9594
-----------------------------------------------------------
UPDATE S
SET S.SkuName='10139-Suite-USE-6-4'
from Sku S
where S.skuid=10139
----------------------------------------------------------
UPDATE S
SET S.SkuName='10139-Suite-USE-6-4'
from Sku S
where S.skuid=10139
-----------------------------------------------------------
UPDATE S
SET S.SkuName='10922-Suite-SFO-76-4'
from Sku S
where S.skuid=10922
------------------------------------------------------------
UPDATE S
SET S.SkuName='11010-Suite-CHI-5-4'
from Sku S
where S.skuid=11010
------------------------------------------------------------
UPDATE S
SET S.SkuName='11010-Suite-CHI-5-4'
from Sku S
where S.skuid=11010
------------------------------------------------------------
UPDATE S
SET S.SkuName='11099-Suite-UAL-2-15'
from Sku S
where S.skuid=11099
------------------------------------------------------------
UPDATE S
SET S.SkuName='11212-Suite-CHI-3-0'
from Sku S
where S.skuid=11212
-------------------------------------------------------------
UPDATE S
SET S.SkuName='11330-Suite-SFO-2-7'
from Sku S
where S.skuid=11330
--------------------------------------------------------------
UPDATE S
SET S.SkuName='11452-Property-CO1-2-0'
from Sku S
where S.skuid=11452
-------------------------------------------------------------
UPDATE S
SET S.SkuName='11452-Property-CO1-2-0'
from Sku S
where S.skuid=11452
-------------------------------------------------------------
UPDATE S
SET S.SkuName='11455-Suite-CHI-3-7'
from Sku S
where S.skuid=11455
------------------------------------------------------------
UPDATE S
SET S.SkuName='11735-Suite-SFO-23-4'
from Sku S
where S.skuid=11735
-------------------------------------------------------------
UPDATE S
SET S.SkuName='11959-Property-SFL-2-0'
from Sku S
where S.skuid=11959
------------------------------------------------------------
UPDATE S
SET S.SkuName='12004-Suite-CHI-2-10'
from Sku S
where S.skuid=12004
------------------------------------------------------------
UPDATE S
SET S.SkuName='12057-Suite-CHI-1-7'
from Sku S
where S.skuid=12057
------------------------------------------------------------
UPDATE S
SET S.SkuName='12122-Suite-UAL-152-4'
from Sku S
where S.skuid=12122
------------------------------------------------------------
UPDATE S
SET S.SkuName='12192-Suite-UAL-86-4'
from Sku S
where S.skuid=12192
------------------------------------------------------------
UPDATE S
SET S.SkuName='12413-Suite-ULO-7-4'
from Sku S
where S.skuid=12413
------------------------------------------------------------
UPDATE S
SET S.SkuName='13079-Suite-SFO-3-0'
from Sku S
where S.skuid=13079
-------------------------------------------------------------
UPDATE S
SET S.SkuName='13079-Suite-SFO-3-0'
from Sku S
where S.skuid=13079
---------------------------------------------------------------
UPDATE S
SET S.SkuName='14099-Suite-UAL-30-4'
from Sku S
where S.skuid=14099
---------------------------------------------------------
UPDATE S
SET S.SkuName='14268-Suite-CHI-1-10'
from Sku S
where S.skuid=14268
---------------------------------------------------------
UPDATE S
SET S.SkuName='14777-Suite-SFO-4-12'
from Sku S
where S.skuid=14777
--------------------------------------------------------
UPDATE S
SET S.SkuName='14929-Suite-SFO-8-0'
from Sku S
where S.skuid=14929
--------------------------------------------------------
UPDATE S
SET S.SkuName='14937-Suite-CHI-2-13'
from Sku S
where S.skuid=14937
-------------------------------------------------------
UPDATE S
SET S.SkuName='15533-Suite-UAL-9-1'
from Sku S
where S.skuid=15533
------------------------------------------------------
UPDATE S
SET S.SkuName='15533-Suite-UAL-9-1'
from Sku S
where S.skuid=15533
-----------------------------------------------------
UPDATE S
SET S.SkuName='15630-Suite-CHI-4-12'
from Sku S
where S.skuid=15630
------------------------------------------------------
UPDATE S
SET S.SkuName='15696-Suite-SFO-4-4'
from Sku S
where S.skuid=15696
-----------------------------------------------------
UPDATE S
SET S.SkuName='15841-Property-SLO-22-4'
from Sku S
where S.skuid=15841
----------------------------------------------------
UPDATE S
SET S.SkuName='16056-Suite-UMI-1-3'
from Sku S
where S.skuid=16056
------------------------------------------------------
UPDATE S
SET S.SkuName='16319-Suite-CHI-1-13'
from Sku S
where S.skuid=16319
-------------------------------------------------------
UPDATE S
SET S.SkuName='16881-Suite-UKN-1-4'
from Sku S
where S.skuid=16881
------------------------------------------------------
UPDATE S
SET S.SkuName='17002-Suite-CHI-4-13'
from Sku S
where S.skuid=17002
------------------------------------------------------
UPDATE S
SET S.SkuName='17012-Combo-SFO-1-9'
from Sku S
where S.skuid=17012
------------------------------------------------------
UPDATE S
SET S.SkuName='17012-Combo-SFO-1-9'
from Sku S
where S.skuid=17012
-----------------------------------------------------
UPDATE S
SET S.SkuName='18237-Suite-CHI-36-9'
from Sku S
where S.skuid=18237
-----------------------------------------------------
UPDATE S
SET S.SkuName='18979-Suite-SFO-1-16'
from Sku S
where S.skuid=18979
------------------------------------------------------
UPDATE S
SET S.SkuName='18987-Suite-CHI-4-0'
from Sku S
where S.skuid=18987
------------------------------------------------------
UPDATE S
SET S.SkuName='19011-Property-WA1-4-4'
from Sku S
where S.skuid=19011
-----------------------------------------------------
UPDATE S
SET S.SkuName='19011-Property-WA1-4-4'
from Sku S
where S.skuid=19011
-----------------------------------------------------
UPDATE S
SET S.SkuName='19034-Combo-TN1-4-0'
from Sku S
where S.skuid=19034
------------------------------------------------
UPDATE S
SET S.SkuName='19037-Combo-AR1-4-0'
from Sku S
where S.skuid=19037
---------------------------------------------
UPDATE S
SET S.SkuName='19089-Suite-CHI-3-4'
from Sku S
where S.skuid=19089
---------------------------------------------
UPDATE S
SET S.SkuName='19175-Suite-CHI-2-4'
from Sku S
where S.skuid=19175
---------------------------------------------
UPDATE S
SET S.SkuName='19549-Property-TX1-12-0'
from Sku S
where S.skuid=19549
---------------------------------------------
UPDATE S
SET S.SkuName='19784-Property-SMC-2-0'
from Sku S
where S.skuid=19784
---------------------------------------------
UPDATE S
SET S.SkuName='19804-Property-SMC-4-0'
from Sku S
where S.skuid=19804
---------------------------------------------
UPDATE S
SET S.SkuName='19940-Property-0AA-1-0'
from Sku S
where S.skuid=19940
---------------------------------------------
UPDATE S
SET S.SkuName='20960-Suite-UAL-264-4'
from Sku S
where S.skuid=20960
---------------------------------------------
UPDATE S
SET S.SkuName='21107-Combo-AVL-1-0'
from Sku S
where S.skuid=21107
----------------------------------------------
UPDATE S
SET S.SkuName='21225-Property-SLO-1-0'
from Sku S
where S.skuid=21225
----------------------------------------------
UPDATE S
SET S.SkuName='21372-Property-MA1-2-0'
from Sku S
where S.skuid=21372
---------------------------------------------
UPDATE S
SET S.SkuName='21400-Combo-CHT-4-0'
from Sku S
where S.skuid=21400
---------------------------------------------
UPDATE S
SET S.SkuName='21757-Suite-UKN-6-7'
from Sku S
where S.skuid=21757
--------------------------------------------
UPDATE S
SET S.SkuName='21757-Suite-UKN-6-7'
from Sku S
where S.skuid=21757
-------------------------------------------
UPDATE S
SET S.SkuName='21823-Property-TX1-1-12'
from Sku S
where S.skuid=21823
-------------------------------------------
UPDATE S
SET S.SkuName='21826-Property-DE1-1-12'
from Sku S
where S.skuid=21826
-------------------------------------------
UPDATE S
SET S.SkuName='22005-Suite-UAL-237-0'
from Sku S
where S.skuid=22005
-------------------------------------------
UPDATE S
SET S.SkuName='22132-Suite-CHI-14-0'
from Sku S
where S.skuid=22132
-------------------------------------------
UPDATE S
SET S.SkuName='22156-Property-OH1-5-0'
from Sku S
where S.skuid=22156
------------------------------------------
UPDATE S
SET S.SkuName='22245-Property-IL1-5-4'
from Sku S
where S.skuid=22245
------------------------------------------
UPDATE S
SET S.SkuName='22249-Combo-FL1-1-4'
from Sku S
where S.skuid=22249
------------------------------------------
UPDATE S
SET S.SkuName='22271-Suite-SFO-5-0'
from Sku S
where S.skuid=22271
------------------------------------------
UPDATE S
SET S.SkuName='22492-Property-SBA-4-4'
from Sku S
where S.skuid=22492
------------------------------------------
UPDATE S
SET S.SkuName='22561-Property-4ON-1-0'
from Sku S
where S.skuid=22561
-----------------------------------------
UPDATE S
SET S.SkuName='22645-Suite-CHI-1-6'
from Sku S
where S.skuid=22645
----------------------------------------
UPDATE S
SET S.SkuName='22767-Combo-FL1-1-0'
from Sku S
where S.skuid=22767
---------------------------------------
UPDATE S
SET S.SkuName='22825-Suite-CHI-9-4'
from Sku S
where S.skuid=22825
----------------------------------------
UPDATE S
SET S.SkuName='22895-Suite-NNJ-17-0'
from Sku S
where S.skuid=22895
-----------------------------------------
UPDATE S
SET S.SkuName='22975-Property-WA1-7-0'
from Sku S
where S.skuid=22975
-------------------------------------------
UPDATE S
SET S.SkuName='23076-Suite-UAL-26-4'
from Sku S
where S.skuid=23076
-------------------------------------------
UPDATE S
SET S.SkuName='23194-Combo-FL1-15-0'
from Sku S
where S.skuid=23194
---------------------------------------------
----UPDATE S
----SET S.SkuName='23355-Suite-UKN-13-0'
----from Sku S
----where S.skuid=23355
------------------------------------------------
UPDATE S
SET S.SkuName='23757-Combo-SBA-2-0'
from Sku S
where S.skuid=23757
------------------------------------------------
UPDATE S
SET S.SkuName='24341-Combo-BFL-5-0'
from Sku S
where S.skuid=24341
------------------------------------------------
UPDATE S
SET S.SkuName='24386-Combo-SBA-7-0'
from Sku S
where S.skuid=24386
------------------------------------------------
UPDATE S
SET S.SkuName='24409-Property-SLO-1-7'
from Sku S
where S.skuid=24409
------------------------------------------------
UPDATE S
SET S.SkuName='24718-Property-SLO-4-0'
from Sku S
where S.skuid=24718
--------------------------------------------------
UPDATE S
SET S.SkuName='24773-Suite-SFO-6-0'
from Sku S
where S.skuid=24773
-------------------------------------------------
UPDATE S
SET S.SkuName='24795-Combo-ROC-1-0'
from Sku S
where S.skuid=24795
-----------------------------------------------
UPDATE S
SET S.SkuName='24898-Combo-MA1-2-4'
from Sku S
where S.skuid=24898
-----------------------------------------------
UPDATE S
SET S.SkuName='25023-Combo-WA1-7-0'
from Sku S
where S.skuid=25023
------------------------------------------------
UPDATE S
SET S.SkuName='25046-Combo-ALB-1-0'
from Sku S
where S.skuid=25046
-----------------------------------------------
UPDATE S
SET S.SkuName='25169-Combo-TX1-6-4'
from Sku S
where S.skuid=25169
----------------------------------------------
UPDATE S
SET S.SkuName='25435-Combo-NC1-8-0'
from Sku S
where S.skuid=25435
----------------------------------------------
UPDATE S
SET S.SkuName='25623-Suite-SFO-21-4'
from Sku S
where S.skuid=25623
------------------------------------------------
UPDATE S
SET S.SkuName='25773-Suite-SFO-15-4'
from Sku S
where S.skuid=25773
------------------------------------------------
UPDATE S
SET S.SkuName='25802-Suite-SFO-17-0'
from Sku S
where S.skuid=25802
-------------------------------------------------
UPDATE S
SET S.SkuName='25926-Combo-SLO-1-0'
from Sku S
where S.skuid=25926
--------------------------------------------------
UPDATE S
SET S.SkuName='26110-Combo-SYR-1-0'
from Sku S
where S.skuid=26110
----------------------------------------------------















































































SELECT * FROM SkuPrice WHERE PRICE>4 AND SkuName IS NOT NULL

SELECT * 
INTO #SKU
FROM Sku

SELECT * FROM #SKU

INSERT INTO [dbo].[Sku]
           ([SKUID]
            ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[Amount])
     SELECT
           [SKUID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[Amount]
FROM #SKU


SELECT count(*)  FROM Sku

UPDATE S
SET S.SkuName=P.SkuName
FROM Sku S JOIN SkuPrice P on S.SKUID=P.SKUID
-------------------------------------------------------------------


SELECT SKUID , COUNT(*) CNT
FROM SKU
GROUP BY SKUID

SELECT * FROM SKU WHERE ProductID NOT IN (1)
SELECT * FROM SKU WHERE ProductID NOT IN (2)
SELECT * FROM SKU WHERE ProductID NOT IN (5)


SELECT S.SKUID, COUNT(*)
FROM (SELECT * FROM SKU WHERE ProductID NOT IN (1)) S
GROUP BY S.SKUID

SELECT * FROM SKU
ORDER BY SKUID,ProductID
-------------------------------------------------

SELECT

 * 
INTO #SKU_NOT_3
 FROM SKU WHERE ProductID NOT IN (3)
 --------------------------------------------------

 SELECT * FROM #SKU_NOT_1
 ORDER BY SKUID, PRODUCTID

 SELECT  * FROM Sku ORDER BY SKUID, ProductID
 ---------------------------------------------------
 --- PRICE THE OTHER PRODUCTS ----------------------
 ---------------------------------------------------
 ---------------------------------------------------
UPDATE S
SET S.SkuName='2536-Suite-USA-110-14'
FROM Sku S
WHERE skuid=2536
----------------------------------------------
UPDATE S
SET S.SkuName='2563-Suite-USA-87-0'
FROM Sku S
WHERE skuid=2563
---------------------------------------------
UPDATE S
SET S.SkuName='2572-Suite-USA-85-0'
FROM Sku S
WHERE skuid=2572
----------------------------------------------
UPDATE S
SET S.SkuName='2581-Suite-USA-84-0'
FROM Sku S
WHERE skuid=2581
----------------------------------------------
UPDATE S
SET S.SkuName='3032-Suite-USA-49-0'
FROM Sku S
WHERE skuid=3032
----------------------------------------------
UPDATE S
SET S.SkuName='3092-Suite-USA-52-7'
FROM Sku S
WHERE skuid=3092
----------------------------------------------
UPDATE S
SET S.SkuName='3291-Suite-USA-20-9'
FROM Sku S
WHERE skuid=3291
--------------------------------------------------------------------
UPDATE S
SET S.SkuName='3438-Suite-USA-4-1'
FROM Sku S
WHERE skuid=3438
--------------------------------------------------------------------
UPDATE S
SET S.SkuName='3605-Suite-USA-0-14'
FROM Sku S
WHERE skuid=3605
-------------------------------------------------------------------
UPDATE S
SET S.SkuName='3721-Suite-USA-54-7'
FROM Sku S
WHERE skuid=3721
--------------------------------------------------------------
UPDATE S
SET S.SkuName='3843-Suite-USA-2-14'
FROM Sku S
WHERE skuid=3843
--------------------------------------------------------------
UPDATE S
SET S.SkuName='4290-Suite-POR-24-4'
FROM Sku S
WHERE skuid=4290
-------------------------------------------------------------
UPDATE S
SET S.SkuName='4332-Suite-USA-12-12'
FROM Sku S
WHERE skuid=4332
-------------------------------------------------------------
UPDATE S
SET S.SkuName='4362-Suite-USA-63-7'
FROM Sku S
WHERE skuid=4362
--------------------------------------------------------------
UPDATE S
SET S.SkuName='4723-Suite-FL1-15-12'
FROM Sku S
WHERE skuid=4723
--------------------------------------------------------------
UPDATE S
SET S.SkuName='8481-Suite-USA-0-4'
FROM Sku S
WHERE skuid=8481
------------------------------------------------------------
UPDATE S
SET S.SkuName='13122-Suite-DEN-15-10'
FROM Sku S
WHERE skuid=13122
-----------------------------------------------------------
UPDATE S
SET S.SkuName='17744-Suite-USA-78-0'
FROM Sku S
WHERE skuid=17744
------------------------------------------------------------
UPDATE S
SET S.SkuName='17899-Suite-USA-19-0'
FROM Sku S
WHERE skuid=17899
------------------------------------------------------------
UPDATE S
SET S.SkuName='18162-Suite-NNJ-47-4'
FROM Sku S
WHERE skuid=18162
---------------------------------------------------------
UPDATE S
SET S.SkuName='18170-Suite-NNJ-13-4'
FROM Sku S
WHERE skuid=18170
--------------------------------------------------------
UPDATE S
SET S.SkuName='20223-Suite-USA-4-14'
FROM Sku S
WHERE skuid=20223
----------------------------------------------------
UPDATE S
SET S.SkuName='21132-Suite-USA-13-13'
FROM Sku S
WHERE skuid=21132
----------------------------------------------------
UPDATE S
SET S.SkuName='21488-Suite-USA-116-0'
FROM Sku S
WHERE skuid=21488
----------------------------------------------------
UPDATE S
SET S.SkuName='22581-Suite-USA-55-0'
FROM Sku S
WHERE skuid=22581
---------------------------------------------------
UPDATE S
SET S.SkuName='23056-Suite-USA-26-4'
FROM Sku S
WHERE skuid=23056
-------------------------------------------------
UPDATE S
SET S.SkuName='23056-Suite-USA-26-4'
FROM Sku S
WHERE skuid=23056
--------------------------------------------------
UPDATE S
SET S.SkuName='24161-Suite-USA-1-8'
FROM Sku S
WHERE skuid=24161
--------------------------------------------------
UPDATE S
SET S.SkuName='25488-Suite-USA-61-0'
FROM Sku S
WHERE skuid=25488
--------------------------------------------------
UPDATE S
SET S.SkuName='25488-Suite-USA-61-0'
FROM Sku S
WHERE skuid=25488






[dbo].[Contract_Input_List]




-------------------------------------
truncate table [dbo].[LineItem1]
select * from [dbo].[LineItem1]


EXEC [dbo].[uspLOAD_LineItem]


select count(*) from LineItem1;
select count(*) from [dbo].[LineItem];

TRUNCATE TABLE [dbo].[LineItem]


INSERT INTO [dbo].[LineItem]
           ([LineItemID]
           ,[ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount])


SELECT 
            [LineItemID]
           ,[ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount]

 from [dbo].LineItem1 where lineitemid not in (select LineItemID from LineItem_1stbatch)
--157,223---need to add and process these additional lines
--123,578---
select count(*) from [dbo].LineItem1
-------------------------------------------------
��U S E   [ m a s t e r ]  
 G O  
 E X E C   m a s t e r . d b o . s p _ d e t a c h _ d b   @ d b n a m e   =   N ' C o S t a r '  
 G O  
 - - - - -  
  
 S E L E C T   C O U N T ( * )   F R O M   L I N E I T E M 1   - - -   6 8 2 3 1 1  
  
 S E L E C T   C O U N T ( * )   F R O M   L I N E I T E M 1   W H E R E   B U N D L E I D = - 1 - - - 6 8 2 3 1 1  
  
  
 S E L E C T   *    
 I N T O   S k u X  
 F R O M   S k u  
 - - - - - - - - -  
 S E L E C T   *  
 I N T O   S k u P r i c e X  
 f r o m   S k u P r i c e  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S E L E C T   *    
 I N T O   L i n e I t e m B X  
 F R O M  
 L I N E I T E M    
  
 D E L E T E   F R O M   [ d b o ] . [ L i n e I t e m ]   W H E R E   [ C o n t r a c t I D ]   N O T   I N   ( 7 )  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
 S E L E C T   *   F R O M   L I N E I T E M    
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S E L E C T   D I S T I N C T   C o n t r a c t I D    
 I N T O   C o n t r a c t _ I n p u t _ L i s t  
 F R O M   L I N E I T E M    
  
 s e l e c t   *   f r o m   C o n t r a c t _ I n p u t _ L i s t  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
 S E L E C T   *   F R O M   L i n e I t e m    
  
 S E L E C T   *   F R O M   L i n e I t e m B X   W H E R E   C O N T R A C T I D = 7  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 E X E C   [ d b o ] . [ u s p S K U b ]   7  
  
  
 S E L E C T   *   F R O M   L I N E I T E M   O R D E R   B Y   D A T E   A S C  
  
 S E L E C T   C O U N T ( * )   F R O M   [ d b o ] . [ S k u ]  
 S E L E C T   C O U N T ( * )   F R O M   [ d b o ] . [ S k u X ]    
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 S E L E C T     D a t e I D = D A T E , A M T = S U M ( A M O U N T )  
 	 	 	 F R O M   L i n e I t e m    
 	 	 	           W H E R E   C o n t r a c t I D =   7   A N D   B u n d l e I D = - 1  
 	 	 	                   G R O U P   B Y   D A T E  
                                                 H A V I N G   S U M ( A M O U N T ) > 0  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S E L E C T   *   F R O M   S K U   W H E R E    
 P R O D U C T I D = 4 7   A N D    
  
 M A R K E T I D = ' U S A '   A N D   U s e r C o u n t = 1 3   a n d   C u s t o m e r T y p e = 4  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - ' ' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - 4 7 	 U S A 	 1 3 	 4 - - - - - - - > > > - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - 1 7 3 	 W A S 	 1 3 	 4 - - - - - - - - - > > > > - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - 1 7 3 	 B L T 	 1 3 	 4 - - - - - - - > > > - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - 5 	 N V A 	 1 3 	 4 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - ' ' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
  
  
 	 S E L E C T     D a t e I D = D A T E , A M T = S U M ( A M O U N T )  
 	 	 	 F R O M   L i n e I t e m    
 	 	 	           - - W H E R E   C o n t r a c t I D =   @ C O N T R A C T I D   A N D   B u n d l e I D = - 1  
 	 	 	                   G R O U P   B Y   D A T E  
                                                 H A V I N G   S U M ( A M O U N T ) > 0  
  
  
 / *  
 2 0 0 3 - 0 8 - 2 2 	 7 4 2 . 9 2  
 2 0 0 5 - 1 0 - 1 4 	 4 5 0 . 0 0  
 2 0 0 6 - 0 5 - 1 2 	 5 7 6 . 2 0  
 2 0 0 7 - 0 8 - 2 8 	 3 0 8 . 0 0  
 2 0 1 0 - 0 6 - 2 9 	 5 0 0 . 0 0  
 2 0 1 5 - 0 9 - 0 1 	 2 8 7 . 0 0  
 * /  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 S E L E C T   C O U N T ( * )   F R O M   [ d b o ] . [ L i n e I t e m ]  
 S E L E C T   C O U N T ( * )   F R O M   [ d b o ] . [ L i n e I t e m B X ]   W H E R E   C O N T R A C T I D = 7  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
 I N S E R T   [ d b o ] . [ C o n t r a c t _ I n p u t _ L i s t ] ( [ C o n t r a c t I D ] )  
 S E L E C T   D I S T I N C T   C O N T R A C T I D    
 F R O M   L I N E I T E M    
 O R D E R   B Y   C O N T R A C T I D    
  
  
 S E L E C T   *   F R O M   [ d b o ] . [ C o n t r a c t _ I n p u t _ L i s t ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 E X E C   [ d b o ] . [ u s p P r o c e s s C o n t r a c t s ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S E L E C T   C O U N T ( * )   F R O M   L I N E I T E M    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 SELECT * FROM SkuLG WHERE SKUID IN(
144,
152,
167,
176,
1694,
559
) ORDER BY SKUID;

SELECT * FROM SkuPriceLG 
WHERE SKUID IN(
144,
152,
167,
176,
1694,
559
) ORDER BY SKUID;
------------------

SELECT * FROM [dbo].[SkuSimple] ORDER BY SKUID




select * from [BusinessType] order by BusinessTypeID --------------------------------------------------------------------------------------
 SELECT * FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI where ProductID in (
 SELECT ProductID 
 FROM [DCSQLPRD104].Enterprise.dbo.Product WHERE ProductDesc like '%Apartments.com%')
 AND LI.LineItemStatusID=1 and LI.BundleID is not null
 --------------------------------------------------------------------------------------
 SELECT contractid, OriginalMonthlyPrice,  * FROM LineItem LI where ProductID in (
 SELECT ProductID 
 FROM Product WHERE ProductDesc like '%Apartments.com Gold%')
 AND LI.LineItemStatusID=1 
 order by LI.contractid
 --AND LI.BundleID is not null
  -------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------
  SELECT contractid, OriginalMonthlyPrice,  * FROM LineItem LI where ProductID in (
 SELECT ProductID 
 FROM Product WHERE ProductDesc like '%Apartments.com Silver%')
 AND LI.LineItemStatusID=1 
 order by LI.contractid
 --AND LI.BundleID is not null
 
  -----------------------------------------------------------------------------------
    SELECT contractid, OriginalMonthlyPrice,  * FROM LineItem LI where ProductID in (
 SELECT ProductID 
 FROM Product WHERE ProductDesc like '%Apartments.com Platinum%')
 AND LI.LineItemStatusID=1 
 order by LI.contractid
 --AND LI.BundleID is not null

  -----------------------------------------------------------------------------------

      SELECT contractid, OriginalMonthlyPrice,  * FROM LineItem LI where ProductID in (
 SELECT ProductID 
 FROM Product WHERE ProductDesc like '%Apartments.com Diamond%')
 AND LI.LineItemStatusID=1 
 order by LI.contractid
 --AND LI.BundleID is not null
 
  -------------------------------------------------------------------------------------

 SELECT contractid, OriginalMonthlyPrice,  * FROM LineItem LI where ProductID in (
 SELECT ProductID 
 FROM Product WHERE ProductID IN (
225,
228,
231,
233,
249,
245,
246,
247,
250,
251,
252,
227,
232,
265,
281,
241,
226,
229,
230,
234,
239,
240,
248,
253,
261
))
AND LI.LineItemStatusID=1 
 --order by LI.contractid
 --AND LI.BundleID is not null




  ---------------------------------------------------------------------------------------
    SELECT ProductID, ProductDesc  FROM Product WHERE ProductDesc like '%Apartments.com%'

	---Apartments.com Platinum Package
	---Apartments.com Diamond Package Advance Billed

WITH CTEDupRecords
AS
(
bcp CoStar.cube.D_Market out C:\Temp\Market.txt -c -T

SELECT * FROM Sales_Order_Feed

SELECT SALES_ORDER AS ContractID, Deal_ID_CreatedDate, SUM(UNIT_SELL_PRICE) 
FROM ##SalesOrder SO
	JOIN LineItem L
		ON SO.SALES_ORDER_LINE = L.LineItemID
WHERE L.LineItemStatusID = 1
GROUP BY SALES_ORDER, Deal_ID_CreatedDate
ORDER BY ISNULL(SUM(UNIT_SELL_PRICE),0), Deal_ID_CreatedDate

SELECT * 
FROM [Contract] 
WHERE Contractid = 15557

SELECT DiscountedMonthlyPrice, * 
FROM LineItem 
WHERE Lineitemstatusdate BETWEEN '2005-02-01' AND '2005-02-28'

SELECT DiscountedMonthlyPrice, COUNT(*) 
FROM LineItem
GROUP BY DiscountedMonthlyPrice
ORDER BY 2 DESC


SELECT COUNT(*) 
FROM LineItem 
WHERE ISNULL(DiscountedMonthlyPrice,0) = 0

SELECT lineitemstatusdate, COUNT(*) 
FROM LineItem 
WHERE ISNULL(DiscountedMonthlyPrice,0) = 0
AND Lineitemstatusdate < '1/1/2016'
GROUP BY Lineitemstatusdate
ORDER BY 2 DESC

SELECT * 
FROM [Contract]

SELECT DiscountedMonthlyPrice, * 
FROM lineitem 
WHERE DiscountedMonthlyPrice IS NOT NULL-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
SELECT 
 [G_L Account No_] as GLAccount, 
 CASE WHEN (SUM(Amount) > 0) THEN SUM(Amount) ELSE 0 END AS [Debit Amount],
 CASE WHEN (SUM(Amount) <= 0) THEN SUM(Amount) ELSE 0 END * - 1 AS [Credit Amount]
-- SUM(Amount) as Amount
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[LoopNet$G_L Entry]
WHERE YEAR([Posting Date])=2016
group by [G_L Account No_]
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--------------------------- Complete SQL for the Legal Report -----------------------------------
-------------------------------------------------------------------------------------------------

SELECT 
CustomerName as CustomerHQ , 
[201607] as '2016-JUL',
[201608] as '2016-AUG',
[201609] as '2016-SEPT',
[201610] AS '2016-OCT', 
[201611] as '2016-NOV',
[201612] AS '2016-DEC', 
[201701] AS '2017-JAN',
[201702] AS '2017-FEB',
[201703] AS '2017-MAR',
[201704] AS '2017-APR',
[201705] AS '2017-MAY',
[201706] AS '2017-JUN'
FROM   
(SELECT N.[InvoiceAmount] as Amount,N.[ChargeYearMonth] as YearMonth , C.CustomerName as CustomerName
FROM [cube].[F_ProductRevenueNAV] N JOIN [cube].[D_Customer] C ON N.LocationID=C.LocationID JOIN [cube].[D_Product] P
ON N.SKUID=P.SKUID 
where P.ProductCategory='Apartments'
) p  
PIVOT  
(  
SUM(Amount)  
FOR YearMonth IN  
( [201607],[201608],[201609],
  [201610],[201611], [201612], 
  [201701],[201702],[201703],
  [201704],[201705],[201706])  
) AS pvt  
ORDER BY pvt.CustomerName;  
-------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
SELECT 
CustomerName as CustomerHQ ,  --- [BILL_TO_CUSTOMER_NAME]
[201607] as '2016-JUL', ---use RULE_START_DATE 
[201608] as '2016-AUG',
[201609] as '2016-SEPT',
[201610] AS '2016-OCT', 
[201611] as '2016-NOV',
[201612] AS '2016-DEC', 
[201701] AS '2017-JAN',
[201702] AS '2017-FEB',
[201703] AS '2017-MAR',
[201704] AS '2017-APR',
[201705] AS '2017-MAY',
[201706] AS '2017-JUN'
--INTO #TempApts
FROM   
(SELECT
N.[UNIT_SELL_PRICE] as InvoicedAmount,
CAST(YEAR(RULE_START_DATE) as char(4))+
CASE CAST(MONTH(RULE_START_DATE) as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
				   WHEN '3' THEN '03'
				   WHEN '4' THEN '04'
				   WHEN '5' THEN '05'
				   WHEN '6' THEN '06'
				   WHEN '7' THEN '07'
				   WHEN '8' THEN '08'
				   WHEN '9' THEN '09'
ELSE CAST(MONTH(RULE_START_DATE) as char(2)) END AS YearMonth , 
N.BILL_TO_CUSTOMER_NAME as CustomerName
--L.LocationName as CustomerName
FROM [dbo].[Invoice_Feed] N 
--JOIN [dbo].[Location] L ON N.CUSTOMER_ID=L.ParentLocationID
WHERE N.UNBILLED_AR_SEG4='Apartments'
) p  
PIVOT  
(  
SUM(InvoicedAmount)  
FOR YearMonth IN  
( [201607],[201608],[201609],
  [201610],[201611], [201612], 
  [201701],[201702],[201703],
  [201704],[201705],[201706])  
) AS pvt  
ORDER BY pvt.CustomerName;  
-------------------------------------------------------------------------

--select sum([UNIT_SELL_PRICE]) from [dbo].[Invoice_Feed] where UNBILLED_AR_SEG4='Apartments'
---279,915,984
--133,970,437

��U S E   [ S t a g i n g ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p _ C r e a t e R e p o r t F o r L e g a l _ I n v F e e d ]         S c r i p t   D a t e :   8 / 2 2 / 2 0 1 7   3 : 3 2 : 5 0   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 E X E C   [ d b o ] . [ u s p _ C r e a t e R e p o r t F o r L e g a l _ S I L ]  
  
  
 A L T E R   p r o c   [ d b o ] . [ u s p _ C r e a t e R e p o r t F o r L e g a l _ S I L ]  
 A S  
  
 I F   O B J E C T _ I D ( ' t e m p d b . . T e m p A p t s 1 ' ,   ' U ' )   I S   N O T   N U L L   D R O P   T A B L E   t e m p d b . . T e m p A p t s 1 ;  
 I F   O B J E C T _ I D ( ' t e m p d b . . T e m p A p t s 2 ' ,   ' U ' )   I S   N O T   N U L L   D R O P   T A B L E   t e m p d b . . T e m p A p t s 2 ;  
  
  
 S E L E C T    
 C u s t o m e r N a m e   a s   C u s t o m e r H Q   ,     - - -    
 C u s t o m e r I D   a s   C u s t o m e r N u m b e r ,  
 P a r e n t C o m p a n y L o c I D   a s   C u s t o m e r P a r e n t I D ,  
 [ 2 0 1 6 0 1 ]   a s   ' 2 0 1 6 - J A N ' ,    
 [ 2 0 1 6 0 2 ]   a s   ' 2 0 1 6 - F E B ' ,    
 [ 2 0 1 6 0 3 ]   a s   ' 2 0 1 6 - M A R ' ,  
 [ 2 0 1 6 0 4 ]   a s   ' 2 0 1 6 - A P R ' ,  
 [ 2 0 1 6 0 5 ]   A S   ' 2 0 1 6 - M A Y ' ,  
 [ 2 0 1 6 0 6 ]   a s   ' 2 0 1 6 - J U N ' ,    
 [ 2 0 1 6 0 7 ]   a s   ' 2 0 1 6 - J U L ' ,    
 [ 2 0 1 6 0 8 ]   a s   ' 2 0 1 6 - A U G ' ,  
 [ 2 0 1 6 0 9 ]   a s   ' 2 0 1 6 - S E P T ' ,  
 [ 2 0 1 6 1 0 ]   A S   ' 2 0 1 6 - O C T ' ,    
 [ 2 0 1 6 1 1 ]   a s   ' 2 0 1 6 - N O V ' ,  
 [ 2 0 1 6 1 2 ]   A S   ' 2 0 1 6 - D E C '    
 - - [ 2 0 1 7 0 1 ]   A S   ' 2 0 1 7 - J A N ' ,  
 - - [ 2 0 1 7 0 2 ]   A S   ' 2 0 1 7 - F E B ' ,  
 - - [ 2 0 1 7 0 3 ]   A S   ' 2 0 1 7 - M A R ' ,  
 - - [ 2 0 1 7 0 4 ]   A S   ' 2 0 1 7 - A P R ' ,  
 - - [ 2 0 1 7 0 5 ]   A S   ' 2 0 1 7 - M A Y ' ,  
 - - [ 2 0 1 7 0 6 ]   A S   ' 2 0 1 7 - J U N '  
 I N T O   # T e m p A p t s 1  
 F R O M        
 ( S E L E C T  
 c o n v e r t ( m o n e y , I L . [ A m o u n t ] )   a s   I n v o i c e d A m o u n t ,  
 C A S T ( Y E A R ( I L . [ P o s t i n g   D a t e ] )   a s   c h a r ( 4 ) ) +  
 C A S E   C A S T ( M O N T H ( I L . [ P o s t i n g   D a t e ] )   a s   c h a r ( 2 ) )     W H E N   ' 1 '   T H E N   ' 0 1 '  
                                       W H E N   ' 2 '   T H E N   ' 0 2 '  
                                                                 W H E N   ' 3 '   T H E N   ' 0 3 '  
                                                                 W H E N   ' 4 '   T H E N   ' 0 4 '  
                                                                 W H E N   ' 5 '   T H E N   ' 0 5 '  
                                                                 W H E N   ' 6 '   T H E N   ' 0 6 '  
                                                                 W H E N   ' 7 '   T H E N   ' 0 7 '  
                                                                 W H E N   ' 8 '   T H E N   ' 0 8 '  
                                                                 W H E N   ' 9 '   T H E N   ' 0 9 '  
 E L S E   C A S T ( M O N T H ( I L . [ P o s t i n g   D a t e ] )   a s   c h a r ( 2 ) )   E N D   A S   Y e a r M o n t h   ,    
 I L . C u s t o m e r A c c o u n t N a m e   a s   C u s t o m e r N a m e ,  
 I L . C u s t o m e r A c c o u n t C o d e   a s   C u s t o m e r I D ,  
 I L . [ B i l l - t o   C u s t o m e r   N o _ ]   a s   [ P a r e n t C o m p a n y L o c I D ] ,  
 I H . [ B i l l - t o   N a m e ]   a s   [ P a r e n t C o m p a n y N a m e ]  
 F R O M   [ d b o ] . [ R I G $ S a l e s   I n v o i c e   L i n e ]   I L  
     I N N E R   J O I N   [ d b o ] . [ R I G $ S a l e s   I n v o i c e   H e a d e r ]   I H   O N   I L . [ D o c u m e n t   N o _ ]   =   I H . N o _  
     W H E R E   [ B u s i n e s s   U n i t   C o d e ]   I N  
     ( ' A F P A K ' , ' A F P L U S ' , ' A F P R O ' , ' A F P R O O D D ' , ' A P N ' , ' A P T ' , ' A P T 0 0 1 ' , ' A P T 0 0 2 ' , ' A P T 0 0 3 ' ,    
 ' A P T 0 0 4 ' , ' A P T 0 0 5 ' , ' A P T S D I A M D A ' , ' A P T S D I A M O N ' , ' A P T S G O L D ' , ' A P T S G O L D A ' , ' A P T S M Y M E A ' , ' A P T S M Y M E D ' ,  
 ' A P T S P H T R T K ' , ' A P T S P L A T I N ' , ' A P T S P L A T N A ' , ' A P T S S I L V E R ' , ' A P T S S I L V R A ' , ' A P T S V D R S H T ' )  
 )   p      
 P I V O T      
 (      
 S U M ( I n v o i c e d A m o u n t )      
 F O R   Y e a r M o n t h   I N    
 (    
     [ 2 0 1 6 0 1 ] , [ 2 0 1 6 0 2 ] , [ 2 0 1 6 0 3 ] ,  
     [ 2 0 1 6 0 4 ] , [ 2 0 1 6 0 5 ] , [ 2 0 1 6 0 6 ] ,  
     [ 2 0 1 6 0 7 ] , [ 2 0 1 6 0 8 ] , [ 2 0 1 6 0 9 ] ,  
     [ 2 0 1 6 1 0 ] , [ 2 0 1 6 1 1 ] ,   [ 2 0 1 6 1 2 ]    
     - - [ 2 0 1 7 0 1 ] , [ 2 0 1 7 0 2 ] , [ 2 0 1 7 0 3 ] ,  
     - - [ 2 0 1 7 0 4 ] , [ 2 0 1 7 0 5 ] , [ 2 0 1 7 0 6 ]      
     )      
 )   A S   p v t      
 O R D E R   B Y   p v t . C u s t o m e r N a m e ;      
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 S E L E C T    
 C u s t o m e r P a r e n t I D ,    
 S U M ( [ 2 0 1 6 - J A N ] )   A S   J A N _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - F E B ] )   A S   F E B _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - M A R ] )   A S   M A R _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - A P R ] )   A S   A P R _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - M A Y ] )   A S   M A Y _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - J U N ] )   A S   J U N _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - J U L ] )   A S   J U L _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - A U G ] )   A S   A U G _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - S E P T ] )   A S   S E P T _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - O C T ] )   A S   O C T _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - N O V ] )   A S   N O V _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - D E C ] )   A S   D E C _ 2 0 1 6 ,  
 S U M ( [ 2 0 1 6 - J A N ] ) +   S U M ( [ 2 0 1 6 - F E B ] ) + S U M ( [ 2 0 1 6 - M A R ] ) + S U M ( [ 2 0 1 6 - A P R ] ) + S U M ( [ 2 0 1 6 - M A Y ] ) + S U M ( [ 2 0 1 6 - J U N ] ) + S U M ( [ 2 0 1 6 - J U L ] ) + S U M ( [ 2 0 1 6 - A U G ] ) + S U M ( [ 2 0 1 6 - S E P T ] ) + S U M ( [ 2 0 1 6 - O C T ] ) + S U M ( [ 2 0 1 6 - N O V ] ) + S U M ( [ 2 0 1 6 - D E C ] )   A S   T O T A L  
 - - S U M ( [ 2 0 1 7 - J A N ] )   A S   J A N _ 2 0 1 7 ,  
 - - S U M ( [ 2 0 1 7 - F E B ] )   A S   F E B _ 2 0 1 7 ,  
 - - S U M ( [ 2 0 1 7 - M A R ] )   A S   M A R _ 2 0 1 7 ,  
 - - S U M ( [ 2 0 1 7 - A P R ] )   A S   A P R _ 2 0 1 7 ,  
 - - S U M ( [ 2 0 1 7 - M A Y ] )   A S   M A Y _ 2 0 1 7 ,  
 - - S U M ( [ 2 0 1 7 - J U N ] )   A S   J U N _ 2 0 1 7  
 I N T O   # T e m p A p t s 2  
 f r o m   # T e m p A p t s 1    
 g r o u p   b y   C u s t o m e r P a r e n t I D  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - - S E L E C T   *   F R O M   # T e m p A p t s 2  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 A L T E R   T A B L E   # T e m p A p t s 2   A D D   C u s t o m e r P a r e n t N a m e   v a r c h a r ( 1 5 0 )   n u l l ;  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 u p d a t e   T  
 S E T   T . C u s t o m e r P a r e n t N a m e = L . L o c a t i o n N a m e    
 f r o m   # T e m p A p t s 2   T   J O I N   L o c a t i o n   L   o n   T . C u s t o m e r P a r e n t I D = L . P a r e n t L o c a t i o n I D  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 s e l e c t   *   f r o m   # T e m p A p t s 2   o r d e r   B Y   T O T A L  
 - - S U M ( [ 2 0 1 6 - J A N ] ) +   S U M ( [ 2 0 1 6 - F E B ] ) + S U M ( [ 2 0 1 6 - M A R ] ) + S U M ( [ 2 0 1 6 - A P R ] ) + S U M ( [ 2 0 1 6 - M A Y ] ) + S U M ( [ 2 0 1 6 - J U N ] ) + S U M ( [ 2 0 1 6 - J U L ] ) + S U M ( [ 2 0 1 6 - A U G ] ) + S U M ( [ 2 0 1 6 - S E P T ] ) + S U M ( [ 2 0 1 6 - O C T ] ) + S U M ( [ 2 0 1 6 - N O V ] ) + S U M ( [ 2 0 1 6 - D E C ] )  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 SELECT DISTINCT
    
	 V.[No_]              AS  VendorNo,
	 V.[Name]             AS  VendorName,
	 V.[Address]          AS  Adderess,
	 V.[City]			  AS  City, 
	 V.[County]           AS  [State], 
	 V.[E-Mail]           AS  Email,
	 V.[Vendor Posting Group]  AS VendorPostingGroup,
	 --VL.[Document No_]    AS PaymentNo,
	 --VL.[Posting Date]    AS  LastPaymentDate,
	 --PIH.[PO Number]      AS PurchaseOrder_No
	  SUM(VDL.[Amount])    AS SpentAmount
	  
	 FROM [RIG$Vendor Ledger Entry] VL          
		JOIN [RIG$Vendor] V
		  ON VL.[Vendor No_]= V.[No_]
        JOIN [RIG$Detailed Vendor Ledg_ Entry] VDL
		  ON VL.[Entry No_] = VDL.[Vendor Ledger Entry No_]
	    --JOIN ( SELECT V.Ve  	
	 WHERE V.[Blocked] = '' 
	 AND VL.[Document Type] = '1'
	 AND VDL.[Entry Type]  ='1'
	 AND VL.[Posting Date] BETWEEN '2016-01-01' AND '2016-12-31'
	 AND V.[Vendor Posting Group] IN ('TRADE','FINDER')
	
	GROUP BY V.[No_], V.[Name],V.[Address],V.[City],V.[County],V.[E-Mail],V.[Vendor Posting Group]
	--SUM(VDL.[Amount])
	
	-- AND VL.[Posting Date] IN ( SELECT  MAX(VL.[Posting Date]) from [RIG$Vendor Ledger Entry] VL)
	 --group by V.[No_]

SELECT DISTINCT
    
	 V.[No_]              AS  VendorNo,
	 V.[Name]             AS  VendorName,
	 V.[Address]          AS  Adderess,
	 V.[City]			  AS  City, 
	 V.[County]           AS  [State], 
	 V.[E-Mail]           AS  Email,
	 V.[Vendor Posting Group]  AS VendorPostingGroup,
	 VL.[Global Dimension 1 Code] AS Department,
	 V.[Vendor Posting Group] AS BusinessUnitCode,
	 
	 --VL.[Document No_]    AS PaymentNo,
	 --VL.[Posting Date]    AS  LastPaymentDate,
	 --PIH.[PO Number]      AS PurchaseOrder_No
	  SUM(VDL.[Amount])    AS SpentAmount
	  
	 FROM [RIG$Vendor Ledger Entry] VL          
		JOIN [RIG$Vendor] V
		  ON VL.[Vendor No_]= V.[No_]
        JOIN [RIG$Detailed Vendor Ledg_ Entry] VDL
		  ON VL.[Entry No_] = VDL.[Vendor Ledger Entry No_]

	    --JOIN ( SELECT V.Ve  	
	 WHERE V.[Blocked] = '' 
	 AND VL.[Document Type] = '1'
	 AND VDL.[Entry Type]  ='1'
	 AND VL.[Posting Date] BETWEEN '2016-01-01' AND '2016-12-31'
	 AND V.[Vendor Posting Group] IN ('TRADE','FINDER')
	
	GROUP BY V.[No_], V.[Name],V.[Address],V.[City],V.[County],V.[E-Mail],V.[Vendor Posting Group],
	 VL.[Global Dimension 1 Code] ,
	 V.[Vendor Posting Group]
	--SUM(VDL.[Amount])
	
	-- AND VL.[Posting Date] IN ( SELECT  MAX(VL.[Posting Date]) from [RIG$Vendor Ledger Entry] VL)
	 --group by V.[No_]

