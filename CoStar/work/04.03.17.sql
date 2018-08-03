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



