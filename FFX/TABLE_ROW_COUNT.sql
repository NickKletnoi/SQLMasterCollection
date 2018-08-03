



--------------------------------------------------------------------------------------------------
SELECT TABLE_SCHEMA,TABLE_NAME, COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH,
COLUMNPROPERTY(OBJECT_ID(TABLE_SCHEMA + '.' + TABLE_NAME), COLUMN_NAME, 'ColumnID') AS COLUMN_ID
FROM [DMB_FOCUS_DW].INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FM_CMMT_LNITMS' AND TABLE_SCHEMA='TD';
--------------------------------------------------------------------------------------------------


USE [DMB_FOCUS_DW]
SELECT sc.name +'.'+ ta.name AS TableName
,SUM(pa.rows) RowCnt
FROM sys.tables ta
INNER JOIN sys.partitions pa
ON pa.OBJECT_ID = ta.OBJECT_ID
INNER JOIN sys.schemas sc
ON ta.schema_id = sc.schema_id
GROUP BY sc.name,ta.name
ORDER BY ta.name
--ORDER BY SUM(pa.rows) DESC;
-------------------------------
USE [DMB_FOCUS_STG]
SELECT sc.name +'.'+ ta.name AS TableName
,SUM(pa.rows) RowCnt
FROM sys.tables ta
INNER JOIN sys.partitions pa
ON pa.OBJECT_ID = ta.OBJECT_ID
INNER JOIN sys.schemas sc
ON ta.schema_id = sc.schema_id
GROUP BY sc.name,ta.name
ORDER BY ta.name
--ORDER BY SUM(pa.rows) DESC;
