
SELECT [Description 3], *
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line]
WHERE [Description 3] is not null;
select top 100 * from [DCSQLPRD104].Enterprise.dbo.[Contract];
select distinct BillingTermID from [DCSQLPRD104].Enterprise.dbo.[Contract];
----------------------------------------------------------------------------

DECLARE @BillStart DATE
DECLARE @BillEnd DATE

SELECT MAX(

SELECT  
ContractID, 
LineItemID, 
YEAR(BillingStartDate) as BillingYear,
MONTH( BillingStartDate) as BillingMonth
into stub.RawInput
FROM [DCSQLPRD104].Enterprise.dbo.LineItem  
where BillingStartDate 
BETWEEN '2016-05-15 00:00:00.000' and '2017-06-15 00:00:00.000'
---------------------------------------------------------------
alter table [stub].[RawInput] add InvoiceYear int null;
alter table [stub].[RawInput] add InvMonth int null;
alter table [stub].[RawInput] Rename column StubAmt money null;
--------------------------------------------------------------


update R
set 
R.[InvoiceYear]=2017,
R.[InvMonth]=1
FROM [stub].[RawInput] R  

update R
set 
R.InvoiceYear=R.[BillingYear],
R.[InvMonth]=R.[BillingMonth]+1
FROM [stub].[RawInput] R  where not ( BillingMonth=12 and BillingYear=2016)




select * from [stub].[RawInput] where  BillingMonth=12

SP_Rename 

----------------------------------------------

select * from [stub].[RawInput]

update R
set R.FirstInvAmt=F.[InvoiceAmount]
from [cube].[F_ProductRevenue] F JOIN [stub].[RawInput] R on 
F.ContractID=R.ContractID AND
F.LineItemID=R.LineItemID AND
F.PostingYear=R.InvoiceYear AND
F.PostingMonth=R.InvMonth

delete from [stub].[RawInput] where FirstInvAmt is null;

select * from  [stub].[RawInput]


select Contractid, LineItemID,AVG([InvoiceAmount]) as AvgInvAmt 
INTO stub.RawAvgAmounts
from [cube].[F_ProductRevenue] R 
Group By Contractid, LineItemID

where 
ContractID=152187 AND 	
LineItemID=1892824 AND
PostingYear=2016 AND
PostingMonth=8
-- $374.50


update RI
set RI.[AvgInvAmt]=RA.[AvgInvAmt]
FROM [stub].[RawInput] RI JOIN [stub].[RawAvgAmounts] RA ON 
RI.ContractID=RA.ContractID AND
RI.LineItemID=RA.LineItemID

update RI
set RI.[StubAmt]=RI.[AvgInvAmt]-[FirstInvAmt]
FROM [stub].[RawInput] RI 

update [stub].[RawInput] set StubAmt=NULL where StubAmt is not null;



select sum([StubAmt]) from [stub].[RawInput]

----4,934,868.8582

select * from [stub].[RawInput]

SELECT
sum(sign([StubAmt])) as [sign]
--[StubAmt]
FROM
    [stub].[RawInput] where sign([StubAmt])=-1.00
	--where [StubAmt]='-1.00';
	-----------------------------

select sum([StubAmt]) from [stub].[RawInput]
--4,934,868.85

alter table [cube].[F_ProductRevenue] add StubAmount numeric(38,20) null;

update F
set F.[StubAmount]=R.[StubAmt]
from [cube].[F_ProductRevenue] F JOIN [stub].[RawInput] R on 
F.ContractID=R.ContractID AND
F.LineItemID=R.LineItemID AND
F.PostingYear=R.InvoiceYear AND
F.PostingMonth=R.InvMonth AND
F.LocationID IN (SELECT MAX([LocationID]) from [cube].[F_ProductRevenue] F1 where F1.LocationID=F.LocationID)


select sum([StubAmount])  from [cube].[F_ProductRevenue];

--23,563,639.92450000000000000000

update [cube].[F_ProductRevenue] set [StubAmount]=NULL where [StubAmount] is not null

select * from [stub].[RawInput]

select sum([StubAmt]) from [stub].[RawInput]
--4,934,868.8582
----------------------------------------------------------------------------------

update F 
set F.[StubAmount]=R.StubAmt
from [cube].[F_ProductRevenue] F JOIN [stub].[RawInput] R on 
F.ContractID=R.ContractID AND
F.LineItemID=R.LineItemID AND
F.PostingYear=R.InvoiceYear AND
F.PostingMonth=R.InvMonth AND
F.InvoiceAmount=R.FirstInvAmt
--F.PostingMonth=R.InvMonth 
--AND
--F.LocationID IN (SELECT MAX([LocationID]) from [cube].[F_ProductRevenue] F1 where F1.LocationID=F.LocationID)
--------------------------------------------------------------
--------------------------------------------------------------

update [cube].[F_ProductRevenue] set [StubAmount]=NULL WHERE [StubAmount] IS NOT NULL;

SELECT SUM([StubAmount]) FROM [cube].[F_ProductRevenue];

--11,468,728.26

SELECT COUNT(*) FROM [stub].[RawInput]

SELECT 
[ContractID],
[LineItemID],
[InvoiceYear],
[InvMonth],
[FirstInvAmt],
COUNT(*) AS CNT
FROM [stub].[RawInput]
GROUP BY 
[ContractID],
[LineItemID],
[InvoiceYear],
[InvMonth],
[FirstInvAmt]
HAVING 
COUNT(*)>1
---------------------------------
SELECT 
[ContractID],
[LineItemID],
[PostingYear],
[PostingMonth],
[InvoiceAmount],
COUNT(*) AS CNT
FROM [cube].[F_ProductRevenue] WHERE LEFT([GLAccount],1)='3'
GROUP BY 
[ContractID],
[LineItemID],
[PostingYear],
[PostingMonth],
[InvoiceAmount]
HAVING 
COUNT(*)>1





SELECT * FROM [cube].[F_ProductRevenue]
WHERE
CONTRACTID=83370 AND
LineItemID=1057283 AND
PostingYear=2017 AND
PostingMonth=3
AND lefT(GLAccount,1)=3
-----------------------------
-----------------------------
SELECT * FROM [cube].[D_GLAccount]
WHERE [GLAccount]='3084'
------------------------------
