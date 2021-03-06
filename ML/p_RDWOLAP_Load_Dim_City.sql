USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_City]    Script Date: 04/04/2008 14:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select * from Dim_City
*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_City]
AS
BEGIN

SET NOCOUNT ON

INSERT INTO dbo.Dim_City
SELECT DISTINCT ISNULL(MD.CITY,'None'),'Y',GETDATE(),NULL FROM RDWDB..MBR_DESCR MD
WHERE
	NOT EXISTS(SELECT * FROM Dim_City DC WHERE DC.City=ISNULL(MD.CITY,'None'))
ORDER BY ISNULL(CITY,'None')

IF NOT EXISTS(SELECT * FROM Dim_City WHERE CityID_WK=-1)
BEGIN
	SET IDENTITY_INSERT Dim_City ON	
	INSERT Dim_City(CityID_WK,City,CityActive,InsertDate,LastUpdateDate)       VALUES('-1','None','N',convert(datetime,'Jan  1 1900 12:00AM'),convert(datetime,''))
	SET IDENTITY_INSERT Dim_City OFF
	
END

END