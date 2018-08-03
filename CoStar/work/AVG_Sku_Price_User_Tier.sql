
-- $48.20
select Avg(MonthlyPrice) [1 Person Tier] from Staging..InvoiceDetail ID JOIN RevPro..SkuBridge SB
ON ID.LineItemID=SB.LineItemID JOIN dbo.Sku S ON SB.SKUID=S.SKUID JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
 where ID.ChargeYear=2017 and S.UserCount=1 and SP.SkuName LIKE '%Suite%'and S.ProductID in (1,2,5,266)
 ------------
 
 --$171.21
 select Avg(MonthlyPrice) [5 Person Tier] from Staging..InvoiceDetail ID JOIN RevPro..SkuBridge SB
ON ID.LineItemID=SB.LineItemID JOIN dbo.Sku S ON SB.SKUID=S.SKUID JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
 where ID.ChargeYear=2017 and S.UserCount=5 and SP.SkuName LIKE '%Suite%'and S.ProductID in (1,2,5,266)
 ------------------------------------------------------------------------------------
 ----$1,747.09 (this query run in PRD )-----------------------------------------------
  select (SUM(ID.OriginalMonthlyPrice)/count(distinct SP.SKUID)) as AvgSkuPrice 
  from Staging..LineItem ID JOIN RevPro..SkuBridge SB
ON ID.LineItemID=SB.LineItemID JOIN dbo.Sku S ON SB.SKUID=S.SKUID JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
 where YEAR(ID.BillingStartDate)=2017  AND
 SP.SkuName LIKE '%Suite%' and ID.OriginalMonthlyPrice>0 and SP.ProductCategory='Suite'
 and S.ProductID in (1,2,5,266)
---------------------------------------------------------------------------------------
-----$1,763.01 (this query run in PRD )-------------------------------------------------
 SELECT Avg(Price) 
 FROM dbo.SkuPrice SP JOIN dbo.Sku S ON SP.SKUID=S.SKUID 
 WHERE S.ProductID IN (1,2,5,266)
 and SP.ProductCategory='Suite'
 ---------------------------------------------------------------------------------------

 


  SP.SKUID not in (
 106982,
39129,
115064,
31339,
31339,
107142,
136083,
73811,
671,
136824,
136083,
116688,
21333,
103399,
3763,
24099,
37534,
19793,
136083,
136824,
671,
3737,
3794,
19813,
19802,
106983,
21333,
58783,
37710,
21195,
136704,
4315,
642,
136652,
2177,
106103,
3763,
136083,
1289,
33214,
116688,
125587,
1289,
1289,
31975,
24099,
30795,
671,
136824,
3032,
36798,
3041,
19793,
116686,
3737,
3794,
19813,
21333,
75034,
103665
);




 select SKUID, SUM(Amount) from Staging..InvoiceDetail ID JOIN RevPro..Sku S on ID. order by Amount DESC

  ----$673.62
  select Avg(MonthlyPrice) [20 person Tier] from Staging..InvoiceDetail ID JOIN RevPro..SkuBridge SB
ON ID.LineItemID=SB.LineItemID JOIN dbo.Sku S ON SB.SKUID=S.SKUID JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
 where ID.ChargeYear=2017 and S.UserCount=20 and SP.SkuName LIKE '%Suite%'and S.ProductID in (1,2,5,266)

-- $1,070.12
   select Avg(MonthlyPrice) [50 person Tier ]from Staging..InvoiceDetail ID JOIN RevPro..SkuBridge SB
ON ID.LineItemID=SB.LineItemID JOIN dbo.Sku S ON SB.SKUID=S.SKUID JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
 where ID.ChargeYear=2017 and S.UserCount=50 and SP.SkuName LIKE '%Suite%' and S.ProductID in (1,2,5,266)





 --select top 10 * from dbo.Sku