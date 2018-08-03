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
INTO F_NAVISION
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] WHERE 
[Posting Date] BETWEEN '2016-06-15 00:00:00.000' and '2017-06-15 00:00:00.000'
GROUP BY [Contract ID],[Line Item ID],[CustAccountLocationID],[Posting Date]
