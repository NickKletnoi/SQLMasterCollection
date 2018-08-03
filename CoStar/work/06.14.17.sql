select * from [dbo].[SkuApptsFinal]

select top 1 * from [dbo].[LineItemAppts5]

select [NetworkName],[UnitSign],[ContractTermMonths], count([ContractTermMonths]) as cnt
from [dbo].[LineItemAppts5]
group by [NetworkName],[UnitSign],[ContractTermMonths]
order by 3
----------------------------------------------------
----------------------------------------------------
select Distinct SPF.SkuName
from [dbo].[LineItemAppts5] LIA LEFT  JOIN 
[dbo].[SkuBridgeFinal2] SBF ON LIA.LineItemID=SBF.LineItemID JOIN 
[dbo].[SkuPriceFinal] SPF ON SBF.SKUID=SPF.SKUID
-----------------------------------------------------









