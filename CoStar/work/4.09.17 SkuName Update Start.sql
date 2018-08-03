select skuid , sum(amount) Amount from LineItem where SKUID in (
select distinct SKUID from Sku_1500WORST)
group by SKUID 
order by sum(amount) desc
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
select count(distinct skuid) skuid, sum(amount) amount from lineitem where skuid not in
(select distinct skuid from [dbo].[Sku_500MOST]
union
select distinct skuid from [dbo].[Sku_100TOPWORST])
and Amount>1;
-------------------------------------------------------
--2,048,056.72-----------------------------------------
-------------------------------------------------------


SELECT SKUID,MarketID, COUNT(*) CNT
INTO #TEMP_SKU2
FROM SKU
WHERE PRODUCTID IN (1,2,5)
GROUP BY SKUID,MarketID
--ORDER BY SKUID
HAVING COUNT(*)=3;

SELECT * 
INTO #TEMP_SKU3
FROM #TEMP_SKU2
ORDER BY SKUID, MarketID

SELECT SKUID,COUNT(*)
FROM #TEMP_SKU3
GROUP BY SKUID
HAVING COUNT(*)>1

SELECT * FROM #TEMP_SKU3

DELETE FROM #TEMP_SKU3 WHERE SKUID IN (
933,
3308,
3349,
4092,
4218,
7569,
19249
)

