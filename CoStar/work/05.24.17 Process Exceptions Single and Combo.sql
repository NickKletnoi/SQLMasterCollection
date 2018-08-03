

SELECT DISTINCT SBF.SKUID
INTO OldAptSkusList
FROM [dbo].[SkuBridgeFinal] SBF JOIN [LineItemApptsFinal] LIAF ON 
                                                                               SBF.LineItemID=LIAF.LineItemID 
										        JOIN [dbo].[SkuPriceFinal] SPF ON SPF.SKUID=SBF.SKUID 
                     

WHERE LINEITEMID IN (SELECT DISTINCT LINEITEMID FROM [dbo].[LineItemApptsFinal])


select distinct SKUID, SkuName from ##AptSkus

select * from ##AptSkus1 order by SKUID

update AS1
set AS1.SKUID=LIAF.SKUID,
    AS1.SkuName=SAF2.SkuName
from AptSkus AS1 JOIN [LineItemApptsFinal] LIAF ON AS1.LineItemID=LIAF.LineItemID  JOIN [dbo].[SkuApptsFinal2] SAF2
                                                   ON SAF2.SkuId=LIAF.SKUID

select * from [dbo].[SkuApptsFinal2]

select * from ##AptSkus1

select * from AptSkus

UPDATE SBF
SET SBF.SKUID=A.SKUID
FROM [dbo].[SkuBridgeFinal] SBF JOIN AptSkus A ON SBF.LineItemID=A.LineItemID

INSERT SkuPriceFinal ([SKUID],[SkuName])
SELECT [SkuId] ,[SkuName] FROM [dbo].[SkuApptsFinal2] 


SELECT * FROM SkuFinal

delete from SkuPriceFinal where SKUID in (select  Skuid from OldAptSkusList)

select * from [dbo].[SkuPriceFinal]
------------------------------------------------------------------------------


select * from [dbo].[SkuPriceFinal] where SkuName like '%Appts%'

select * from [dbo].[SkuFinal] where SkuName like '%Appts%'

select * from SkuPriceFinal where SKUID in ( select skuid from [dbo].[SkuApptsFinal2])

select * from [dbo].[SkuBridgeFinal] order by SKUID



select * 
INTO #SkuExceptionsList
from SkuPriceFinal where skuid in (
select SKUID from [dbo].[SkuNonSuite])

select * from #SkuExceptionsList where Price>0 order by Price desc
delete from #SkuExceptionsList where SKUID in (35758)

select * 
into SkuExceptionsList052417
from #SkuExceptionsList where Price>0 order by Price desc

select * from [dbo].[SkuExceptionsList052417]
delete from [dbo].[SkuExceptionsList052417] where SKUID in( 30795)
--------------------------------------------------------------------------------------------

select * from SkuFinal where SKUID IN (39541)
update SkuPriceFinal set SkuName='39541-Exchange-Renville-2-0' where SKUID IN (39541)
update SkuFinal set SkuName='39541-Exchange-Renville-2-0' where SKUID IN (39541)
--------
select * from SkuFinal where SKUID IN (39744)
update SkuPriceFinal set SkuName='39744-ADJ-UKN-1-9' where SKUID IN (39744)
update SkuFinal set SkuName='39744-ADJ-UKN-1-9' where SKUID IN (39744)
-----
select * from SkuFinal where SKUID IN (39763)
update SkuPriceFinal set SkuName='39763-Exchange-UKN-1-4' where SKUID IN (39763)
update SkuFinal set SkuName='39763-Exchange-UKN-1-4' where SKUID IN (39763)
-------
select * from SkuFinal where SKUID IN (46247)
update SkuPriceFinal set SkuName='46247-Property-SFO-1-4' where SKUID IN (46247)
update SkuFinal set SkuName='46247-Property-SFO-1-4' where SKUID IN (46247)
-----
select * from SkuFinal where SKUID IN (46247)
update SkuPriceFinal set SkuName='46247-Property-SFO-1-4' where SKUID IN (46247)
update SkuFinal set SkuName='46247-Property-SFO-1-4' where SKUID IN (46247)
------
select * from SkuFinal where SKUID IN (35758)
update SkuPriceFinal set SkuName='35758-Market-UKN-180-0' where SKUID IN (35758)
update SkuFinal set SkuName='35758-Market-UKN-180-0' where SKUID IN (35758)
-------
select * from SkuFinal where SKUID IN (30795)
update SkuPriceFinal set SkuName='30795-Combo-UKN-0-0' where SKUID IN (30795)
update SkuFinal set SkuName='30795-Combo-UKN-0-0' where SKUID IN (30795)
-----
select * from SkuFinal where SKUID IN (32984)
update SkuPriceFinal set SkuName='32984-Combo--1 -78-0' where SKUID IN (32984)
update SkuFinal set SkuName='32984-Combo--1 -78-0' where SKUID IN (32984)

