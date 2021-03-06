USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_Country]    Script Date: 04/04/2008 14:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Select * from Dim_Country
*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_Country]
AS
BEGIN

SET NOCOUNT ON


UPDATE dbo.Dim_Country
SET
	CountryActive=ACTV_IN,
	LastUpdateDate=GETDATE()
FROM
	dbo.Dim_Country,RDWDB.dbo.LOC
WHERE
	Country=NM


INSERT INTO dbo.Dim_Country
(
CountryID_NK,
Country,
CountryCode,
CountryActive,
InsertDate,
LastUpdateDate
)
SELECT LOC_ID,NM,LOC_CD,ACTV_IN,GETDATE(),NULL
FROM
	RDWDB.dbo.LOC
WHERE
	LOC_TYP_ID=91
	AND NOT EXISTS(SELECT CountryID_NK FROM dbo.Dim_Country WHERE Country=NM)
UNION ALL
SELECT TOP 1
	-1,
	'None',
	'None',
	'Y',
	GETDATE(),
	NULL
FROM
	dbo.Dim_Country
WHERE
	NOT EXISTS(SELECT * FROM dbo.Dim_Country WHERE CountryID_NK=-1)


END