SELECT SKUID, 
CAST(SKUID AS VARCHAR(20))+'-'+
'Suite-'+
CAST([MarketID] AS VARCHAR(20))+'-'+
CAST([UserCount] AS VARCHAR(20))+'-'+
CAST([CustomerType] AS VARCHAR(20)) SKU_NAME
into #sku_name1
FROM SKU 
WHERE SKUID IN (SELECT DISTINCT SKUID FROM #TEMP_SKU3)

select distinct skuid, Sku_name
into #sku_name2
from #sku_name1
order by skuid

select distinct SKUID from #sku_name2
select * from #sku_name2

select * from SkuPrice

update s
set s.SkuName=t.Sku_name
from SkuPrice s join #sku_name2 t on s.SKUID=t.SKUID

select * from SkuPrice
order by skuid 

select * from
SkuPrice where 
price >4
and SkuName is not null 
and SkuName like '%--1%'
order by SKUID

---------------------- MIXED MARKET SKU'S ----------------
/*

933
3308
3349
4092
4218
7569
19249

*/
----------------------------------------------------------
/*
PROBLEM SKUS

10124
10154
10290
10428
10702
10937
11401
11507
12328
13484
14762
14886
15060
15541
15892
16019
16329
16496
17841
18707
19025
19793
19813
21124
21195
21333
21504
21765
21893
23065
23605
24099
24153


*/

SELECT * FROM SKU WHERE SKUID IN (5594)
select * from SkuPrice where SKUID in (5594)

SELECT * FROM SkuPrice WHERE SKUID IN (SELECT DISTINCT SKUID FROM #TEMP_SKU)
ORDER BY SKUID

select * from CustomerType

select * from [dbo].[sku_name1]

select * from sku where skuid in (24,34,59,92,152,167,176,193)












select * from sku where skuid in (608)
order by ProductID


update s
set s.SkuName='24-Suite-FL1-5-14'
from skuPrice s
where SKUID in (24)

select * from SkuPrice where SKUID=24
----------------------------------------
update s
set s.SkuName='34-Suite-FL1-1-12'
from skuPrice s
where SKUID in (34)

select * from SkuPrice where SKUID=34
----------------------------------------
update s
set s.SkuName='59-Suite-LAX-3-0'
from skuPrice s
where SKUID in (59)

select * from SkuPrice where SKUID=59
------------------------------------------
update s
set s.SkuName='92-Suite-DFW-2-12'
from skuPrice s
where SKUID in (92)

select * from SkuPrice where SKUID=92
-------------------------------------------
update s
set s.SkuName='152-Suite-MN1-4-9'
from skuPrice s
where SKUID in (152)

select * from SkuPrice where SKUID=152
---------------------------------------------
update s
set s.SkuName='193-Suite-USA-15-0'
from skuPrice s
where SKUID in (193)

select * from SkuPrice where SKUID=193
---------------------------------------------
----------------------------------------------
update s
set s.SkuName='176-Suite-MIN-8-0'
from skuPrice s
where SKUID in (176)

select * from SkuPrice where SKUID=176
-----------------------------------------------
update s
set s.SkuName='176-Suite-MIN-8-0'
from skuPrice s
where SKUID in (176)

select * from SkuPrice where SKUID=176
------------------------------------------------
------------------------------------------------
------------------------------------------------
------------------------------------------------
update s
set s.SkuName='167-Suite-USA-11-0'
from skuPrice s
where SKUID in (167)

select * from SkuPrice where SKUID=167
SELECT * FROM SKU WHERE SKUID=167
--------------------------------------------------
update s
set s.SkuName='229-Suite-USA-7-0'
from skuPrice s
where SKUID in (229)

select * from SkuPrice where SKUID=229
SELECT * FROM SKU WHERE SKUID=229
-----------------------------------------------
update s
set s.SkuName='246-Suite-WAS-16-4'
from skuPrice s
where SKUID in (246)

select * from SkuPrice where SKUID=246
SELECT * FROM SKU WHERE SKUID=246
----------------------------------------------
update s
set s.SkuName='255-Suite-USA-24-10'
from skuPrice s
where SKUID in (255)

select * from SkuPrice where SKUID=255
SELECT * FROM SKU WHERE SKUID=255
--------------------------------------------
update s
set s.SkuName='264-Suite-WAS-8-7'
from skuPrice s
where SKUID in (264)

select * from SkuPrice where SKUID=264
SELECT * FROM SKU WHERE SKUID=264
---------------------------------------------
update s
set s.SkuName='281-Suite-EBY-7-4'
from skuPrice s
where SKUID in (281)

select * from SkuPrice where SKUID=281
SELECT * FROM SKU WHERE SKUID=281
---------------------------------------------
update s
set s.SkuName='290-Suite-SNY-32-0'
from skuPrice s
where SKUID in (290)

select * from SkuPrice where SKUID=290
SELECT * FROM SKU WHERE SKUID=290
----------------------------------------------
update s
set s.SkuName='307-Suite-USA-3-7'
from skuPrice s
where SKUID in (307)

select * from SkuPrice where SKUID=307
SELECT * FROM SKU WHERE SKUID=307
---------------------------------------------
update s
set s.SkuName='349-Suite-USA-5-0'
from skuPrice s
where SKUID in (349)

select * from SkuPrice where SKUID=349
SELECT * FROM SKU WHERE SKUID=349
--------------------------------------------
update s
set s.SkuName='391-Suite-NC1-5-7'
from skuPrice s
where SKUID in (391)

select * from SkuPrice where SKUID=391
SELECT * FROM SKU WHERE SKUID=391
--------------------------------------------
update s
set s.SkuName='401-Suite-USA-2-7'
from skuPrice s
where SKUID in (401)

select * from SkuPrice where SKUID=401
SELECT * FROM SKU WHERE SKUID=401
---------------------------------------------
update s
set s.SkuName='410-Suite-USA-15-4'
from skuPrice s
where SKUID in (410)

select * from SkuPrice where SKUID=410
SELECT * FROM SKU WHERE SKUID=410
-------------------------------------------
update s
set s.SkuName='429-Suite-USA-5-4'
from skuPrice s
where SKUID in (429)

select * from SkuPrice where SKUID=429
SELECT * FROM SKU WHERE SKUID=429
------------------------------------------
update s
set s.SkuName='441-Suite-USA-13-0'
from skuPrice s
where SKUID in (441)

select * from SkuPrice where SKUID=441
SELECT * FROM SKU WHERE SKUID=441
----------------------------------------
update s
set s.SkuName='474-Suite-USA-7-7'
from skuPrice s
where SKUID in (474)

select * from SkuPrice where SKUID=474
SELECT * FROM SKU WHERE SKUID=474
-----------------------------------------
update s
set s.SkuName='499-Suite-USA-4-7'
from skuPrice s
where SKUID in (499)

select * from SkuPrice where SKUID=499
SELECT * FROM SKU WHERE SKUID=499
-------------------------------------
update s
set s.SkuName='508-Suite-USA-12-7'
from skuPrice s
where SKUID in (508)

select * from SkuPrice where SKUID=508
SELECT * FROM SKU WHERE SKUID=508
----------------------------------------
update s
set s.SkuName='517-Suite-USA-18-0'
from skuPrice s
where SKUID in (517)

select * from SkuPrice where SKUID=517
SELECT * FROM SKU WHERE SKUID=517
---------------------------------------
update s
set s.SkuName='541-Suite-MIN-6-4'
from skuPrice s
where SKUID in (541)

select * from SkuPrice where SKUID=541
SELECT * FROM SKU WHERE SKUID=541
----------------------------------------
update s
set s.SkuName='550-Suite-USA-9-7'
from skuPrice s
where SKUID in (550)

select * from SkuPrice where SKUID=550
SELECT * FROM SKU WHERE SKUID=550
---------------------------------------
update s
set s.SkuName='559-Suite-USA-60-0'
from skuPrice s
where SKUID in (559)

select * from SkuPrice where SKUID=559
SELECT * FROM SKU WHERE SKUID=559
-----------------------------------------
update s
set s.SkuName='608-Suite-USA-9-4'
from skuPrice s
where SKUID in (608)

select * from SkuPrice where SKUID=608
SELECT * FROM SKU WHERE SKUID=608
------------------------------------------
update s
set s.SkuName='642-Suite-USA-114-4'
from skuPrice s
where SKUID in (642)

select * from SkuPrice where SKUID=642
SELECT * FROM SKU WHERE SKUID=642
------------------------------------------
update s
set s.SkuName='651-Suite-PHI-11-7'
from skuPrice s
where SKUID in (651)

select * from SkuPrice where SKUID=651
SELECT * FROM SKU WHERE SKUID=651
--------------------------------------------
update s
set s.SkuName='671-Suite-USA-250-0'
from skuPrice s
where SKUID in (671)

select * from SkuPrice where SKUID=671
SELECT * FROM SKU WHERE SKUID=671
--------------------------------------------
update s
set s.SkuName='680-Suite-VA1-3-6'
from skuPrice s
where SKUID in (680)

select * from SkuPrice where SKUID=680
SELECT * FROM SKU WHERE SKUID=680
--------------------------------------------
update s
set s.SkuName='697-Suite-HOU-20-0'
from skuPrice s
where SKUID in (697)

select * from SkuPrice where SKUID=697
SELECT * FROM SKU WHERE SKUID=697
-------------------------------------------
update s
set s.SkuName='734-Suite-USA-14-7'
from skuPrice s
where SKUID in (734)

select * from SkuPrice where SKUID=734
SELECT * FROM SKU WHERE SKUID=734
-------------------------------------------
update s
set s.SkuName='743-Suite-USA-20-2'
from skuPrice s
where SKUID in (743)

select * from SkuPrice where SKUID=743
SELECT * FROM SKU WHERE SKUID=743
-------------------------------------------
update s
set s.SkuName='752-Suite-OR1-4-10'
from skuPrice s
where SKUID in (752)

select * from SkuPrice where SKUID=752
SELECT * FROM SKU WHERE SKUID=752
-------------------------------------------
update s
set s.SkuName='761-Suite-USA-9-0'
from skuPrice s
where SKUID in (761)

select * from SkuPrice where SKUID=761
SELECT * FROM SKU WHERE SKUID=761
--------------------------------------------
update s
set s.SkuName='778-Suite-USA-25-10'
from skuPrice s
where SKUID in (778)

select * from SkuPrice where SKUID=778
SELECT * FROM SKU WHERE SKUID=778
--------------------------------------------
update s
set s.SkuName='814-Suite-USA-21-14'
from skuPrice s
where SKUID in (814)

select * from SkuPrice where SKUID=814
SELECT * FROM SKU WHERE SKUID=814
--------------------------------------------
update s
set s.SkuName='849-Suite-VA1-7-10'
from skuPrice s
where SKUID in (849)

select * from SkuPrice where SKUID=849
SELECT * FROM SKU WHERE SKUID=849
--------------------------------------------
update s
set s.SkuName='867-Suite-WAS-6-13'
from skuPrice s
where SKUID in (867)

select * from SkuPrice where SKUID=867
SELECT * FROM SKU WHERE SKUID=867
---------------------------------------------
update s
set s.SkuName='899-Suite-USA-11-14'
from skuPrice s
where SKUID in (899)

select * from SkuPrice where SKUID=899
SELECT * FROM SKU WHERE SKUID=899
---------------------------------------------
update s
set s.SkuName='924-Suite-TX1-10-12'
from skuPrice s
where SKUID in (924)

select * from SkuPrice where SKUID=924
SELECT * FROM SKU WHERE SKUID=924
----------------------------------------------
update s
set s.SkuName='965-Suite-USA-13-14'
from skuPrice s
where SKUID in (965)

select * from SkuPrice where SKUID=965
SELECT * FROM SKU WHERE SKUID=965
----------------------------------------------
update s
set s.SkuName='991-Suite-USA-10-7'
from skuPrice s
where SKUID in (991)

select * from SkuPrice where SKUID=991
SELECT * FROM SKU WHERE SKUID=991
----------------------------------------------
update s
set s.SkuName='1008-Suite-USA-18-4'
from skuPrice s
where SKUID in (1008)

select * from SkuPrice where SKUID=1008
SELECT * FROM SKU WHERE SKUID=1008
-----------------------------------------------
update s
set s.SkuName='1017-Suite-USA-15-7'
from skuPrice s
where SKUID in (1017)

select * from SkuPrice where SKUID=1017
SELECT * FROM SKU WHERE SKUID=1017
----------------------------------------------
update s
set s.SkuName='1095-Suite-UT1-12-0'
from skuPrice s
where SKUID in (1095)

select * from SkuPrice where SKUID=1095
SELECT * FROM SKU WHERE SKUID=1095
----------------------------------------------
update s
set s.SkuName='1123-Suite-COL-10-4'
from skuPrice s
where SKUID in (1123)

select * from SkuPrice where SKUID=1123
SELECT * FROM SKU WHERE SKUID=1123
---------------------------------------------
update s
set s.SkuName='1132-Suite-ATL-10-0'
from skuPrice s
where SKUID in (1132)

select * from SkuPrice where SKUID=1132
SELECT * FROM SKU WHERE SKUID=1132
----------------------------------------------
update s
set s.SkuName='1147-Suite-TX1-4-3'
from skuPrice s
where SKUID in (1147)

select * from SkuPrice where SKUID=1147
SELECT * FROM SKU WHERE SKUID=1147
---------------------------------------------
update s
set s.SkuName='1167-Suite-PHI-6-10'
from skuPrice s
where SKUID in (1167)

select * from SkuPrice where SKUID=1167
SELECT * FROM SKU WHERE SKUID=1167
---------------------------------------------
update s
set s.SkuName='1227-Suite-USA-21-0'
from skuPrice s
where SKUID in (1227)

select * from SkuPrice where SKUID=1227
SELECT * FROM SKU WHERE SKUID=1227
-------------------------------------------
update s
set s.SkuName='1305-Suite-USA-26-0'
from skuPrice s
where SKUID in (1305)

select * from SkuPrice where SKUID=1305
SELECT * FROM SKU WHERE SKUID=1305
--------------------------------------------
update s
set s.SkuName='1355-Suite-EBY-4-12'
from skuPrice s
where SKUID in (1355)

select * from SkuPrice where SKUID=1355
SELECT * FROM SKU WHERE SKUID=1355
--------------------------------------------
update s
set s.SkuName='1388-Suite-USA-8-13'
from skuPrice s
where SKUID in (1388)

select * from SkuPrice where SKUID=1388
SELECT * FROM SKU WHERE SKUID=1388
---------------------------------------------
update s
set s.SkuName='1446-Suite-USA-56-7'
from skuPrice s
where SKUID in (1446)

select * from SkuPrice where SKUID=1446
SELECT * FROM SKU WHERE SKUID=1446
----------------------------------------------
update s
set s.SkuName='1455-Suite-WI1-13-4'
from skuPrice s
where SKUID in (1455)

select * from SkuPrice where SKUID=1455
SELECT * FROM SKU WHERE SKUID=1455
----------------------------------------------
update s
set s.SkuName='1464-Suite-AUS-20-10'
from skuPrice s
where SKUID in (1464)

select * from SkuPrice where SKUID=1464
SELECT * FROM SKU WHERE SKUID=1464
----------------------------------------------
update s
set s.SkuName='1481-Suite-EBY-23-4'
from skuPrice s
where SKUID in (1481)

select * from SkuPrice where SKUID=1481
SELECT * FROM SKU WHERE SKUID=1481
-----------------------------------------------
update s
set s.SkuName='1498-Suite-NNJ-2-5'
from skuPrice s
where SKUID in (1498)

select * from SkuPrice where SKUID=1498
SELECT * FROM SKU WHERE SKUID=1498
-----------------------------------------------
update s
set s.SkuName='1540-Suite-USA-19-7'
from skuPrice s
where SKUID in (1540)

select * from SkuPrice where SKUID=1540
SELECT * FROM SKU WHERE SKUID=1540
------------------------------------------------
update s
set s.SkuName='1549-Suite-CO1-6-7'
from skuPrice s
where SKUID in (1549)

select * from SkuPrice where SKUID=1549
SELECT * FROM SKU WHERE SKUID=1549
-------------------------------------------------
update s
set s.SkuName='1558-Suite-USA-22-7'
from skuPrice s
where SKUID in (1558)

select * from SkuPrice where SKUID=1558
SELECT * FROM SKU WHERE SKUID=1558
---------------------------------------------------
update s
set s.SkuName='1627-Suite-USA-19-4'
from skuPrice s
where SKUID in (1627)

select * from SkuPrice where SKUID=1627
SELECT * FROM SKU WHERE SKUID=1627
--------------------------------------------------
update s
set s.SkuName='1694-Suite-USA-25-7'
from skuPrice s
where SKUID in (1694)

select * from SkuPrice where SKUID=1694
SELECT * FROM SKU WHERE SKUID=1694
-----------------------------------------------------
update s
set s.SkuName='1876-Suite-USA-17-13'
from skuPrice s
where SKUID in (1876)

select * from SkuPrice where SKUID=1876
SELECT * FROM SKU WHERE SKUID=1876
-----------------------------------------------------
update s
set s.SkuName='1885-Suite-USA-50-0'
from skuPrice s
where SKUID in (1885)

select * from SkuPrice where SKUID=1885
SELECT * FROM SKU WHERE SKUID=1885
-------------------------------------------------------
update s
set s.SkuName='1894-Suite-USA-20-7'
from skuPrice s
where SKUID in (1894)

select * from SkuPrice where SKUID=1894
SELECT * FROM SKU WHERE SKUID=1894
-------------------------------------------------------
update s
set s.SkuName='1911-Suite-USA-60-4'
from skuPrice s
where SKUID in (1911)

select * from SkuPrice where SKUID=1911
SELECT * FROM SKU WHERE SKUID=1911
-------------------------------------------------------
update s
set s.SkuName='1993-Suite-ATL-17-4'
from skuPrice s
where SKUID in (1993)

select * from SkuPrice where SKUID=1993
SELECT * FROM SKU WHERE SKUID=1993
------------------------------------------------------
update s
set s.SkuName='2027-Suite-DEN-40-4'
from skuPrice s
where SKUID in (2027)

select * from SkuPrice where SKUID=2027
SELECT * FROM SKU WHERE SKUID=2027
------------------------------------------------------
update s
set s.SkuName='2151-Suite-USA-18-14'
from skuPrice s
where SKUID in (2151)

select * from SkuPrice where SKUID=2151
SELECT * FROM SKU WHERE SKUID=2151
-----------------------------------------------------
update s
set s.SkuName='2168-Suite-FL1-39-4'
from skuPrice s
where SKUID in (2168)

select * from SkuPrice where SKUID=2168
SELECT * FROM SKU WHERE SKUID=2168
-----------------------------------------------------
update s
set s.SkuName='2177-Suite-USA-59-7'
from skuPrice s
where SKUID in (2177)

select * from SkuPrice where SKUID=2177
SELECT * FROM SKU WHERE SKUID=2177
-----------------------------------------------------
update s
set s.SkuName='2214-Suite-BFL-21-4'
from skuPrice s
where SKUID in (2214)

select * from SkuPrice where SKUID=2214
SELECT * FROM SKU WHERE SKUID=2214
---------------------------------------------------
update s
set s.SkuName='2251-Suite-USA-9-12'
from skuPrice s
where SKUID in (2251)

select * from SkuPrice where SKUID=2251
SELECT * FROM SKU WHERE SKUID=2251
---------------------------------------------------
update s
set s.SkuName='2268-Suite-USA-14-4'
from skuPrice s
where SKUID in (2268)

select * from SkuPrice where SKUID=2268
SELECT * FROM SKU WHERE SKUID=2268
-------------------------------------------------
update s
set s.SkuName='2311-Suite-PHI-7-9'
from skuPrice s
where SKUID in (2311)

select * from SkuPrice where SKUID=2311
SELECT * FROM SKU WHERE SKUID=2311
------------------------------------------------
update s
set s.SkuName='2442-Suite-USA-46-0'
from skuPrice s
where SKUID in (2442)

select * from SkuPrice where SKUID=2442
SELECT * FROM SKU WHERE SKUID=2442
-----------------------------------------------
update s
set s.SkuName='2545-Suite-USA-80-0'
from skuPrice s
where SKUID in (2545)

select * from SkuPrice where SKUID=2545
SELECT * FROM SKU WHERE SKUID=2545
----------------------------------------------
update s
set s.SkuName='2554-Suite-USA-83-0'
from skuPrice s
where SKUID in (2554)

select * from SkuPrice where SKUID=2554
SELECT * FROM SKU WHERE SKUID=2554
----------------------------------------------
update s
set s.SkuName='2641-Suite-WA1-14-5'
from skuPrice s
where SKUID in (2641)

select * from SkuPrice where SKUID=2641
SELECT * FROM SKU WHERE SKUID=2641
----------------------------------------------
update s
set s.SkuName='2666-Suite-WAS-21-7'
from skuPrice s
where SKUID in (2666)

select * from SkuPrice where SKUID=2666
SELECT * FROM SKU WHERE SKUID=2666
----------------------------------------------
update s
set s.SkuName='2714-Suite-USA-26-12'
from skuPrice s
where SKUID in (2714)

select * from SkuPrice where SKUID=2714
SELECT * FROM SKU WHERE SKUID=2714
----------------------------------------------
update s
set s.SkuName='2786-Suite-USA-31-0'
from skuPrice s
where SKUID in (2786)

select * from SkuPrice where SKUID=2786
SELECT * FROM SKU WHERE SKUID=2786
-----------------------------------------------
update s
set s.SkuName='2795-Suite-USA-38-0'
from skuPrice s
where SKUID in (2795)

select * from SkuPrice where SKUID=2795
SELECT * FROM SKU WHERE SKUID=2795
-----------------------------------------------
update s
set s.SkuName='2852-Suite-USA-50-12'
from skuPrice s
where SKUID in (2852)

select * from SkuPrice where SKUID=2852
SELECT * FROM SKU WHERE SKUID=2852
-----------------------------------------------
update s
set s.SkuName='2899-Suite-USA-28-4'
from skuPrice s
where SKUID in (2899)

select * from SkuPrice where SKUID=2899
SELECT * FROM SKU WHERE SKUID=2899
-----------------------------------------------
update s
set s.SkuName='2956-Suite-USA-12-4'
from skuPrice s
where SKUID in (2956)

select * from SkuPrice where SKUID=2956
SELECT * FROM SKU WHERE SKUID=2956
------------------------------------------------
update s
set s.SkuName='2973-Suite-HOU-9-10'
from skuPrice s
where SKUID in (2973)

select * from SkuPrice where SKUID=2973
SELECT * FROM SKU WHERE SKUID=2973
-----------------------------------------------
update s
set s.SkuName='2982-Suite-RIV-10-10'
from skuPrice s
where SKUID in (2982)

select * from SkuPrice where SKUID=2982
SELECT * FROM SKU WHERE SKUID=2982
--------------------------------------------
update s
set s.SkuName='3007-Suite-USA-18-7'
from skuPrice s
where SKUID in (3007)

select * from SkuPrice where SKUID=3007
SELECT * FROM SKU WHERE SKUID=3007
--------------------------------------------
update s
set s.SkuName='3041-Suite-USA-35-7'
from skuPrice s
where SKUID in (3041)

select * from SkuPrice where SKUID=3041
SELECT * FROM SKU WHERE SKUID=3041
---------------------------------------------
update s
set s.SkuName='3074-Suite-USA-45-7'
from skuPrice s
where SKUID in (3074)

select * from SkuPrice where SKUID=3074
SELECT * FROM SKU WHERE SKUID=3074
---------------------------------------------
update s
set s.SkuName='3083-Suite-USA-42-4'
from skuPrice s
where SKUID in (3083)

select * from SkuPrice where SKUID=3083
SELECT * FROM SKU WHERE SKUID=3083
----------------------------------------------
update s
set s.SkuName='3168-Suite-USA-29-4'
from skuPrice s
where SKUID in (3168)

select * from SkuPrice where SKUID=3168
SELECT * FROM SKU WHERE SKUID=3168
---------------------------------------------
update s
set s.SkuName='3177-Suite-USA-24-12'
from skuPrice s
where SKUID in (3177)

select * from SkuPrice where SKUID=3177
SELECT * FROM SKU WHERE SKUID=3177
---------------------------------------------
update s
set s.SkuName='3234-Suite-USA-41-0'
from skuPrice s
where SKUID in (3234)

select * from SkuPrice where SKUID=3234
SELECT * FROM SKU WHERE SKUID=3234
---------------------------------------------
update s
set s.SkuName='3340-Suite-USA-41-4'
from skuPrice s
where SKUID in (3340)

select * from SkuPrice where SKUID=3340
SELECT * FROM SKU WHERE SKUID=3340
--------------------------------------------
update s
set s.SkuName='3405-Suite-CA1-4-6'
from skuPrice s
where SKUID in (3405)

select * from SkuPrice where SKUID=3405
SELECT * FROM SKU WHERE SKUID=3405
--------------------------------------------
update s
set s.SkuName='3480-Suite-EBY-76-4'
from skuPrice s
where SKUID in (3480)

select * from SkuPrice where SKUID=3480
SELECT * FROM SKU WHERE SKUID=3480
---------------------------------------------
update s
set s.SkuName='3557-Suite-USA-24-7'
from skuPrice s
where SKUID in (3557)

select * from SkuPrice where SKUID=3557
SELECT * FROM SKU WHERE SKUID=3557
-----------------------------------------------
update s
set s.SkuName='3590-Suite-USA-16-7'
from skuPrice s
where SKUID in (3590)

select * from SkuPrice where SKUID=3590
SELECT * FROM SKU WHERE SKUID=3590
-------------------------------------------------
update s
set s.SkuName='3737-Suite-USA-100-7'
from skuPrice s
where SKUID in (3737)

select * from SkuPrice where SKUID=3737
SELECT * FROM SKU WHERE SKUID=3737
------------------------------------------------
update s
set s.SkuName='3746-Suite-USA-37-7'
from skuPrice s
where SKUID in (3746)

select * from SkuPrice where SKUID=3746
SELECT * FROM SKU WHERE SKUID=3746
-------------------------------------------------
update s
set s.SkuName='3763-Suite-USA-141-0'
from skuPrice s
where SKUID in (3763)

select * from SkuPrice where SKUID=3763
SELECT * FROM SKU WHERE SKUID=3763
----------------------------------------------------
update s
set s.SkuName='3794-Suite-USA-130-7'
from skuPrice s
where SKUID in (3794)

select * from SkuPrice where SKUID=3794
SELECT * FROM SKU WHERE SKUID=3794
---------------------------------------------------
update s
set s.SkuName='3819-Suite-AZ1-23-7'
from skuPrice s
where SKUID in (3819)

select * from SkuPrice where SKUID=3819
SELECT * FROM SKU WHERE SKUID=3819
--------------------------------------------------
update s
set s.SkuName='3877-Suite-USA-17-7'
from skuPrice s
where SKUID in (3877)

select * from SkuPrice where SKUID=3877
SELECT * FROM SKU WHERE SKUID=3877
-------------------------------------------------
update s
set s.SkuName='3900-Suite-NY1-7-12'
from skuPrice s
where SKUID in (3900)

select * from SkuPrice where SKUID=3900
SELECT * FROM SKU WHERE SKUID=3900
-------------------------------------------------
update s
set s.SkuName='3949-Suite-SFL-2-3'
from skuPrice s
where SKUID in (3949)

select * from SkuPrice where SKUID=3949
SELECT * FROM SKU WHERE SKUID=3949
---------------------------------------------------
update s
set s.SkuName='3974-Suite-USA-5-9'
from skuPrice s
where SKUID in (3974)

select * from SkuPrice where SKUID=3974
SELECT * FROM SKU WHERE SKUID=3974
--------------------------------------------------
update s
set s.SkuName='4047-Suite-USA-26-7'
from skuPrice s
where SKUID in (4047)

select * from SkuPrice where SKUID=4047
SELECT * FROM SKU WHERE SKUID=4047
---------------------------------------------------
update s
set s.SkuName='4299-Suite-POR-23-0'
from skuPrice s
where SKUID in (4299)

select * from SkuPrice where SKUID=4299
SELECT * FROM SKU WHERE SKUID=4299
---------------------------------------------------
update s
set s.SkuName='4315-Suite-USA-70-7'
from skuPrice s
where SKUID in (4315)

select * from SkuPrice where SKUID=4315
SELECT * FROM SKU WHERE SKUID=4315
--------------------------------------------------
update s
set s.SkuName='4315-Suite-USA-70-7'
from skuPrice s
where SKUID in (4315)

select * from SkuPrice where SKUID=4315
SELECT * FROM SKU WHERE SKUID=4315
--------------------------------------------------
update s
set s.SkuName='4385-Suite-USA-187-12'
from skuPrice s
where SKUID in (4385)

select * from SkuPrice where SKUID=4385
SELECT * FROM SKU WHERE SKUID=4385
---------------------------------------------------
update s
set s.SkuName='4491-Suite-USA-50-4'
from skuPrice s
where SKUID in (4491)

select * from SkuPrice where SKUID=4491
SELECT * FROM SKU WHERE SKUID=4491
----------------------------------------------------
update s
set s.SkuName='4500-Suite-AUS-20-12'
from skuPrice s
where SKUID in (4500)

select * from SkuPrice where SKUID=4500
SELECT * FROM SKU WHERE SKUID=4500
----------------------------------------------------
update s
set s.SkuName='4509-Suite-LVG-14-9'
from skuPrice s
where SKUID in (4509)

select * from SkuPrice where SKUID=4509
SELECT * FROM SKU WHERE SKUID=4509
---------------------------------------------------
update s
set s.SkuName='4535-Suite-BLT-32-7'
from skuPrice s
where SKUID in (4535)

select * from SkuPrice where SKUID=4535
SELECT * FROM SKU WHERE SKUID=4535
---------------------------------------------------
update s
set s.SkuName='4779-Suite-USA-20-14'
from skuPrice s
where SKUID in (4779)

select * from SkuPrice where SKUID=4779
SELECT * FROM SKU WHERE SKUID=4779
--------------------------------------------------
update s
set s.SkuName='4853-Suite-USA-35-4'
from skuPrice s
where SKUID in (4853)

select * from SkuPrice where SKUID=4853
SELECT * FROM SKU WHERE SKUID=4853
--------------------------------------------------
update s
set s.SkuName='4870-Suite-USA-15-14'
from skuPrice s
where SKUID in (4870)

select * from SkuPrice where SKUID=4870
SELECT * FROM SKU WHERE SKUID=4870
----------------------------------------------------
update s
set s.SkuName='5009-Suite-USA-36-14'
from skuPrice s
where SKUID in (5009)

select * from SkuPrice where SKUID=5009
SELECT * FROM SKU WHERE SKUID=5009
-----------------------------------------------------
update s
set s.SkuName='5055-Suite-LAX-4-0'
from skuPrice s
where SKUID in (5055)

select * from SkuPrice where SKUID=5055
SELECT * FROM SKU WHERE SKUID=5055
---------------------------------------------------
update s
set s.SkuName='5216-Suite-CA1-8-4'
from skuPrice s
where SKUID in (5216)

select * from SkuPrice where SKUID=5216
SELECT * FROM SKU WHERE SKUID=5216
--------------------------------------------------
update s
set s.SkuName='5249-Suite-WAS-2-4'
from skuPrice s
where SKUID in (5249)

select * from SkuPrice where SKUID=5249
SELECT * FROM SKU WHERE SKUID=5249
--------------------------------------------------
update s
set s.SkuName='5278-Suite-USA-2-0'
from skuPrice s
where SKUID in (5278)

select * from SkuPrice where SKUID=5278
SELECT * FROM SKU WHERE SKUID=5278
-----------------------------------------------------
update s
set s.SkuName='5594-Suite-DFW-3-4'
from skuPrice s
where SKUID in (5594)

select * from SkuPrice where SKUID=5594
SELECT * FROM SKU WHERE SKUID=5594
-------------------------------------------------------
update s
set s.SkuName='5644-Suite-USA-22-4'
from skuPrice s
where SKUID in (5644)

select * from SkuPrice where SKUID=5644
SELECT * FROM SKU WHERE SKUID=5644
-----------------------------------------------------
update s
set s.SkuName='5998-Suite-AL1-14-0'
from skuPrice s
where SKUID in (5998)

select * from SkuPrice where SKUID=5998
SELECT * FROM SKU WHERE SKUID=5998
-----------------------------------------------------
update s
set s.SkuName='6281-Suite-USA-39-7'
from skuPrice s
where SKUID in (6281)

select * from SkuPrice where SKUID=6281
SELECT * FROM SKU WHERE SKUID=6281
-----------------------------------------------------
update s
set s.SkuName='7406-Suite-AL1-1-7'
from skuPrice s
where SKUID in (7406)

select * from SkuPrice where SKUID=7406
SELECT * FROM SKU WHERE SKUID=7406
---------------------------------------------------
update s
set s.SkuName='7446-Suite-USA-1-14'
from skuPrice s
where SKUID in (7446)

select * from SkuPrice where SKUID=7446
SELECT * FROM SKU WHERE SKUID=7446
---------------------------------------------------
update s
set s.SkuName='7482-Suite-WAS-20-4'
from skuPrice s
where SKUID in (7482)

select * from SkuPrice where SKUID=7482
SELECT * FROM SKU WHERE SKUID=7482
---------------------------------------------------
update s
set s.SkuName='8510-Suite-BLT-6-0'
from skuPrice s
where SKUID in (8510)

select * from SkuPrice where SKUID=8510
SELECT * FROM SKU WHERE SKUID=8510
---------------------------------------------------
update s
set s.SkuName='8525-Suite-TX1-2-13'
from skuPrice s
where SKUID in (8525)

select * from SkuPrice where SKUID=8525
SELECT * FROM SKU WHERE SKUID=8525
--------------------------------------------------
update s
set s.SkuName='8547-Suite-SAV-1-4'
from skuPrice s
where SKUID in (8547)

select * from SkuPrice where SKUID=8547
SELECT * FROM SKU WHERE SKUID=8547
--------------------------------------------------
update s
set s.SkuName='8555-Suite-GA1-0-0'
from skuPrice s
where SKUID in (8555)

select * from SkuPrice where SKUID=8555
SELECT * FROM SKU WHERE SKUID=8555
---------------------------------------------------
update s
set s.SkuName='8704-Suite-WAS-25-0'
from skuPrice s
where SKUID in (8704)

select * from SkuPrice where SKUID=8704
SELECT * FROM SKU WHERE SKUID=8704
---------------------------------------------------
update s
set s.SkuName='8838-Suite-USA-4-13'
from skuPrice s
where SKUID in (8838)

select * from SkuPrice where SKUID=8838
SELECT * FROM SKU WHERE SKUID=8838
----------------------------------------------------
update s
set s.SkuName='9007-Suite-USA-8-12'
from skuPrice s
where SKUID in (9007)

select * from SkuPrice where SKUID=9007
SELECT * FROM SKU WHERE SKUID=9007
------------------------------------------------------
update s
set s.SkuName='9193-Suite-FL1-5-10'
from skuPrice s
where SKUID in (9193)

select * from SkuPrice where SKUID=9193
SELECT * FROM SKU WHERE SKUID=9193
-----------------------------------------------------
update s
set s.SkuName='9299-Suite-WA1-1-13'
from skuPrice s
where SKUID in (9299)

select * from SkuPrice where SKUID=9299
SELECT * FROM SKU WHERE SKUID=9299
--------------------------------------------------
update s
set s.SkuName='9563-Suite-CO1-2-8'
from skuPrice s
where SKUID in (9563)

select * from SkuPrice where SKUID=9563
SELECT * FROM SKU WHERE SKUID=9563
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
update s
set s.SkuName='10124-Suite-USA-11-4'
from skuPrice s
where SKUID in (10124)

select * from SkuPrice where SKUID=10124
SELECT * FROM SKU WHERE SKUID=10124
--------------------------------------------------------
update s
set s.SkuName='10154-Suite-USA-30-7'
from skuPrice s
where SKUID in (10154)

select * from SkuPrice where SKUID=10154
SELECT * FROM SKU WHERE SKUID=10154
--------------------------------------------------
update s
set s.SkuName='10290-Suite-USA-36-7'
from skuPrice s
where SKUID in (10290)

select * from SkuPrice where SKUID=10290
SELECT * FROM SKU WHERE SKUID=10290
--------------------------------------------------
update s
set s.SkuName='10428-Suite-USA-2-10'
from skuPrice s
where SKUID in (10428)

select * from SkuPrice where SKUID=10428
SELECT * FROM SKU WHERE SKUID=10428
--------------------------------------------------
update s
set s.SkuName='10702-Suite-LAX-17-0'
from skuPrice s
where SKUID in (10702)

select * from SkuPrice where SKUID=10702
SELECT * FROM SKU WHERE SKUID=10702
--------------------------------------------------
update s
set s.SkuName='10937-Suite-EBY-27-4'
from skuPrice s
where SKUID in (10937)

select * from SkuPrice where SKUID=10937
SELECT * FROM SKU WHERE SKUID=10937
---------------------------------------------------
update s
set s.SkuName='11401-Suite-ATL-1-10'
from skuPrice s
where SKUID in (11401)

select * from SkuPrice where SKUID=11401
SELECT * FROM SKU WHERE SKUID=11401
----------------------------------------------------
update s
set s.SkuName='11507-Suite-WAS-24-4'
from skuPrice s
where SKUID in (11507)

select * from SkuPrice where SKUID=11507
SELECT * FROM SKU WHERE SKUID=11507
-----------------------------------------------------
update s
set s.SkuName='12328-Suite-AL1-16-0'
from skuPrice s
where SKUID in (12328)

select * from SkuPrice where SKUID=12328
SELECT * FROM SKU WHERE SKUID=12328
----------------------------------------------------
update s
set s.SkuName='13484-Suite-USA-9-13'
from skuPrice s
where SKUID in (13484)

select * from SkuPrice where SKUID=13484
SELECT * FROM SKU WHERE SKUID=13484
----------------------------------------------------
update s
set s.SkuName='14762-Suite-NSH-1-5'
from skuPrice s
where SKUID in (14762)

select * from SkuPrice where SKUID=14762
SELECT * FROM SKU WHERE SKUID=14762
----------------------------------------------------
update s
set s.SkuName='14886-Suite-USA-30-0'
from skuPrice s
where SKUID in (14886)

select * from SkuPrice where SKUID=14886
SELECT * FROM SKU WHERE SKUID=14886
----------------------------------------------------
update s
set s.SkuName='15060-Suite-USA-30-4'
from skuPrice s
where SKUID in (15060)

select * from SkuPrice where SKUID=15060
SELECT * FROM SKU WHERE SKUID=15060
---------------------------------------------------
update s
set s.SkuName='15541-Suite-USA-10-9'
from skuPrice s
where SKUID in (15541)

select * from SkuPrice where SKUID=15541
SELECT * FROM SKU WHERE SKUID=15541
--------------------------------------------------
update s
set s.SkuName='15541-Suite-USA-10-9'
from skuPrice s
where SKUID in (15541)

select * from SkuPrice where SKUID=15541
SELECT * FROM SKU WHERE SKUID=15541
---------------------------------------------------
update s
set s.SkuName='15892-Suite-WAS-8-10'
from skuPrice s
where SKUID in (15892)

select * from SkuPrice where SKUID=15892
SELECT * FROM SKU WHERE SKUID=15892
-------------------------------------------------
update s
set s.SkuName='16019-Suite-SFL-2-11'
from skuPrice s
where SKUID in (16019)

select * from SkuPrice where SKUID=16019
SELECT * FROM SKU WHERE SKUID=16019
------------------------------------------------
update s
set s.SkuName='16329-Suite-SFL-16-4'
from skuPrice s
where SKUID in (16329)

select * from SkuPrice where SKUID=16329
SELECT * FROM SKU WHERE SKUID=16329
-----------------------------------------------
update s
set s.SkuName='16496-Suite-HOU-2-16'
from skuPrice s
where SKUID in (16496)

select * from SkuPrice where SKUID=16496
SELECT * FROM SKU WHERE SKUID=16496
------------------------------------------------
update s
set s.SkuName='17841-Suite-USA-40-7'
from skuPrice s
where SKUID in (17841)

select * from SkuPrice where SKUID=17841
SELECT * FROM SKU WHERE SKUID=17841
------------------------------------------------
update s
set s.SkuName='18707-Suite-BOS-9-4'
from skuPrice s
where SKUID in (18707)

select * from SkuPrice where SKUID=18707
SELECT * FROM SKU WHERE SKUID=18707
------------------------------------------------
update s
set s.SkuName='19025-Suite-USA-25-14'
from skuPrice s
where SKUID in (19025)

select * from SkuPrice where SKUID=19025
SELECT * FROM SKU WHERE SKUID=19025
------------------------------------------------
update s
set s.SkuName='19793-Suite-USA-63-0'
from skuPrice s
where SKUID in (19793)

select * from SkuPrice where SKUID=19793
SELECT * FROM SKU WHERE SKUID=19793
--------------------------------------------------
update s
set s.SkuName='19813-Suite-USA-146-4'
from skuPrice s
where SKUID in (19813)

select * from SkuPrice where SKUID=19813
SELECT * FROM SKU WHERE SKUID=19813
--------------------------------------------------
update s
set s.SkuName='21124-Suite-USA-40-13'
from skuPrice s
where SKUID in (21124)

select * from SkuPrice where SKUID=21124
SELECT * FROM SKU WHERE SKUID=21124
---------------------------------------------------
update s
set s.SkuName='21195-Suite-USA-73-7'
from skuPrice s
where SKUID in (21195)

select * from SkuPrice where SKUID=21195
SELECT * FROM SKU WHERE SKUID=21195
------------------------------------------------
update s
set s.SkuName='21333-Suite-USA-252-7'
from skuPrice s
where SKUID in (21333)

select * from SkuPrice where SKUID=21333
SELECT * FROM SKU WHERE SKUID=21333
------------------------------------------------
update s
set s.SkuName='21504-Suite-USA-7-13'
from skuPrice s
where SKUID in (21504)

select * from SkuPrice where SKUID=21504
SELECT * FROM SKU WHERE SKUID=21504
-------------------------------------------------
update s
set s.SkuName='21765-Suite-USA-13-7'
from skuPrice s
where SKUID in (21765)

select * from SkuPrice where SKUID=21765
SELECT * FROM SKU WHERE SKUID=21765
--------------------------------------------------
update s
set s.SkuName='21893-Suite-USA-74-4'
from skuPrice s
where SKUID in (21893)

select * from SkuPrice where SKUID=21893
SELECT * FROM SKU WHERE SKUID=21893
-------------------------------------------------
update s
set s.SkuName='23065-Suite-HOU-22-16'
from skuPrice s
where SKUID in (23065)

select * from SkuPrice where SKUID=23065
SELECT * FROM SKU WHERE SKUID=23065
--------------------------------------------------
update s
set s.SkuName='23605-Suite-USA-13-12'
from skuPrice s
where SKUID in (23605)

select * from SkuPrice where SKUID=23605
SELECT * FROM SKU WHERE SKUID=23605
--------------------------------------------------
update s
set s.SkuName='24099-Suite-USA-220-0'
from skuPrice s
where SKUID in (24099)

select * from SkuPrice where SKUID=24099
SELECT * FROM SKU WHERE SKUID=24099
-----------------------------------------------
update s
set s.SkuName='24153-Suite-USA-38-4'
from skuPrice s
where SKUID in (24153)

select * from SkuPrice where SKUID=24153
SELECT * FROM SKU WHERE SKUID=24153
----------------------------------------------



























