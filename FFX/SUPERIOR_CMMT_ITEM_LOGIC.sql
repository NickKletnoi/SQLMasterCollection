/*
SELECT * FROM  [STG_TD].[FM_FI_LNITMS]
WHERE STATISTICAL_ID='X'

SELECT COUNT(*) FROM [STG_TD].[FM_FI_LNITMS]

SELECT COUNT(*) FROM [TD].[FM_FI_LNITMS]

 SELECT * FROM [TD].[FM_CMMT_LNITMS_X]

 SELECT [BUDGET_TYPE], SUM([CHANGED_BUDGET_AMOUNT])
 FROM [TD].[FM_BDGT_ENTR]
 GROUP BY [BUDGET_TYPE]
 */

----------------------------------------------------------------------------------------------------------------------------------------------------
SELECT                 LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.COMMITMENT_ITEM))) AS COMMITMENT_ITEM, 
                       LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.[NAME]))) AS NAME, 
                       LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.COMMITMENT_ITEM))) + ' - ' + LTRIM(RTRIM(CI.[NAME])) AS LONG_DESCRIPTION, 
                       LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.CMMT_ITEM_CAT))) AS CMMT_ITEM_CAT, 
                       LTRIM(RTRIM(CONVERT(VARCHAR(100), CIC.[NAME]))) AS CMMT_ITEM_CAT_NAME, 
                       LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.CMMT_ITEM_CAT))) + ' - ' + LTRIM(RTRIM(CIC.[NAME])) AS CMMT_ITEM_CAT_LONG_NAME,
                       CASE WHEN CONVERT(VARCHAR(100), CI.CMMT_ITEM_GRP)=' ' THEN '-1'  ELSE LTRIM(RTRIM(CONVERT(VARCHAR(100), CI.CMMT_ITEM_GRP))) END AS CMMT_ITEM_GRP,
                       ISNULL(LTRIM(RTRIM(CONVERT(VARCHAR(100), GRP.CMMT_ITEM_GRP_NAME))),'Statistical') AS CMMT_ITEM_GRP_NAME,
                       ISNULL(LTRIM(RTRIM(CONVERT(VARCHAR(100), GRP.[CMMT_ITEM_GRP_LONG_NAME]))),'Statistical') AS [CMMT_ITEM_GRP_LONG_NAME]

					  -- INTO [MD].[COMMITMENT_ITEM2]
                        
FROM            MD.COMMITMENT_ITEM AS CI INNER JOIN
                         MD.CMMT_ITEM_CAT AS CIC ON CIC.CMMT_ITEM_CAT = CI.CMMT_ITEM_CAT
                                        LEFT JOIN (
                                                                                                SELECT  
                                                                                                [COMMITMENT_ITEM] AS [CMMT_ITEM_GRP],
                                                                                                [NAME] AS [CMMT_ITEM_GRP_NAME],
                                                                                                [COMMITMENT_ITEM]+' - '+ [NAME] AS [CMMT_ITEM_GRP_LONG_NAME]
                                                                                                FROM [MD].[COMMITMENT_ITEM] WHERE 
                                                                                                DATALENGTH([COMMITMENT_ITEM])<5) GRP 

                                                                                  ON CI.CMMT_ITEM_GRP=GRP.CMMT_ITEM_GRP
																				
																				
																				  ORDER BY CI.COMMITMENT_ITEM
																				  
---------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM [MD].[COMMITMENT_ITEM1]
where LEN([NAME])>40
----
SELECT * FROM [MD].[COMMITMENT_ITEM1]
where datalength([LONG_DESCRIPTION])>100


RTRIM()

-- Escrow Funds Outside Agents-Murray Gate Insurance
Escrow Funds Outside Agents-Murray Gate


INSERT [MD].[COMMITMENT_ITEM2]
SELECT * FROM [MD].[COMMITMENT_ITEM1]






