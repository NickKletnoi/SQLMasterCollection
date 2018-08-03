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




