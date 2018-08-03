EXEC [dbo].[uspProcessContracts]


select count(*) from SkuPrice

select count(*) from SkuPrice;
select count(*) from Sku;

select * from LineItem
order by Contractid, ProductID, MarketID

select count(*) from  [dbo].[SkuBridgeFinal]
select count(*) from  [dbo].[SkuBridgeFinal2]

select distinct LineItemID from LineItem where LineItemID in (select distinct LineItemID from [dbo].[SkuBridgeFinal]);

INSERT  [dbo].[SkuBridgeFinal]([LineItemID],[SKUID])
SELECT DISTINCT [LineItemID],[SKUID] 
FROM LineItem WHERE SKUID<>-1 
ORDER BY SKUID

select distinct skuid from LineItem where SKUID IN (select distinct SKUID from [dbo].[SkuBridgeFinal])
select * from SkuPrice where Price>4
select count(*) from [dbo].[SkuBridgeFinal]

select * from [dbo].[LineItem] 
ORDER BY CONTRACTID, DATE 
-----------------------------

TRUNCATE TABLE [dbo].[Contract_Input_List]

INSERT [dbo].[Contract_Input_List]([ContractID])
SELECT DISTINCT [ContractID] FROM [dbo].[LineItem] ORDER BY CONTRACTID 
------------------
SELECT * FROM LineItem where BundleID=-1







