USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_ProductFact]    Script Date: 04/04/2008 15:00:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*

Select top 10 * from Dim_product where Status='Completed' Order by ProductID_NK desc
Select * from dbo.Dim_ProductProfile
Select top 10 * from RDWDB..NG_AnalystProduct

Select  * from Cov_AnalystCoverage WHERE AnalystID_WK=4210

Select Count(*) from Fact_product
-- 405630

SELECT Count(*) FROM Cov_AnalystCoverage

Select top 1000 * from fact_product

Select Count(Distinct ProductID_Nk) from Fact_product
-- 87581

Select * from Dim_Ref

Select top 10 * from RDWDB..NG_product

TRUNCATE TABLE Fact_product

*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_ProductFact]
AS

BEGIN

SET NOCOUNT ON

	CREATE TABLE #ProductAnalyst
	(
	AnaProductID INT,
	AnalystID INT,
	AnaReferType NVARCHAR(100)
	)

	CREATE TABLE #ProductInstrument
	(
	SecProductID INT,
	SecurityID INT,
	SecReferType NVARCHAR(100)
	)

	CREATE TABLE #ProductIndustry
	(
	IndusProductID INT,
	IndustryID INT,
	IndusReferType NVARCHAR(100)
	)

	CREATE TABLE #ProductMLDiscipline
	(
	DisciProductID INT,
	MLDisciplineID INT,
	DisciReferType NVARCHAR(100)
	)

	CREATE TABLE #ProductAssetClass
	(
	AsClassProductID INT,
	AssetClassID INT,
	AsClassReferType NVARCHAR(100)
	)

	CREATE TABLE #ProductAssetType
	(
	AsTypeProductID INT,
	AssetTypeID INT,
	AsTypeReferType NVARCHAR(100)
	)

	CREATE TABLE #SourceCoverage
	(
	ProductID INT,
	AnalystID INT,
	AnaReferType NVARCHAR(100),
	SecurityID INT,
	SecReferType NVARCHAR(100),
	IndustryID INT,
	IndusReferType NVARCHAR(100),
	MLDisciplineID INT,
	DisciReferType NVARCHAR(100),
	AssetClassID INT,
	AsClassReferType NVARCHAR(100),
	AssetTypeID INT,
	AsTypeReferType NVARCHAR(100)
	)


CREATE TABLE #PidList
(
AutoID INT IDENTITY(1,1),
ProductID INT
)

DECLARE @MaxAutoID INT,
		@ProductID INT

INSERT INTO #PidList
SELECT ProductID_NK from Dim_product A,NG_Product B where 
ProductID_NK NOT IN(SELECT DISTINCT ProductID_NK FROM Fact_Product)
AND A.ProductID_NK=B.ProductID
AND A.Compilation<>'Y' AND StatusDate IS NOT NULL

