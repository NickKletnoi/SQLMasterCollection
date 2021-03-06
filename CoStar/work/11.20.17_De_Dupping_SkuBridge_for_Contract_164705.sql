USE [RevPro]
GO
/****** Object:  StoredProcedure [dbo].[usp_SKU_MSTR]    Script Date: 11/20/2017 11:32:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[usp_SKU_MSTR] 
AS
--EXEC [dbo].[usp_SKU_GetContractList];
EXEC [dbo].[usp_SKU_LoadContracts] 'R';
EXEC [dbo].[usp_SKU_Prep];  
EXEC [dbo].[usp_SKU_ProcessContracts]; 
EXEC [dbo].[usp_SKU_Bridge_Upd];
EXEC [dbo].[usp_SKU_Cleanup];
--EXEC [dbo].[usp_ActiveSO_Delta]


select * from [dbo].[Contract_Input_List]

truncate table  [dbo].[Contract_Input_List]

exec [dbo].[usp_SKU_MSTR]
---------------

select * from dbo.LineItem
----------------------------

update SB 
set SKUID=9620
from dbo.SkuBridge SB where SB.LineItemID IN (select LineItemID from dbo.LineItem)

select top 10 * from dbo.SkuBridge	

select * from dbo.SkuBridge where LineItemID in (select LineItemID from dbo.LineItem )

with dups as (
select LineItemID, ROW_NUMBER() over (Partition by LineItemID order by SKUID ) rn
from dbo.SkuBridge SB where SB.LineItemID in (select LineItemID from dbo.LineItem))
delete from dups where rn >1;

select PC.ContractID, count(distinct L.BundleID) as BundleCnt, 
count(distinct SB.SKUID) as SKUIDCnt, 
CASE WHEN count(distinct L.BundleID)<>count(distinct SB.SKUID) THEN 1 ELSE 0 END AS MissMatchFlg1,
CASE WHEN count(distinct L.BundleID)<>count(distinct LI.SKUID) THEN 1 ELSE 0 END AS MissMatchFlg2
INTO dbo.SkuMissMatches2
from RevPro..ProcessedContracts PC JOIN [DCSQLDEV126\CRM].[Enterprise].dbo.LineItem L
ON PC.ContractID=L.ContractID JOIN dbo.SkuBridge SB ON SB.LineItemID=L.LineItemID JOIN dbo.LineItem LI ON L.LineItemID=LI.LineItemID
group  by PC.ContractID
having count(L.BundleID)>0

truncate table dbo.Contract_Input_List

select ContractID
into dbo.Fixed_Contracts1
from dbo.SkuMissMatches2 where MissMatchFlg2=0


select L.ContractID,L.LineItemID,L.SKUID 
into dbo.Fixed_Contracts2
from dbo.LineItem L JOIN dbo.Fixed_Contracts1 FC on L.ContractID=FC.ContractID
-------------------------------------------------------------------------------

select distinct LineItemID from dbo.Fixed_Contracts2

with dups1  as (
select LineItemID, ROW_NUMBER() over (partition by skuid order by skuid) rn
 from dbo.Fixed_Contracts2 );
 delete  from dups1 where rn >1
 
------------------------------------------
select * from dbo.Contract_Input_List
------------------------------------------
insert dbo.Contract_Input_List(ContractID)
select ContractID from dbo.SkuMissMatches where MissMatchFlg=1 and BundleCnt=1 and SKUIDCnt>1
-------------------------------------------------------
select distinct ContractID from dbo.ProcessedContracts
-------------------------------------------------------
select distinct ContractID from dbo.Contract_Input_List
-----------------------------------------------------------------------------------------------
--------------------------- Let this Run then Compare The Sku Count Details -------------------
EXEC [dbo].[usp_SKU_MSTR];
------------------------------------------------------------------------------------------------
select * from 
------------------------------------------------------------------------------------------------


