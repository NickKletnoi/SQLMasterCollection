/*

EXEC [dbo].[uspSKU_original] 152472
EXEC [dbo].[uspSKU_original] 83492
EXEC [dbo].[uspSKU_original] 144831
EXEC [dbo].[uspSKU_original] 152567
EXEC [dbo].[uspSKU_original] 152562

TRUNCATE TABLE [dbo].[Sku]
UPDATE LineItem SET SKUID=NULL WHERE SKUID IS NOT NULL
SELECT * FROM [dbo].[LineItem] order by [ContractID]
SELECT * FROM [dbo].[LineItem] 
ORDER BY CONTRACTID

SELECT * FROM [dbo].[Sku]

*/


ALTER PROCEDURE [dbo].[uspSKU_original]
@CONTRACTID INT
AS

DECLARE @CURRENT_BundleID  INT
DECLARE @CURRENT_SKUID INT
DECLARE @EXISTING_SKUID INT
DECLARE @SKU_EXISTS INT
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
				
				SELECT 
				@SKU_EXISTS=COUNT(*),
				@EXISTING_SKUID=S.SKUID 
				FROM @Bundles B JOIN Sku S ON B.ProductID=S.ProductID AND B.MarketID=S.MarketID AND B.UserCount=S.UserCount
				GROUP BY S.SKUID

				IF @SKU_EXISTS>0 
				   BEGIN 
				   
				          SET  @CURRENT_SKUID=@EXISTING_SKUID 

						 UPDATE LI
				         SET LI.SKUID=@CURRENT_SKUID
				         FROM LineItem LI JOIN Sku S on S.ProductID=LI.ProductID AND  S.MarketID=LI.MarketID AND S.UserCount=LI.UserCount
				         AND LI.ContractID=@CONTRACTID
						 WHERE LI.BundleID=@CURRENT_BundleID

				   END
								
				ELSE 
				
				BEGIN

				
				SET  @CURRENT_SKUID=NULL
				SELECT @CURRENT_SKUID=COUNT(*) FROM [Sku]
				
				
				INSERT [Sku] ([SKUID],[ProductID],[MarketID],[UserCount])
				SELECT @CURRENT_SKUID, ProductID,MarketID,UserCount
				FROM @Bundles
				WHERE BundleID=@CURRENT_BundleID
				
				UPDATE LI
				SET LI.SKUID=S.SKUID
				FROM LineItem LI JOIN Sku S on S.ProductID=LI.ProductID AND  S.MarketID=LI.MarketID AND S.UserCount=LI.UserCount
				AND LI.ContractID=@CONTRACTID AND LI.BundleID=@CURRENT_BundleID
	           

				END	
		
		DELETE FROM @BundlesList WHERE BundleID = @CURRENT_BundleID
		DELETE FROM @Bundles
		SET @CURRENT_BundleID = NULL
		SELECT TOP 1 @CURRENT_BundleID = BundleID  FROM @BundlesList
		IF @@rowcount = 0 SET @CURRENT_BundleID = NULL
   END 




          