



[dbo].[Contract_Input_List]




-------------------------------------
truncate table [dbo].[LineItem1]
select * from [dbo].[LineItem1]


EXEC [dbo].[uspLOAD_LineItem]


select count(*) from LineItem1;
select count(*) from [dbo].[LineItem];

TRUNCATE TABLE [dbo].[LineItem]


INSERT INTO [dbo].[LineItem]
           ([LineItemID]
           ,[ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount])


SELECT 
            [LineItemID]
           ,[ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount]

 from [dbo].LineItem1 where lineitemid not in (select LineItemID from LineItem_1stbatch)
--157,223---need to add and process these additional lines
--123,578---
select count(*) from [dbo].LineItem1
-------------------------------------------------
