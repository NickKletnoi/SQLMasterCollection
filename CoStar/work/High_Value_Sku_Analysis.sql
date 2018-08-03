---------------------------------------------
select count(*) from dbo.Contract_Input_List;
select count(*) from dbo.Contract_Input_List 
WHERE AuditDate is not null;
--------------------------------------------
select count(*) from dbo.LineItem order by ContractID
---------------------------------------------
select * from dbo.SkuPrice where SKUID=80590
-------------------------------------
select count(*) from dbo.SkuBridge;
select count(*) from bkp.SkuBridge;
------------------------------------
---------------------------------------------------------------
select count(distinct LineItemID) from dbo.SkuBridge--838,905
---------------------------------------------------------------
select count(*) from dbo.Sku;
select count(*) from bkp.Sku;
---------------------------------------------------------------
select count(*) from LineItem
---------------------------------------------------------------
select count(*) from LineItem where SKUID=80590
union
select count(*) from LineItem where SKUID=-1
--------------------------------------------------------------
select count(*) from dbo.SkuBridge where SKUID=-1;
--------------------------------------------------------------
-------- Count of all unknowns in the dbo.SkuBridge Table ----
--------------------------------------------------------------
select Distinct LineItemID from bkp.SkuBridge where SKUID=-1
UNION
select Distinct LineItemID from dbo.SkuBridge where SKUID=80590
UNION
select Distinct LineItemID from dbo.SkuBridge where SKUID IN (
select SkuID from dbo.SkuPrice SP where SP.SkuName LIKE '_____-Unkn%') 
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
SELECT COUNT(DISTINCT LineItemID) FROM dbo.SkuBridge; ----------
SELECT COUNT(*) FROM dbo.SkuBridge; ----------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
select SKUID,count(distinct LineItemID) as Cnt
from dbo.SkuBridge SB
Group by SKUID
Order by count(distinct LineItemID) Desc
---------------------------------------------------------------
select SP.SkuName,sum(ID.MonthlyPrice) as Cnt 
from Staging..InvoiceDetail ID 
JOIN dbo.SkuBridge SB ON ID.LineItemID=SB.LineItemID
JOIN dbo.SkuPrice SP ON SB.SKUID=SP.SKUID
WHERE SB.SKUID IN (
select SKUID from [tst].[HighValueSku])
AND ID.ChargeYear=2017
GROUP by SP.SkuName
Order by sum(ID.MonthlyPrice) DESC
---------------------------------------------------------------
---------------------------------------------------------------
--$325,371,480.83


