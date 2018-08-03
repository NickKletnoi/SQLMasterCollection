

select count(*) from [dbo].[LINB];

select * 
into #CompleteSet
from [dbo].[LineItem]
union
select * from [dbo].[LineItem1]
union
select * from [dbo].[LineItem2]
--union
--select * from [dbo].[LineItemApptsFinal2]

select count(*) from #CompleteSet

select CONTRACTID, SUM(
ISNULL(AMOUNT,0)
) AMT 
into #ZeroContracts
FROM #CompleteSet 
--where amount is null
GROUP BY CONTRACTID 
having  SUM(AMOUNT)=0
--------------------------------------------------------------------------
--------------------------------------------------------------------------
select distinct ContractID 
from [dbo].[FACT_INV_2017] 
where ContractID in 
(select distinct ContractID from #ZeroContracts)
--------------------------------------------------------------------------
--------------------------------------------------------------------------
select distinct contractiD 
from #ZeroContracts
select count(distinct contractid) from #CompleteSet
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------



