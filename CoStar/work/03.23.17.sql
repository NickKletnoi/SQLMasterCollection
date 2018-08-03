USE [CoStar]
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


