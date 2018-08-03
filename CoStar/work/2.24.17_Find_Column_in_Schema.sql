----------------------------------------------------------
SELECT TOP 10 * FROM LINEITEM-----------------------------
SELECT * FROM [dbo].[MajorMarket]-------------------------
SELECT COUNT(*) FROM [dbo].[Location]--23,620,205---------
----------------------------------------------------------
----------------------------------------------------------
SELECT 
--C.NAME AS COLUMN_NAME,
T.NAME AS TABLE_NAME 
FROM SYS.columns C JOIN SYS.TABLES T 
ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN SYS.schemas S 
ON T.[SCHEMA_ID]=S.[schema_id]
WHERE
C.NAME='BUNDLEID'
--T.NAME='LOCATION' AND 
ORDER BY C.COLUMN_ID
-------------------------------------------------------------
---------------- NEWER VERSION WITH TYPES BELOW -------------
---------------------------------------------------------------
SELECT 
C.NAME AS COLUMN_NAME,
ST.name AS COLUMN_TYPE, 
T.NAME AS TABLE_NAME
FROM SYS.columns C JOIN SYS.TABLES T 
ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN SYS.schemas S 
ON T.[SCHEMA_ID]=S.[schema_id] JOIN  SYS.TYPES ST ON
C.system_type_id=ST.system_type_id
WHERE
ST.name='numeric'
--(C.NAME LIKE '%total area%') OR (C.NAME LIKE '%sq foot%') OR (C.NAME LIKE '%square%')
--T.NAME='LOCATION' AND 
ORDER BY C.Name

--------------------------------------------------------------
SELECT TOP 10 * FROM SYS.TABLES 
SELECT TOP 10 * FROM SYS.COLUMNS
SELECT TOP 10 * FROM SYS.SCHEMAS
SELECT TOP 10 * FROM REGION;
---------------------------------------------------------------
SELECT TOP 10 * FROM [dbo].[MajorMarket]
SELECT TOP 10 * FROM [dbo].[Metro]
SELECT TOP 10 * FROM [dbo].[Property]
SELECT TOP 10 * FROM [dbo].[PropertyUpdateEvent]
----------------------------------------------------------------

SELECT TOP 10 * FROM [dbo].[Region]


SELECT DISTINCT PRODUCTID FROM LINEITEM WHERE PRODUCTID NOT IN (
SELECT PRODUCTID FROM BundleTypeProduct)
-----------------------------------------------------------------
SELECT DISTINCT PRODUCTID  FROM PRODUCT; 
SELECT TOP 10 * FROM LINEITEMAUDIT;
-------------------------------------

SELECT DISTINCT CoStarMarket FROM COSTARMARKET
SELECT * FROM COSTARMARKET
-------------------------------------------
-------------------------------------------
SELECT * FROM [dbo].[CostarDepartment]
SELECT * FROM [dbo].[CostarLocation]
-------------------------------------------

