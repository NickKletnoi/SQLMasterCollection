select * from [stg].[StraightLineContracts];
select * from [stg].[StraightLineDiscountContracts];
----------------

select * from dbo.StraightLineContracts;
select * from dbo.StraightLineDiscountContracts;
----------------

select * from vwStraightLineContracts

with ContractDups as (
select contractid, ROW_NUMBER() over (partition by contractid order by contract_final_amt desc) rn
from vwStraightLineContracts)
select * from ContractDups CD JOIN vwStraightLineContracts SLC on CD.Contractid=SLC.ContractID where CD.rn>1;
