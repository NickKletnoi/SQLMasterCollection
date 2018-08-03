SELECT * FROM LineItem

SELECT * FROM SKU

SELECT DISTINCT BUNDLEID FROM LineItem

SELECT      [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount]
INTO [dbo].LineItem_Exception
FROM [dbo].[LineItem]
WHERE SKUID=-1

SELECT COUNT(*) FROM LineItem WHERE SKUID='-1'
SELECT COUNT(*) FROM LineItem

SELECT * FROM [dbo].[LineItem_Exception]


