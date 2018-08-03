--------------------------------------------
SELECT sc.name +'.'+ ta.name AS TableName
,SUM(pa.rows) RowCnt
FROM sys.tables ta
INNER JOIN sys.partitions pa
ON pa.OBJECT_ID = ta.OBJECT_ID
INNER JOIN sys.schemas sc
ON ta.schema_id = sc.schema_id
GROUP BY sc.name,ta.name
--ORDER BY ta.name
ORDER BY SUM(pa.rows) DESC;
-----------------------------------------------------
-----------------------------------------------------
--dbo.rpro_transactions_pre_stg_hist; ---------------
--dbo.CSTR_RPRO_ERR_CODE_DETAILS_test; --------------
-----------------------------------------------------
-----------------------------------------------------
SELECT COUNT(DISTINCT deal_id) FROM dbo.rpro_transactions_pre_stg_hist;
----------------------------------------------------

