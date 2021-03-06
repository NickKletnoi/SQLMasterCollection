USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Load_Dim_Product]    Script Date: 04/04/2008 14:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*
-- Select * from RDWDB..RDWOLAP_Metadata

-- INSERT INTO RDWOLAP_Metadata VALUES('Dim_Product','2008-03-07 16:44:07.553','2008-03-07 16:44:07.553')

-- Select top 100 * from RDWDB..NG_Product_Metadata ORDER BY CREATEDDate desc

Select * from Dim_Product

Select Count(*) from Dim_Product




Select * from Dim_QRQ

Select * from Dim_DisplayIndustry

TRUNCATE TABLE Dim_Product

Select Rating,* from RDWDB..NG_Product where ProductID IN
(
10705863,
10705868,
10705869,
10705875,
10705876,
10705878,
10705880
)

Select top 100 * from RDWDB..NG_Product_Metadata where ProductID=10705880

Select top 10 * from RDWDB..NG_Product where 
QRQ IS NOT NULL
AND DisplayRegion is Not NULL
--AND Compilation is not NULL
AND DocumentType Is not NULL
AND GrisKey is Not Null
AND SecurityTypeName is not null
AND Rating is Not NULL

Select top 100 * from RDWDB..NG_Product_Metadata WHERE CREATEDDate>='2008-03-07 15:23:32.930'
AND ProductID NOT IN(Select ProductID_NK from Dim_Product)

Select * from RDWDB..NG_product Where ProductID IN
(
10705836,
10705840
)


UPDATE RDWDB..RDWOLAP_Metadata
SET
	InsertDate='2008-03-07 08:40:55.847'
WHERE
	TableName='Dim_Product'


Select * from Dim_ProductProfile where ProductProfileID_NK=20562

Select * from RDWDB..NG_ProductProfile where ProductProfileID=20562

GRANT EXECUTE ON [dbo].[p_RDWOLAP_Load_Dim_Product] TO RDW_USER

*/
CREATE PROCEDURE [dbo].[p_RDWOLAP_Load_Dim_Product]
AS
BEGIN

SET NOCOUNT ON

DECLARE @InsertDate DATETIME,
		@MaxAutoID INT,
		@ProductID INT,
		@FileType NVARCHAR(50),
		@SrcProductID INT,
		@StraightThrough NVARCHAR(10),
		@DisplayDiscipline NVARCHAR(100),
		@DisplayIndustry NVARCHAR(100),
		@GlobalTranslationRequired NVARCHAR(10),
		@TranslationRequired NVARCHAR(10),
		@DistributeviaRS NVARCHAR(10),
		@DataProduct NVARCHAR(10),

		@SubjectName NVARCHAR(100),
		@ProductCategoryName NVARCHAR(100),
		@QRQ NVARCHAR(10),
		@AuthoringRegionID INT,
		@ProductRegionID INT,
		@SecurityTypeName NVARCHAR(50),
		@SubjectID INT,
		@FocusID INT,
		@AuthoringRegionName NVARCHAR(100),
		@ProductRegionName NVARCHAR(100),
		@SecurityTypeID INT,
		@FocusName NVARCHAR(100),
		@CategoryID INT,
		@DocumentType NVARCHAR(100),
		@DisplayRegion NVARCHAR(100)
		

DECLARE @PIDList TABLE
(
AutoID INT IDENTITY(1,1),
ProductID INT
)

SELECT @InsertDate=InsertDate FROM RDWDB..RDWOLAP_Metadata WHERE TableName='Dim_Product'

INSERT INTO @PIDList
Select top 500 ProductID from NG_product where StatusDate is Not NULL AND
StatusDate Between '06-01-2006' AND '03-01-2008' and Status IN('Completed','Pullback')
AND ProductID NOT IN
(Select ProductID_NK FROM Dim_product)

SELECT @MaxAutoID=SCOPE_IDENTITY()



WHILE (@MaxAutoID>=1)
BEGIN

