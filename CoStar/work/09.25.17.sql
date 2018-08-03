------------------------------------------------
CREATE TABLE [bal].[MergeBal](
	[PostingDate] date NULL,
	[GLAccount] [varchar](50)  NULL,
	Debit money null,
	Credit money null
) ON [PRIMARY] GO
---------------------------------------------------------------------
---------------------------------------------------------------------
EXEC xp_cmdshell 'bcp CoStar.bal.MergeBal IN L:\Financial Systems\Nick\mrge_bal_092517.txt -c -T'; 
--bcp CoStar.bal.MergeBal IN L:\Financial Systems\Nick\mrge_bal_092517.txt -c -T
----------
select distinct PostingDate   from [bal].[MergeBal]
alter table [bal].[MergeBal] add PostingYearMonth varchar(50) null;
----------------------------------------------------------------------
SELECT
CAST(  YEAR(PostingDate) AS VARCHAR(4))    as PostingYear,
CAST(  MONTH(PostingDate) AS VARCHAR(2))    as PostingMonth,
CAST(  YEAR(PostingDate) AS VARCHAR(4))+
CASE CAST(  MONTH(PostingDate) AS VARCHAR(2)) WHEN '1' THEN '-Jan'
                   WHEN '2' THEN '-Feb'
				   WHEN '3' THEN '-Mar'
				   WHEN '4' THEN '-Apr'
				   WHEN '5' THEN '-May'
				   WHEN '6' THEN '-Jun'
				   WHEN '7' THEN '-Jul'
				   WHEN '8' THEN '-Aug'
				   WHEN '9' THEN '-Sept'
				   WHEN '10' THEN '-Oct'
				   WHEN '11' THEN '-Nov'
				   WHEN '12' THEN '-Dec'
 END AS YearMonthName
 FROM [bal].[MergeBal]
 --------------------------------------------------------------
 --------------------------------------------------------------
UPDATE B
SET B.PostingYearMonth=
CAST(  YEAR(B.PostingDate) AS VARCHAR(4))+
CASE CAST(  MONTH(B.PostingDate) AS VARCHAR(2)) WHEN '1' THEN '-Jan'
                   WHEN '2' THEN '-Feb'
				   WHEN '3' THEN '-Mar'
				   WHEN '4' THEN '-Apr'
				   WHEN '5' THEN '-May'
				   WHEN '6' THEN '-Jun'
				   WHEN '7' THEN '-Jul'
				   WHEN '8' THEN '-Aug'
				   WHEN '9' THEN '-Sept'
				   WHEN '10' THEN '-Oct'
				   WHEN '11' THEN '-Nov'
				   WHEN '12' THEN '-Dec'
 END 
from [bal].[MergeBal] B
---------------------------------------------------------
--------------------------------------------------------
select  GLAccount,SUM(Debit) as Debit
from bal.MergeBal 
where PostingYearMonth='2016-Dec' and LEFT(GLAccount,1)='3'
group by GLAccount 
order by SUM(Debit) desc
----------------------------------------------------------
------------------------------------------------------------
--------------------------------------------------------------

/*
Continuing to work through the enhancements and the 
other things that we have in place for the right setup
needed to undertake in this particular curcumstance;
----
this will be provided for the forthcoming episode of

*/

CAST([PostingDate] as char(4))+
CASE CAST([PostingDate] as varchar(20))  WHEN '1' THEN '-Jan'
                   WHEN '2' THEN '-Feb'
				   WHEN '3' THEN '-Mar'
				   WHEN '4' THEN '-Apr'
				   WHEN '5' THEN '-May'
				   WHEN '6' THEN '-Jun'
				   WHEN '7' THEN '-Jul'
				   WHEN '8' THEN '-Aug'
				   WHEN '9' THEN '-Sept'
				   WHEN '10' THEN '-Oct'
				   WHEN '11' THEN '-Nov'
				   WHEN '12' THEN '-Dec'

 END AS YearMonthName
 from [bal].[MergeBal]
 -------------------------------------------
 select top 10 PostingDate from bal.MergeBal;
 ------------------------------------------------
 ----------------------------------------------------
 select * from dbo.LineItem where contractid = 173763
 ------------------------------------------------------
 -- 173763

 select * from  dbo.ProcessedContracts where ContractID=173763


select * from dbo.SkuBridge where LineItemID in (

2959559,
2959560,
3492410,
3492411,
3492412,
2943235,
2943236,
2943237,
2943238,
2943239,
2943240,
2943241,
2943242,
2959561,
2959562
)


select * from dbo.Sku where SKUID=84

--------------------------------------
/*
Items to get done tomorrow include:
-----------------------------------
1. Populating the Allocations table
2. Populating the Active_SO  table 
3. Getting everything ready to go
   from a contracts standpoint;
--------------------------------
this is what i am talking about
when i refer to the shit talking back

*/

select distinct contractID from dbo.LineItem where LineITemid in (
3492410,
98599,
3492411,
98599,
3492412,
98599
)

select * from dbo.LineItem where Contractid in (
13534,
173763);
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------