
----------------------- Step 1 create temp processing table bal.Temp ----------------------------
select  
ContractID,
SKUID,
SUM(TotalAMount) as Amount
into bal.temp
from bal.[2017BalancesContractLineItem]
GROUP By ContractID, SKUID
having SUM(TotalAMount)>0
order by ContractID

------------------------Step 2. Generate temp Sku's from that table --------------

select t1.contractID,  COALESCE (t1.SKUID,m.SKUID) as SKUID
into bal.tempFillSku
from (select contractID, SKUID from bal.temp t where t.SKUID IS NULL ) t1 LEFT JOIN 
 (select ContractID, MAX(SKUID) as SKUID from bal.temp t3 where t3.SKUID IS NOT NULL group by t3.ContractID ) m
 ON t1.ContractID=m.ContractID
order by ContractID



select distinct ContractID, SKUID from bal.temp t where t.SKUID IS NULL


