select * from [Apt].[NewSkuNewTerm_r];

/*
------------------------------------
Objectives for the Day:
------------------------------------
Finish up the re-sku'ing of the
Apartments data and get on with it
------------------------------------

*/
--- this is what would be the final product for this purpose and it would
--- be selected every time whatever process runs for the same period of 
--- time that the active period ran;

CREATE PROC 

SELECT L.ContractID,L.LineItemID,[dbo].[fnGetMaxSku]( L.ContractID) as SKUID ,Count(*) cnt 
FROM Lineitem L
       JOIN Active_SOFile SO
             ON L.ContractId = SO.ContractID
WHERE L.LineitemID NOT IN (SELECT Lineitemid FROM Active_SOFile)
GROUP BY  L.ContractID,L.LineItemID,[dbo].[fnGetMaxSku]( L.ContractID)
-----------------------------------------------------------------
select [dbo].[fnGetMaxSku](68181)
-----------------------------------------------------------------

