USE [master]
GO
EXEC master.dbo.sp_detach_db @dbname = N'CoStar'
GO
-----

SELECT COUNT(*) FROM LINEITEM1 --- 682311

SELECT COUNT(*) FROM LINEITEM1 WHERE BUNDLEID=-1---682311


SELECT * 
INTO SkuX
FROM Sku
---------
SELECT *
INTO SkuPriceX
from SkuPrice
---------------------------------------------

SELECT * 
INTO LineItemBX
FROM
LINEITEM 

DELETE FROM [dbo].[LineItem] WHERE [ContractID] NOT IN (7)
-----------------------------------------------------------


SELECT * FROM LINEITEM 

------------------------------------------------------------

SELECT DISTINCT ContractID 
INTO Contract_Input_List
FROM LINEITEM 

select * from Contract_Input_List
----------------------------------------------------------


SELECT * FROM LineItem 

SELECT * FROM LineItemBX WHERE CONTRACTID=7
----------------------------------------------------------

EXEC [dbo].[uspSKUb] 7


SELECT * FROM LINEITEM ORDER BY DATE ASC

SELECT COUNT(*) FROM [dbo].[Sku]
SELECT COUNT(*) FROM [dbo].[SkuX] 
------------------------------------------------

	SELECT  DateID=DATE,AMT=SUM(AMOUNT)
			FROM LineItem 
			     WHERE ContractID= 7 AND BundleID=-1
			         GROUP BY DATE
                        HAVING SUM(AMOUNT)>0
-----------------------------------------------------------

SELECT * FROM SKU WHERE 
PRODUCTID=47 AND 

MARKETID='USA' AND UserCount=13 and CustomerType=4

-------------------------------------------------------------------------
--''--------------------------------------------------------------------
--47	USA	13	4------->>>---------------------------------------------
--173	WAS	13	4--------->>>>-------------------------------------------
--173	BLT	13	4------->>>-----------------------------------------------
--5	NVA	13	4--------------------------------------------------------------
--''-----------------------------------------------------------------------
---------------------------------------------------------------------------




	SELECT  DateID=DATE,AMT=SUM(AMOUNT)
			FROM LineItem 
			     --WHERE ContractID= @CONTRACTID AND BundleID=-1
			         GROUP BY DATE
                        HAVING SUM(AMOUNT)>0


/*
2003-08-22	742.92
2005-10-14	450.00
2006-05-12	576.20
2007-08-28	308.00
2010-06-29	500.00
2015-09-01	287.00
*/
-----------------------------------------------------------------
SELECT COUNT(*) FROM [dbo].[LineItem]
SELECT COUNT(*) FROM [dbo].[LineItemBX] WHERE CONTRACTID=7
----------------------------------------------------------------


INSERT [dbo].[Contract_Input_List]([ContractID])
SELECT DISTINCT CONTRACTID 
FROM LINEITEM 
ORDER BY CONTRACTID 


SELECT * FROM [dbo].[Contract_Input_List]
----------------------------------------------------------------
EXEC [dbo].[uspProcessContracts]
-----------------------------------------------------------------

SELECT COUNT(*) FROM LINEITEM 

















