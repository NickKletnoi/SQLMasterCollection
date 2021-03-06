USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_Industry]    Script Date: 04/04/2008 14:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
SELECT * FROM Dim_Industry
*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_Industry]
AS
BEGIN

SET NOCOUNT ON

SET NOCOUNT ON

UPDATE dbo.Dim_Industry
SET
	IndustryActive=ACTV_IN
FROM
	dbo.Dim_Industry,RDWDB.dbo.INDUS
WHERE
	IndustryID_NK=INDUS_ID


INSERT INTO dbo.Dim_Industry
(
IndustryID_NK,
IndustryShortName,
IndustryLongName,
IndustryCode,
IndustryActive,
InsertDate,
LastUpdateDate
)
SELECT
	IND.INDUS_ID,
	INDUS_SName,
	INDUS_LName,
	INDUS_CODE,
	ACTV_IN,
	GETDATE(),
	NULL
FROM
	RDWDB.dbo.INDUS IND
	INNER JOIN RDWDB.dbo.INDUS_DESCR IND_DSR
	ON
		IND.INDUS_ID=IND_DSR.INDUS_ID
		AND LANG_ID=1
WHERE
	NOT EXISTS(SELECT IndustryID_NK FROM dbo.Dim_Industry WHERE IndustryID_NK=IND.INDUS_ID)
UNION ALL
SELECT TOP 1
	-1,
	'None',
	'None',
	'None',
	'Y',
	GETDATE(),
	NULL
FROM
	dbo.Dim_Industry
WHERE
	NOT EXISTS(SELECT * FROM dbo.Dim_Industry WHERE IndustryID_NK=-1)


END
