select 
BundleFlg, 
count(*) from stg.Contract_Input_List
group by BundleFlg
---

select 
CIL.BundleFlg,
CIL.ContractID,
Count(LI.LineItemID) as Cnt
from stg.Contract_Input_List CIL JOIN Staging..LineItem LI ON CIL.ContractID=LI.ContractID 
group by CIL.ContractID,CIL.BundleFlg
order by Count(LI.LineItemID) desc
-----
/*
-------------------------------------------------------
------------- pick a couple from the first list,-------- 
------------- pick a couple from the second and --------
------------- pick from the middle; --------------------
-------------------------------------------------------
*/

-- My picks in terms of contracts to sku: 
/*
188871
186962
184147
188434
184704
187917
185327
180502
186551
*/

select bundleId, LineItemStatusDate, * from Staging..LineItem where ContractID=188871; -- large contract ( one unbundled bundle )
select bundleId, LineItemStatusDate,  * from Staging..LineItem where ContractID=186962; -- large contract ( no bundles at all found ) 
select bundleId, LineItemStatusDate,  * from Staging..LineItem where ContractID=184147; -- large contact with some holes (9) for bundles 
select bundleId, LineItemStatusDate,  * from Staging..LineItem where ContractID=188434; -- large active contract with no bundles --- and odd product mix
select bundleId, LineItemStatusDate,  * from Staging..LineItem where ContractID=184704; -- large unbundled contact (non suite )
select bundleId, LineItemStatusDate,  * from Staging..LineItem where ContractID=187917; -- large unbunded suite contract (suite )
select bundleId, LineItemStatusDate,  * from Staging..LineItem where ContractID=185327; -- smaller (standard size unbundled contract)
select bundleId, LineItemStatusDate,  * from Staging..LineItem where ContractID=180502; -- small bundled contract
select bundleId, LineItemStatusDate,  * from Staging..LineItem where ContractID=186551; -- tiny unbundled contact with only 2 products
--------------------

select bundleId, * from RevPro..LineItem where ContractID=188871; -- large contract ( one unbundled bundle )
select bundleId, CASE WHEN (SKUID=-1) THEN  (dbo.fnGetMaxSku(ContractID)) ELSE SKUID END as NewSku, * from RevPro..LineItem where ContractID=186962; -- large contract ( no bundles at all found ) 
select bundleId, * from RevPro..LineItem where ContractID=184147; -- large contact with some holes (9) for bundles 
select bundleId,CASE WHEN (SKUID=-1) THEN  (dbo.fnGetMaxSku(ContractID)) ELSE SKUID END as NewSku, * from RevPro..LineItem where ContractID=188434; -- large active contract with no bundles --- and odd product mix
select bundleId,CASE WHEN (SKUID=-1) THEN  (dbo.fnGetMaxSku(ContractID)) ELSE SKUID END as NewSku, * from RevPro..LineItem where ContractID=184704; -- large unbundled contact (non suite )
select bundleId,CASE WHEN (SKUID=-1) THEN  (dbo.fnGetMaxSku(ContractID)) ELSE SKUID END as NewSku, * from RevPro..LineItem where ContractID=187917; -- large unbunded suite contract (suite )
select bundleId, * from RevPro..LineItem where ContractID=185327; -- smaller (standard size unbundled contract)
select bundleId,CASE WHEN (SKUID=-1) THEN  (dbo.fnGetMaxSku(ContractID)) ELSE SKUID END as NewSku, * from RevPro..LineItem where ContractID=180502; -- small bundled contract
select bundleId, * from RevPro..LineItem where ContractID=186551; -- tiny unbundled contact with only 2 products

select * from dbo.ProcessedContracts where ContractID=186962

SELECT  
COUNT( DISTINCT BundleID) as DistinctBunledCnt ,
COUNT( DISTINCT SKUID) as DistinctSkuCnt
FROM RevPro..LineItem WHERE ContractID=185327




 DECLARE @Sku INT;  
    SELECT  @Sku = MAX(A.SKUID)  
    FROM 
	( SELECT L.SKUID, COUNT(L.LineItemID) as Maxcnt
	  FROM RevPro..LineItem L 
	  WHERE L.ContractID=186962
	  GROUP BY L.SKUID
	    ) A

    select @Sku sku;  


delete from dbo.ProcessedContracts where ContractID in (
188871,
186962,
184147,
188434,
184704,
187917,
185327,
180502,
186551
);


UPDATE LI
SET LI.SKUID = dbo.fnGetMaxSku(ContractID)
FROM dbo.LineItem LI WHERE LI.SKUID=-1

---------------------  set everything up a-new ------------------

delete from dbo.ProcessedContracts where ContractID in (
188871,
186962,
184147,
188434,
184704,
187917,
185327,
180502,
186551
);
-------------------------------------
delete from dbo.Active_SOFile where ContractID in (
188871,
186962,
184147,
188434,
184704,
187917,
185327,
180502,
186551
);
----------------------------------------
select * from dbo.LineItem

select * from dbo.SkuBridge SB  
WHERE SB.LineItemID IN (SELECT LineItemID FROM dbo.LineItem )

select * from dbo.SkuBridge;
select * from bkp.SkuBridge

EXEC [dbo].[usp_SKU_MSTR];


select bundleId,  * from RevPro..LineItem where ContractID=188871; -- large contract ( one unbundled bundle )
select bundleId,   * from RevPro..LineItem where ContractID=186962; -- large contract ( no bundles at all found ) 
select bundleId,   * from RevPro..LineItem where ContractID=184147; -- large contact with some holes (9) for bundles 
select bundleId,   * from RevPro..LineItem where ContractID=188434; -- large active contract with no bundles --- and odd product mix
select bundleId,   * from RevPro..LineItem where ContractID=184704; -- large unbundled contact (non suite )
select bundleId,   * from RevPro..LineItem where ContractID=187917; -- large unbunded suite contract (suite )
select bundleId,   * from RevPro..LineItem where ContractID=185327; -- smaller (standard size unbundled contract)
select bundleId,   * from RevPro..LineItem where ContractID=180502; -- small bundled contract
select bundleId,   * from RevPro..LineItem where ContractID=186551; 