select * from Market2 where MarketID in ('4');
select * from Product where productid in (69,66);
---------------------------------------------------------------------------------


select * 
into ##SkuExceptions
from SkuFinal where skuid in ( 
select SKUID from [dbo].[SkuExceptionsList052417]) order by SKUID

select SKUID,SkuName,count(productid) as ProductCnt 
into #SkuExceptionsSingle
from ##SkuExceptions
Group by SkuName,SKUID
having count(productid)=1
---
select SKUID,SkuName,count(productid) as ProductCnt 
into #SkuExceptionsCombo
from ##SkuExceptions
Group by SkuName,SKUID
having count(productid)>1
-----

drop table #SkuExceptionsSingle
drop table #SkuExceptionsCombo
---

select * from #SkuExceptionsSingle


UPDATE SES
SET SES.SkuName=SkuName
from #SkuExceptionsSingle SES JOIN SkuFinal SF on SF.SKUID=SES.SKUID JOIN 
--------------------------------------------------------------------------

SELECT SF.SKUID,CAST(SF.SKUID AS VARCHAR(20)) +'-'+

(SELECT top 1 P1.ProductName from SkuFinal SF1 JOIN Product P1 on SF1.ProductID= P1.ProductID 
 where SF1.SKUID=SF.SKUID
)
+'-'+RIGHT(SF.SkuName,7)
  AS SkuName
 --into SkuExceptionsCombo
from  SkuExceptionsSingle E JOIN SkuFinal SF ON E.SKUID=SF.SKUID JOIN Product P ON SF.ProductID=P.ProductID
------------------------------------------------------------------------------------------------------------
SELECT distinct SF.SKUID,CAST(SF.SKUID AS VARCHAR(20)) +'-'+

'Combo'
+'-'+RIGHT(SF.SkuName,7)
  AS SkuName
 --into SkuExceptionsCombo
from  SkuExceptionsCombo E JOIN SkuFinal SF ON E.SKUID=SF.SKUID JOIN Product P ON SF.ProductID=P.ProductID
--------------------------------------------------------------------------------------------------------



select * from #SkuExceptionsSingle


  select LEFT(SkuName,LEN(SkuName)-LEN(RIGHT(SkuName,LEN(SkuName)-(CHARINDEX('-S',SkuName))))) 
   
  AS Numbr,
         SKUID
  from SkuFinal 
  
  
  S JOIN SkuFinal S1
  on RIGHT(S.SkuName,LEN(S.SkuName)-(CHARINDEX('-S',S.SkuName)))=RIGHT(S1.SkuName,LEN(S1.SkuName)-(CHARINDEX('-S',S1.SkuName)))
  where S.SKUID<>S1.SKUID
  group by RIGHT(S.SkuName,LEN(S.SkuName)-(CHARINDEX('-S',S.SkuName))),S.SKUID
  having count(*)>1
  -----

  select distinct SkuID, NewSkuName 
  into SkuExceptionsCombo2
  from SkuExceptionsCombo


  update SF
  set SF.SkuName=SE.NewSkuName
  from SkuFinal SF JOIN [dbo].SkuExceptionsCombo2 SE on SF.SKUID=SE.SKUID


  update SPF
  set SPF.SkuName = SF.SkuName
  from SkuPriceFinal SPF JOIN SkuFinal SF on SPF.SKUID=SF.SKUID
  where SPF.SKUID in (select SKUID from SkuExceptionsCombo2)
  --------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------
  select * from SkuPriceFinal where Price>4  order by SkuName
  select * from SkuFinal where SKUID in (31726)
  select * from Product where ProductID in (150)
  ------------------------------------------------------
  select * from [dbo].[SkuPriceFinal] where price>4
  select * from SkuFinal where SKUID in (49042)
  -----------------------------------------------------
  select * from SkuFinal where SKUID in (16881);
  -----------------------------------------------------
  select * from SkuPriceFinal where SKUID in (select SKUID from [dbo].[SkuListPriced])
  -----------------------------------------------------


  select CustomerType, count(*) TypeCnt From SkuFinal
  group by  CustomerType
  order by CustomerType

  select top 100 * from SkuFinal


  UPDATE SF
  SET SF.SkuName=SF.SkuName+'-'+BTC.BusinessTypeCategory
  --, BT.BusinessTypeID,BTC.[BusinessTypeCategory]  
  from SkuFinal SF JOIN [dbo].[BusinessType] BT ON SF.CustomerType=BT.BusinessTypeID JOIN [dbo].[BusinessTypeCategory] BTC ON 
                     BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
					 where SF.SKUID not in (select SKUID from [dbo].[741Sku]) AND
					RIGHT(SkuName,1) IN ('1','2','3','4','5','6','7','8','9','0')
					 ------

