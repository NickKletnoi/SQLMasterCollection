select * from [stub].[RawInputInvoiceDetail]

select
ContractID,
COUNT(Distinct BillingStartDate) as CNT
INTO stub.ContractsMoreThanOneBillStartDate
from [stub].[RawInputInvoiceDetail]
Group by ContractID
Having COUNT(Distinct BillingStartDate)>1
---------------------------------------------
---------------------------------------------


alter table [stub].[ContractsOnlyOneBillStartDate] drop column CNT

alter table [stub].[ContractsOnlyOneBillStartDate] add BillingStartDate date null;
alter table [stub].[ContractsOnlyOneBillStartDate] add BillingMonth INT null;
alter table [stub].[ContractsOnlyOneBillStartDate] add BillingYear INT null;
alter table [stub].[ContractsOnlyOneBillStartDate] add InvoiceID INT null;
alter table [stub].[ContractsOnlyOneBillStartDate] add InvoiceDetailID INT null;

----------------------------------------------------------[stub].[ContractsOnlyOneBillStartDate]------------------


select 
InvoiceDetailID,
InvoiceID,
ContractID,
MONTH(BillingStartDate) MTH,
YEAR(BillingStartDate) YR,
MIN(BillingStartDate) Min_Date,
SUM(StubAmount) as StubAmount
INTO stub.FlagOnlyOneBillStartDate
from [stub].[RawInputInvoiceDetail] where ContractID IN (select ContractID 
from [stub].[ContractsOnlyOneBillStartDate])
GROUP BY 
InvoiceDetailID,
InvoiceID,
ContractID,
MONTH(BillingStartDate),
YEAR(BillingStartDate)


alter table [stub].[RawInputInvoiceDetail] add StartType char(1) null;

select count(*) from [stub].[RawInputInvoiceDetail]

update R
set R.[StartType]='O'
from [stub].[RawInputInvoiceDetail] R where ContractID IN  (select ContractID from [stub].[ContractsOnlyOneBillStartDate])
----
update R
set R.[StartType]='M'
from [stub].[RawInputInvoiceDetail] R where ContractID IN  (select ContractID from [stub].[ContractsMoreThanOneBillStartDate])

select * 
INTO [stub].[RawInputInvoiceDetail1]
from [stub].[RawInputInvoiceDetail]


update R
SET R.StubAmount=NULL
from [stub].[RawInputInvoiceDetail] R where R.StartType='O'

----------------------------

update R
SET R.StubAmount=F.StubAmount
FROM [stub].[RawInputInvoiceDetail] R JOIN stub.FlagOnlyOneBillStartDate F ON
R.InvoiceDetailID=F.InvoiceDetailID and R.InvoiceID=F.InvoiceID and R.ContractID=F.ContractID

select * from [stub].[StubAmountbyMonthYear]
order by StubAmount ASC


select E.ChargeMonth, E.ChargeYear, Sum(R.StubAmount) as StubAmount
from [cube].[F_ProductRevenueENT] E JOIN [stub].[RawInputInvoiceDetail] R ON E.InvoiceDetailID=R.InvoiceDetailID
group by E.ChargeMonth, E.ChargeYear




