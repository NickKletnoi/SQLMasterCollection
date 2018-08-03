select LineItemID from [cube].[F_ProductRevenueNAV] where [StubAmount] is not null;

select count(*) from [cube].[F_ProductRevenueNAV]; 


SELECT 
ContractID as ContractID, 
LineItemID as LineItemID, 
BillingStartDate as BillingStartDate,
YEAR(BillingStartDate) as BillingYear,
MONTH( BillingStartDate) as BillingMonth
/*
DATEDIFF(day,BillingStartDate,
CAST(
CAST(YEAR(BillingStartDate) as char(4))+'/'+CAST(MONTH(BillingStartDate)+1 as char(2))+'/'+'01' 
AS DATE)
) as NumOfDaysTillInvStartMonth
*/
into stub.RawInput
FROM [DCSQLPRD104].Enterprise.dbo.LineItem  
where BillingStartDate 
BETWEEN '2016-07-01 00:00:00.000' and '2017-06-30 00:00:00.000'
AND ISDATE(BillingStartDate)=1
------------------------------------------------------------------

select top 10 BillingStartDate,

CAST(
CAST(YEAR(BillingStartDate) as char(4))+'/'+CAST(MONTH(BillingStartDate)+1 as char(2))+'/'+'01' 
AS DATE)

--+'/'+ CAST(MONTH(BillingStartDate)) as char(2)) +'/01'
 as BillingEndDate
 from [DCSQLPRD104].Enterprise.dbo.LineItem  
where BillingStartDate is not null;



select distinct ContractID from [stub].[RawInput]


select * from [stub].[RawInput]

Alter Table [stub].[RawInput] add NumOfDaysTillInvStartMonth INT NULL;

Alter Table [stub].[RawInput] add DollarValuePerDay Money NULL;

Alter Table
------------------------------
------------------------------
SELECT 
ContractID as ContractID, 
LineItemID as LineItemID, 
BillingStartDate as BillingStartDate,
--DATEDIFF(day,BillingStartDate,
CAST(
CAST(YEAR(BillingStartDate) as char(4))+'/'+CAST(MONTH(BillingStartDate)+1 as char(2))+'/'+'01' 
AS DATE)
--) 
as NumOfDaysTillInvStartMonth
FROM stub.RawInput 
where MONTH(BillingStartDate)+1<>13

alter table [stub].[RawInput] alter column [NumOfDaysTillInvStartMonth] date null;

alter table  [stub].[RawInput] add [BillingEndDate] date null;


update R
SET R.[BillingEndDate]= CAST(
CAST(YEAR(BillingStartDate) as char(4))+'/'+CAST(MONTH(BillingStartDate)+1 as char(2))+'/'+'01' 
AS DATE)
FROM [stub].[RawInput] R
where MONTH(R.BillingStartDate)+1<>13
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

update R 
SET R.NumOfDaysTillInvStartMonth=DATEDIFF(day,R.BillingStartDate,R.BillingEndDate)-1
from stub.RawInput R
where MONTH(R.BillingStartDate)+1<>13
---------------------------------------------------------------------------------------
select * from [stub].[RawInput]
--------------
update R 
SET R.NumOfDaysTillInvStartMonth=NULL
from stub.RawInput R
where MONTH(R.BillingStartDate)+1<>13
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
update R
SET R.[BillingEndDate]= CAST(
CAST(YEAR(BillingStartDate)+1 as char(4))+'/'+'01'+'/'+'01' 
AS DATE)
FROM [stub].[RawInput] R
where MONTH(R.BillingStartDate)=12
------------------
------------------
update R 
SET R.NumOfDaysTillInvStartMonth=DATEDIFF(day,R.BillingStartDate,R.BillingEndDate)-1
from stub.RawInput R
where MONTH(R.BillingStartDate)=12
----------------------------
select * from stub.RawInput
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
---------------------------- Do the same thing but with Invoice Detail --------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

SELECT 
[InvoiceDetailID] as InvoiceDetailID,
[InvoiceID] as InvoiceID,
ContractID as ContractID, 
LineItemID as LineItemID, 
BillingStartDate as BillingStartDate,
[GrossMonthlyPrice],
[DiscountAmount],
[SalesTaxAmount]
INTO [stub].[RawInputInvoiceDetail]
FROM [DCSQLPRD104].Enterprise.dbo.InvoiceDetail
where BillingStartDate 
BETWEEN '2016-07-01 00:00:00.000' and '2017-06-30 00:00:00.000'
and [InvoiceDetailID] IN (SELECT [InvoiceDetailID] from [cube].[F_ProductRevenueENT])


