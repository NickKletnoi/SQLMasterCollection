
--SELECT * 
delete ASO 
FROM dbo.Active_SOFile ASO where ASO.ContractID IN (
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

-----------------------------------------------------
select distinct SB.LineItemID, SB.SKUID from dbo.SkuBridge SB JOIN dbo.LineItem LI ON SB.LineItemID=LI.LineItemID
where LI.ContractID IN (
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
delete sb from dbo.SkuBridge SB JOIN dbo.LineItem LI ON SB.LineItemID=LI.LineItemID
-------------------------------------------------------
--select *
delete PC 
from dbo.ProcessedContracts PC where
PC.ContractID IN (
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
--------------------------------------------------------
select * from dbo.LineItem
truncate table dbo.LineItem
--------------------------------------------------------
with dups as (
select LineItemID, SKUID , ROW_NUMBER() OVER (Partition by LineItemID, SKUID ORDER BY SKUID) rn
from dbo.SkuBridge )
delete from dups where rn>1;
---------------------------------------------------------------------------------------
select * from dbo.LineItem
---------------------------------------------------------------------------------------
---------- Check on the Status of the Contracts That were Processed Today -------------
---------------------------------------------------------------------------------------
select PC.ContractID, PC.StatusFlg, PC.BundleFlg, SS.Description, PC.StatusDateTime
from dbo.ProcessedContracts PC JOIN dbo.SkuStatus SS on PC.StatusFlg=SS.StatusFlg
where convert(varchar(10),StatusDateTime,1) = convert(varchar(10),getdate(),1)
order by BundleFlg
--------------------------------------------------------------------------------------
select * from dbo.SkuStatus;
--------------------------------------------------------------------------------------





/*
DECLARE @d DATETIME = GETDATE();  
DECLARE @n NUMERIC(38,4)=0.5712

SELECT @n n_Initial
SELECT 
FORMAT( @d, 'MMddyyyy') AS 'DateTime Result',  
FORMAT(69,'# °') AS 'Custom Number Result',
CONVERT(NUMERIC(38,2), @n) n_After
--'0.000'
--'0.00'
ALTER TABLE dbo.try1 alter column [DateTime Result] varchar(10) null;

*/
     