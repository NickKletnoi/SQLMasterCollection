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