SELECT @ProductID=ProductID FROM @PIDList WHERE AutoID=@MaxAutoID

	SELECT 
			@FileType=metadata.value('(/DocumentMetadata/@FileType)[1]', 'NVARCHAR(100)'),
			@SrcProductID=metadata.value('(/DocumentMetadata/@OriginalId)[1]', 'INT'),
			@StraightThrough=metadata.value('(/DocumentMetadata/@StraightThrough)[1]', 'NVARCHAR(10)'),
			@DisplayDiscipline=metadata.value('(/DocumentMetadata/@TitleDiscipline)[1]', 'NVARCHAR(100)'),
			@DisplayIndustry=metadata.value('(/DocumentMetadata/@TitleIndustry)[1]', 'NVARCHAR(100)'),
			@SecurityTypeID=  metadata.value('(/DocumentMetadata/SecurityType/@Id)[1]', 'int'),  
			@GlobalTranslationRequired=  metadata.value('(/DocumentMetadata/@GlobalTranslationRequired)[1]', 'NVARCHAR(10)'),
			@TranslationRequired=  metadata.value('(/DocumentMetadata/@TranslationRequired)[1]', 'NVARCHAR(10)'),
			@DistributeviaRS=metadata.value('(/DocumentMetadata/Distribution/@ResearchSubscribe)[1]', 'NVarchar(50)'),
			@DataProduct=metadata.value('(/DocumentMetadata/@DataProduct)[1]', 'NVARCHAR(10)'),
			@CategoryID=metadata.value('(/DocumentMetadata/Category/@Id)[1]', 'INT'),
			@SubjectID=  metadata.value('(/DocumentMetadata/Subjects/Subject[@Type=''Primary'']/@Id)[1]', 'int'), 
			@AuthoringRegionName=  metadata.value('(/DocumentMetadata/Profile/Team/Primary/Region/@Name)[1]', 'NVarchar(100)'),  
			@ProductRegionName=metadata.value('(/DocumentMetadata/Regions/Region[@Type=''Primary'']/@Name)[1]', 'NVarchar(100)'), 
			@FocusName=metadata.value('(/DocumentMetadata/FocusAreas/FocusArea[@Type=''Primary'']/@Name)[1]', 'NVarchar(100)')
		
	FROM
		NG_Product_Metadata_TEST
	WHERE
		ProductID=@ProductID	

	SELECT  @SubjectName=SubjectName,
			@ProductCategoryName =ProductCategoryName,
			@QRQ =QRQ,
			@AuthoringRegionID=AuthoringRegionID,
			@ProductRegionID=ProductRegionID,
			@SecurityTypeName=SecurityTypeName,
			@FocusID =FocusID,
			@DocumentType=DocumentType,
			@DisplayRegion=DisplayRegion
	FROM
		NG_Product
	WHERE
		ProductID=@ProductID



IF @SubjectID IS NOT NULL AND NOT EXISTS(SELECT SubjectID_NK FROM dbo.Dim_Subject WHERE SubjectID_NK=@SubjectID)
BEGIN
	INSERT INTO dbo.Dim_Subject VALUES(@SubjectID,@SubjectName,GETDATE(),NULL)
END

IF @CategoryID IS NOT NULL AND NOT EXISTS(SELECT ProductCategoryID_NK FROM dbo.Dim_ProductCategory WHERE ProductCategoryID_NK=@CategoryID)
BEGIN
	INSERT INTO dbo.Dim_ProductCategory VALUES(@CategoryID,@ProductCategoryName,GETDATE(),NULL)
END
	

/*IF @QRQ IS NOT NULL AND NOT EXISTS(SELECT QRQID_WK FROM dbo.Dim_QRQ WHERE QRQ=@QRQ)
BEGIN
	INSERT INTO dbo.Dim_QRQ VALUES(@QRQ,LEFT(@QRQ,1),SUBSTRING(@QRQ,3,1),RIGHT(@QRQ,1),
	(SELECT TOP 1 Display_RiskRating FROM dbo.Dim_QRQ WHERE RiskRating=LEFT(@QRQ,1)),'','',GETDATE(),NULL)
END*/

IF @DisplayDiscipline IS NOT NULL AND NOT EXISTS(SELECT DisplayDisciplineID_WK FROM dbo.Dim_DisplayDiscipline WHERE DisplayDiscipline=@DisplayDiscipline)
BEGIN
	INSERT INTO dbo.Dim_DisplayDiscipline VALUES(@DisplayDiscipline,GETDATE(),NULL)
END

IF @DisplayRegion IS NOT NULL AND NOT EXISTS(SELECT DisplayRegionID_WK FROM dbo.Dim_DisplayRegion WHERE DisplayRegionName=@DisplayRegion)
BEGIN
	INSERT INTO dbo.Dim_DisplayRegion VALUES(@DisplayRegion,GETDATE(),NULL)
END

IF @DisplayIndustry IS NOT NULL AND NOT EXISTS(SELECT DisplayIndustryID_WK FROM dbo.Dim_DisplayIndustry WHERE DisplayIndustry=@DisplayIndustry)
BEGIN
	INSERT INTO dbo.Dim_DisplayIndustry VALUES(@DisplayIndustry,GETDATE(),NULL)
END

IF @DocumentType IS NOT NULL AND NOT EXISTS(SELECT DocumentTypeID_NK FROM dbo.Dim_DocumentType WHERE DocumentType=@DocumentType)
BEGIN
	INSERT INTO dbo.Dim_DocumentType
	SELECT MAX(DocumentTypeID_NK)+1,@DocumentType,GETDATE(),NULL FROM dbo.Dim_DocumentType
END

IF @DisplayIndustry IS NULL
SET @DisplayIndustry='None'

