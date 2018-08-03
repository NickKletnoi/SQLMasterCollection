drop table [bal].[2017EndingBalance][dbo].[SkuBridge]

select sum([TotalAmount]) from bal.[2017BalancesContractLineItem]

alter table [bal].[2017BalancesContractLineItem] add SKUID int null;

update BCL
SET BCL.SKUID=SB.SKUID
from [bal].[2017BalancesContractLineItem] BCL LEFT JOIN dbo.SkuBridge SB ON BCL.LineItemID=SB.LineItemID
-----
select * from [bal].[2017BalancesContractLineItem]
select * from bal.[2017BalancesContractLineItem]

-----------------------------------------------------------------
select count(distinct contractid),SUM([TotalAmount]) as AmountOut 
from bal.[2017BalancesContractLineItem] where SKUID is null;------
---92,209,365.18 -------------------------------------------------
------------------------------------------------------------------

select 
SP.SkuName as SkuName,
SUM(BLI.[TotalAmount]) as Amount 
into bal.2017BalanceBySku
from [bal].[2017BalancesContractLineItem] BLI 
JOIN dbo.SkuPrice SP ON BLI.SKUID=SP.SKUID
GROUP BY SP.SkuName
Having SUM(BLI.[TotalAmount])>0
ORDER BY SUM(BLI.[TotalAmount]) DESC
-------------------------------------
select count(distinct ContractID),SUM([TotalAmount]) from bal.[2017BalancesContractLineItem] where SKUID is  null;
--748,087,175.07
--$92,209,365.18
---------------------------------------
select * from bal.[2017BalancesContractLineItem] where LineItemID LIKE '0%'
select count(distinct LineItemID) from bal.[2017BalancesContractLineItem]

---406,228

SELECT COUNT(*) FROM [bal].[2017BalancesContractLineItem]
------------------------------------------------------------
------------------------------------------------------------
SELECT 
BCL.ContractID as ContractID,
BCL.LineItemID as LineItemID,
SUM(BCL.TotalAmount) as TotalAmount,
COALESCE (BCL.SKUID,(select max(skuid) 
FROM [bal].[2017BalancesContractLineItem] BCL2 
WHERE BCL2.LineItemID=BCL.LineItemID) ) as SKUID
INTO [bal].[2017BalancesContractLineItemNX]
FROM [bal].[2017BalancesContractLineItem] BCL 
WHERE TotalAmount>0
GROUP BY BCL.ContractID, BCL.LineItemID, BCL.SKUID
ORDER BY ContractID

select sum(TotalAmount) from [bal].[2017BalancesContractLineItemNX] where SKUID is null;
--92,209,365.18
-----------------------------------------------------------------
-----------------------------------------------------------------
select sum(BCL.TotalAmount)  
from [bal].[2017BalancesContractLineItemN] BCL 
where SKUID is null;
--91,481,748.19
--

SELECT 
a.ContractID,
MAX(a.SKUID) as SKUID_MX
--into bal.MaxSku2017
 FROM (select * from [bal].[2017BalancesContractLineItem] where (SKUID is null) and (SKUID is not null)) a
 -- where SKUID IS NOT NULL;
 GROUP BY a.ContractID
 ----

 select * from bal.[2017BalancesContractLineItem] 
 order by ContractID, SKUID
 ---------------------------------------------------------------------
 ----------------------------------------------------------------------
 ----------------------------------------------------------------------
 select sum([TotalAmount]) from [bal].[2017BalancesContractLineItem];--
 ----------------------------------------------------------------------
 ----------------------------------------------------------------------
