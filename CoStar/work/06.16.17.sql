select count(*) from [dbo].[LineItem] where SKUID=-1


truncate table [dbo].[Contract_Input_List]

select * from [dbo].[Contract_Input_List]


insert [dbo].[Contract_Input_List] ([ContractID])
select distinct [ContractID] from LineItem order by ContractID

--------------------------------------------------------
select distinct lineitemid from LineItem----124,937;---
-------------------------------------------------------
select distinct LineItemID from LineItem where LineItemID IN 
(select distinct LineItemID from SkuBridgeFinal)
--------------------------------------------------------
select *
INTO revenue.Sku
from dbo.Sku
--------------------81,019
select * 
INTO revenue.SkuPrice
from dbo.SkuPrice
---------------------11,030
select *
INTO revenue.SkuBridge
from dbo.SkuBridgeFinal
---------------------493,133











