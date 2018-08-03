-------------------------------
--UPDATE SP ------------------
--SET SP.SkuName=SP1.SkuName--
------------------------------
/*
SELECT
LEFT(FIX.SkuName,11) as LeftPartofSku,
RIGHT(Fix.SkuName,len(fix.skuname)-16) as RightPartofSku,
LEFT(RIGHT(Fix.SkuName,len(fix.skuname)-12),3) as MiddlePartofSku,
Fix.SKUID,Fix.SkuName,
fix.ProductMarketDesc
*/

UPDATE  SP
SET SP.SkuName=LEFT(FIX.SkuName,11)+ '-'+ FIX.ProductMarketDesc+ '-' + RIGHT(FIX.SkuName,len(FIX.skuname)-16) 
FROM 
(
SELECT M.SKUID,M.SkuName,M.Market,PM.ProductMarketDesc
FROM 
(
select SKUID,SkuName,

CASE WHEN 
LEFT( RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))),
       CHARINDEX('-',  RIGHT(SkuName,
                                         (LEN(SkuName)-(CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))
                                                                   
                                                                   )
                                                                   
                                                                   )
                                                                   
                                                                   ))
          
          ) LIKE '____' THEN
          
       LEFT (
       
       LEFT( RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))),
       CHARINDEX('-',  RIGHT(SkuName,
                                         (LEN(SkuName)-(CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))
                                                                   
                                                                   )
                                                                   
                                                                   )
                                                                   
                                                                   ))
          
          ) 
       ,3)   
          
           END Market
from dbo.SkuPrice SP WHERE 
LEFT( RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))),
       CHARINDEX('-',  RIGHT(SkuName,
                                         (LEN(SkuName)-(CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))
                                                                   
                                                                   )
                                                                   
                                                                   )
                                                                   
                                                                   ))
          
          ) LIKE '____'
AND 
LEFT( RIGHT(SkuName,LEN(SkuName)-CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))),
       CHARINDEX('-',  RIGHT(SkuName,
                                         (LEN(SkuName)-(CHARINDEX('-',SkuName,CHARINDEX('Suite',SkuName))
                                                                   
                                                                   )
                                                                   
                                                                   )
                                                                   
                                                                   ))
          
          ) NOT LIKE 'LN%' ) M LEFT JOIN Staging..ProductMarket PM ON m.Market=PM.ProductMarket
--WHERE M.SkuName NOT LIKE '%-VP-%'
) FIX JOIN dbo.SkuPrice SP ON FIX.SKUID=SP.SKUID
WHERE FIX.ProductMarketDesc IS NOT NULL 

