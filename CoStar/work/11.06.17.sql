----------------------------------------------------------------------------------------------------
UPDATE SP
SET SP.[SkuName]=NSF.NewSkuName
FROM [Apt].[F_SalesPricingReport] SP LEFT JOIN Apt.NewSkusFinal NSF ON SP.LineItemID=NSF.LineItemID
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
SELECT * FROM  [Apt].[F_SalesPricingReport]; 


SELECT DISTINCT SKUID, NewSkuName from [Apt].[NewSkusFinal] order by NewSkuName
UNION 
SELECT DISTINCT SKUID,'', SkuName from dbo.SkuPrice where ProductCategory in ('Apartments')
select * from [Apt].[NewSkusFinal]
select distinct NewSkuName from [Apt].[NewSkusFinal] order by 1
--------------------------------------->>---------------->>--------------------------------------->>---------------
--------------------------------------->>---------------->>--------------------------------------->>---------------
select SB.LineItemID,SP.SKUID,SP.SkuName 
into apt.NewSkuTerm_r2
from dbo.SkuPrice SP JOIN dbo.SkuBridge SB on SP.SKUID=SB.SKUID 
where SP.ProductCategory in ('Apartments') AND SB.LineItemID NOT IN (select LineItemID from apt.NewSkusFinal)
and SP.SkuName like '%N/A%'------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------->>>------------->>>>-------------->>>----------------------------------------------
---------------------------->>>------------->>>>-------------->>>----------------------------------------------
---------------------------------------------------------------------------------------------------------------