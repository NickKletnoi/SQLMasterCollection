
WITH Numbers (N) AS (
    SELECT 1 UNION ALL
    SELECT 1 + N FROM Numbers WHERE N < 500 
)
SELECT N FROM Numbers
OPTION (MAXRECURSION 500)