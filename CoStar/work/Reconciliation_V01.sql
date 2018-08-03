SELECT 
COUNT(*) AS RowCnt,
SUM([Amount]) as InvAmount   
FROM  [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line]


-------------------------------------
SELECT 
COUNT(*) AS RowCnt,
SUM([Amount]) as InvAmount   
FROM  [dbo].[RIG$Sales Invoice Line]
--------------------------------------

SELECT
COUNT(*) AS RowCnt,
SUM(OriginalMonthlyPrice) as OMP 
FROM [DCSQLPRD104].Enterprise.dbo.LineItem
----------------

SELECT
COUNT(*) AS RowCnt,
SUM(OriginalMonthlyPrice) as OMP 
FROM dbo.LineItem
-------------------


