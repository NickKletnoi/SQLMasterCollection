------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
select count(distinct SKUID) from [cube].[F_ProductRevenueENT];---
select count(distinct SKUID) from [cube].[F_ProductRevenueNAV];---
select count(distinct SKUID) from [cube].[F_ProductRevenueENTX];--
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
/* Objective - Build Power BI front 
   applications to the Revenue 
   backend that you have 
   ----------------------------
   Create Another Visalization;
   ----------------------------
*/-----------------------------------------------------------------
-------------------------------------------------------------------

alter table [cube].[F_ProductRevenueENT] add BillingStartDate date null;

update E
SET E.BillingStartDate=I.BillingStartDate
from [cube].[F_ProductRevenueENT] E JOIN [DCSQLPRD104].Enterprise.dbo.InvoiceDetail I
on E.InvoiceID=I.InvoiceID and E.InvoiceDetailID=I.InvoiceDetailID and E.LineItemID=I.LineItemID
---------

select ContractID, Min([BillingStartDate]) As FirstDate
INTO ##ContStart
from [cube].[F_ProductRevenueENT]
group by ContractID

select * from ##ContStart

alter table ##ContStart add FirstInvDate date null;

update CS
SET CS.FirstInvDate=DATEADD(DAY,30,CS.FirstDate)
from ##ContStart CS
---------------------

SELECT * FROM ##ContStart

UPDATE E
SET E.[StubAmount]=0.00
FROM [cube].[F_ProductRevenueENT] E EXCEPT SELECT 


SELECT [InvoiceDetailID],[InvoiceID],[LineItemID],E.[ContractID],[StubAmount]
into ##StubAmounts
FROM [cube].[F_ProductRevenueENT] E join ##ContStart S on E.ContractID=S.ContractID AND 
E.InvoiceMonth=Month(S.FirstInvDate) and InvoiceYear=Year(S.FirstInvDate)

select sum(StubAmount) from ##StubAmounts
--19,720,400.0731

update E
set E.StubAmount=0.00
from [cube].[F_ProductRevenueENT] E

update E
set E.StubAmount=SA.StubAmount
from [cube].[F_ProductRevenueENT] E JOIN ##StubAmounts SA ON E.InvoiceID=SA.InvoiceID and
E.InvoiceDetailID=SA.InvoiceDetailID and E.ContractID=SA.ContractID and E.LineItemID=SA.LineItemID

select sum(StubAmount) from [cube].[F_ProductRevenueENT]

---$19,720,400.0731






