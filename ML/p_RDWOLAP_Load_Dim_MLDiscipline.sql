USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_MLDiscipline]    Script Date: 04/04/2008 14:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select * from Dim_MLDiscipline
*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_MLDiscipline]
AS
BEGIN

SET NOCOUNT ON

	INSERT INTO Dim_MLDiscipline
	SELECT
	SourceID          = DISCPLN.DISCPLN_ID, 
	LookupValue       = DISCPLN.NM, 
 	ACTV_IN,
	GETDATE(),
	NULL
FROM	RDWDB.dbo.DISCPLN DISCPLN
WHERE	DISCPLN.DISCPLN_TYP='DISCIPLINE'
AND NOT EXISTS(SELECT * FROM Dim_MLDiscipline WHERE MlDisciplineID_NK=DISCPLN_ID)

IF NOT EXISTS(SELECT * FROM Dim_MLDiscipline WHERE MlDisciplineID_WK=-1)
BEGIN
	SET IDENTITY_INSERT Dim_MLDiscipline ON
	INSERT Dim_MLDiscipline(MLDisciplineID_WK,MLDisciplineID_NK,MLDiscipline,MLDisciplineActive,InsertDate,LastUpdateDate)       VALUES('-1','0','None','N',convert(datetime,'Mar 25 2008  5:39PM'),'          ')
	SET IDENTITY_INSERT Dim_MLDiscipline OFF
END


END