update SPF
set SPF.[SkuName]=SF.SkuName
FROM
[dbo].[SkuPriceFinal] SPF JOIN SkuFinal SF ON SPF.SKUID=SF.SKUID

select * from SkuPriceFinal



select CustomerType, count(*) CustomerTypeCnt 
FROM SkuFinal where SKUID not in (select SKUID from [dbo].[SkuListPriced])
group by CustomerType
order by 1
---------------------------------------

SELECT TOP 100 
    SUBSTRING(SkuName, CHARINDEX('-',SkuName)+1,LEN(SkuName)-CHARINDEX('-',SkuName)) No_SKUID_Name,
 CustomerType, 
SkuName 
into #
FROM 
SkuFinal
----
select * from SkuFinal where SKUID in(
select SKUID from [dbo].[SkuListPriced])
--------------------
-----
set @idx = charindex(@Delimiter,@String) 
  if @idx!=0 
   set @slice = left(@String,@idx - 1) 

   --39318-Suite-WSH-13-4
   --39345-Suite-1RM-2-12


   select * from [dbo].[741Sku]


    select 
   SF.SkuName,SF.SkuName+'-'+BTC.BusinessTypeCategory
  --, BT.BusinessTypeID,BTC.[BusinessTypeCategory]  
  from SkuFinal SF JOIN [dbo].[BusinessType] BT ON SF.CustomerType=BT.BusinessTypeID JOIN [dbo].[BusinessTypeCategory] BTC ON 
                     BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
					 where SF.SKUID not in (select SKUID from [dbo].[741Sku]) AND
					RIGHT(SkuName,1) IN ('1','2','3','4','5','6','7','8','9','0')
					 ------

    select 
 *
  --, BT.BusinessTypeID,BTC.[BusinessTypeCategory]  
  from  [dbo].[BusinessType] BT JOIN [dbo].[BusinessTypeCategory] BTC ON 
                     BT.BusinessTypeCategoryID=BTC.BusinessTypeCategoryID
					 

Update SF
SET SF.SkuName=Left(SkuName,LEN(SkuName)-1)+'Unknown' 
 from SkuFinal SF where Right(SkuName,1)='0'
 ----------

 Update SPF
 SET SPF.SkuName=S.SkuName
 From SkuPriceFinal SPF JOIN SkuFinal S ON SPF.SKUID=S.SKUID
 ---------

 select * from SkuPriceFinal where Price>4
 select * from SkuFinal

 select * from product where productid in (173,1,40)

 select ProductID, Productdesc from Product  order by ProductID

  select SKUID,SkuName, COUNT(*) CNT
 into ##SuiteSku 
 from SkuFinal WHERE ProductID IN (1,2,5) AND Amount>0
 GROUP BY SKUID,SkuName


 select DISTINCT SKUID 
 INTO IncompleteSKUs
 from SkuFinal where SKUID NOT IN (select SKUID from ##SuiteSku) and SkuName like '%Suite%'
 Order by SKUID

 select * from SkuFinal where SKUID in (select SKUID from IncompleteSKUs)  order by SKUID,ProductID

 select * from Product where productid in (
166,
166,
167,
168);

--------------------------------------------------------------------------
select * from SkuPriceFinal where Price>4 and SkuName not like '%Suite%'--
select * from [dbo].[SkuPriceFinal] where Price>4 order by SKUID;---------
--------------------------------------------------------------------------




































