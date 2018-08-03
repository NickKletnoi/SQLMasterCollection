IF OBJECT_ID('tempdb..MergeBal', 'U') IS NOT NULL DROP TABLE tempdb..MergeBal;
SELECT 
GLAccount,
[2016-Jul],
[2016-Aug],
[2016-Sept],
[2016-Oct],
[2016-Nov],
[2016-Dec],
[2017-Jan],
[2017-Feb],
[2017-Mar],
[2016-Apr],
[2017-May],
[2017-Jun]
INTO #MergeBal
FROM  ( select [GLAccount],[Credit],[PostingYearMonth] from 
[bal].[MergeBal]  where LEFT(GLAccount,1)='3')
 p  

PIVOT  
(  
SUM(Credit)
FOR PostingYearMonth IN 
( 
[2016-Jul],
[2016-Aug],
[2016-Sept],
[2016-Oct],
[2016-Nov],
[2016-Dec],
[2017-Jan],
[2017-Feb],
[2017-Mar],
[2016-Apr],
[2017-May],
[2017-Jun]
)  
) AS pvt  

SELECT 
GLAccount,
SUM([2016-Jul]) AS [2016-Jul],
SUM([2016-Aug])  AS [2016-Aug],
SUM([2016-Sept]) AS [2016-Sept],
SUM([2016-Oct]) AS [2016-Oct],
SUM([2016-Nov]) AS [2016-Nov],
SUM([2016-Dec]) AS [2016-Dec],
SUM([2017-Jan]) AS [2017-Jan],
SUM([2017-Feb]) AS [2017-Feb],
SUM([2017-Mar]) AS [2017-Mar],
SUM([2016-Apr]) AS [2016-Apr],
SUM([2017-May]) AS [2017-May],
SUM([2017-Jun]) AS [2017-Jun],
SUM([2016-Jul])+SUM([2016-Aug])+SUM([2016-Sept])+SUM([2016-Oct])+SUM([2016-Nov])+SUM([2016-Dec])+SUM([2017-Jan])+SUM([2017-Feb])+SUM([2017-Mar])+SUM([2016-Apr])+SUM([2017-May])+SUM([2017-Jun]) as TOTAL 
FROM #MergeBal
GROUP BY GLAccount;



---------------------------------------------------------------------------------
select GLAccount,SUM([2016-Dec]) Amount from #BalPiv where LEFT(GLAccount,1)='3'
group by GLAccount
---------------------------------------------------------------------------------
select distinct [PostingYearMonth] from [bal].[MergeBal];-------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
select [GLAccount],SUM([Debit]) as Amount -----------------------------------------
from [bal].[MergeBal] where GLAccount is not null and PostingYearMonth IN ('2016-Dec')
group by [GLAccount]; ----------------------------------------------------------------
--------------------------------------------------------------------------------------

/* 
   |----------------------------------------
   |Goals For Today:
   |----------------------------------------
   | 1. Start on the reconciliation report;
   | 2. Get in contact for the sku'ing stuff;
   |-----------------------------------------
 
*/
