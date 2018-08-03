-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
SELECT 
 [G_L Account No_] as GLAccount, 
 CASE WHEN (SUM(Amount) > 0) THEN SUM(Amount) ELSE 0 END AS [Debit Amount],
 CASE WHEN (SUM(Amount) <= 0) THEN SUM(Amount) ELSE 0 END * - 1 AS [Credit Amount]
-- SUM(Amount) as Amount
FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[LoopNet$G_L Entry]
WHERE YEAR([Posting Date])=2016
group by [G_L Account No_]
------------------------------------------------------------------------------
------------------------------------------------------------------------------
