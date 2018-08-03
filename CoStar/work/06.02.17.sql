select * from [dbo].[SkuExceptions] where price>4

select * from SkuFinal where SKUID IN  (30343,30346);


update SF
set SF.SKUID=30343, SF.SkuName='30343-Suite-MIL-9-Unknown'
from SkuFinal SF where SF.SKUID=30346
------------
update SF
set SF.SKUID=30343, SF.SkuName='30343-Suite-MIL-9-Unknown'
from SkuPriceFinal SF where SF.SKUID=30346
------------
delete from [dbo].[SkuExceptions] where SKUID IN (30343,30346);
------------------------------------------------------------------

select LineItemID, 
from [dbo].[FACT_INV_2017] I JOIN 

select * 
into LineItemComplete
from [dbo].[LineItem]
Union
select * 
from [dbo].[LineItem1]
select *
from [dbo].[LineItem2]
union
select * from
[dbo].[LineItemRS]

select LI.LineItemID, LI.Amount as Sales_Amount, I.Revenue_Amount as Invoice_Amount
INTO LineItemAmountNotequalInvoiceAmount
from [dbo].[LineItemComplete] LI JOIN [dbo].[FACT_INV_2017] I on LI.LineItemID=I.LineItemID
where LI.Amount<4 and I.Revenue_Amount>4


select * from [dbo].[LineItemAmountNotequalInvoiceAmount]


select * from Product where ProductDesc like '%Analytics%'

120
121
122
286
298
266
307

select DISTINCT LI.LineItemID,P.ProductDesc,P.ProductID, LI.Sales_Amount, LI.Invoice_Amount 
INTO [dbo].[LineItemAmountNotequalInvoiceAmount2]
from [dbo].[LineItemAmountNotequalInvoiceAmount] LI JOIN [dbo].[LineItemComplete] LIC
ON LI.LineItemID=LIC.LineItemID JOIN Product P ON LIC.ProductID= P.ProductID
where LIC.ProductID NOT IN (
120,
121,
122,
286,
298,
266,
307
);


select * 
INTO [dbo].[LineItemAmountNotequalInvoiceAmount_MJR]
from [dbo].[LineItemAmountNotequalInvoiceAmount]
where (ProductDesc like '%Comps%') OR (ProductDesc like '%Property%') OR (ProductDesc like '%Tennent%')

select * from [dbo].[LineItemAmountNotequalInvoiceAmount_MJR]
order by Invoice_Amount DESC
------------------------------------------------------------------------
select RIL.[Line Item ID],RIL.[Unit Price] as UnitPrice_NAVISION, 0 as DiscountMonthlyPrice_ENT  from
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] RIL 
where   [Gen_ Bus_ Posting Group]='ACTUAL' and RIL.[Unit Price]>0 and 
[Line Item ID] IN (select distinct LineItemID from [dbo].[ZeroContractsEnterprise])  
---

select *  from
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] RIL 
where   [Gen_ Bus_ Posting Group]='ACTUAL' AND
[Line Item ID] IN (1440)  
------------------------------------------------------------------------
--1440
------------------------------------------------------------------------
select * from [DCSQLPRD104].[Enterprise].dbo.LineItem LI where LineItemID IN (1440) 

select top 1 * from [DCSQLPRD104].[Enterprise].dbo.LineItem LI

/*

LineItemID
1440
1442
1446
1450
1451
1452
1473
1478
1503
1504
1505
1506
1509
*/


--where LineItemID=2160625
-- JOIN 
--[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] SIL
--ON LI.[LineItemID]=SIL.[Line Item ID]
--where   SIL.[Unit Price]<>LI.DiscountedMonthlyPrice
----------------------------------
----------------------------------
/*
2257494
*/

select * 
INTO ZeroLines1
from  
[DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] SIL
where   SIL.[Unit Price]=0 and SIL.[Amount]>0


select
LI.LineItemID,
LI.ContractID,
------------------ this is what i think the logic should be for the Discounted Monthly Price -----------------------
COALESCE( DiscountedMonthlyPrice,CurrentMonthlyPrice,OriginalMonthlyPrice) as DiscountedMonthlyPrice, --- Basically this is 'Sell  Price'
LI.CurrentMonthlyPrice,
LI.OriginalMonthlyPrice
from [DCSQLPRD104].[Enterprise].dbo.LineItem LI
where LI.LineItemID IN (select [LineItemID] from [dbo].[ZeroContractsEnterprise])

--------------------------------------------------------------
select [Line Item ID], * from ZeroLines1;---------------------
select * from [dbo].[LineItemAmountNotequalInvoiceAmount_MJR];
--------------------------------------------------------------
--------------------------------------------------------------

select * from [dbo].[LineItemAmountNotequalInvoiceAmount_MJR]