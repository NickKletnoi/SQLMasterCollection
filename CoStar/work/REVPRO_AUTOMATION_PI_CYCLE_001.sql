--INSERT dbo.[ProcessedContracts](ContractID, BundleFlg)
---- query to improve below ---------
SELECT distinct contractid , 
CASE WHEN COALESCE(BundleID,[dbo].[fnGetMaxBundle](ContractID)) IS NOT NULL  THEN 'Y' ELSE 'N' END AS BundleFlg 
FROM Staging..LineItem WHERE ContractID not in (
SELECT contractid from dbo.ProcessedContracts) 
AND LineItemStatusID=1
------------------

/*
1. 1 index (contract, bundle) on LineItem
2. 1 index (contract) on dbo.ProcessedContracts
c
*/

----------------------------------------------------------
DROP INDEX IDX_LI_CB ON Staging..LineItem;
DROP INDEX IDX_PC_C ON RevPro..ProcessedContracts;
---------------------------------------------------------------------
CREATE NONCLUSTERED INDEX IDX_LI_CB  
ON Staging..LineItem (ContractID,BundleID,LineItemStatusDate);  
GO 
---
CREATE NONCLUSTERED INDEX IDX_PC_C  
ON RevPro..ProcessedContracts (ContractID);  
GO 
----------------------------------------------------------------

exec sp_who 'Active'