IF @DisplayDiscipline IS NULL
SET @DisplayDiscipline='None'



IF EXISTS(SELECT ProductID_Nk FROM dbo.Dim_Product WHERE ProductID_NK=@ProductID)
DELETE FROM Dim_Product WHERE ProductID_NK=@ProductID

--Print @DisplayDiscipline
--Print '----'

	INSERT INTO dbo.Dim_Product
	SELECT 
		ProductID,
		SrcProductID=ISNULL(@SrcProductID,0),
		CASE WHEN LanguageName IS NULl THEN 'ENGLISH' ELSE LanguageName END AS Language,
		ISNULL(HeadLine,'None'),
		Status,
		1,--PublishdateID,
		Pagecount=ISNULL(Pagecount,0),
		ISNULL(WordCount,0),
		ISNULL(CharacterCount,0),
		ISNULL(QRQID_WK,-1),
		CASE WHEN Compilation=1 THEN 'Y' ELSE 'N' END,
		SubjectID_NK,
		DisplayregionID_WK,
		DAR.RegionID_NK,
		DPR.RegionID_NK,
		DocumentTypeID_NK,
		ISNULL(GrisKey,'None'),
		ProductCategoryID_NK,
		ContentTypeID_NK,
		CASE WHEN @DataProduct='true' THEN 'Y' ELSE 'N' END,
		DistributeviaRS=CASE WHEN @DistributeviaRS='true' THEN 'Y' ELSE 'N' END,
		StraightThrough=CASE WHEN @StraightThrough='true' THEN 'Y' ELSE 'N' END,
		DisplayDisciplineID_WK,
		DisplayIndustryID_WK,
		SecurityTypeID_NK,
		TranslationRequired=CASE WHEN @TranslationRequired='true' THEN 'Y' ELSE 'N' END,
		Globaltranslationrequired=CASE WHEN @Globaltranslationrequired='true' THEN 'Y' ELSE 'N' END,
		FocusID_NK,
		CASE WHEN BullBear=1 THEN 'Y' ELSE 'N' END,
		CASE WHEN TradingOpportunity=1 THEN 'Y' ELSE 'N' END,
		CASE WHEN DerivativeCatalysts=1 THEN 'Y' ELSE 'N' END,
		CASE WHEN EditorialRequired=1 THEN 'Y' ELSE 'N' END,
		CASE WHEN EditorialSkipped=1 THEN 'Y' ELSE 'N' END,
		CASE WHEN EditorialBypass=1 THEN 'Y' ELSE 'N' END,
		ISNULL(RatingID_NK,-1),
		ISNULL(P.ProductProfileID,-1),
		CASE WHEN DATEPART(hh,P.StatusDate)<12 THEN 'AM' ELSE 'PM' END,
		GETDATE(),
		NULL
FROM
	NG_Product P
LEFT JOIN dbo.Dim_Subject DS
ON
	ISNULL(P.SubjectName,'None')=DS.Subject
LEFT JOIN dbo.Dim_DisplayRegion DDR
ON
	ISNULL(P.DisplayRegion,'None')=DDR.DisplayRegionName
LEFT JOIN dbo.Dim_Region DAR
ON
	ISNULL(P.AuthoringregionID,'-1')=DAR.RegionID_NK
LEFT JOIN dbo.Dim_Region DPR
ON
	ISNULL(P.ProductregionID,'-1')=DPR.RegionID_NK
LEFT JOIN dbo.Dim_DocumentType DDT
ON
	ISNULL(P.DocumentType,'None')=DDT.DocumentType
LEFT JOIN dbo.Dim_ProductCategory DPC
ON
	ISNULL(P.ProductCategoryName,'None')=DPC.ProductCategory
LEFT JOIN dbo.Dim_SecurityType DST
ON
	CASE WHEN P.SecurityTypeName IS NULL THEN 'None' ELSE P.SecurityTypeName END=DST.SecurityType
LEFT JOIN dbo.Dim_Focus DF
ON
	ISNULL(P.FocusID,-1)=DF.FocusID_NK
LEFT JOIN dbo.Dim_Rating DR
ON
	CASE WHEN P.Rating IS NULL THEN 'Unknown' ELSE P.Rating END=DR.Rating
LEFT JOIN dbo.Dim_QRQ DQ
ON
	ISNULL(P.QRQ,'none')=DQ.QRQ
LEFT JOIN dbo.Dim_ContentType DCT
ON
	DCT.ContentType=ISNULL(@FileType,'None')
LEFT JOIN dbo.Dim_DisplayDiscipline DDD
On
	DDD.DisplayDiscipline=@DisplayDiscipline

LEFT JOIN dbo.Dim_DisplayIndustry DDI
On
	DDI.DisplayIndustry=@DisplayIndustry




WHERE
	P.ProductID =@ProductID

SET @MaxAutoID=@MaxAutoID-1

END
		
		

	

END






