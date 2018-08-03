
------------------------------------------------------------------------------
select distinct  GLAccount from [cube].[F_PO] where GLAccount not in (select 
GLAccount from [cube].[D_GLAccount]);
---------------------------------------

select distinct [PostingYearMonth]  from [cube].[F_PO] where [PostingYearMonth] not in (select 
[YearMonthName] from [cube].[D_PeriodYearMonth]);
--2016-Sep
----------------------------------------

select distinct [VendorNumber]  from [cube].[F_PO] where [VendorNumber] not in (select 
[VendorNumber] from [cube].[D_Vendor]);
--2016-Sep

select * from [cube].[D_PeriodYearMonth]


update PO
set PO.[PostingYearMonth]='2016-Sept' from [cube].[F_PO] PO where [PostingYearMonth]='2016-Sep'


alter table [cube].[F_PO] alter column [PostingYearMonth] varchar(9) 
-----------------------------------------------

 update E
  set E.[PostingYearMonth]=
     CAST([PostingYear] as char(4))+
CASE CAST([PostingMonth] as char(2))  WHEN '1' THEN '01'
                   WHEN '2' THEN '02'
				   WHEN '3' THEN '03'
				   WHEN '4' THEN '04'
				   WHEN '5' THEN '05'
				   WHEN '6' THEN '06'
				   WHEN '7' THEN '07'
				   WHEN '8' THEN '08'
				   WHEN '9' THEN '09'
ELSE CAST([PostingMonth] as char(2)) END
FROM [cube].[F_PO] E
-----------------------------------------

alter table [cube].[F_PO] alter column PostingYearMonth varchar(10) null;



select [VendorNumber], count(*) cnt
from [cube].[D_Vendor]
group by [VendorNumber]
having count(*)>1

with dups as (
select [VendorNumber], ROW_NUMBER() OVER (Partition by [VendorNumber] ORDER BY [VendorNumber]) rn
from [cube].[D_Vendor]
)
delete from dups where rn>1
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
