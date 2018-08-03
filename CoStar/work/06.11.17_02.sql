SELECT
[Line Item ID] as LineItem,
[G_L Account No_] as GLAccount,
CAST(YEAR([Posting Date])  as varchar(4))+
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
	 ELSE '-Ukn' END as YR_MTH,
YEAR([Posting Date]) as PostingYear, 
MONTH([Posting Date]) as PostingMonth,
SUM([Credit Amount]) as CreditAmount,
SUM([Debit Amount]) as DebitAmount,   
SUM([Amount]) as TotalAmount
INTO F_Invoice1
from [DCSQLDEV135\ACCT].[NavisionDB260_PRD].[dbo].[RIG$G_L Entry] 
where [G_L Account No_] IN 
(
'2401',
'3101',
'3300',
'2025',
'2001',
'3760',
'3434',
'3083',
'2005',
'2028',
'2013',
'2010',
'3090',
'2000',
'3085',
'2009',
'2026',
'2037',
'3084',
'3091',
'2003',
'2021',
'3200',
'2019',
'2002'
) and [Posting Date]>='2017-01-01 00:00:00.000'
group by [Line Item ID],YEAR([Posting Date]),MONTH([Posting Date]),[G_L Account No_]

----

select * from [dbo].[D_YearMonth] order by [YR_MTH]

CAST(YEAR(LI.Date) as varchar(4))+
CASE MONTH(LI.Date)
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
	 ELSE '-Ukn' END as YR_MTH,


select 
       SBF.SKUID,
       F.[GLAccount],
	  CAST([PostingYear] as varchar(4))+
     CASE F.[PostingMonth]
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
	 ELSE '-Ukn' END as YR_MTH,
      F.[PostingYear],
      F.[PostingMonth],
      sum(F.[Amount]) as Amount
INTO F_Invoice2
from [dbo].[F_Invoice] F JOIN [dbo].[SkuBridgeFinal] SBF ON F.LineItem=SBF.LineItemID
group by  SBF.SKUID, F.[GLAccount], F.[PostingYear],F.[PostingMonth]



 