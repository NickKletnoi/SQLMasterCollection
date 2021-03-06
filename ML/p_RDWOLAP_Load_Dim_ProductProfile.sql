USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_ProductProfile]    Script Date: 04/04/2008 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
SELECT * FROM Dim_ProductProfile where ProductProfileID_NK=-1

*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_ProductProfile]
AS
BEGIN

SET NOCOUNT ON
	
	

	INSERT INTO dbo.Dim_ProductProfile
	(
	ProductProfileID_NK,
	ProductGroupProfileName,
	ProductProfileName,
	RDRAnalystTeam,
	InsertDate,
	LastUpdateDate
	)
	SELECT 
			PP.ProductProfileID,
			PGP.ProductProfileName AS GroupProfile,
			PP.ProductProfileName,
			ISNULL(ISNULL(PM.ProductProfileMetadataValue,PM1.ProductProfileMetadataValue),'None'),
			GETDATE(),
			NULL
	FROM
		RDWDB.dbo.NG_ProductProfile PP
		INNER JOIN RDWDB.dbo.NG_ProductProfile PGP
		ON
			PP.ProductGroupProfileID=PGP.ProductProfileID
			AND PGP.ProductGroupProfileID IS NULL

		LEFT JOIN RDWDB.dbo.NG_ProductProfile_Metadata PM
		ON
			PP.ProductProfileID=PM.ProductProfileID
			AND PM.ProductProfileMetadataID=46

		LEFT JOIN RDWDB.dbo.NG_ProductProfile_Metadata PM1
		ON
			PGP.ProductProfileID=PM1.ProductProfileID
			AND PM1.ProductProfileMetadataID=46

	WHERE
		PP.ProductGroupProfileID IS NOT NULL AND NOT EXISTS(SELECT * FROM Dim_ProductProfile WHERE ProductProfileID_NK=PP.ProductProfileID)

	UNION ALL
	SELECT -1,'None','None','None',GETDATE(),NULL
	WHERE
		NOT EXISTS(SELECT * FROM Dim_ProductProfile WHERE ProductProfileID_NK=-1)

END



