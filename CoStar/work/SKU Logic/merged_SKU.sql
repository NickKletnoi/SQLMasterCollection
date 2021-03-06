SELECT 
ContractID,
BundleID,
ProductID,
ProductMarket as MarketID,
'-' as UserCount,
'-' as CustomerType, 
BillingStartDate as [Date], 
0 as SKUID ,
CAST (OriginalMonthlyPrice AS decimal(10,2)) as Amount
FROM Enterprise.dbo.LineItem LI JOIN
EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID
WHERE YEAR(BillingStartDate) in (2016,2017) AND BUNDLEID IS NOT NULL
------------------------------------------------------------------------

SELECT *
INTO LineItem2
FROM LineItem

truncate table [dbo].[LineItem]
select * from LineItem
--------------------------
INSERT LineItem (
            [ContractID]
           ,[BundleID]
           ,[ProductID]
           ,[MarketID]
           ,[UserCount]
           ,[CustomerType]
           ,[Date]
           ,[SKUID]
           ,[Amount])

SELECT 
ContractID,
BundleID,
ProductID,
ProductMarket as MarketID,
0 as UserCount,
0 as CustomerType, 
BillingStartDate as [Date], 
0 as SKUID ,
CAST (OriginalMonthlyPrice AS decimal(10,2)) as Amount
FROM Enterprise.dbo.LineItem LI JOIN
EnterpriseSub.dbo.SalesUnitProductMarket SUPM on LI.SalesUnitID=SUPM.SalesUnitID
WHERE YEAR(BillingStartDate) in (2016,2017) AND BUNDLEID IS NOT NULL

---------------------------------------------------------------------------------

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




          SELECT BundleID, ContractID, Count(*) as cnt FROM [dbo].[LineItem]
group by BundleID, ContractID
order by BundleID

SELECT 
[ContractID],
[BundleID],
[ProductID],
[MarketID],
[UserCount],
[SKUID]
INTO [dbo].[LineItem1]
FROM [dbo].[LineItem] where ContractID in (152472,144831,152562,83492)

select * from [dbo].[LineItem]

select * from [dbo].[Market]

select * from [dbo].[Users]

truncate table [dbo].[LineItem1]


/*
-- Contract_ID's to pick
--152472 ( 2 bundles - 3, 8 in each )
--144831 ( 1 bundle - 3 in it )
--152562 ( 2 bundles - 2 in each )
--83492  ( 1 bundles - 2 in it )



*/


SELECT LI.ContractID, LI.BundleID, LI.ProductID, Count(*) as CNT
FROM LineItem LI JOIN LineItem LI2 on LI.ContractID=LI2.ContractID 
where LI.BundleID<>LI2.BundleID
GROUP by LI.ContractID, LI.BundleID, LI.ProductID

