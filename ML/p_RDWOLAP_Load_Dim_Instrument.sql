USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_Instrument]    Script Date: 04/04/2008 14:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
Select top 2 * from RDWDB..Instrument
Select top 2 * from RDWDB..FIN_INSTRM_DESCR

SELECT * FROM Dim_Instrument

SELECT * FROM Dim_AssetClass

SELECT * FROM Dim_AssetType

*/

CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_Instrument]
AS
BEGIN


	INSERT INTO dbo.Dim_Instrument
	SELECT
		INS.FIN_INSTRM_ID,
		ISNULL(FID.INSTRM_NM,'None'),
		ISNULL(FID.SHORT_NM,'None'),
		ISNULL(FID.INSTRM_NM,'None'),
		ISNULL(InstrumentTypeID_NK,-1),
		ISNULL(report.CurrencyID_NK,-1),
		ISNULL(report.CurrencyID_NK,-1),
		1,--PriExID
		ISNULL(report.CurrencyID_NK,-1),
		REVW_IN,
		REVW_DT,
		RSTRCT_IN,
		RSTRCT_DT,
		COVRG_TYP_DESCR,
		Bloomberg_Symb,
		CUSIP_SEDOL_SYMB,
		SEDOL7_SYMB,
		ISIN_SYMB,
		RIC_SYMB,
		ML_TICKER_SYMB,
		'None',
		'None',
		PRIM_STK_IN,
		BLUE_SKY_IN,
		MKT_MAKER_IN,
		RULE_144A_IN,
		OWNER_IN,
		'',
		'',
		ISNULL(IssuerID_NK,-1),
		ISNULL(AssetTypeID_NK,-1),
		ISNULL(AssetClassID_NK,-1),
		INS.ACTV_IN,
		GETDATE(),
		NULL
	FROM
		RDWDB..Instrument INS
		INNER JOIN RDWDB..FIN_INSTRM_DESCR FID
		ON
			INS.FIN_INSTRM_ID=FID.FIN_INSTRM_ID
		LEFT JOIN dbo.Dim_InstrumentType
		ON
			InstrumentTypeID_NK=ISNULL(FIN_INSTRM_TYP_ID,-1)
		LEFT JOIN Dim_Currency Report
		ON
			ISNULL(PRIM_REPT_CCY_ID,-1)=CurrencyID_NK

		LEFT JOIN dbo.Dim_Issuer DI
		ON
			ISNULL(ISSR_ID,-1)=IssuerID_NK
		LEFT JOIN dbo.Dim_AssetType
		ON
			ASSET_TYP_ID=AssetTypeID_NK

		LEFT JOIN dbo.Dim_AssetClass
		ON
			ASSET_CLASS_ID=AssetClassID_NK

	WHERE
		NOT EXISTS(SELECT * FROM Dim_Instrument WHERE INS.FIN_INSTRM_ID=InstrumentID_NK)
	

END


