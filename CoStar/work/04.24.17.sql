---------------------------------------------------------------------------
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