select count(*) from  [stub].[RawInputInvoiceDetail]

alter table [stub].[RawInputInvoiceDetail] add BillingEndDate date null;
alter table [stub].[RawInputInvoiceDetail] add NumOfDaysTillInvStartMonth int null;
alter table [stub].[RawInputInvoiceDetail] add DiscountedMonthlyPrice money null;
----------------------------------------------------------------------
update R
SET R.[BillingEndDate]= CAST(
CAST(YEAR(BillingStartDate) as char(4))+'/'+CAST(MONTH(BillingStartDate)+1 as char(2))+'/'+'01' 
AS DATE)
FROM [stub].[RawInputInvoiceDetail] R
where MONTH(R.BillingStartDate)+1<>13
----------------------------------------------------------------------
update R
SET R.[BillingEndDate]= CAST(
CAST(YEAR(BillingStartDate)+1 as char(4))+'/'+'01'+'/'+'01' 
AS DATE)
FROM [stub].[RawInputInvoiceDetail] R
where MONTH(R.BillingStartDate)=12
------------------------------------------------------------------

update R 
SET R.NumOfDaysTillInvStartMonth=DATEDIFF(day,R.BillingStartDate,R.BillingEndDate)-1
from [stub].[RawInputInvoiceDetail] R

---------------------------------------
update R 
SET R.[DiscountedMonthlyPrice]=([GrossMonthlyPrice]-[SalesTaxAmount]-[DiscountAmount])
from [stub].[RawInputInvoiceDetail] R
--------------------------------------------
update R 
SET R.[DiscountedMonthlyPrice]=([GrossMonthlyPrice]-[SalesTaxAmount]-[DiscountAmount])
from [stub].[RawInputInvoiceDetail] R
--------------------------------------------
alter table [stub].[RawInputInvoiceDetail] add StubAmount money null;
---------------------------------------------
update R 
SET R.[StubAmount]=([DiscountedMonthlyPrice]/30)*[NumOfDaysTillInvStartMonth]
from [stub].[RawInputInvoiceDetail] R
---------------------------------------------
---------------------------------------------
select sum([StubAmount]) from [stub].[RawInputInvoiceDetail]
--104,517,036.13
select * from [stub].[RawInputInvoiceDetail]

alter table [cube].[F_ProductRevenueENT]  add StubAmount money null;


update E
SET E.StubAmount=R.StubAmount
from 
[cube].[F_ProductRevenueENT] E  JOIN [stub].[RawInputInvoiceDetail] R
ON E.InvoiceDetailID=R.InvoiceDetailID and E.InvoiceID=R.InvoiceID and E.LineItemID=R.LineItemID


alter table [stub].[RawInputLineItem]  add StubAmount money null;
alter table [stub].[RawInputLineItem]  add DiscountedMonthlyPrice money null;

update R 
SET R.[StubAmount]=([DiscountedMonthlyPrice]/30)*[NumOfDaysTillInvStartMonth]
from [stub].[RawInputLineItem] R

update R
SET R.[DiscountedMonthlyPrice]=E.[CurrentMonthlyPrice]-[SalesTaxAmount]-[DiscountedMonthlyPrice]
from [stub].[RawInputLineItem] R JOIN [DCSQLPRD104].Enterprise.dbo.LineItem E
ON R.ContractID=E.Contractid and R.LineItemID=E.LineItemID and R.BillingStartDate=E.BillingStartDate
------------------------------------------------------------------------

update R 
SET R.[StubAmount]=([DiscountedMonthlyPrice]/30)*[NumOfDaysTillInvStartMonth]
from [stub].[RawInputLineItem] R
----------------------------------------------------------------------------
----------------------------------------------------------------------------
select sum([StubAmount]) from [stub].[RawInputLineItem]
--25,730,073.71
----------------------------------------------------------------------------
UPDATE R 
SET R.[StubAmount]=NULL,
    R.DiscountedMonthlyPrice=NULL
from [stub].[RawInputLineItem] R
---------------------------------------------------------------------------
select top 100 * from [DCSQLPRD104].Enterprise.dbo.LineItem;
---------------------------------------------------------------------------




