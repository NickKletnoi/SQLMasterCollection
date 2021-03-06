USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_DisplayRegion]    Script Date: 04/04/2008 14:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Select * from Dim_DisplayRegion
TRUNCATE TABLE Dim_DisplayRegion
*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_DisplayRegion]
AS
BEGIN

SET NOCOUNT ON	

	CREATE TABLE #Displayregion_Stage
	(
	DisplayRegion_Stage NVARCHAR(500)
	)
	-- Inserting into Stage Table
	INSERT INTO #Displayregion_Stage
	(
	DisplayRegion_Stage
	)
	SELECT DISTINCT 
		CASE WHEN Displayregion IS NULL THEN 'UnKnown' 
			WHEN Displayregion='' THEN 'UnKnown'
		ELSE Displayregion END
		
	FROM RDWDB..NG_product


	-- Inserting into Dimension table
	INSERT INTO dbo.Dim_DisplayRegion
	(
	DisplayregionName,
	InsertDate,
	LastUpdateDate
	)
	SELECT DISTINCT 
		CASE WHEN DisplayRegion_Stage IS NULL THEN 'UnKnown' 
			WHEN DisplayRegion_Stage='' THEN 'UnKnown'
		ELSE DisplayRegion_Stage END,
		GETDATE(),
		NULL 
	FROM #Displayregion_Stage WHERE NOT EXISTS(SELECT DisplayregionID_WK FROM dbo.Dim_DisplayRegion WHERE DisplayRegion_Stage=DisplayregionName)

IF NOT EXISTS(SELECT * FROM dbo.Dim_DisplayRegion WHERE DisplayRegionID_WK=-1)
BEGIN
	SET IDENTITY_INSERT Dim_DisplayRegion ON
	INSERT Dim_DisplayRegion(DisplayRegionID_WK,DisplayRegionName,InsertDate,LastUpdateDate)       VALUES('-1','None',convert(datetime,'Mar 14 2008  3:26PM'),convert(datetime,''))
	SET IDENTITY_INSERT Dim_DisplayRegion OFF
END


END


