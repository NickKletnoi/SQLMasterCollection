USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_Analyst]    Script Date: 04/04/2008 14:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- Select top 10 * from RDWDB..Analyst
-- Select top 10 * from RDWDB..MBR
-- Select top 10 * from RDWDB..MBR_DESCR

Select * from Dim_Analyst
Select * from Dim_Rating


*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_Analyst]
AS

BEGIN

	INSERT INTO dbo.Dim_Analyst
	SELECT
		Member.MBR_ID,
		Publish_Code,
		RDW_person_ID,
		ISNULL(First_NM,'none'),
		ISNULL(Last_NM,'None'),
		ISNULL(MD_PUBLISH_TITLE,'None'),
		ISNULL(MD_OFFCL_TITLE,'None'),
		ISNULL(DivisionID_WK,-1),
		ISNULL(DepartmentID_WK,-1),
		EMP_ML_ID_NO,
		WKR_EMP_STA_TX,
		LOGIN_DOMAIN,
		ISNULL(PUB_APPR_STS_IN,'N'),
		'Y',
		ISNULL(DISP_NM,'None'),
		ISNULL(MD_PUBL_NM,'None'),
		OrganizationID_WK,
		RegionID_NK,
		CountryID_NK,
		CityID_WK,
		StateID_WK,
		PostalCodeID_WK,
		MBR_TYP_ID,
		'Y',
		GETDATE(),
		NULL
	FROM
		RDWDB..MBR Member
		INNER JOIN RDWDB..MBR_DESCR MemDescr
		ON
			Member.MBR_ID=MemDescr.MBR_ID
			AND LANG_ID=1
		LEFT JOIN RDWDB..MLWorker_Login ML
		ON
			Login_Name=WIN_LGON_ID
		LEFT JOIN RDWDB..MLWorker MLW
		ON
			MLW.WKR_ID=ML.WKR_ID
		LEFT JOIN Dim_Division Div
		ON
			Div.DivisionCode=WKR_DIV_CD
			AND DivisionShortName<>''
		LEFT JOIn Dim_Department Dept
		ON
			Dept.DepartmentID=Member.Dept_ID
			AND Department<>''
			AND DepartmentID_WK=(SELECT MAX(DepartmentID_WK) FROM Dim_Department WHERE DepartmentID=Member.Dept_ID)
		LEFT JOIN Dim_Organization org
		ON
			member.ORGTN_ID=org.OrganizationID
		LEFT JOIN Dim_region reg
		ON
			AnalystRegion=RegionName
		LEFT JOIN Dim_Country
		ON
			CNTRY_ID=CountryID_NK
		LEFT JOIN Dim_City City
		ON
			City.CITY=MemDescr.City
		LEFT JOIN Dim_State STate
		ON
			STate.State=STATE_PROVINCE
		LEFT JOIN Dim_PostalCode
		ON
			POSTAL_CD=PostalCode
		
		
		
	WHERE
		NOT EXISTS(SELECT * FROM Dim_Analyst WHERE MBRID_NK=Member.MBR_ID)

END
