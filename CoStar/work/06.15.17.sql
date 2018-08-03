--------------------------------------------------------------------------------
----------- Sales Invoice Header Count------------------------------------------
select [No_] as Invoice, 
SUM([Charged Amount]) as ChargedAmount
from [dbo].[RIG$Sales Invoice Header] where 
[Posting Date] BETWEEN '2016-06-15 00:00:00.000' and '2017-06-15 00:00:00.000'
group by [No_]
--------------------------------------------------------------------------------
----------- Sales Invoice Line Count--------------------------------------------
select [Document No_] as Invoice, 
COUNT(*) as InvoiceCount, 
--SUM([Line Discount Amount]) as LineDiscountAmount,
SUM([Amount]) as Amount
from [dbo].[RIG$Sales Invoice Line] where 
[Posting Date] BETWEEN '2016-06-15 00:00:00.000' and '2017-06-15 00:00:00.000'
group by [Document No_]
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
SELECT 
0  AS SKUID,
[Contract ID] AS ContractID,
[Line Item ID] AS LineItemID,
[CustAccountLocationID] AS LocationID,
'' AS GLAccount,
CAST(YEAR([Posting Date])  AS VARCHAR(4))+
CASE MONTH([Posting Date])
     WHEN 1 THEN '-Jan'
	 WHEN 2 THEN '-Feb'
	 WHEN 3 THEN '-Mar'
	 WHEN 4 THEN '-Apr'
	 WHEN 5 THEN '-May'
	 WHEN 6 THEN '-Jun'
	 WHEN 7 THEN '-Jul'
	 WHEN 8 THEN '-Aug'
	 WHEN 9 THEN '-Sep'
	 WHEN 10 THEN '-Oct'
	 WHEN 11 THEN '-Nov'
	 WHEN 12 THEN '-Dec'
	 ELSE '-Ukn' END AS PostingYearMonth,
YEAR([Posting Date]) AS PostingYear,
MONTH([Posting Date]) AS PostingMonth,
SUM([Amount]) AS InvoiceAmount,
SUM(0) AS ContractAmount
FROM [dbo].[RIG$Sales Invoice Line] WHERE 
[Posting Date] BETWEEN '2016-06-15 00:00:00.000' and '2017-06-15 00:00:00.000'
GROUP BY [Contract ID],[Line Item ID],[CustAccountLocationID],[Posting Date]
----------------------------


select top 10 [Contract Number] from [dbo].[RIG$Sales Invoice Header] where [Contract Number]<>'' and [Contract Number] is not null
select top 10 [Contract ID] from [dbo].[RIG$Sales Invoice Line] where [Contract ID]<>'' and [Contract ID] is not null





[dbo].[RIG$Sales Invoice Line]


select top 10 [Posting Date]  from  [dbo].[RIG$Sales Invoice Header]
select top 10 *  from  [dbo].[RIG$Sales Invoice Header]
select top 10 * from [dbo].[RIG$Sales Invoice Line]
