



select Distinct 
--[InvoiceDetailID] ,
--[InvoiceID] ,
ContractID, [BillingStartDate] from [stub].[RawInputInvoiceDetail]
where ContractID IN (select ContractID from [stub].[ContractsMoreThanOneBillStartDate])
ORDER BY ContractID

select count(*) from [cube].[F_ProductRevenueENT] where StubAmount is null;
--1,696,431
select BillingStartDate  from [cube].[F_ProductRevenueENT] 
--where StubAmount is null;
--2,373,126


select TransactionID from [cube].[F_ProductRevenueENT]
where TransactionID is not null;

select * from [cube].[F_ProductRevenueENT]

alter table [cube].[F_ProductRevenueENT] drop column PreviousBalance;
alter table [cube].[F_ProductRevenueENT] drop column InvoiceText;

update R
set R.StubAmount=0.00
from [cube].[F_ProductRevenueENT] R where R.StubAmount IS NULL;  


select * from [stub].[RawInputInvoiceDetail] where InvoiceDetailID=38319931