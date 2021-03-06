USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_Focus]    Script Date: 04/04/2008 14:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select * from Dim_Focus
*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_Focus]
AS
BEGIN

SET NOCOUNT ON	

	

	INSERT INTO dbo.Dim_Focus
	(
	FocusID_NK,
	Focus,
	InsertDate,
	LastUpdatedate
	)

	SELECT
	SourceID          = FOCUS.FOCUS_ID, 
	LookupValue       = FOCUS.NM, 
 	GETDATE(),
	NULL
	FROM	RDWDB.dbo.FOCUS FOCUS
	WHERE	NOT EXISTS(SELECT * FROM Dim_Focus WHERE FOCUS.FOCUS_ID=FocusID_NK)
UNION ALL
	SELECT -1,'None',GETDATE(),NULL 
	FROM
		dbo.Dim_Focus
	WHERE
	NOT EXISTS(SELECT FocusID_NK FROM dbo.Dim_Focus WHERE FocusID_NK=-1)


END

