SELECT 
S.CustomerType,
BT.BusinessTypeName,
BTC.BusinessTypeCategory,
count(*) as cnt
 FROM SkuLG S JOIN BusinessType BT on S.CustomerType=BT.BusinessTypeID JOIN BusinessTypeCategory BTC ON
 BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID WHERE S.SKUID IN (
 select SKUID from SkuPriceLG where SKUID in (
 select distinct skuid from #EasySku) and SkuName is not null and Price>4 )
 group by customertype,BTC.BusinessTypeCategory,BT.BusinessTypeName
 order by CustomerType

 select * 
 INTO #EasySku
 from skuLG where CustomerType in (
 4,8,11,12,13,14,15,16) and skuname is not null


 select * from SkuLG where SKUID in (
  select * from SkuPriceLG where SKUID in (
 select distinct skuid from #EasySku where SkuName is not null and Price>4 )
  ---
  select * from SkuPriceLG where SKUID in (
 select distinct skuid from #EasySku where SkuName is not null and Price>4 )
 