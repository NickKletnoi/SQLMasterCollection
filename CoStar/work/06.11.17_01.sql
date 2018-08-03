
select top 100
[Line Item ID] as LineItem,
[G_L Account No_] as GLAccount,
YEAR([Posting Date]) as PostingYear, 
MONTH([Posting Date]) as PostingMonth,   
SUM([Amount]) as Amount
from [dbo].[RIG$G_L Entry] 
where [G_L Account No_] IN 
(
'3101',
'3300',
'3090',
'3085',
'3434',
'3091',
'3084'
) and [Posting Date]>'2016-01-01 00:00:00.000'
group by [Line Item ID],YEAR([Posting Date]),MONTH([Posting Date]),[G_L Account No_]

select top 10 * from [dbo].[RIG$G_L Entry]
--------------------------
---------------------------

SELECT 
C.NAME AS COLUMN_NAME,
T.NAME AS TABLE_NAME 
FROM SYS.columns C JOIN SYS.TABLES T 
ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN SYS.schemas S 
ON T.[SCHEMA_ID]=S.[schema_id]
WHERE
C.NAME like '%Global Dimension 1%' and
T.NAME LIKE '%RIG%' 
ORDER BY C.COLUMN_ID

select top 10 * from [dbo].[RIG$ITem]