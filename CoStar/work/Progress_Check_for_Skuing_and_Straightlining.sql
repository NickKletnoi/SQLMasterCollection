-----------------------------------------------------------------------
------------------ Progress Check for Skuing and Straightlining -------
-----------------------------------------------------------------------
select count(*) Total_to_be_Skued_today from dbo.Contract_Input_List;
select count(*) Already_skued_today from dbo.Contract_Input_List 
where AuditDate is not null;
------------------------------------------------------------------------
select count(*) Total_to_be_straightlined_today from stg.Contract_Input_List;
select count(*) Already_straightlined_today from stg.Contract_Input_List 
where AuditDate is not null;
------------------------------------------------------------------------
------------------------------------------------
select count(*) ASO_bkp from [bkp].[Active_SOFile];
select count(*) ASO_dbo from [dbo].[Active_SOFile];
------------------------------------------
select count(*) PC_bkp from [bkp].[ProcessedContracts];
select count(*) PC_dbo from [dbo].[ProcessedContracts];
----------------------------------------------
select count(*) S_bkp from [bkp].[Sku];
select count(*) S_dbo from [dbo].[Sku];
-----------------------------------------------
select count(*) SB_bkp from [bkp].[SkuBridge];
select count(*) SB_dbo from [dbo].[SkuBridge];
-----------------------------------------------
select count(*) SP_bkp from [bkp].[SkuPrice];
select count(*) SP_dbo from [dbo].[SkuPrice];
-----------------------------------------------
select count(*) SLC_bkp from [bkp].[StraightLineContracts];
select count(*) SLC_dbo from [dbo].[StraightLineContracts];
------------------------------------------------
select count(*) SLDC_bkp from [bkp].[StraightLineDiscountContracts];
select count(*) SLDC_dbo from [dbo].[StraightLineDiscountContracts];
-------------------------------------------------
select count(*) vwSLC from vwStraightLineContracts;
-------------------------------------------------
select count(*) Processed_Active_Contracts from ProcessedContracts where StatusFlg<>'I'
------------------------------------------------------------
select count(distinct contractid) ASO_Contracts_Count from dbo.Active_SOFile;
--------------------------------------------------------

------------------------------------------------------------------------
DROP TABLE bkp.Active_SOFile;
DROP TABLE bkp.ProcessedContracts;
DROP TABLE bkp.Sku;
DROP TABLE bkp.SkuBridge;
DROP TABLE bkp.SkuPrice;
DROP VIEW [dbo].[vwStraightLineContracts];
DROP TABLE bkp.StraightLineContracts;
DROP TABLE bkp.StraightlineDiscountContracts;
-----------------------------------------------
SELECT * INTO bkp.Active_SOFile FROM dbo.Active_SOFile
SELECT * INTO bkp.ProcessedContracts FROM dbo.ProcessedContracts
SELECT * INTO bkp.Sku FROM dbo.Sku
SELECT * INTO bkp.SkuBridge FROM dbo.SkuBridge
SELECT * INTO bkp.SkuPrice FROM dbo.SkuPrice
SELECT * INTO bkp.StraightLineContracts FROM dbo.StraightLineContracts 
SELECT * INTO bkp.StraightlineDiscountContracts FROM dbo.StraightLineDiscountContracts
---------------------------------------------------
---------------------------------------------------
	CREATE VIEW [dbo].[vwStraightLineContracts]
	AS
	SELECT SLC.ContractID, SLC.Waterfall_Amt, SLC.Waterfall_Stub_Amt, SLC.Contract_Final_Amt, 
	(SLC.Contract_Final_Amt-SLC.Waterfall_Stub_Amt) as Contract_Final_Amt_LessStubAmt,
	 'E' as StraightLineType, CASE WHEN (NFTC.ContractID IS NOT NULL) THEN 0 ELSE 1 END AS StraightLineStatusFlg
	FROM dbo.StraightLineContracts SLC LEFT JOIN
	(SELECT contractid, COUNT(DISTINCT L.RenewalDate) RD 
							FROM Staging..LineItem L
							GROUP BY ContractID
							HAVING COUNT(DISTINCT L.RenewalDate)>1 ) NFTC ON SLC.ContractID=NFTC.ContractID
	WHERE (SLC.StraightLine_Flg=0 OR SLC.StraightLine_Flg=1) 
    AND ( SLC.Contract_Final_Amt > 0 ) AND ( SLC.Waterfall_Stub_Amt  < SLC.Waterfall_Amt )

	UNION

    SELECT SLDC.ContractID, SLDC.Waterfall_Amt, SLDC.Waterfall_Stub_Amt, SLDC.Contract_Final_Amt, 
	(SLDC.Contract_Final_Amt-SLDC.Waterfall_Stub_Amt) as Contract_Final_Amt_LessStubAmt,
	 'D' as StraightLineType, CASE WHEN (NFTC.ContractID IS NOT NULL) THEN 0 ELSE 1 END AS StraightLineStatusFlg
	FROM dbo.StraightLineDiscountContracts SLDC LEFT JOIN
	(SELECT contractid, COUNT(DISTINCT L.RenewalDate) RD 
							FROM Staging..LineItem L
							GROUP BY ContractID
							HAVING COUNT(DISTINCT L.RenewalDate)>1 ) NFTC ON SLDC.ContractID=NFTC.ContractID
	WHERE (SLDC.StraightLine_Flg=0 OR SLDC.StraightLine_Flg=1) 
    AND ( SLDC.Contract_Final_Amt > 0 ) AND ( SLDC.Waterfall_Stub_Amt  < SLDC.Waterfall_Amt )

GO







------------------------------------------------
