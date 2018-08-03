    
SELECT [FI_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER], COUNT(*)
FROM  [TD].[FM_FI_LNITMS]	
GROUP BY [FI_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER]
HAVING COUNT(*)>1
--------------------------------------------------------------

SELECT [FI_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER], COUNT(*)
FROM  [STG_TD].[FM_FI_LNITMS]	
GROUP BY [FI_DOCUMENT_NO], [FY_PERIOD],[LEVEL_NUMBER]
HAVING COUNT(*)>1
---------------------------------------------------------------
	