SELECT BundleID, ContractID, Count(*) as cnt FROM [dbo].[LineItem]
group by BundleID, ContractID
order by BundleID

SELECT 
[ContractID],
[BundleID],
[ProductID],
[MarketID],
[UserCount],
[SKUID]
INTO [dbo].[LineItem1
FROM [dbo].[LineItem] where ContractID in (152472,144831,152562,83492)

select * from [dbo].[LineItem1]

/*
-- Contract_ID's to pick
--152472 ( 2 bundles - 3, 8 in each )
--144831 ( 1 bundle - 3 in it )
--152562 ( 2 bundles - 2 in each )
--83492  ( 1 bundles - 2 in it )



*/