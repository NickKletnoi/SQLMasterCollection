USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_Region]    Script Date: 04/04/2008 14:59:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
SELECT * FROM Dim_Region
*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_Region]
AS
BEGIN

SET NOCOUNT ON

CREATE TABLE #TestRegion
(
TRegionID INT,
TName NVARCHAR(100),
TH1 NVARCHAR(50),
TH2 NVARCHAR(50)
)

INSERT INTO #TestRegion VALUES(34855,'Americas','AMRS','AMRS')
INSERT INTO #TestRegion VALUES(34848,'AsiaPac','PacRim','PacRim')
INSERT INTO #TestRegion VALUES(34850,'EMEA','EMEA','EMEA')
INSERT INTO #TestRegion VALUES(34851,'Europe','EMEA','EMEA')
INSERT INTO #TestRegion VALUES(34847,'Global','Global','Global')
INSERT INTO #TestRegion VALUES(34858,'North America','AMRS','AMRS')
INSERT INTO #TestRegion VALUES(34849,'AsiaExJapan','PacRim','PacRim')
INSERT INTO #TestRegion VALUES(34853,'Australasia','PacRim','PacRim')
INSERT INTO #TestRegion VALUES(34887,'Emerging Market MiddleEast','EMEA','EEMEA')
INSERT INTO #TestRegion VALUES(34856,'Latin America','AMRS','AMRS')
INSERT INTO #TestRegion VALUES(34867,'Japan','PacRim','PacRim')
INSERT INTO #TestRegion VALUES(34883,'Emerging Market Europe','EMEA','EEMEA')
INSERT INTO #TestRegion VALUES(34882,'Emerging Market Asia','PacRim','PacRim')
INSERT INTO #TestRegion VALUES(34884,'Emerging Market Africa','EMEA','EEMEA')
INSERT INTO #TestRegion VALUES(48555,'Emerging Markets Global','Global','Global')
INSERT INTO #TestRegion VALUES(34852,'Africa','EMEA','EMEA')
INSERT INTO #TestRegion VALUES(34859,'Middle East','EMEA','EMEA')


INSERT INTO dbo.Dim_Region
(
RegionID_NK,
RegionName,
Hierarchy1,
Hierarchy2,
InsertDate,
LastUpdateDate
)
SELECT
SourceID          = LOC.LOC_ID, 
LookupValue       = LOC_DESCR.NM, 
TH1,
TH2,
 GETDATE(),
NULL

FROM RDWDB.dbo.LOC LOC
INNER JOIN 
RDWDB.dbo.LOC_DESCR LOC_DESCR
ON
LOC.LOC_ID =LOC_DESCR.LOC_ID
LEFT JOIN #TestRegion
ON
	LOC.LOC_ID=TRegionID
WHERE LOC.LOC_TYP_ID = 141
  AND LOC.ACTV_IN    = 'Y'
  AND LOC_DESCR.ACTV_IN    = 'Y'
  AND   LOC_DESCR.LANG_ID=1
AND NOT EXISTS(SELECT * FROM dbo.Dim_Region WHERE RegionID_NK=LOC.LOC_ID)


UNION ALL  
SELECT
SourceID          = LOC.LOC_ID, 
LookupValue       = LOC_DESCR.NM, 
TH1,
TH2,
 GETDATE(),
NULL
FROM RDWDB.dbo.LOC LOC
INNER JOIN 
RDWDB.dbo.LOC_DESCR LOC_DESCR
ON
LOC.LOC_ID =LOC_DESCR.LOC_ID
LEFT JOIN #TestRegion
ON
	LOC.LOC_ID=TRegionID
WHERE LOC.LOC_TYP_ID = 99
  AND LOC.ACTV_IN    = 'Y'
  AND LOC_DESCR.ACTV_IN    = 'Y'
  AND   LOC_DESCR.LANG_ID=1
AND NOT EXISTS(SELECT * FROM dbo.Dim_Region WHERE RegionID_NK=LOC.LOC_ID)

UNION ALL

SELECT -1,'None','None','None',GETDATE(),NULL
WHERE
	NOT EXISTS(SELECT * FROM dbo.Dim_Region WHERE RegionID_NK=-1)



END


