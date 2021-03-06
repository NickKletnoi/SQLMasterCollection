USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_SecurityType]    Script Date: 04/04/2008 15:00:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
SELECT * FROM Dim_SecurityType
*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_SecurityType]
AS
BEGIN

SET NOCOUNT ON	

	

	INSERT INTO dbo.Dim_SecurityType
	(
	SecurityTypeID_NK,
	SecurityType,
	InsertDate,
	LastUpdatedate
	)

	SELECT
	SourceID          = FIN_INSTRM_TYP.FIN_INSTRM_TYP_ID, 
	LookupValue       = ISNULL(FIN_INSTRM_TYP.DESCR, FIN_INSTRM_TYP.NM), 
 	GETDATE(),
	 NULL
FROM	RDWDB.dbo.FIN_INSTRM_TYP_DESCR FIN_INSTRM_TYP
WHERE	LANG_ID=1
		AND NOT EXISTS(SELECT SecurityTypeID_NK FROM dbo.Dim_SecurityType WHERE SecurityTypeID_NK=FIN_INSTRM_TYP.FIN_INSTRM_TYP_ID)
UNION ALL
	SELECT DISTINCT -1,'None',GETDATE(),NULL
	FROM
		dbo.Dim_SecurityType
	WHERE
		NOT EXISTS(SELECT SecurityTypeID_NK FROM dbo.Dim_SecurityType WHERE SecurityTypeID_NK=-1)


END

