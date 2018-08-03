

SELECT  
SP.SKUID,
SP.SkuName,
P.ProductDesc,
*
FROM dbo.LineItem LI JOIN dbo.SkuBridge SB ON LI.LineItemID=SB.LineItemID JOIN dbo.SkuPrice SP ON
SB.SKUID=SP.SKUID JOIN apt.Product P ON LI.ProductID=P.ProductID
------------

SELECT * FROM bal.[2017BalancesContractLineItem] WHERE LineItemID IN (2943017) 
SELECT * FROM SkuBridge WHERE LineItemID = 2943017

select count(distinct LineItemID) from [bal].[2017BalancesContractLineItem];
select count(*) from [bal].[2017BalancesContractLineItem];
-------------------------------------------------------------------------------------
--------------------------- Remove the Dups from the  Balances Table ----------------
-------------------------------------------------------------------------------------
with BalDups as (
select LineItemID, ROW_NUMBER() OVER (PARTITION BY LineItemID ORDER BY SKUID) rn
FROM bal.[2017BalancesContractLineItem]
)
delete from BalDups where rn>1
---------------------------------------------------------------------------------------