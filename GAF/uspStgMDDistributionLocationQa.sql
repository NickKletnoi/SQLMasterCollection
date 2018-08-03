USE [ERAEDWPROD]
GO

/****** Object:  StoredProcedure [dbo].[uspStgMDDistributionLocationQa]    Script Date: 07/19/2011 14:34:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspStgMDDistributionLocationQa]
AS

DECLARE @ExDTTM DateTime
SET @ExDTTM = GetDate()

-- Find and capture the duplicates
INSERT INTO [dbo].[StgSpPSFT1PS_STOR_AREA_INV]
	([BUSINESS_UNIT], [STORAGE_AREA], [DESCR], [DESCRSHORT], [ST_LEVEL_DISPLAY], [DELETE_STORLOC_FLG]
	,[ExceptionDescription], [CorrectedValue], [ExceptionTimeStamp]
	,[SourceSystemID], [SourceBatchProcessNumber], [SourceEffectiveTimestamp], [SourceBatchProcessDate], [SourceSystemUserName], [SourceSystemDeletedIndicator]
	,[ERAEBatchProcessNumber], [ERAEBatchProcessDate], [ERAEOperationTimestamp], [ERAEUserName])
SELECT BUSINESS_UNIT, STORAGE_AREA, DESCR, DESCRSHORT, ST_LEVEL_DISPLAY, DELETE_STORLOC_FLG
, 'Duplicate STORAGE_AREA (warehouse)', '', @ExDTTM
, [SourceSystemID], [SourceBatchProcessNumber], [SourceEffectiveTimestamp], [SourceBatchProcessDate], [SourceSystemUserName], [SourceSystemDeletedIndicator]
, [ERAEBatchProcessNumber], [ERAEBatchProcessDate], [ERAEOperationTimestamp], [ERAEUserName]
FROM [dbo].[StgCpPSFT1PS_STOR_AREA_INV]
WHERE STORAGE_AREA IN (
						SELECT SA.STORAGE_AREA
						FROM 
							(SELECT SA.BUSINESS_UNIT, SA.STORAGE_AREA
								FROM StgCpPSFT1PS_STOR_AREA_INV SA WITH(NOLOCK)
								INNER JOIN StgCpPSFT1PS_BUS_UNIT_TBL_FS BUFS WITH(NOLOCK) ON SA.BUSINESS_UNIT = BUFS.BUSINESS_UNIT  
								INNER JOIN StgCpPSFT1PS_LOCATION_TBL LOC WITH(NOLOCK) ON SA.STORAGE_AREA = LOC.LOCATION 
									AND LOC.EFFDT = (SELECT MAX(EFFDT) FROM StgCpPSFT1PS_LOCATION_TBL WHERE SETID = LOC.SETID AND LOCATION = LOC.LOCATION )
								INNER JOIN StgCpPSFT1PS_STOR_LOC_INV SLI WITH(NOLOCK) ON SA.BUSINESS_UNIT = SLI.BUSINESS_UNIT AND SA.STORAGE_AREA = SLI.STORAGE_AREA
									AND SLI.STOR_LEVEL_1 = 'MAIN'
								LEFT JOIN StgCpPSFT1PS_GAF_BU_XREF GBUX WITH(NOLOCK) ON SA.STORAGE_AREA = GBUX.BUSINESS_UNIT
								WHERE SA.DELETE_STORLOC_FLG = 'N' 
							UNION SELECT LOCATION, LOCATION FROM StgCpPSFT1PS_LOCATION_TBL WHERE LOCATION = '99'
							UNION SELECT LOCATION, LOCATION FROM StgCpPSFT1PS_LOCATION_TBL WHERE LOCATION = '99999') SA
						GROUP BY STORAGE_AREA
						HAVING Count(STORAGE_AREA) > 1
					)
ORDER BY BUSINESS_UNIT, STORAGE_AREA;

-- Update the StgSp table to populate the [CorrectedValue] column
WITH CTE (DistributionGroupID, WarehouseID, DuplicateCount)
 AS
 (
	 SELECT DistributionGroupID, WarehouseID,
	 ROW_NUMBER() OVER(PARTITION BY WarehouseID ORDER BY DistributionGroupID DESC) AS DuplicateCount
	 FROM StgDistributionLocation
 )
UPDATE SA SET SA.[CorrectedValue] = 'Excluded from DW'
--SELECT SA.BUSINESS_UNIT, SA.STORAGE_AREA, SA.[CorrectedValue], CTE.DuplicateCount
FROM [dbo].[StgSpPSFT1PS_STOR_AREA_INV] AS SA
INNER JOIN CTE ON SA.BUSINESS_UNIT = CTE.DistributionGroupID AND SA.STORAGE_AREA = CTE.WarehouseID
WHERE CTE.DuplicateCount > 1 AND SA.[ExceptionTimeStamp] = @ExDTTM;

-- Remove the duplicates from the Stg table
WITH CTE (DistributionGroupID, WarehouseID, DuplicateCount)
 AS
 (
	 SELECT DistributionGroupID, WarehouseID,
	 ROW_NUMBER() OVER(PARTITION BY WarehouseID ORDER BY DistributionGroupID DESC) AS DuplicateCount
	 FROM StgDistributionLocation
 )
DELETE
--SELECT DistributionGroupID, WarehouseID, DuplicateCount
FROM CTE
WHERE DuplicateCount > 1


GO

