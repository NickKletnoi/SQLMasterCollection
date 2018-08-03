


select top 100 [InvoiceNumber] from [cube].[XD_InvoiceNumber] where InvoiceNumber like '%-%'


drop table dbo.InvoiceBridge 

select distinct CAST(LEFT(InvoiceNumber,CHARINDEX('-',InvoiceNumber)-1) AS INT) as FixedInvoice, InvoiceNumber
INTO dbo.InvoiceBridge 
 from [cube].[XD_InvoiceNumber] where InvoiceNumber like '%-%'
 UNION
select distinct CAST(LEFT(InvoiceNumber,6) as INT)  as FixedInvoice, InvoiceNumber from [cube].[XD_InvoiceNumber] where ISNUMERIC(InvoiceNumber)=0
AND InvoiceNumber not like '%-%'
UNION
select distinct CAST(InvoiceNumber as INT)  as FixedInvoice, InvoiceNumber from [cube].[XD_InvoiceNumber] WHERE ISNUMERIC(InvoiceNumber)=1




select InvoiceNumber as FixedInvoice, InvoiceNumber
into dbo.InvoiceBridge1
from 
[cube].[XD_InvoiceNumber] EXCEPT SELECT FixedInvoice, InvoiceNumber from dbo.InvoiceBridge

--where InvoiceNumber like '%-%'

update N
set N.[ChargeYearMonth]=NULL from [cube].[F_ProductRevenueNAV] N
where N.ChargeYearMonth IS NOT NULL

alter table [cube].[F_ProductRevenueNAV] add InvoiceID int null;

update N
set N.[InvoiceID]=B.FixedInvoice
from  [cube].[F_ProductRevenueNAV] N JOIN dbo.InvoiceBridge B ON N.InvoiceNumber=B.InvoiceNumber
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

update N
set N.[ChargeYearMonth]=E.[ChargeYearMonth]
FROM [cube].[F_ProductRevenueNAV] N JOIN [cube].[F_ProductRevenueENT] E
ON N.ContractID=E.ContractID AND
   N.InvoiceID=E.InvoiceID AND
   N.LineItemID=E.LineItemID 
   ------------------------------------------------------------------

   select E.InvoiceID,E.InvoiceYearMonth ,E.[ChargeYearMonth], E.LineItemID, N.PostingYearMonth,N.ChargeYearMonth,N.InvoiceID
   from [cube].[F_ProductRevenueENT] E JOIN [cube].[F_ProductRevenueNAV] N ON 
   E.ContractID=N.ContractID AND
   E.LineItemID=N.LineItemID AND
   E.InvoiceID=N.InvoiceID AND
   N.PostingYearMonth=201703
   where E.[ChargeYearMonth]<>N.ChargeYearMonth

   --select distinct PostingYearMonth from cube.F_ProductRevenueNAV

   select
   [InvoiceNumber],[InvoiceID]
       from  [cube].[F_ProductRevenueNAV]



	 UPDATE N
	 SET N.ChargeYearMonth=E.ChargeYearMonth
	   --select E.InvoiceID,E.InvoiceYearMonth ,E.[ChargeYearMonth], E.LineItemID, N.PostingYearMonth,N.ChargeYearMonth,N.InvoiceID
   from [cube].[F_ProductRevenueENT] E JOIN [cube].[F_ProductRevenueNAV] N ON 
   E.ContractID=N.ContractID AND
   E.LineItemID=N.LineItemID AND
   E.InvoiceID=N.InvoiceID AND
   --N.PostingYearMonth=201703
   E.[ChargeYearMonth]<>N.ChargeYearMonth



alter table  [cube].[XD_InvoiceNumber] add InvoiceID int null;
  ------------------------------------------------------------------------
  update I
  set I.[InvoiceID]=B.FixedInvoice
  from [cube].[XD_InvoiceNumber] I JOIN [dbo].[InvoiceBridge] B ON 
  I.InvoiceNumber=B.InvoiceNumber
  ------------------------------------------------------------------------