select distinct contractid from LineItem��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p S K U ]         S c r i p t   D a t e :   3 / 1 8 / 2 0 1 7   6 : 3 6 : 2 7   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 / *  
  
 E X E C   [ d b o ] . [ u s p S K U ]   1 5 2 4 7 2  
 E X E C   [ d b o ] . [ u s p S K U ]   8 3 4 9 2  
 E X E C   [ d b o ] . [ u s p S K U ]   1 4 4 8 3 1  
 E X E C   [ d b o ] . [ u s p S K U ]   1 5 2 5 6 7  
 E X E C   [ d b o ] . [ u s p S K U ]   1 5 2 5 6 2  
  
 T R U N C A T E   T A B L E   [ d b o ] . [ S k u ]  
 U P D A T E   L i n e I t e m   S E T   S K U I D = N U L L   W H E R E   S K U I D   I S   N O T   N U L L  
 S E L E C T   *   F R O M   [ d b o ] . [ L i n e I t e m ]   o r d e r   b y   [ C o n t r a c t I D ]  
 S E L E C T   *   F R O M   [ d b o ] . [ L i n e I t e m ]    
 O R D E R   B Y   C O N T R A C T I D  
  
 S E L E C T   *   F R O M   [ d b o ] . [ S k u ]  
  
 * /  
  
  
 A L T E R   P R O C E D U R E   [ d b o ] . [ u s p S K U ]  
 @ C O N T R A C T I D   I N T  
 A S  
  
 D E C L A R E   @ C U R R E N T _ B u n d l e I D     I N T  
 D E C L A R E   @ C U R R E N T _ S K U I D   I N T  
 D E C L A R E   @ E X I S T I N G _ S K U I D   I N T  
 D E C L A R E   @ S K U _ E X I S T S   I N T  
 D E C L A R E   @ B u n d l e s L i s t   t a b l e   ( B u n d l e I D   I N T )  
 D E C L A R E   @ B u n d l e s   t a b l e   ( B u n d l e I D   I N T , P r o d u c t I D   I N T   , M a r k e t I D   C H A R ( 3 ) ,   U s e r C o u n t   I N T ,   S K U I D   I N T )  
  
  
  
 I N S E R T   I N T O   @ B u n d l e s L i s t   S E L E C T   D I S T I N C T   B U N D L E I D   F R O M   L i n e I t e m   W H E R E   C o n t r a c t I D =   @ C O N T R A C T I D  
  
 	  
  
  
 	 S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
 	 S E L E C T   T O P   1   @ C U R R E N T _ B u n d l e I D   =   B U N D L E I D     F R O M   @ B u n d l e s L i s t  
  
 	 W H I L E   ( @ C U R R E N T _ B u n d l e I D   I S   N O T   N U L L )  
 	  
 	   B E G I N  
  
 	 	 	 	 I N S E R T   I N T O     @ B u n d l e s   ( B u n d l e I D ,   P r o d u c t I D , M a r k e t I D , U s e r C o u n t )  
 	 	 	 	 S E L E C T   B u n d l e I D ,   P r o d u c t I D , M a r k e t I D , U s e r C o u n t  
 	 	 	 	 F R O M       L i n e I t e m  
 	 	 	 	 W H E R E     B u n d l e I D = @ C U R R E N T _ B u n d l e I D    
 	 	 	 	  
 	 	 	 	 S E L E C T    
 	 	 	 	 @ S K U _ E X I S T S = C O U N T ( * ) ,  
 	 	 	 	 @ E X I S T I N G _ S K U I D = S . S K U I D    
 	 	 	 	 F R O M   @ B u n d l e s   B   J O I N   S k u   S   O N   B . P r o d u c t I D = S . P r o d u c t I D   A N D   B . M a r k e t I D = S . M a r k e t I D   A N D   B . U s e r C o u n t = S . U s e r C o u n t  
 	 	 	 	 G R O U P   B Y   S . S K U I D  
  
 	 	 	 	 I F   @ S K U _ E X I S T S > 0    
 	 	 	 	       B E G I N    
 	 	 	 	        
 	 	 	 	                     S E T     @ C U R R E N T _ S K U I D = @ E X I S T I N G _ S K U I D    
  
 	 	 	 	 	 	   U P D A T E   L I  
 	 	 	 	                   S E T   L I . S K U I D = @ C U R R E N T _ S K U I D  
 	 	 	 	                   F R O M   L i n e I t e m   L I   J O I N   S k u   S   o n   S . P r o d u c t I D = L I . P r o d u c t I D   A N D     S . M a r k e t I D = L I . M a r k e t I D   A N D   S . U s e r C o u n t = L I . U s e r C o u n t  
 	 	 	 	                   A N D   L I . C o n t r a c t I D = @ C O N T R A C T I D  
 	 	 	 	 	 	   W H E R E   L I . B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
  
 	 	 	 	       E N D  
 	 	 	 	 	 	 	 	  
 	 	 	 	 E L S E    
 	 	 	 	  
 	 	 	 	 B E G I N  
  
 	 	 	 	  
 	 	 	 	 S E T     @ C U R R E N T _ S K U I D = N U L L  
 	 	 	 	 S E L E C T   @ C U R R E N T _ S K U I D = C O U N T ( * )   F R O M   [ S k u ]  
 	 	 	 	  
 	 	 	 	  
 	 	 	 	 I N S E R T   [ S k u ]   ( [ S K U I D ] , [ P r o d u c t I D ] , [ M a r k e t I D ] , [ U s e r C o u n t ] )  
 	 	 	 	 S E L E C T   @ C U R R E N T _ S K U I D ,   P r o d u c t I D , M a r k e t I D , U s e r C o u n t  
 	 	 	 	 F R O M   @ B u n d l e s  
 	 	 	 	 W H E R E   B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
 	 	 	 	  
 	 	 	 	 U P D A T E   L I  
 	 	 	 	 S E T   L I . S K U I D = S . S K U I D  
 	 	 	 	 F R O M   L i n e I t e m   L I   J O I N   S k u   S   o n   S . P r o d u c t I D = L I . P r o d u c t I D   A N D     S . M a r k e t I D = L I . M a r k e t I D   A N D   S . U s e r C o u n t = L I . U s e r C o u n t  
 	 	 	 	 A N D   L I . C o n t r a c t I D = @ C O N T R A C T I D   A N D   L I . B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
 	                        
  
 	 	 	 	 E N D 	  
 	 	  
 	 	 D E L E T E   F R O M   @ B u n d l e s L i s t   W H E R E   B u n d l e I D   =   @ C U R R E N T _ B u n d l e I D  
 	 	 D E L E T E   F R O M   @ B u n d l e s  
 	 	 S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
 	 	 S E L E C T   T O P   1   @ C U R R E N T _ B u n d l e I D   =   B u n d l e I D     F R O M   @ B u n d l e s L i s t  
 	 	 I F   @ @ r o w c o u n t   =   0   S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
       E N D    
  
  
  
  
                     ��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p S K U ]         S c r i p t   D a t e :   3 / 1 9 / 2 0 1 7   1 2 : 1 3 : 2 1   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 / *  
  
 E X E C   [ d b o ] . [ u s p S K U ]   1 5 2 4 7 2  
 E X E C   [ d b o ] . [ u s p S K U ]   8 3 4 9 2  
 E X E C   [ d b o ] . [ u s p S K U ]   1 4 4 8 3 1  
 E X E C   [ d b o ] . [ u s p S K U ]   1 5 2 5 6 7  
 E X E C   [ d b o ] . [ u s p S K U ]   1 5 2 5 6 2  
  
 T R U N C A T E   T A B L E   [ d b o ] . [ S k u ]  
 U P D A T E   L i n e I t e m   S E T   S K U I D = N U L L   W H E R E   S K U I D   I S   N O T   N U L L  
 S E L E C T   *   F R O M   [ d b o ] . [ L i n e I t e m ]   o r d e r   b y   [ C o n t r a c t I D ]  
 S E L E C T   *   F R O M   [ d b o ] . [ L i n e I t e m ]    
 O R D E R   B Y   C O N T R A C T I D  
  
 S E L E C T   *   F R O M   [ d b o ] . [ S k u ]  
  
 * /  
  
  
 A L T E R   P R O C E D U R E   [ d b o ] . [ u s p S K U ]  
 @ C O N T R A C T I D   I N T  
 A S  
  
 B E G I N   T R Y  
  
 D E C L A R E   @ C U R R E N T _ B u n d l e I D     I N T  
 D E C L A R E   @ C U R R E N T _ S K U I D   I N T  
 D E C L A R E   @ E X I S T I N G _ S K U I D   I N T  
 D E C L A R E   @ S K U _ E X I S T S   I N T  
 D E C L A R E   @ B u n d l e s L i s t   t a b l e   ( B u n d l e I D   I N T )  
 D E C L A R E   @ B u n d l e s   t a b l e   ( B u n d l e I D   I N T , P r o d u c t I D   I N T   , M a r k e t I D   C H A R ( 3 ) ,   U s e r C o u n t   I N T ,   S K U I D   I N T )  
 D E C L A R E   @ E r r o r _ M e s s a g e   V A R C H A R ( 8 0 0 0 )  
  
  
 I N S E R T   I N T O   @ B u n d l e s L i s t   S E L E C T   D I S T I N C T   B U N D L E I D   F R O M   L i n e I t e m   W H E R E   C o n t r a c t I D =   @ C O N T R A C T I D  
  
 	  
  
  
 	 S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
 	 S E L E C T   T O P   1   @ C U R R E N T _ B u n d l e I D   =   B U N D L E I D     F R O M   @ B u n d l e s L i s t  
  
 	 W H I L E   ( @ C U R R E N T _ B u n d l e I D   I S   N O T   N U L L )  
 	  
 	   B E G I N  
  
 	 	 	 	 I N S E R T   I N T O     @ B u n d l e s   ( B u n d l e I D ,   P r o d u c t I D , M a r k e t I D , U s e r C o u n t )  
 	 	 	 	 S E L E C T   B u n d l e I D ,   P r o d u c t I D , M a r k e t I D , U s e r C o u n t  
 	 	 	 	 F R O M       L i n e I t e m  
 	 	 	 	 W H E R E     B u n d l e I D = @ C U R R E N T _ B u n d l e I D    
 	 	 	 	  
 	 	 	 	 S E L E C T    
 	 	 	 	 @ S K U _ E X I S T S = C O U N T ( * ) ,  
 	 	 	 	 @ E X I S T I N G _ S K U I D = S . S K U I D    
 	 	 	 	 F R O M   @ B u n d l e s   B   J O I N   S k u   S   O N   B . P r o d u c t I D = S . P r o d u c t I D   A N D   B . M a r k e t I D = S . M a r k e t I D   A N D   B . U s e r C o u n t = S . U s e r C o u n t  
 	 	 	 	 G R O U P   B Y   S . S K U I D  
  
 	 	 	 	 I F   @ S K U _ E X I S T S > 0    
 	 	 	 	       B E G I N    
 	 	 	 	        
 	 	 	 	                     S E T     @ C U R R E N T _ S K U I D = @ E X I S T I N G _ S K U I D    
  
 	 	 	 	 	 	   U P D A T E   L I  
 	 	 	 	                   S E T   L I . S K U I D = @ C U R R E N T _ S K U I D  
 	 	 	 	                   F R O M   L i n e I t e m   L I   J O I N   S k u   S   o n   S . P r o d u c t I D = L I . P r o d u c t I D   A N D     S . M a r k e t I D = L I . M a r k e t I D   A N D   S . U s e r C o u n t = L I . U s e r C o u n t  
 	 	 	 	                   A N D   L I . C o n t r a c t I D = @ C O N T R A C T I D  
 	 	 	 	 	 	   W H E R E   L I . B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
  
 	 	 	 	       E N D  
 	 	 	 	 	 	 	 	  
 	 	 	 	 E L S E    
 	 	 	 	  
 	 	 	 	 B E G I N  
  
 	 	 	 	  
 	 	 	 	 S E T     @ C U R R E N T _ S K U I D = N U L L  
 	 	 	 	 S E L E C T   @ C U R R E N T _ S K U I D = C O U N T ( * )   F R O M   [ S k u ]  
 	 	 	 	  
 	 	 	 	  
 	 	 	 	 I N S E R T   [ S k u ]   ( [ S K U I D ] , [ P r o d u c t I D ] , [ M a r k e t I D ] , [ U s e r C o u n t ] )  
 	 	 	 	 S E L E C T   @ C U R R E N T _ S K U I D ,   P r o d u c t I D , M a r k e t I D , U s e r C o u n t  
 	 	 	 	 F R O M   @ B u n d l e s  
 	 	 	 	 W H E R E   B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
 	 	 	 	  
 	 	 	 	 U P D A T E   L I  
 	 	 	 	 S E T   L I . S K U I D = S . S K U I D  
 	 	 	 	 F R O M   L i n e I t e m   L I   J O I N   S k u   S   o n   S . P r o d u c t I D = L I . P r o d u c t I D   A N D     S . M a r k e t I D = L I . M a r k e t I D   A N D   S . U s e r C o u n t = L I . U s e r C o u n t  
 	 	 	 	 A N D   L I . C o n t r a c t I D = @ C O N T R A C T I D   A N D   L I . B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
 	                        
  
 	 	 	 	 E N D 	  
 	 	  
 	 	 D E L E T E   F R O M   @ B u n d l e s L i s t   W H E R E   B u n d l e I D   =   @ C U R R E N T _ B u n d l e I D  
 	 	 D E L E T E   F R O M   @ B u n d l e s  
 	 	 S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
 	 	 S E L E C T   T O P   1   @ C U R R E N T _ B u n d l e I D   =   B u n d l e I D     F R O M   @ B u n d l e s L i s t  
 	 	 I F   @ @ r o w c o u n t   =   0   S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
       E N D    
  
 E N D   T R Y  
  
 B E G I N   C A T C H  
                   - - - - - - - - - - - - - E R R O R   H A N D L I N G   A R E A  
 	 	   S E T   @ E r r o r _ M e s s a g e   =   E R R O R _ M E S S A G E ( )    
  
    
 E N D   C A T C H  
  
 ��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p S K U x ]         S c r i p t   D a t e :   3 / 1 9 / 2 0 1 7   1 1 : 2 9 : 0 0   A M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 / *  
  
 E X E C   [ d b o ] . [ u s p S K U x ]   1 5 2 4 7 2  
 E X E C   [ d b o ] . [ u s p S K U x ]   8 3 4 9 2  
 E X E C   [ d b o ] . [ u s p S K U x ]   1 4 4 8 3 1  
 E X E C   [ d b o ] . [ u s p S K U x ]   1 5 2 5 6 7  
 E X E C   [ d b o ] . [ u s p S K U x ]   1 5 2 5 6 2  
  
 T R U N C A T E   T A B L E   [ d b o ] . [ S k u ]  
 U P D A T E   L i n e I t e m   S E T   S K U I D = N U L L   W H E R E   S K U I D   I S   N O T   N U L L  
 S E L E C T   *   F R O M   [ d b o ] . [ L i n e I t e m ]   o r d e r   b y   [ C o n t r a c t I D ]  
 S E L E C T   *   F R O M   [ d b o ] . [ L i n e I t e m ]    
 O R D E R   B Y   C O N T R A C T I D  
  
 S E L E C T   *   F R O M   [ d b o ] . [ S k u ]  
  
 * /  
  
  
 A L T E R   P R O C E D U R E   [ d b o ] . [ u s p S K U x ]  
 @ C O N T R A C T I D   I N T  
 A S  
  
 B E G I N   T R Y  
  
 D E C L A R E   @ C U R R E N T _ B u n d l e I D     I N T  
 D E C L A R E   @ C U R R E N T _ S K U I D   I N T  
 D E C L A R E   @ E X I S T I N G _ S K U I D   I N T  
 D E C L A R E   @ S K U _ E X I S T S   I N T  
  
  
 	 S E L E C T   D I S T I N C T   B U N D L E I D    
 	 	 I N T O   # B u n d l e L i s t    
 	 	 	 F R O M   L i n e I t e m    
 	 	 	 	 W H E R E   C o n t r a c t I D =   @ C O N T R A C T I D  
  
 	 S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
  
 	 S E L E C T   T O P   1   @ C U R R E N T _ B u n d l e I D   =   B U N D L E I D      
 	 	 	 F R O M   # B u n d l e L i s t  
  
 	 W H I L E   ( @ C U R R E N T _ B u n d l e I D   I S   N O T   N U L L )  
 	  
 	   B E G I N  
 	 	 	 	  
 	 	 	 	 S E L E C T   B u n d l e I D ,   P r o d u c t I D , M a r k e t I D , U s e r C o u n t  
 	 	 	 	 I N T O       # B u n d l e s  
 	 	 	 	 	 F R O M       L i n e I t e m  
 	 	 	 	 	 	 W H E R E     B u n d l e I D = @ C U R R E N T _ B u n d l e I D    
 	 	 	 	  
 	 	 	 	 S E L E C T    
  
 	 	 	 	 @ S K U _ E X I S T S = C O U N T ( * ) ,  
 	 	 	 	 @ E X I S T I N G _ S K U I D = S . S K U I D    
  
 	 	 	 	 F R O M   # B u n d l e s   B   J O I N   S k u   S    
 	 	 	 	 	 O N   B . P r o d u c t I D = S . P r o d u c t I D    
 	 	 	 	 	 	 A N D   B . M a r k e t I D = S . M a r k e t I D    
 	 	 	 	 	 	 A N D   B . U s e r C o u n t = S . U s e r C o u n t  
  
 	 	 	 	 G R O U P   B Y   S . S K U I D  
  
 	 	 	 	 I F   @ S K U _ E X I S T S > 0    
 	 	 	 	       B E G I N    
 	 	 	 	        
 	 	 	 	                   S E T     @ C U R R E N T _ S K U I D = @ E X I S T I N G _ S K U I D    
  
 	 	 	 	 	 	   U P D A T E   L I  
  
 	 	 	 	                   S E T   L I . S K U I D = @ C U R R E N T _ S K U I D  
  
 	 	 	 	 	 	 	 F R O M   L i n e I t e m   L I   J O I N   S k u   S    
 	 	 	 	 	 	 	 	 O N   S . P r o d u c t I D = L I . P r o d u c t I D    
 	 	 	 	 	 	 	 	 	 A N D     S . M a r k e t I D = L I . M a r k e t I D    
 	 	 	 	 	 	 	 	 	 A N D   S . U s e r C o u n t = L I . U s e r C o u n t  
 	 	 	 	 	 	 	 	 	 A N D   L I . C o n t r a c t I D = @ C O N T R A C T I D  
 	 	 	 	 	 	 	 	 	 A N D   L I . B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
  
 	 	 	 	       E N D  
 	 	 	 	 	 	 	 	  
 	 	 	 	 E L S E    
 	 	 	 	  
 	 	 	 	 B E G I N  
 	 	 	  
 	 	 	 	 S E T     @ C U R R E N T _ S K U I D = N U L L  
  
 	 	 	 	 S E L E C T   @ C U R R E N T _ S K U I D = C O U N T ( * )    
 	 	 	 	 	 F R O M   [ S k u ]  
 	 	 	 	 	 	 	 	  
 	 	 	 	 I N S E R T   [ S k u ]   ( [ S K U I D ] , [ P r o d u c t I D ] , [ M a r k e t I D ] , [ U s e r C o u n t ] )  
 	 	 	 	 S E L E C T   @ C U R R E N T _ S K U I D ,   P r o d u c t I D , M a r k e t I D , U s e r C o u n t    
 	 	 	 	 	 F R O M   # B u n d l e s    
 	 	 	 	 	 	 W H E R E   B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
 	 	 	 	  
 	 	 	 	 U P D A T E   L I  
 	 	 	 	 S E T   L I . S K U I D = S . S K U I D  
 	 	 	 	 	 F R O M   L i n e I t e m   L I   J O I N   S k u   S    
 	 	 	 	 	 	 O N   S . P r o d u c t I D = L I . P r o d u c t I D    
 	 	 	 	 	 	 	 A N D     S . M a r k e t I D = L I . M a r k e t I D    
 	 	 	 	 	 	 	 A N D   S . U s e r C o u n t = L I . U s e r C o u n t  
 	 	 	 	 	 	 	 A N D   L I . C o n t r a c t I D = @ C O N T R A C T I D    
 	 	 	 	 	 	 	 A N D   L I . B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
 	                        
  
 	 	 	 	 E N D 	  
 	 	  
 	 	 D E L E T E    
 	 	 	 F R O M   # B u n d l e L i s t    
 	 	 	 	 W H E R E   B u n d l e I D   =   @ C U R R E N T _ B u n d l e I D  
  
 	 	 D R O P   T A B L E     # B u n d l e s  
  
 	 	 S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
  
 	 	 S E L E C T   T O P   1   @ C U R R E N T _ B u n d l e I D   =   B u n d l e I D      
 	 	 	 F R O M   # B u n d l e L i s t  
  
 	 	 I F   @ @ r o w c o u n t   =   0   S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
       E N D    
  
 E N D   T R Y  
  
 B E G I N   C A T C H  
                   - - - - - - - - - - - - - E R R O R   H A N D L I N G   A R E A  
 	 	   D E C L A R E   @ E r r o r _ M e s s a g e   V A R C H A R ( 8 0 0 0 )  
 	 	   S E T   @ E r r o r _ M e s s a g e   =   E R R O R _ M E S S A G E ( )    
  
    
 E N D   C A T C H  
  
 ��U S E   [ C o S t a r ]  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ u s p S K U x ]         S c r i p t   D a t e :   3 / 1 9 / 2 0 1 7   1 2 : 5 9 : 3 2   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 / *  
  
 E X E C   [ d b o ] . [ u s p S K U x ]   1 5 2 4 7 2  
 E X E C   [ d b o ] . [ u s p S K U x ]   8 3 4 9 2  
 E X E C   [ d b o ] . [ u s p S K U x ]   1 4 4 8 3 1  
 E X E C   [ d b o ] . [ u s p S K U x ]   1 5 2 5 6 7  
 E X E C   [ d b o ] . [ u s p S K U x ]   1 5 2 5 6 2  
  
 T R U N C A T E   T A B L E   [ d b o ] . [ S k u ]  
 U P D A T E   L i n e I t e m   S E T   S K U I D = N U L L   W H E R E   S K U I D   I S   N O T   N U L L  
 S E L E C T   *   F R O M   [ d b o ] . [ L i n e I t e m ]   o r d e r   b y   [ C o n t r a c t I D ]  
 S E L E C T   *   F R O M   [ d b o ] . [ L i n e I t e m ]    
 O R D E R   B Y   C O N T R A C T I D  
  
 S E L E C T   *   F R O M   [ d b o ] . [ S k u ]  
  
 * /  
  
  
 A L T E R   P R O C E D U R E   [ d b o ] . [ u s p S K U x ]  
 @ C O N T R A C T I D   I N T  
 A S  
  
 B E G I N   T R Y  
  
 D E C L A R E   @ C U R R E N T _ B u n d l e I D     I N T  
 D E C L A R E   @ C U R R E N T _ S K U I D   I N T  
 D E C L A R E   @ E X I S T I N G _ S K U I D   I N T  
 D E C L A R E   @ S K U _ E X I S T S   I N T  
  
  
 	 S E L E C T   D I S T I N C T   B U N D L E I D    
 	 	 I N T O   # B u n d l e L i s t    
 	 	 	 F R O M   L i n e I t e m    
 	 	 	 	 W H E R E   C o n t r a c t I D =   @ C O N T R A C T I D  
  
 	 S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
  
 	 S E L E C T   T O P   1   @ C U R R E N T _ B u n d l e I D   =   B U N D L E I D      
 	 	 	 F R O M   # B u n d l e L i s t  
  
 	 W H I L E   ( @ C U R R E N T _ B u n d l e I D   I S   N O T   N U L L )  
 	  
 	   B E G I N  
 	 	 	 	  
 	 	 	 	 S E L E C T   B u n d l e I D ,   P r o d u c t I D , M a r k e t I D , U s e r C o u n t  
 	 	 	 	 I N T O       # B u n d l e s  
 	 	 	 	 	 F R O M       L i n e I t e m  
 	 	 	 	 	 	 W H E R E     B u n d l e I D = @ C U R R E N T _ B u n d l e I D    
 	 	 	 	  
 	 	 	 	 S E L E C T    
  
 	 	 	 	 @ S K U _ E X I S T S = C O U N T ( * ) ,  
 	 	 	 	 @ E X I S T I N G _ S K U I D = S . S K U I D    
  
 	 	 	 	 F R O M   # B u n d l e s   B   J O I N   S k u   S    
 	 	 	 	 	 O N   B . P r o d u c t I D = S . P r o d u c t I D    
 	 	 	 	 	 	 A N D   B . M a r k e t I D = S . M a r k e t I D    
 	 	 	 	 	 	 	 A N D   B . U s e r C o u n t = S . U s e r C o u n t  
  
 	 	 	 	 G R O U P   B Y   S . S K U I D  
  
 	 	 	 	 I F   @ S K U _ E X I S T S > 0    
 	 	 	 	       B E G I N    
 	 	 	 	        
 	 	 	 	                   S E T     @ C U R R E N T _ S K U I D = @ E X I S T I N G _ S K U I D    
  
 	 	 	 	 	 	   U P D A T E   L I  
  
 	 	 	 	                   S E T   L I . S K U I D = @ C U R R E N T _ S K U I D  
  
 	 	 	 	 	 	 	 F R O M   L i n e I t e m   L I   J O I N   S k u   S    
 	 	 	 	 	 	 	 	 O N   S . P r o d u c t I D = L I . P r o d u c t I D    
 	 	 	 	 	 	 	 	 	 A N D     S . M a r k e t I D = L I . M a r k e t I D    
 	 	 	 	 	 	 	 	 	 	 A N D   S . U s e r C o u n t = L I . U s e r C o u n t  
 	 	 	 	 	 	 	 	 	 	 	 A N D   L I . C o n t r a c t I D = @ C O N T R A C T I D  
 	 	 	 	 	 	 	 	 	 	 	 	 A N D   L I . B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
  
 	 	 	 	       E N D  
 	 	 	 	 	 	 	 	  
 	 	 	 	 E L S E    
 	 	 	 	  
 	 	 	 	 B E G I N  
 	 	 	  
 	 	 	 	 S E T     @ C U R R E N T _ S K U I D = N U L L  
  
 	 	 	 	 S E L E C T   @ C U R R E N T _ S K U I D = C O U N T ( * )    
 	 	 	 	 	 F R O M   [ S k u ]  
 	 	 	 	 	 	 	 	  
 	 	 	 	 I N S E R T   [ S k u ]   ( [ S K U I D ] , [ P r o d u c t I D ] , [ M a r k e t I D ] , [ U s e r C o u n t ] )  
 	 	 	 	 S E L E C T   @ C U R R E N T _ S K U I D ,   P r o d u c t I D , M a r k e t I D , U s e r C o u n t    
 	 	 	 	 	 F R O M   # B u n d l e s    
 	 	 	 	 	 	 W H E R E   B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
 	 	 	 	  
 	 	 	 	 U P D A T E   L I  
 	 	 	 	 S E T   L I . S K U I D = S . S K U I D  
 	 	 	 	 	 F R O M   L i n e I t e m   L I   J O I N   S k u   S    
 	 	 	 	 	 	 O N   S . P r o d u c t I D = L I . P r o d u c t I D    
 	 	 	 	 	 	 	 A N D     S . M a r k e t I D = L I . M a r k e t I D    
 	 	 	 	 	 	 	 	 A N D   S . U s e r C o u n t = L I . U s e r C o u n t  
 	 	 	 	 	 	 	 	 	 A N D   L I . C o n t r a c t I D = @ C O N T R A C T I D    
 	 	 	 	 	 	 	 	 	 	 A N D   L I . B u n d l e I D = @ C U R R E N T _ B u n d l e I D  
 	                        
  
 	 	 	 	 E N D 	  
 	 	  
 	 	 D E L E T E    
 	 	 	 F R O M   # B u n d l e L i s t    
 	 	 	 	 W H E R E   B u n d l e I D   =   @ C U R R E N T _ B u n d l e I D  
  
 	 	 D R O P   T A B L E     # B u n d l e s  
  
 	 	 S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
  
 	 	 S E L E C T   T O P   1   @ C U R R E N T _ B u n d l e I D   =   B u n d l e I D      
 	 	 	 F R O M   # B u n d l e L i s t  
  
 	 	 I F   @ @ r o w c o u n t   =   0   S E T   @ C U R R E N T _ B u n d l e I D   =   N U L L  
       E N D    
  
 E N D   T R Y  
  
 B E G I N   C A T C H  
                   - - - - - - - - - - - - - E R R O R   H A N D L I N G   A R E A  
 	 	   D E C L A R E   @ E r r o r _ M e s s a g e   V A R C H A R ( 8 0 0 0 )  
 	 	   S E T   @ E r r o r _ M e s s a g e   =   E R R O R _ M E S S A G E ( )    
  
    
 E N D   C A T C H  
  
 /*

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




           /*

EXEC [dbo].[uspSKU_original] 152472
EXEC [dbo].[uspSKU_original] 83492

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




           