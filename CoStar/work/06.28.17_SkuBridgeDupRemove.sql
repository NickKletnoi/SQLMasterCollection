------------------------------------------------------------
SELECT DISTINCT [Document Type] from [dbo].[RIG$G_L Entry];
------------------------------------------------------------


[dbo].[LoopNet$Sales Invoice Line]

select  [LineItemID],count(*)
from [dbo].[GLBridge]
group by [LineItemID],[GLAccount]
having count(*)>1

select [LineItemID], count(*) from 
[revenue].[SkuBridge]
group by [LineItemID]
having count(*)>1
-----------------------

select * from revenue.SkuPrice where SKUID IN (
59462,
6231
);
select * from [revenue].[SkuBridge] where LineItemID=1317361
------------------------------------------------------------------

with dups as (
select [LineItemID],SKUID ,ROW_NUMBER() OVER (PARTITION BY [LineItemID] ORDER BY SKUID) AS rn
 from [revenue].[SkuBridge]
)
delete from dups where rn>1