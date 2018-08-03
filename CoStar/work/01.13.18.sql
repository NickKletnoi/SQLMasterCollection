

select
SB.LineItemID, P.SkuPart, SP.SkuName
from dbo.SkuBridge SB JOIN Staging..LineItem LI 
ON SB.LineItemID=LI.LineItemID JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID JOIN apt.Product P 
ON LI.ProductID=P.ProductID  
WHERE SP.SkuName not Like '%apt%'