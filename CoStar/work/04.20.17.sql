

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




