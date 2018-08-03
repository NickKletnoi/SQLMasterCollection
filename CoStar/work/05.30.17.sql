
----------------------------------
SELECT * FROM [dbo].[GLBridge];---
----------------------------------
--- To-do List For Today:
/*
1. Bring in the components of the Journal from Navision for the parts that are relevant;
*/

-------------------------------------------------------
--select count(*) from [dbo].[RIG$Gen_ Journal Line];--
--select distinct from [RIG$Gen_ Journal Line];--------
-------------------------------------------------------


SELECT ECM.ERROR_MESSAGE AS DETAILED_ERROR_MESSAGE, 
ECD.ERROR_COLUMN AS OFFENDING_COLUMN_NAME, 
COUNT(ECD.SEQ_NO) as ERROR_INSTANCE_COUNT 
FROM [dbo].[CSTR_RPRO_ERR_CODE_DETAILS] ECD JOIN [dbo].[CSTR_RPRO_ERR_CODE_MASTER] ECM ON 
ECD.ERROR_CODE=ECM.ERROR_CODE
GROUP BY ECM.ERROR_MESSAGE,ECD.ERROR_COLUMN
ORDER BY 3 DESC 
-------------------------------------------------






select * from [dbo].[CSTR_RPRO_ERR_CODE_DETAILS]
