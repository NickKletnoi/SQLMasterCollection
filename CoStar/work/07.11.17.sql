select * from dbo.SkuPrice

select ProductCategory, count(*) 
from revenue.SkuPrice 
group by ProductCategory

select SKUID 
INTO err.SkuUndefCategory
from revenue.SkuPrice where ProductCategory='Undef'
order by SKUID

update SP
set ProductCategory='Other' from revenue.SkuPrice SP where ProductCategory is null


update SP
set CustomerPricingCategory='Lender' from revenue.SkuPrice SP where SKUID IN (select SKUID from err.SkuUndefCategory)
and SkuName LIKE '%Lender%'

select * from revenue.SkuPrice where SKUID IN (select SKUID from err.SkuUndefCategory)
and SkuName LIKE '%Lender%'

---75808-Suite-Northern Virginia-1-Brokerage/Consultants
--80540-Unknown
---80863-Suite-San Antonio-4-Appraisal/Valuation/Tax Appeal
-------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
select count(distinct SKUID) from [revenue].[Sku];
select count(distinct SKUID) from revenue.SkuPrice;
select count(distinct skuid) from revenue.SkuBridge;
--------------------------------------------------------------
