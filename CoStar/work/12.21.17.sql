select * from RevPro..StraightLineDiscountContracts

insert RevPro..StraightLineDiscountContracts (
[ContractID]
      ,[Waterfall_Amt]
      ,[Waterfall_Stub_Amt]
      ,[Contract_Final_Amt]
      ,[StraightLine_Flg]

)
select 
       [ContractID]
      ,[Waterfall_Amt]
      ,[Waterfall_Stub_Amt]
      ,[Contract_Final_Amt]
      ,[StraightLine_Flg]

 from dbo.StraightLineContracts where StraightLine_Flg=1 
and Contract_Final_Amt > 0.00 and ContractID not in (select distinct contractid from RevPro..StraightLineContracts) 

truncate table dbo.StraightLineContracts

EXEC [dbo].[uspProcessStraightLineContracts]

with dups as (
select contractid, ROW_NUMBER() OVER (PARTITION by ContractID order by Contract_Final_Amt desc) rn
from RevPro..vwStraightLineContracts)
select * from dups where rn>1;
---
with dups as (
select contractid, ROW_NUMBER() OVER (PARTITION by ContractID order by Contract_Final_Amt desc) rn
from RevPro..vwStraightLineContracts)
select * from dups where rn>1
--delete from dups where rn>1;

select * from RevPro..StraightLineDiscountContracts where ContractID in (
99629,
165548,
189646,
190508
);
select * from RevPro..StraightLineContracts where ContractID in (
99629,
165548,
189646,
190508
);


select * from RevPro..vwStraightLineContracts
------------------------------------------------------------------------------
select count(*) from RevPro..vwStraightLineContracts where StraightLineType='D';
select count(*) from RevPro..vwStraightLineContracts where StraightLineType='E';
--------------------------------------------------------------------------------

select * from RevPro..vwStraightLineContracts where Contract_Final_Amt < 0

select * from RevPro..vwStraightLineContracts order by ContractID

drop table dbo.StraightLineContracts_bkp

select * into dbo.StraightLineContracts_bkp from dbo.StraightLineContracts; 
truncate table dbo.StraightLineContracts

select * into dbo.StraightLineDiscountContracts_bkp from dbo.StraightLineDiscountContracts;
truncate table dbo.StraightLineDiscountContracts

select * from dbo.StraightLineContracts_bkp;
select * from dbo.StraightLineDiscountContracts_bkp;



insert RevPro..StraightLineContracts (
[ContractID]
      ,[Waterfall_Amt]
      ,[Waterfall_Stub_Amt]
      ,[Contract_Final_Amt]
      ,[StraightLine_Flg]

)
select 
       [ContractID]
      ,[Waterfall_Amt]
      ,[Waterfall_Stub_Amt]
      ,[Contract_Final_Amt]
      ,[StraightLine_Flg]



  from dbo.StraightLineContracts_bkp where StraightLine_Flg=0 and 
ContractID not in  (select distinct ContractID from RevPro..StraightLineContracts )
and Contract_Final_Amt >0  and Waterfall_Stub_Amt  < Waterfall_Amt


select * from RevPro..vwStraightLineContracts

---------------------------------------------------------------------------------------------------------
delete from RevPro..StraightLineContracts where ContractID  in (
select distinct ContractID from RevPro..vwStraightLineContracts where Waterfall_Amt=Waterfall_Stub_Amt)
---------------------------------------------------------------------------------------------------------


delete from RevPro..StraightLineDiscountContracts where ContractID in (
select distinct ContractID from RevPro..vwStraightLineContracts where Contract_Final_Amt < 0 )

select 
StraightLineType,
count(*) from RevPro..vwStraightLineContracts
group by StraightLineType

select * from RevPro..vwStraightLineContracts