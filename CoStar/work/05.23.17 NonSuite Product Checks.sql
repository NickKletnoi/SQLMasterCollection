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





