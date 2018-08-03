SELECT 
C.NAME AS COLUMN_NAME,
T.NAME AS TABLE_NAME 
FROM SYS.columns C JOIN SYS.TABLES T 
ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN SYS.schemas S 
ON T.[SCHEMA_ID]=S.[schema_id]
WHERE
C.NAME like '%Market%'
--T.NAME='LOCATION' AND 
ORDER BY C.COLUMN_ID
---------------------------------------------------

SELECT CoStarMarket, MarketName FROM CostarMarket




