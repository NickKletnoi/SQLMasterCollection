
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






