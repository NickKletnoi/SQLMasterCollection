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
