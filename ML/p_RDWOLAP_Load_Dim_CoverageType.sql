USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_CoverageType]    Script Date: 04/04/2008 14:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
SELECT * FROM Dim_CoverageType
*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_CoverageType]
AS
BEGIN

SET NOCOUNT ON

	UPDATE dbo.Dim_CoverageType
	SET
		CoverageTypeActive=ACTV_IN,
		LastUpdateDate=GETDATE()
	FROM
		dbo.Dim_CoverageType,RDWDB.dbo.COVRG_TYP
	WHERE
		CoverageType=NM

	
	INSERT INTO dbo.Dim_CoverageType
	(
	CoverageTypeID_NK,
	CoverageType,
	CoverageTypeActive,
	InsertDate,
	LastUpdateDate
	)
	SELECT DISTINCT
		COVRG_TYP_ID,
		NM,
		ACTV_IN,
		GETDATE(),
		NULL
	FROM
		RDWDB.dbo.COVRG_TYP
	WHERE
		NOT EXISTS(SELECT CoverageTypeID_NK FROM dbo.Dim_CoverageType WHERE CoverageType=NM)
	UNION ALL
	SELECT DISTINCT -1,'None','N',GETDATE(),NULL
	FROM
		dbo.Dim_CoverageType
	WHERE
		NOT EXISTS(SELECT CoverageTypeID_NK FROM dbo.Dim_CoverageType WHERE CoverageTypeID_NK=-1)


END