SET @MaxAutoID=SCOPE_IDENTITY()

		WHILE (@MaxAutoID>=1)
		BEGIN
				SELECT @ProductID=ProductID from #PidList WHERE AutoID=@MaxAutoID

			INSERT INTO #ProductAnalyst
			SELECT DISTINCT @ProductID,AnalystID_WK,CASE WHEN ReferenceType<>'Primary' THEN 'Referred' ELSE ReferenceType END FROM RDWDB..NG_AnalystProduct,dbo.Dim_Analyst WHERE ProductID=@ProductID
			AND PersonID=MBRID_NK AND AnalystActive='Y'
		
			INSERT INTO #ProductAssetType
			SELECT DISTINCT @ProductID,AssetTypeID,CASE WHEN ReferenceType<>'Primary' THEN 'Referred' ELSE ReferenceType END FROM RDWDB..NG_ProductAssetType WHERE ProductID=@ProductID
			
			INSERT INTO #ProductAssetClass
			SELECT DISTINCT @ProductID,AssetClassID,CASE WHEN ReferenceType<>'Primary' THEN 'Referred' ELSE ReferenceType END FROM RDWDB..NG_ProductAssetClass WHERE ProductID=@ProductID
			
			INSERT INTO #ProductMLDiscipline
			SELECT DISTINCT @ProductID,MLDisciplineID_WK,CASE WHEN ReferenceType<>'Primary' THEN 'Referred' ELSE ReferenceType END FROM RDWDB..NG_ProductMLDiscipline,dbo.Dim_MLDiscipline WHERE ProductID=@ProductID
			AND MLDisciplineID=MLDisciplineID_NK AND MLDisciplineActive='Y'
		
			INSERT INTO #ProductInstrument
			SELECT DISTINCT @ProductID,InstrumentID_WK,CASE WHEN ReferenceType<>'Primary' THEN 'Referred' ELSE ReferenceType END FROM RDWDB..NG_SecurityReference,dbo.Dim_Instrument WHERE ProductID=@ProductID
			AND SecurityID=InstrumentID_NK

			INSERT INTO #ProductIndustry
			SELECT DISTINCT @ProductID,IndustryID,CASE WHEN ReferenceType<>'Primary' THEN 'Referred' ELSE ReferenceType END FROM RDWDB..NG_ProductIndustry WHERE ProductID=@ProductID

			IF NOT EXISTS(SELECT * FROM #ProductAnalyst)
			BEGIN
				INSERT INTO #ProductAnalyst VALUES(@ProductID,-1,'Unknown')
			END

			IF NOT EXISTS(SELECT * FROM #ProductAssetType)
			BEGIN
				INSERT INTO #ProductAssetType VALUES(@ProductID,-1,'Unknown')
			END


			IF NOT EXISTS(SELECT * FROM #ProductAssetClass)
			BEGIN
				INSERT INTO #ProductAssetClass VALUES(@ProductID,-1,'Unknown')
			END

			IF NOT EXISTS(SELECT * FROM #ProductMLDiscipline)
			BEGIN
				INSERT INTO #ProductMLDiscipline VALUES(@ProductID,-1,'Unknown')
			END

			IF NOT EXISTS(SELECT * FROM #ProductInstrument)
			BEGIN
				INSERT INTO #ProductInstrument VALUES(@ProductID,-1,'Unknown')
			END

			IF NOT EXISTS(SELECT * FROM #ProductIndustry)
			BEGIN
				INSERT INTO #ProductIndustry VALUES(@ProductID,-1,'Unknown')
			END
			
			/*
			SELECT * FROM #ProductAssetType
			SELECT * FROM #ProductAnalyst
			SELECT * FROM #ProductAssetClass
			SELECT * FROM #ProductMLDiscipline
			SELECT * FROM #ProductInstrument
			SELECT * FROM #ProductIndustry

			SELECT @ProductID,AnalystID,SecurityID,IndustryID,MLDisciplineID,AssetTypeID,AssetClassID
			FROM
				#ProductAnalyst,#ProductAssetType,#ProductAssetClass,#ProductMLDiscipline,#ProductInstrument,#ProductIndustry
			*/			

			INSERT INTO #SourceCoverage
			SELECT @ProductID,AnalystID,AnaReferType,SecurityID,SecReferType,IndustryID,IndusReferType,MLDisciplineID,DisciReferType,AssetClassID,AsTypeReferType,AssetTypeID,AsClassReferType
			FROM
				#ProductAnalyst,#ProductAssetType,#ProductAssetClass,#ProductMLDiscipline,#ProductInstrument,#ProductIndustry


			DELETE FROM #ProductAssetType
			DELETE FROM #ProductAnalyst
			DELETE FROM #ProductAssetClass
			DELETE FROM #ProductMLDiscipline
			DELETE FROM #ProductInstrument
			DELETE FROM #ProductIndustry



			SET @MaxAutoID=@MaxAutoID-1

		END

--Select * from Fact_product

INSERT INTO dbo.Fact_product
SELECT AnalystCoverageID_WK,A.ProductID,RefID_WK,SecurityID,AnalystID,IndustryID,DateID,GETDATE(),NULL FROM 
		#SourceCoverage A
		LEFT JOIN Cov_AnalystCoverage B
		ON
			A.AnalystID=AnalystID_WK
			AND IndustryID=IndustryID_NK
			AND AssetTypeID=AssetTypeID_NK
			AND AssetClassID=AssetClassID_NK
			AND SecurityID=InstrumentID_WK
			AND MLDisciplineID=MLDisciplineID_WK
		LEFT JOIN Dim_Ref C
		ON
			AnaReferType=Analyst_Rollup
			AND SecReferType=Instrument_Rollup
			AND IndusReferType=Industry_Rollup
			AND DisciReferType=MLDiscipline_Rollup
			AND AsTypeReferType=AssetType_Rollup
			AND AsClassReferType=AssetClass_Rollup
		LEFT JOIN NG_Product NP
		ON
			A.ProductID=NP.ProductID
		LEFT JOIN Dim_Day
		ON
		[Year]=YEAR(StatusDate)
		AND [Month]=MONTH(StatusDate)
		AND [Day]=DAY(StatusDate)
WHERE NOT EXISTS(SELECT FP.ProductID_NK FROM dbo.Fact_Product FP WHERE A.ProductID=FP.ProductID_NK)
AND AnalystCoverageID_WK IS NOT NULL

/*
Select  * from Cov_AnalystCoverage WHERE AnalystID_WK=4210 and InstrumentID_WK=3827

SELECT A.*,AnalystCoverageID_WK FROM 
		#SourceCoverage A,Cov_AnalystCoverage B
WHERE
			A.AnalystID=AnalystID_WK
			AND IndustryID=IndustryID_WK
			AND AssetTypeID=AssetTypeID_NK
			AND AssetClassID=AssetClassID_NK
			AND SecurityID=InstrumentID_WK
			AND MLDisciplineID=MLDisciplineID_WK
			AND	ProductID=10705878	
			AND AnalystID=4210

Select * from Dim_Ref

*/


DROP TABLE #ProductAssetType
DROP TABLE #ProductAnalyst
DROP TABLE #ProductAssetClass
DROP TABLE #ProductMLDiscipline
DROP TABLE #ProductInstrument
DROP TABLE #ProductIndustry

END

