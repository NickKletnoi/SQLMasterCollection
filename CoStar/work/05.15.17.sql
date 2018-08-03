SELECT * FROM [dbo].[SkuBridge]
select * from [dbo].[SkuApptsFinal];
select * from [dbo].[SkuApptsFinal];


select * from [dbo].[SkuAppts]

select * from [dbo].[ProductAppts1]

select 
--top 100
-- PA1.ProductID,
 SkuName=CAST(PA1.[SKUID] AS VARCHAR(50))+'-'+PA1.ProductCategory+'-'+LIA.[NetworkName]+'-'+LIA.[UnitSign]
 --, count(*) as cnt
  from [dbo].[ProductAppts1] PA1 JOIN LineItemApptsFinal2 LIA on PA1.ProductID=LIA.ProductID
--  group by CAST(PA1.[SKUID] AS VARCHAR(50))+'-'+PA1.ProductCategory+'-'+LIA.[NetworkName]+'-'+LIA.[UnitSign]

select * from [dbo].[LineItemApptsFinal2] order by SKUID


  select * from ProductAppts1

  ------------------------------------ BUILD THE SKU DIMENSION -------------------------
  select distinct SkuId, SkuName 
  INTO [dbo].[SkuApptsFinal2]
  from [dbo].[LineItemApptsFinal2] order by SkuName
  --------------------------------------------------------------------------------------

  select count(*) from [dbo].[LineItemApptsFinal2] where SkuName like  '%Finder%';
  select count(*) from [dbo].[LineItemApptsFinal2] where SkuName like  '%Appts%';

  
  select COUNT(distinct  contractID) AS PrimaryFinder_Cnt
  --INTO #FinderNoAppts
  from [LineItemApptsFinal2] where SkuName like '%Finder%' and ContractID not in (
  (select contractID
  from [dbo].[LineItemApptsFinal2] where (SkuName like '%Appts%')))
  ----------------
  select COUNT(distinct  contractID) AS PrimaryAppt_Cnt 
  --#ApptsNoFinder
  from [LineItemApptsFinal2] where SkuName like '%Appts%' and ContractID not in (
  (select contractID
  from [dbo].[LineItemApptsFinal2] where (SkuName like '%Finder%')))


  Select * from LineItemAppts2 where ContractID in (select ContractID from #FinderNoAppts)

  select * from #FinderNoAppts

  drop table #ApptsNoFinder




   AND (SkuName like '%Finder%')


   update L
   set L.SkuID=30101,
       L.SkuName='30101-Legacy-Silver-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30001-Legacy-Silver-P'
   ---------------
    update L
   set L.SkuID=30102,
       L.SkuName='30102-Appts-Gold-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30002-Appts-Gold-P'
   ----------------
    update L
   set L.SkuID=30103,
       L.SkuName='30103-Appts-Silver-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30003-Appts-Silver-P'
   -----------------
    update L
   set L.SkuID=30104,
       L.SkuName='30104-Appts-Platinum-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30004-Appts-Platinum-P'
   -------------------------
   update L
   set L.SkuID=30105,
       L.SkuName='30105-Appts-Diamond-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30005-Appts-Diamond-P'
   --------------------------
      update L
   set L.SkuID=30106,
       L.SkuName='30106-Appts-Gold-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30006-Appts-Gold-P'
   -----------------------------
    update L
   set L.SkuID=30106,
       L.SkuName='30106-Appts-Gold-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30007-Appts-Gold-P'
   --------------------------------
       update L
   set L.SkuID=30109,
       L.SkuName='30109-Finder-Silver-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30009-Finder-Silver-P'
   -----------------
    update L
   set L.SkuID=30110,
       L.SkuName='30110-Finder-Gold-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30010-Finder-Gold-P'
   -------------------
   update L
   set L.SkuID=30111,
       L.SkuName='30111-Finder-Platinum-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30011-Finder-Platinum-P'
   -------------------
    update L
   set L.SkuID=30112,
       L.SkuName='30112-Finder-Diamond-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30012-Finder-Diamond-P'
   ------------
    update L
   set L.SkuID=30113,
       L.SkuName='30113-FinderSites-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30013-FinderSites-Finder Sites-P'
   ----------------------
   update L
   set 
   --L.SkuID=30113,
       L.SkuName='30013-FinderSites-M'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30013-FinderSites-Finder Sites-M'
   ---------------------
    update L
   set L.SkuID=30114,
       L.SkuName='30114-Appts-Silver-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30014-Appts-Silver-P'
   -----------
   update L
   set L.SkuID=30115,
       L.SkuName='30115-Finder-Silver-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30015-Finder-Silver-P'
   ---------------
    
  update L
   set 
   L.SkuName='30016-FinderSites-P'
   from [dbo].[LineItemApptsFinal2] L where SkuName='30016-FinderSites-Finder Sites-P'
   ----------------



   SELECT * FROM [dbo].[SkuApptsFinal2]