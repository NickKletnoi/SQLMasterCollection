USE [CoStar2]
GO

SELECT [LineItemID]
      ,[ContractID]
      ,[BundleID]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[SKUID]
      ,[Amount]
INTO ##SkuBridge2
  FROM [dbo].[LineItem]
UNION
SELECT [LineItemID]
      ,[ContractID]
      ,[BundleID]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[SKUID]
      ,[Amount]
  FROM [dbo].[LineItem_1stbatch]
UNION
SELECT [LineItemID]
      ,[ContractID]
      ,[BundleID]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[SKUID]
      ,[Amount]
  FROM [dbo].[LineItem1]
SELECT [LineItemID]
      ,[ContractID]
      ,[BundleID]
      ,[ProductID]
      ,[MarketID]
      ,[UserCount]
      ,[CustomerType]
      ,[Date]
      ,[SKUID]
      ,[Amount]
  FROM [dbo].[LineItem3]


SELECT 
      LineItemID=SB2.LineItemID,
      ContractID=SB2.ContractID,
	  LocationID=LI.SiteLocationID,
      BundleID=SB2.BundleID,
      SKUID=SB2.SKUID,
	  SqFt=BSF.GrossBldgSqFt	 
INTO SkuBridge3  
 FROM ##SkuBridge2 SB2 JOIN ENTERPRISE.dbo.LineItem LI ON SB2.LineItemID=LI.LineItemID 
 LEFT JOIN  ENTERPRISE.dbo.Location L ON LI.SiteLocationID=L.LocationID
 LEFT JOIN ENTERPRISE.dbo.LocationOccupancy LO on LI.SiteLocationID=LO.TenantLocationID
 LEFT JOIN [dbo].[BldSqFt] BSF ON BSF.PropertyID=LO.PropertyID


 with dups as (
 select LineItemID, rn=ROW_NUMBER() over (partition by  LineItemID order by LineItemID) 
   from SkuBridge3 )

delete from dups where rn>1;


select * from ##SkuBridge3