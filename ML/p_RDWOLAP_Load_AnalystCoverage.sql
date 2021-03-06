USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_AnalystCoverage]    Script Date: 04/04/2008 14:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*

TRUNCATE TABLE Cov_AnalystCoverage
SELECT Count(*) FROM Cov_AnalystCoverage
SELECT top 100 * FROM Cov_AnalystCoverage
 
*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_AnalystCoverage]
AS
BEGIN

SET NOCOUNT ON

DECLARE @MaxAutoID INT,
		@ProductID INT

CREATE TABLE #PIDList
(
AutoID INT IDENTITY(1,1),
ProductID INT
)

CREATE TABLE #Cov_AnalystCoverage_Stage
(
	
	[AnalystID_WK_Stage] [int] NOT NULL,
	[IndustryID_WK_Stage] [int] NOT NULL,
	[AssetTypeID_NK_Stage] [int] NOT NULL,
	[AssetClassID_NK_Stage] [int] NOT NULL,
	[InstrumentID_WK_Stage] [int] NOT NULL,
	[MlDisciplineID_WK_Stage] [int] NOT NULL,
	[AudienceID_NK_Stage] [int] NOT NULL

 
) 


CREATE TABLE #Analyst
(
AnalystID INT
)

CREATE TABLE #AssetType
(
AssetTypeID INT
)

CREATE TABLE #Audience
(
AudienceID INT
)

CREATE TABLE #AssetClass
(
AssetClassID INT
)

CREATE TABLE #MLDiscipline
(
MLDisciplineID INT
)

CREATE TABLE #Instrument
(
InstrumentID INT
)

CREATE TABLE #Industry
(
IndustryID INT
)

INSERT INTO #PIDList
Select ProductID_NK from Dim_Product
WHERE
	InsertDate >'03/31/2008'
	AND Compilation<>'Y'


SELECT @MaxAutoID=SCOPE_IDENTITY()

		WHILE (@MaxAutoID>=1)
		BEGIN
			
			SELECT @ProductID=ProductID FROM #PIDList WHERE AutoID=@MaxAutoID;

			INSERT INTO #Analyst
			SELECT DISTINCT AnalystID_WK FROM RDWDB..NG_AnalystProduct,dbo.Dim_Analyst WHERE ProductID=@ProductID
			AND PersonID=MBRID_NK AND AnalystActive='Y'
		
			INSERT INTO #AssetType
			SELECT DISTINCT AssetTypeID FROM RDWDB..NG_ProductAssetType WHERE ProductID=@ProductID
			
			--INSERT INTO #Audience
			--SELECT DISTINCT AudienceID FROM RDWDB..NG_ProductAudience WHERE ProductID=@ProductID
			
			INSERT INTO #AssetClass
			SELECT DISTINCT AssetClassID FROM RDWDB..NG_ProductAssetClass WHERE ProductID=@ProductID
			
			INSERT INTO #MlDiscipline
			SELECT DISTINCT MLDisciplineID_WK FROM RDWDB..NG_ProductMLDiscipline,dbo.Dim_MLDiscipline WHERE ProductID=@ProductID
			AND MLDisciplineID=MLDisciplineID_NK AND MLDisciplineActive='Y'
		
			INSERT INTO #Instrument
			SELECT DISTINCT InstrumentID_WK FROM RDWDB..NG_SecurityReference,dbo.Dim_Instrument WHERE ProductID=@ProductID
			AND SecurityID=InstrumentID_NK

			INSERT INTO #Industry
			SELECT DISTINCT IndustryID FROM RDWDB..NG_ProductIndustry WHERE ProductID=@ProductID

			IF NOT EXISTS(SELECT * FROM #Analyst)
			BEGIN
				INSERT INTO #Analyst VALUES(-1)
			END

			IF NOT EXISTS(SELECT * FROM #AssetType)
			BEGIN
				INSERT INTO #AssetType VALUES(-1)
			END

			IF NOT EXISTS(SELECT * FROM #Audience)
			BEGIN
				INSERT INTO #Audience VALUES(-1)
			END

			IF NOT EXISTS(SELECT * FROM #AssetClass)
			BEGIN
				INSERT INTO #AssetClass VALUES(-1)
			END

			IF NOT EXISTS(SELECT * FROM #MLDiscipline)
			BEGIN
				INSERT INTO #MLDiscipline VALUES(-1)
			END

			IF NOT EXISTS(SELECT * FROM #Instrument)
			BEGIN
				INSERT INTO #Instrument VALUES(-1)
			END

			IF NOT EXISTS(SELECT * FROM #Industry)
			BEGIN
				INSERT INTO #Industry VALUES(-1)
			END
			
			/*
			SELECT * FROM #AssetType
			SELECT * FROM #Analyst
			SELECT * FROM #Audience
			SELECT * FROM #AssetClass
			SELECT * FROM #MLDiscipline
			SELECT * FROM #Instrument
			SELECT * FROM #Industry
			*/	

			INSERT INTO #Cov_AnalystCoverage_Stage
			SELECT AnalystID,IndustryID,AssetTypeID,AssetClassID,InstrumentID,MLDisciplineID,AudienceID
			FROM #Analyst,#AssetType,#Audience,#AssetClass,#MLDiscipline,#Instrument,#Industry

			INSERT INTO Cov_AnalystCoverage
			SELECT [AnalystID_WK_Stage],
					[IndustryID_WK_Stage],
					[AssetTypeID_NK_Stage] ,
					[AssetClassID_NK_Stage] ,
					[InstrumentID_WK_Stage],
					[MlDisciplineID_WK_Stage] 
			,GETDATE(),NULL FROM #Cov_AnalystCoverage_Stage WHERE NOT EXISTS
			(SELECT AnalystCoverageID_WK FROM Cov_AnalystCoverage WHERE AnalystID_WK_Stage=AnalystID_WK AND
				IndustryID_NK=IndustryID_WK_Stage AND AssetTypeID_NK=AssetTypeID_NK_Stage
				AND AssetClassID_NK=AssetClassID_NK_Stage AND InstrumentID_WK=InstrumentID_WK_Stage
				AND MLDisciplineID_WK=MLDisciplineID_WK_Stage --AND AudienceID_NK=AudienceID_NK_Stage
			)

			DELETE FROM #AssetType
			DELETE FROM #Analyst
			DELETE FROM #Audience
			DELETE FROM #AssetClass
			DELETE FROM #MLDiscipline
			DELETE FROM #Instrument
			DELETE FROM #Industry
			DELETE FROM #Cov_AnalystCoverage_Stage
			

			SET @MaxAutoID=@MaxAutoID-1
		END


/*
INSERT INTO Cov_AnalystCoverage
SELECT *,GETDATE(),NULL FROM #Cov_AnalystCoverage_Stage WHERE NOT EXISTS
(SELECT AnalystCoverageID_WK FROM Cov_AnalystCoverage WHERE AnalystID_WK_Stage=AnalystID_WK AND
	IndustryID_WK=IndustryID_WK_Stage AND AssetTypeID_NK=AssetTypeID_NK_Stage
	AND AssetClassID_NK=AssetClassID_NK_Stage AND InstrumentID_WK=InstrumentID_WK_Stage
	AND MLDisciplineID_WK=MLDisciplineID_WK_Stage AND AudienceID_NK=AudienceID_NK_Stage
)*/

DROP TABLE #AssetType
DROP TABLE #Analyst
DROP TABLE #Audience
DROP TABLE #AssetClass
DROP TABLE #MLDiscipline
DROP TABLE #Instrument
DROP TABLE #Industry

END




