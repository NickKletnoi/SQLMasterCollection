/*

EXEC [dbo].[uspSKU_original] 152472

TRUNCATE TABLE [dbo].[Sku]
UPDATE LineItem SET SKUID=NULL WHERE SKUID IS NOT NULL
SELECT * FROM [dbo].[LineItem]
SELECT * FROM [dbo].[LineItem] WHERE ContractID=152472
ORDER BY CONTRACTID

SELECT * FROM [dbo].[Sku]

*/


ALTER PROCEDURE [dbo].[uspSKU_original]
@CONTRACTID INT
AS

DECLARE @CURRENT_BundleID  INT
DECLARE @CURRENT_SKUID INT
DECLARE @BundlesList table (BundleID INT)
DECLARE @Bundles table (BundleID INT,ProductID INT ,MarketID CHAR(3), UserCount INT, SKUID INT)



INSERT INTO @BundlesList SELECT DISTINCT BUNDLEID FROM LineItem WHERE ContractID= @CONTRACTID

	


	SET @CURRENT_BundleID = NULL
	SELECT TOP 1 @CURRENT_BundleID = BUNDLEID  FROM @BundlesList

	WHILE (@CURRENT_BundleID IS NOT NULL)
	
	 BEGIN

				INSERT INTO  @Bundles (BundleID, ProductID,MarketID,UserCount)
				SELECT BundleID, ProductID,MarketID,UserCount
				FROM   LineItem
				WHERE  BundleID=@CURRENT_BundleID
				
								
				SET  @CURRENT_SKUID=NULL
				SELECT @CURRENT_SKUID=COUNT(*) FROM [Sku]
	
								
				BEGIN

				INSERT [Sku] ([SKUID],[ProductID],[MarketID],[UserCount])
				SELECT @CURRENT_SKUID, ProductID,MarketID,UserCount
				FROM @Bundles
				WHERE BundleID=@CURRENT_BundleID
				
				UPDATE LI
				SET LI.SKUID=S.SKUID
				FROM LineItem LI JOIN Sku S on S.ProductID=LI.ProductID AND  S.MarketID=LI.MarketID AND S.UserCount=LI.UserCount
				AND LI.ContractID=@CONTRACTID
	           

				END	
		
		DELETE FROM @BundlesList WHERE BundleID = @CURRENT_BundleID
		DELETE FROM @Bundles
		SET @CURRENT_BundleID = NULL
		SELECT TOP 1 @CURRENT_BundleID = BundleID  FROM @BundlesList
		IF @@rowcount = 0 SET @CURRENT_BundleID = NULL
   END 




           