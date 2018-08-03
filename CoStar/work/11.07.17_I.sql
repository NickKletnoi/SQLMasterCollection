----------------------------------------------------------------------------
select distinct SKUID, NewSkuName 
into apt.SKU_MSTR
from [Apt].[NewSkusFinal] order by SKUID

--------------------------------------------------------------------------
update NSF
SET NSF.SKUID = LEFT(NewSkuName,5)
from apt.NewSkusFinal NSF
------------------------------------------------------------------------
select distinct SKUID, NewSkuName from apt.SKU_MSTR order by SKUID

delete from apt.SKU_MSTR where SKUID is null;

