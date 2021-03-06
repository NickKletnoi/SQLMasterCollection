USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_Issuer]    Script Date: 04/04/2008 14:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_Issuer]
AS
BEGIN
/*

Select * from Dim_Issuer

*/

	INSERT INTO dbo.Dim_Issuer

	SELECT 
		IR.ISSR_ID,
		IRD.LONG_NM,
		ISNULL(IRD.PUBLISH_NM,'None'),
		IRD.SHORT_NM,
		IssuerTypeID_NK,
		ISNULL(IR.REGISTER_NM,'None'),
		'',
		ISNULL(REVW_IN,'N'),
		REVW_DT,
		ISNULL(RESTRCT_IN,'N'),
		RESTRCT_DT,
		CoverageTypeID_NK,
		RegCountry.CountryID_NK,
		OprCountry.CountryID_NK,
		ISNULL(RegionID_NK,-1),
		'',
		ISNULL(CurrencyID_NK,-1),
		ISNULL(FY_END_MONTH,0),
		ISNULL(LAST_COMPLT_FY,0),
		ISNULL(SRC_FY_END_MONTH,0),
		ISNULL(SRC_LAST_COMPLT_FY,0),
		ISNULL(BANKRUPTCY_IN,'N'),
		ISNULL(IndustryID_NK,-1),
		IR.ACTV_IN,
		GETDATE(),
		NULL
	FROM
		RDWDB.dbo.ISSR IR
		INNER JOIN
		RDWDB.dbo.ISSR_DESCR IRD
		ON
			IR.ISSR_ID=IRD.ISSR_ID
			AND IRD.LANG_ID=1
		LEFT JOIN dbo.Dim_IssuerType
		ON
			ISNULL(ISSR_TYP_NM,'None')=IssuerType
		LEFT JOIN dbo.Dim_CoverageType
		ON
			CoverageTypeID_NK=Covrg_Typ_ID
		LEFT JOIN dbo.Dim_Country RegCountry
		ON
			ISNULL(Registry_Cntry_ID,-1)=RegCountry.CountryID_NK

		LEFT JOIN dbo.Dim_Country OprCountry
		ON
			ISNULL(PRIM_OPER_Cntry_ID,-1)=OprCountry.CountryID_NK

		LEFT JOIN dbo.Dim_Region DR
		On
			ISNULL(PRIM_REGN_ID,'-1')=DR.RegionID_NK

		LEFT JOIN dbo.Dim_Currency
		ON
			ISNULL(PRIM_REPT_CCY_ID,-1)=CurrencyID_NK

		LEFT JOIN dbo.Dim_Industry DI
		ON
			ISNULL(PRIM_INDUS_ID,-1)=IndustryID_NK
	WHERE
		NOT EXISTS(SELECT IssuerID_NK FROM dbo.Dim_Issuer WHERE IssuerID_NK=IR.ISSR_ID)

	UNION ALL

	SELECT DISTINCT '-1','None','None','None','-1','None',' ','N',convert(datetime,'Jan  1 1900 12:00AM'),'N',convert(datetime,'Jan  1 1900 12:00AM'),'-1','-1','-1','-1',' ','-1','0','0','0','0','N','-1','N',GETDATE(),NULL
	WHERE
		NOT EXISTS(SELECT IssuerID_NK FROM dbo.Dim_Issuer WHERE IssuerID_NK=-1)
	



END
