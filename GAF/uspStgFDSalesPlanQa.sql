USE [ERAEDWPROD]
GO

/****** Object:  StoredProcedure [dbo].[uspStgFDSalesPlanQa]    Script Date: 07/19/2011 14:32:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspStgFDSalesPlanQa]
	
AS
BEGIN
---- Start Fresh ----------------------------------------------------------------------------------
UPDATE T
SET
T.SALES_PLAN_PRODUCT_ID=NULL
FROM StgCpPSFT1PS_S_SALES_PLAN T
where SALES_PLAN_PRODUCT_ID IS NOT NULL
-------Business Area Update-------------------------------------------------------------------------
UPDATE T
SET
T.SALES_PLAN_PRODUCT_ID = BR.ProductID,
T.S_SEGMENT = 'UND',
T.PROD_CATEGORY = 'UND',
T.PRODUCT_GROUP = 'UND',
T.S_PROD_FAMILY = 'UND',
T.PROD_BRAND = 'UND' 
FROM StgCpPSFT1PS_S_SALES_PLAN T JOIN
(SELECT R.* FROM (
   SELECT BusinessAreaCode, ProductID, ProductSK
   ,DENSE_RANK() OVER (PARTITION BY BusinessAreaCode
   ORDER BY BusinessAreaCode, SegmentID, CategoryID, GroupID, FamilyID, BrandID, ProductID ASC) AS 'BUSINESSAREA_RANK'
   FROM ConProduct WHERE LEN(BusinessAreaCode) > 0
   ) R
WHERE R.BUSINESSAREA_RANK = 1) BR ON BR.BusinessAreaCode = T.S_BUSINESS_AREA
WHERE T.S_PRODUCT_LEVEL = '1'

-------Segment Update-------------------------------------------------------------------------------
UPDATE T
SET
T.SALES_PLAN_PRODUCT_ID=SR.ProductID,
T.PROD_CATEGORY='UND',
T.PRODUCT_GROUP='UND',
T.S_PROD_FAMILY='UND',
T.PROD_BRAND='UND'
FROM StgCpPSFT1PS_S_SALES_PLAN T JOIN 
(SELECT R.* FROM (
   SELECT BusinessAreaCode, SegmentID, ProductID, ProductSK
   ,DENSE_RANK() OVER (PARTITION BY BusinessAreaCode, SegmentID
   ORDER BY BusinessAreaCode, SegmentID, CategoryID, GroupID, FamilyID, BrandID, ProductID ASC) AS 'SEGMENT_RANK'
   FROM ConProduct WHERE LEN(SegmentID) > 1
   ) R
WHERE R.SEGMENT_RANK = 1) SR on SR.SegmentID=T.S_SEGMENT
WHERE T.S_PRODUCT_LEVEL='2'

-------Category Update---------------------------------------------------------------------------------
UPDATE T
SET
T.SALES_PLAN_PRODUCT_ID=CR.ProductID,
T.PRODUCT_GROUP='UND',
T.S_PROD_FAMILY='UND',
T.PROD_BRAND='UND'
FROM StgCpPSFT1PS_S_SALES_PLAN T JOIN 
(SELECT R.* FROM (
   SELECT BusinessAreaCode, SegmentID, CategoryID, ProductID, ProductSK
   ,DENSE_RANK() OVER (PARTITION BY BusinessAreaCode, CategoryID
   ORDER BY BusinessAreaCode, SegmentID, CategoryID, GroupID, FamilyID, BrandID, ProductID ASC) AS 'CATEGORY_RANK'
   FROM ConProduct WHERE LEN(CategoryID) > 1
   ) R
WHERE R.CATEGORY_RANK = 1
) CR on CR.CategoryID=T.PROD_CATEGORY
WHERE T.S_PRODUCT_LEVEL='3'

---------Group Update--------------------------------------------------------------------------------

UPDATE T
SET
T.SALES_PLAN_PRODUCT_ID=GR.ProductID,
T.S_PROD_FAMILY='UND',
T.PROD_BRAND='UND'
FROM StgCpPSFT1PS_S_SALES_PLAN T JOIN 
(SELECT R.* FROM (
   SELECT BusinessAreaCode, SegmentID, CategoryID, GroupID, ProductID, ProductSK
   ,DENSE_RANK() OVER (PARTITION BY BusinessAreaCode, CategoryID, GroupID
   ORDER BY BusinessAreaCode, SegmentID, CategoryID, GroupID, FamilyID, BrandID, ProductID ASC) AS 'GROUP_RANK'
   FROM ConProduct WHERE LEN(CategoryID) > 1 AND LEN(GroupID) > 1 
   ) R
WHERE R.GROUP_RANK = 1) GR on GR.GroupID=T.PRODUCT_GROUP
WHERE T.S_PRODUCT_LEVEL='4'


---------Family Update----------------------------------------------------------------------------

UPDATE T
SET
T.SALES_PLAN_PRODUCT_ID=FR.ProductID,
T.PROD_BRAND='UND'
FROM StgCpPSFT1PS_S_SALES_PLAN T JOIN 
(SELECT R.* FROM (
   SELECT BusinessAreaCode, SegmentID, CategoryID, GroupID, FamilyID, ProductID, ProductSK
   ,DENSE_RANK() OVER (PARTITION BY BusinessAreaCode, CategoryID, GroupID, FamilyID
   ORDER BY BusinessAreaCode, SegmentID, CategoryID, GroupID, FamilyID, BrandID, ProductID ASC) AS 'FAMILY_RANK',SourceEffectiveTimestamp
   FROM [dbo].[ConProduct] WHERE LEN(CategoryID) > 1 AND LEN(GroupID) > 1 AND LEN(FamilyID) > 1 
   ) R
WHERE R.FAMILY_RANK = 1) FR on FR.FamilyID=T.S_PROD_FAMILY
WHERE T.S_PRODUCT_LEVEL='5'


---------Brand Update------------------------------------------------------------------------------

UPDATE T
SET
T.SALES_PLAN_PRODUCT_ID=BR.ProductID
FROM StgCpPSFT1PS_S_SALES_PLAN T JOIN 
(SELECT R.* FROM (
   SELECT BusinessAreaCode, SegmentID, CategoryID, GroupID, FamilyID, BrandID, ProductID, ProductSK
   ,DENSE_RANK() OVER (PARTITION BY BusinessAreaCode, CategoryID, GroupID, FamilyID, BrandID
   ORDER BY BusinessAreaCode, SegmentID, CategoryID, GroupID, FamilyID, BrandID, ProductID ASC) AS 'BRAND_RANK'
   FROM ConProduct WHERE LEN(CategoryID) > 1 AND LEN(GroupID) > 1 AND LEN(FamilyID) > 1 AND LEN(BrandID) > 1
   ) R
WHERE R.BRAND_RANK = 1) BR on BR.BrandID=T.PROD_BRAND
WHERE T.S_PRODUCT_LEVEL='6'

--------------------------------------------------------------------------------------------------

UPDATE T
SET
T.SALES_PLAN_PRODUCT_ID='-1'
FROM StgCpPSFT1PS_S_SALES_PLAN T
where SALES_PLAN_PRODUCT_ID IS NULL


END

GO

