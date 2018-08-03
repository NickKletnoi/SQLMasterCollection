SELECT DiscountMonth, * FROM dbo.LineItemDiscount LID JOIN dbo.LineItem L ON LID.LineItemID=L.LineItemID
WHERE ContractID=187964;


SELECT DiscountMonth, DiscountPct, * FROM dbo.LineItemDiscount WHERE DiscountPct <> '100.00'

[‎11/‎21/‎2017 12:12 PM] Vitaly Romm (Contractor): 
select * from revpro..skubridge  where lineitemid in (2097472,2097473,2097474) 


with dups as (
select LineItemID, ROW_NUMBER OVER (PARTITION BY LineItemID order by SKUID) rn
from dbo.SkuBridge where lineitemid in (2097472,2097473,2097474) )

;


select * from dups where rn>1
-----------------------
WITH DUPS AS
( SELECT LineItemID, ROW_NUMBER() OVER (PARTITION BY LineItemID
                                                                ORDER BY SKUID) AS MK
  FROM dbo.SkuBridge  
  --where lineitemid in (2097472,2097473,2097474) 
)
DELETE FROM DUPS WHERE MK > 1;
--select * FROM DUPS WHERE MK > 1;
---------------------

select * from revpro..skubridge  where lineitemid in (2097472,2097473,2097474) 




select * from revpro..skubridge where lineitemid in (2097472,2097473,2097474) 

select * from RevPro..SkuPrice where SKUID=12827
select * from RevPro..SkuPrice where SKUID=38661

update SB
set SKUID=38661
from dbo.SkuBridge SB
where  lineitemid in (2097472,2097473,2097474) 

-->>>12827
38661

SELECT LineItemID, COUNT(*) FROM revpro..skubridge GROUP BY LineItemID HAVING COUNT(*) > 1


SELECT BundleID, * FROM dbo.LineItem where ContractID=166624


166624