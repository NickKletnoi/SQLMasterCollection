 
 
 select (SUM(ID.CurrentMonthlyPrice))/COUNT(SP.SKUID) as AvgPrice 
  from Staging..LineItem ID JOIN RevPro..SkuBridge SB
ON ID.LineItemID=SB.LineItemID JOIN dbo.Sku S ON SB.SKUID=S.SKUID JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
JOIN
(
select ContractID, count(*) cnt
from Staging..LineItem LI 
JOIN RevPro..SkuBridge SB
ON LI.LineItemID=SB.LineItemID JOIN dbo.Sku S ON SB.SKUID=S.SKUID JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
WHERE S.ProductID IN (1,2,5,266)
group by LI.ContractID 
having (Count(*)=4 )
) L ON ID.ContractID= L.ContractID
 where 
 SP.SkuName LIKE '%Suite%' and ID.DiscountedMonthlyPrice>0 
 and SP.ProductCategory='Suite'
 and S.ProductID IN (1,2,5,266)