USE [CoStar]
GO
/****** Object:  StoredProcedure [dbo].[uspSKUx]    Script Date: 3/19/2017 12:59:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

EXEC [dbo].[uspSKUx] 152472
EXEC [dbo].[uspSKUx] 83492
EXEC [dbo].[uspSKUx] 144831
EXEC [dbo].[uspSKUx] 152567
EXEC [dbo].[uspSKUx] 152562

TRUNCATE TABLE [dbo].[Sku]
UPDATE LineItem SET SKUID=NULL WHERE SKUID IS NOT NULL
SELECT * FROM [dbo].[LineItem] order by [ContractID]
SELECT * FROM [dbo].[LineItem] 
ORDER BY CONTRACTID

SELECT * FROM [dbo].[Sku]

*/


ALTER PROCEDURE [dbo].[uspSKUx]
@CONTRACTID INT
AS

BEGIN TRY

DECLARE @CURRENT_BundleID  INT
DECLARE @CURRENT_SKUID INT
DECLARE @EXISTING_SKUID INT
DECLARE @SKU_EXISTS INT


	SELECT DISTINCT BUNDLEID 
		INTO #BundleList 
			FROM LineItem 
				WHERE ContractID= @CONTRACTID

	SET @CURRENT_BundleID = NULL

	SELECT TOP 1 @CURRENT_BundleID = BUNDLEID  
			FROM #BundleList

	WHILE (@CURRENT_BundleID IS NOT NULL)
	
	 BEGIN
				
				SELECT BundleID, ProductID,MarketID,UserCount
				INTO   #Bundles
					FROM   LineItem
						WHERE  BundleID=@CURRENT_BundleID 
				
				SELECT 

				@SKU_EXISTS=COUNT(*),
				@EXISTING_SKUID=S.SKUID 

				FROM #Bundles B JOIN Sku S 
					ON B.ProductID=S.ProductID 
						AND B.MarketID=S.MarketID 
							AND B.UserCount=S.UserCount

				GROUP BY S.SKUID

				IF @SKU_EXISTS>0 
				   BEGIN 
				   
				         SET  @CURRENT_SKUID=@EXISTING_SKUID 

						 UPDATE LI

				         SET LI.SKUID=@CURRENT_SKUID

							FROM LineItem LI JOIN Sku S 
								ON S.ProductID=LI.ProductID 
									AND  S.MarketID=LI.MarketID 
										AND S.UserCount=LI.UserCount
											AND LI.ContractID=@CONTRACTID
												AND LI.BundleID=@CURRENT_BundleID

				   END
								
				ELSE 
				
				BEGIN
			
				SET  @CURRENT_SKUID=NULL

				SELECT @CURRENT_SKUID=COUNT(*) 
					FROM [Sku]
								
				INSERT [Sku] ([SKUID],[ProductID],[MarketID],[UserCount])
				SELECT @CURRENT_SKUID, ProductID,MarketID,UserCount 
					FROM #Bundles 
						WHERE BundleID=@CURRENT_BundleID
				
				UPDATE LI
				SET LI.SKUID=S.SKUID
					FROM LineItem LI JOIN Sku S 
						ON S.ProductID=LI.ProductID 
							AND  S.MarketID=LI.MarketID 
								AND S.UserCount=LI.UserCount
									AND LI.ContractID=@CONTRACTID 
										AND LI.BundleID=@CURRENT_BundleID
	           

				END	
		
		DELETE 
			FROM #BundleList 
				WHERE BundleID = @CURRENT_BundleID

		DROP TABLE  #Bundles

		SET @CURRENT_BundleID = NULL

		SELECT TOP 1 @CURRENT_BundleID = BundleID  
			FROM #BundleList

		IF @@rowcount = 0 SET @CURRENT_BundleID = NULL
   END 

END TRY

BEGIN CATCH
         -------------ERROR HANDLING AREA
		 DECLARE @Error_Message VARCHAR(8000)
		 SET @Error_Message = ERROR_MESSAGE() 

 
END CATCH

