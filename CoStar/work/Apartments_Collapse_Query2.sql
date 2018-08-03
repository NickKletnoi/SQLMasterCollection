select * from [Apt].[ProductList] 

SELECT DISTINCT RIGHT(spr.SkuName,LEN(spr.SkuName)-6 ) as SimpleSkuName 
FROM [Apt].[SalesPricingReport5] spr


SELECT
SPR.ContractID, 
RIGHT(SPR.SkuName,LEN(SPR.SkuName)-6 ) as SkuName,
SPR.[CustomerHQ] as CustomerHQ,
SPR.[CustomerNumber] as CustomerNumber,
[CustomerID] as CustomerID,
[CustomerName] as CustomerName,
MAX(SPR.[SalesRep]) as [SalesRep],
MAX(SPR.[Executive VP]) as [Executive VP],
MAX(SPR.[Senior VP]) as [Senior VP],
MAX(SPR.[Regional VP]) as [Regional VP],
MAX(SPR.[Regional Director]) as [Regional Director],
MAX(SPR.[MarketName]) as [Market Name],
SUM(SPR.[ContractAmount]) as [ContractAmount],
SUM(PL2.ManualListPrice) as [List Price],
MAX([ContractSignedDate]) as [ContractSignedDate] ,
MAX([ContractReceiptDate]) as [ContractReceiptDate] ,
MAX([AcctApprovedDate]) as [AcctApprovedDate],
MAX([CreatedDate]) as [CreatedDate],
MAX([UpdatedDate]) as [UpdatedDate]
INTO [Apt].[SalesPricingReport6.1]
FROM [Apt].[SalesPricingReport5] SPR JOIN [Apt].[ProductList2] PL2 ON 
RIGHT(SPR.SkuName,LEN(SPR.SkuName)-6 )=PL2.ProductName 
GROUP BY SPR.ContractID,RIGHT(SPR.SkuName,LEN(SPR.SkuName)-6 ),
SPR.[CustomerHQ],
SPR.[CustomerNumber],
[CustomerID],
[CustomerName]   
ORDER BY  SUM(SPR.[ContractAmount]) desc , MAX(SPR.[CustomerHQ])

