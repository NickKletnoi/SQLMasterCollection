SELECT 
C.NAME AS COLUMN_NAME,
ST.name AS COLUMN_TYPE, 
T.NAME AS TABLE_NAME
FROM SYS.columns C JOIN SYS.TABLES T 
ON C.[OBJECT_ID]=T.[OBJECT_ID] JOIN SYS.schemas S 
ON T.[SCHEMA_ID]=S.[schema_id] JOIN  SYS.TYPES ST ON
C.system_type_id=ST.system_type_id
WHERE
ST.name='int' o
--(C.NAME LIKE '%total area%') OR (C.NAME LIKE '%sq foot%') OR (C.NAME LIKE '%square%')
--T.NAME='LOCATION' AND 
ORDER BY C.Name
------------------------------------------------------------------------------------
--Column='AreaSqFt'	int	table='Footprint'
--Column='AverageTenantSizeSqFt'	int	table='ResearchUpdate'
--Column='AvailableFloorSpace'	int	table='ResearchUpdate'
--Column='CenterTotalLotSqFt'	int	table='ShoppingCenterAttributes'
--                                 table='inboxBaselineRollup'
---DealSF	int	UsageUserInfo ??
--Column=GrossTypFloorSqFtSourceID	table='Property'
------------------------------------------------------------------------------------
----select * from sys.types
------------------------------------------------------------------------------------
