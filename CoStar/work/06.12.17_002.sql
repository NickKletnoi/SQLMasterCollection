USE [CoStar]
GO
/****** Object:  StoredProcedure [dbo].[uspLOAD_F_Navision]    Script Date: 6/12/2017 5:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[uspLOAD_F_Navision]
AS

SELECT
SBF2.[LocationID],
SBF2.[ContractID],
SBF2.[SKUID],
R.[G_L Account No_] as GLAccount,
CAST(YEAR(R.[Posting Date])  as varchar(4))+
CASE MONTH(R.[Posting Date])
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
	 ELSE '-Ukn' END as YearMonth,
SUM(R.[Credit Amount]) as CreditAmount,
SUM(R.[Debit Amount]) as DebitAmount,   
SUM(R.[Amount]) as TotalAmount
INTO F_NAV2
from [DCSQLDEV135\ACCT].[NavisionDB260_PRD].[dbo].[RIG$G_L Entry] R JOIN [dbo].[LineItemComplete] LIC ON R.[Line Item ID]=LIC.LineItemID
     LEFT JOIN SkuBridgeFinal2 SBF2 ON R.[Line Item ID]=SBF2.LineItemID
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
) and R.[Posting Date]>='2017-01-01 00:00:00.000'
group by R.[Line Item ID],YEAR(R.[Posting Date]),MONTH(R.[Posting Date]),R.[G_L Account No_],
SBF2.[LocationID],
SBF2.[ContractID],
SBF2.[SKUID]



