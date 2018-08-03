--------------------------------------------------------------------------
--------------------------------------------------------------------------
SELECT * FROM Sku WHERE SKUID=0 ORDER by ProductID;
SELECT * FROM LineItem WHERE SKUID=450 and amount>0 ORDER BY Amount DESC
---------------------------------------------------------------------------
---------------------------------------------------------------------------

/*
PROBLEM SKUS -- 3259,3324,15841,17012,17027,22492,22561,23355,24510,24696
*/
---------------------------------------------------------------------------

SELECT * FROM SKU WHERE SkuName IS NULL 
AND Amount>4 
--and SkuName not like '%COG%' 
ORDER BY SKUID, ProductID
----------------------------------------------------------------------------

SELECT P.ProductDesc, * FROM SKU S JOIN Product P ON S.ProductID=P.ProductID
WHERE S.SKUID=1144 ORDER BY S.ProductID
----------------------------------------------------------------------------
--SELECT * FROM SKU

UPDATE S
SET S.SkuName='68-Suite-UAL-2-0'
from Sku S
where S.skuid=68
----------------------------------------------------------------------------

UPDATE S
SET S.SkuName='76-Suite-UAL-1-0'
from Sku S
where S.skuid=76
--------------------------------------------------------------
UPDATE S
SET S.SkuName='101-Comps-HOU-2-7'
from Sku S
where S.skuid=101
------------------------------------------------------------
UPDATE S
SET S.SkuName='104-Suite-ULO-3-12'
from Sku S
where S.skuid=104
-------------------------------------------------------
UPDATE S
SET S.SkuName='112-Suite-USE-3-12'
from Sku S
where S.skuid=112
------------------------------------------------------
UPDATE S
SET S.SkuName='144-Suite-UMI-2-0'
from Sku S
where S.skuid=144
-----------------------------------------------------
UPDATE S
SET S.SkuName='144-Suite-UMI-2-0'
from Sku S
where S.skuid=144
----------------------------------------------------
UPDATE S
SET S.SkuName='161-UKN-UKN-1-0'
from Sku S
where S.skuid=161
-----------------------------------------
UPDATE S
SET S.SkuName='164-UKN-UKN-5-0'
from Sku S
where S.skuid=164
-----------------------------------------
UPDATE S
SET S.SkuName='213-Suite-ULO-1-0'
from Sku S
where S.skuid=213
----------------------------------------
----------------------------------------
UPDATE S
SET S.SkuName='221-Suite-USE-1-0'
from Sku S
where S.skuid=221
---------------------------------------
UPDATE S
SET S.SkuName='238-Suite-UAL-3-13'
from Sku S
where S.skuid=238
----------------------------------------
UPDATE S
SET S.SkuName='273-Suite-UNW-1-0'
from Sku S
where S.skuid=273
------------------------------------------
UPDATE S
SET S.SkuName='324-Suite-UAL-3-0'
from Sku S
where S.skuid=324
-----------------------------------------
UPDATE S
SET S.SkuName='332-Suite-UNW-2-0'
from Sku S
where S.skuid=332
-----------------------------------------
UPDATE S
SET S.SkuName='341-Suite-ULO-2-12'
from Sku S
where S.skuid=341
----------------------------------------
UPDATE S
SET S.SkuName='366-Suite-UMI-1-0'
from Sku S
where S.skuid=366
----------------------------------------
UPDATE S
SET S.SkuName='375-Suite-UAL-5-4'
from Sku S
where S.skuid=375
----------------------------------------
UPDATE S
SET S.SkuName='375-Suite-UAL-5-4'
from Sku S
where S.skuid=375
----------------------------------------
UPDATE S
SET S.SkuName='419-Combo-ATL-1-16'
from Sku S
where S.skuid=419
---------------------------------------
UPDATE S
SET S.SkuName='438-LNCombo-UKN-4-4'
from Sku S
where S.skuid=438
--------------------------------------
UPDATE S
SET S.SkuName='450-Suite-COG-1-0'
from Sku S
where S.skuid=450
--------------------------------------
UPDATE S
SET S.SkuName='483-Suite-USW-1-3'
from Sku S
where S.skuid=483
--------------------------------------
UPDATE S
SET S.SkuName='491-Suite-UAL-4-13'
from Sku S
where S.skuid=491
-------------------------------------
UPDATE S
SET S.SkuName='599-Suite-UAL-5-7'
from Sku S
where S.skuid=599
-------------------------------------
UPDATE S
SET S.SkuName='599-Suite-UAL-5-7'
from Sku S
where S.skuid=599
-------------------------------------
UPDATE S
SET S.SkuName='617-Suite-ULO-3-4'
from Sku S
where S.skuid=617
-------------------------------------
UPDATE S
SET S.SkuName='625-Suite-USE-3-4'
from Sku S
where S.skuid=625
------------------------------------
UPDATE S
SET S.SkuName='723-Suite-CHI-44-0'
from Sku S
where S.skuid=723
------------------------------------
UPDATE S
SET S.SkuName='795-Suite-ULO-2-0'
from Sku S
where S.skuid=795
------------------------------------
UPDATE S
SET S.SkuName='803-Suite-CHI-1-9'
from Sku S
where S.skuid=803
-------------------------------------
UPDATE S
SET S.SkuName='823-Combo-USA-11-7'
from Sku S
where S.skuid=823
-------------------------------------
UPDATE S
SET S.SkuName='826-Suite-UMI-3-0'
from Sku S
where S.skuid=826
-----------------------------------------
UPDATE S
SET S.SkuName='833-Suite-USC-2-4'
from Sku S
where S.skuid=833
-----------------------------------------
UPDATE S
SET S.SkuName='841-Suite-USC-1-0'
from Sku S
where S.skuid=841
------------------------------------------
UPDATE S
SET S.SkuName='908-Suite-ULO-1-4'
from Sku S
where S.skuid=908
------------------------------------------
UPDATE S
SET S.SkuName='916-Suite-UAL-17-4'
from Sku S
where S.skuid=916
------------------------------------------
UPDATE S
SET S.SkuName='1000-Suite-UMI-2-4'
from Sku S
where S.skuid=1000
------------------------------------------
UPDATE S
SET S.SkuName='1034-Suite-UAL-32-0'
from Sku S
where S.skuid=1034
------------------------------------------
UPDATE S
SET S.SkuName='1059-Suite-UAL-12-0'
from Sku S
where S.skuid=1059
------------------------------------------
UPDATE S
SET S.SkuName='1112-Suite-CHI-6-9'
from Sku S
where S.skuid=1112
------------------------------------------
UPDATE S
SET S.SkuName='1141-Comps-KAN-5-0'
from Sku S
where S.skuid=1141
-----------------------------------------
UPDATE S
SET S.SkuName='1141-Combo-NNJ-1-0'
from Sku S
where S.skuid=1141
--------------------------------------
UPDATE S
SET S.SkuName='1156-Suite-CHI-4-16'
from Sku S
where S.skuid=1156
--------------------------------------
UPDATE S
SET S.SkuName='1187-Suite-UAL-1-4'
from Sku S
where S.skuid=1187
--------------------------------------
UPDATE S
SET S.SkuName='1202-Suite-UAL-2-12'
from Sku S
where S.skuid=1202
-------------------------------------
UPDATE S
SET S.SkuName='1210-Suite-UAL-7-4'
from Sku S
where S.skuid=1210
-------------------------------------
UPDATE S
SET S.SkuName='1218-Suite-UAL-2-7'
from Sku S
where S.skuid=1218
-------------------------------------
UPDATE S
SET S.SkuName='1236-Suite-ULO-1-3'
from Sku S
where S.skuid=1236
-------------------------------------
UPDATE S
SET S.SkuName='1244-Suite-UAL-27-10'
from Sku S
where S.skuid=1244
----------------------------------------
UPDATE S
SET S.SkuName='1252-Suite-UAL-10-0'
from Sku S
where S.skuid=1252
----------------------------------------
UPDATE S
SET S.SkuName='1314-Suite-ULO-1-9'
from Sku S
where S.skuid=1314
-----------------------------------------
UPDATE S
SET S.SkuName='1322-Suite-UAL-4-0'
from Sku S
where S.skuid=1322
-------------------------------------------
UPDATE S
SET S.SkuName='1330-Suite-ULO-6-4'
from Sku S
where S.skuid=1330
------------------------------------------
UPDATE S
SET S.SkuName='1340-Suite-USW-1-0'
from Sku S
where S.skuid=1340
------------------------------------------------------------------------------------------------
--SELECT * FROM Product WHERE ProductID IN (1,2,5)-----------------------------------------------
--SELECT * FROM Product WHERE ProductID IN (166,167,168)
-------------------------------------------------------------------------------------------------
UPDATE S
SET S.SkuName='526-Suite-CHI-30-4'
from Sku S
where S.skuid=526
------------------------------------
UPDATE S
SET S.SkuName='1043-Suite-CTO-3-4'
from Sku S
where S.skuid=1043
-------------------------------------
UPDATE S
SET S.SkuName='1364-Suite-USC-3-9'
from Sku S
where S.skuid=1364
------------------------------------
UPDATE S
SET S.SkuName='1372-Suite-ULO-3-0'
from Sku S
where S.skuid=1372
------------------------------------
UPDATE S
SET S.SkuName='1372-Suite-ULO-3-0'
from Sku S
where S.skuid=1372
-----------------------------------
UPDATE S
SET S.SkuName='1405-Suite-UAL-5-0'
from Sku S
where S.skuid=1405
----------------------------------
UPDATE S
SET S.SkuName='1438-Suite-USC-3-4'
from Sku S
where S.skuid=1438
-----------------------------------
UPDATE S
SET S.SkuName='1438-Suite-USC-3-4'
from Sku S
where S.skuid=1438
----------------------------------
UPDATE S
SET S.SkuName='1508-Suite-UAL-1-7'
from Sku S
where S.skuid=1508
-----------------------------------
UPDATE S
SET S.SkuName='1516-Suite-UAL-35-4'
from Sku S
where S.skuid=1516
------------------------------------
UPDATE S
SET S.SkuName='1575-Suite-UAL-43-0'
from Sku S
where S.skuid=1575
------------------------------------
UPDATE S
SET S.SkuName='1575-Suite-UAL-43-0'
from Sku S
where S.skuid=1575
------------------------------------
UPDATE S
SET S.SkuName='1636-Suite-CTO-7-0'
from Sku S
where S.skuid=1636
-----------------------------------
UPDATE S
SET S.SkuName='1636-Suite-CTO-7-0'
from Sku S
where S.skuid=1636
-------------------------------------
UPDATE S
SET S.SkuName='1652-Suite-USC-1-12'
from Sku S
where S.skuid=1652
---------------------------------------
UPDATE S
SET S.SkuName='1678-Suite-UAL-23-4'
from Sku S
where S.skuid=1678
--------------------------------------
UPDATE S
SET S.SkuName='1678-Suite-UAL-23-4'
from Sku S
where S.skuid=1678
------------------------------------
UPDATE S
SET S.SkuName='1711-Suite-USE-8-4'
from Sku S
where S.skuid=1711
-----------------------------------
UPDATE S
SET S.SkuName='1727-Suite-UAL-1-5'
from Sku S
where S.skuid=1727
------------------------------------
UPDATE S
SET S.SkuName='1743-Suite-UAL-2-4'
from Sku S
where S.skuid=1743
------------------------------------
UPDATE S
SET S.SkuName='1784-Suite-UMI-1-12'
from Sku S
where S.skuid=1784
-------------------------------------
UPDATE S
SET S.SkuName='1804-Suite-UAL-2-13'
from Sku S
where S.skuid=1804
------------------------------------
UPDATE S
SET S.SkuName='1844-Suite-ULO-2-4'
from Sku S
where S.skuid=1844
-------------------------------------
UPDATE S
SET S.SkuName='1868-Suite-USE-5-0'
from Sku S
where S.skuid=1868
------------------------------------
UPDATE S
SET S.SkuName='1903-Suite-UAL-1-13'
from Sku S
where S.skuid=1903
------------------------------------
UPDATE S
SET S.SkuName='1920-Suite-UAL-2-9'
from Sku S
where S.skuid=1920
------------------------------------
UPDATE S
SET S.SkuName='1928-Suite-USE-5-9'
from Sku S
where S.skuid=1928
-----------------------------------
UPDATE S
SET S.SkuName='1928-Suite-USE-5-9'
from Sku S
where S.skuid=1928
------------------------------------
UPDATE S
SET S.SkuName='1936-Suite-UAL-1-15'
from Sku S
where S.skuid=1936
-------------------------------------
UPDATE S
SET S.SkuName='1936-Suite-UAL-1-15'
from Sku S
where S.skuid=1936
------------------------------------
UPDATE S
SET S.SkuName='1952-Suite-UAL-79-4'
from Sku S
where S.skuid=1952
-----------------------------------
UPDATE S
SET S.SkuName='1976-Suite-CGO-4-0'
from Sku S
where S.skuid=1976
-----------------------------------
UPDATE S
SET S.SkuName='2002-Suite-UAL-3-4'
from Sku S
where S.skuid=2002
------------------------------------
UPDATE S
SET S.SkuName='2010-Suite-UAL-8-4'
from Sku S
where S.skuid=2010
------------------------------------
UPDATE S
SET S.SkuName='2092-Suite-UAL-20-0'
from Sku S
where S.skuid=2092
-----------------------------------
UPDATE S
SET S.SkuName='2143-Suite-UAL-1-12'
from Sku S
where S.skuid=2143
-----------------------------------
UPDATE S
SET S.SkuName='2160-Suite-UAL-11-4'
from Sku S
where S.skuid=2160
------------------------------------
UPDATE S
SET S.SkuName='2160-Suite-UAL-11-4'
from Sku S
where S.skuid=2160
-----------------------------------
UPDATE S
SET S.SkuName='2186-Combo-SFL-2-0'
from Sku S
where S.skuid=2186
-----------------------------------
UPDATE S
SET S.SkuName='2190-Suite-UNO-2-9'
from Sku S
where S.skuid=2190
-----------------------------------
UPDATE S
SET S.SkuName='2260-Suite-UAL-3-7'
from Sku S
where S.skuid=2260
-------------------------------------
UPDATE S
SET S.SkuName='2277-Suite-UAL-5-6'
from Sku S
where S.skuid=2277
--------------------------------
UPDATE S
SET S.SkuName='2342-Combo-SFL-1-0'
from Sku S
where S.skuid=2342
--------------------------------
UPDATE S
SET S.SkuName='2359-Suite-CTO-4-3'
from Sku S
where S.skuid=2359
-----------------------------------
UPDATE S
SET S.SkuName='2359-Suite-CTO-4-3'
from Sku S
where S.skuid=2359
------------------------------------
UPDATE S
SET S.SkuName='2375-Suite-UNO-2-0'
from Sku S
where S.skuid=2375
-----------------------------------
UPDATE S
SET S.SkuName='2383-Suite-ULO-2-3'
from Sku S
where S.skuid=2383
-------------------------------------
UPDATE S
SET S.SkuName='2391-Suite-CTO-4-13'
from Sku S
where S.skuid=2391
-------------------------------------
UPDATE S
SET S.SkuName='2407-Suite-UAL-2-3'
from Sku S
where S.skuid=2407
----------------------------------------
UPDATE S
SET S.SkuName='2415-Suite-CHI-3-13'
from Sku S
where S.skuid=2415
----------------------------------------
UPDATE S
SET S.SkuName='2426-Suite-ULO-5-4'
from Sku S
where S.skuid=2426
---------------------------------------
UPDATE S
SET S.SkuName='2496-Suite-ULO-4-7'
from Sku S
where S.skuid=2496
--------------------------------------
UPDATE S
SET S.SkuName='2496-Suite-ULO-4-7'
from Sku S
where S.skuid=2496
--------------------------------------
UPDATE S
SET S.SkuName='2496-Suite-ULO-4-7'
from Sku S
where S.skuid=2496
-------------------------------------
UPDATE S
SET S.SkuName='2590-Suite-CTO-7-4'
from Sku S
where S.skuid=2590
-------------------------------------
UPDATE S
SET S.SkuName='2606-Suite-UAL-1-6'
from Sku S
where S.skuid=2606
-------------------------------------
UPDATE S
SET S.SkuName='2618-Suite-CCA-1-0'
from Sku S
where S.skuid=2618
-------------------------------------
UPDATE S
SET S.SkuName='2618-Suite-CCA-1-0'
from Sku S
where S.skuid=2618
--------------------------------------
UPDATE S
SET S.SkuName='2618-Suite-CCA-1-0'
from Sku S
where S.skuid=2618
--------------------------------------
UPDATE S
SET S.SkuName='2746-Suite-USC-8-12'
from Sku S
where S.skuid=2746
---------------------------------------
UPDATE S
SET S.SkuName='2762-Suite-USW-1-4'
from Sku S
where S.skuid=2762
-----------------------------------
UPDATE S
SET S.SkuName='2820-Suite-USE-4-0'
from Sku S
where S.skuid=2820
----------------------------------
UPDATE S
SET S.SkuName='2844-Suite-UAL-6-4'
from Sku S
where S.skuid=2844
---------------------------------
UPDATE S
SET S.SkuName='2861-Suite-UMI-1-4'
from Sku S
where S.skuid=2861
---------------------------------
UPDATE S
SET S.SkuName='2883-Suite-UAL-1-3'
from Sku S
where S.skuid=2883
-----------------------------------
UPDATE S
SET S.SkuName='2891-Suite-UAL-1-16'
from Sku S
where S.skuid=2891
------------------------------------
UPDATE S
SET S.SkuName='2908-Suite-UNW-1-4'
from Sku S
where S.skuid=2908
-----------------------------------
UPDATE S
SET S.SkuName='2916-Suite-UNO-2-4'
from Sku S
where S.skuid=2916
----------------------------------
UPDATE S
SET S.SkuName='3050-Suite-UNW-4-0'
from Sku S
where S.skuid=3050
----------------------------------
UPDATE S
SET S.SkuName='3108-Suite-UAL-10-6'
from Sku S
where S.skuid=3108
-------------------------------------
UPDATE S
SET S.SkuName='3194-Suite-UAL-25-4'
from Sku S
where S.skuid=3194
-------------------------------------
UPDATE S
SET S.SkuName='3218-Suite-CCA-2-6'
from Sku S
where S.skuid=3218
------------------------------------
UPDATE S
SET S.SkuName='3226-Suite-CVA-2-6'
from Sku S
where S.skuid=3226
------------------------------------
UPDATE S
SET S.SkuName='3243-Suite-ULO-4-12'
from Sku S
where S.skuid=3243
------------------------------------
UPDATE S
SET S.SkuName='3259-Suite-USA-2-0'
from Sku S
where S.skuid=3259
------------------------------------- 
UPDATE S
SET S.SkuName='3283-Suite-UMI-4-9'
from Sku S
where S.skuid=3283
-------------------------------------
UPDATE S
SET S.SkuName='3324-Suite-UAL-500-0'
from Sku S
where S.skuid=3324
-------------------------------------
UPDATE S
SET S.SkuName='3373-Suite-UNO-6-9'
from Sku S
where S.skuid=3373
--------------------------------------
UPDATE S
SET S.SkuName='3389-Suite-UNW-2-4'
from Sku S
where S.skuid=3389
-------------------------------------
UPDATE S
SET S.SkuName='3464-Suite-UAL-12-4'
from Sku S
where S.skuid=3464
------------------------------------
UPDATE S
SET S.SkuName='3489-Suite-UMI-4-4'
from Sku S
where S.skuid=3489
-------------------------------------
UPDATE S
SET S.SkuName='3505-Suite-ULO-23-4'
from Sku S
where S.skuid=3505
-------------------------------------
UPDATE S
SET S.SkuName='3520-Suite-UNO-1-0'
from Sku S
where S.skuid=3520
------------------------------------------
UPDATE S
SET S.SkuName='3540-Suite-UAL-85-0'
from Sku S
where S.skuid=3540
------------------------------------------
UPDATE S
SET S.SkuName='3705-Suite-UAL-3-12'
from Sku S
where S.skuid=3705
----------------------------------------
UPDATE S
SET S.SkuName='3713-Suite-UAL-50-16'
from Sku S
where S.skuid=3713
----------------------------------------
UPDATE S
SET S.SkuName='3755-Suite-UAL-18-4'
from Sku S
where S.skuid=3755
---------------------------------------
UPDATE S
SET S.SkuName='3778-Suite-UAL-4-9'
from Sku S
where S.skuid=3778
---------------------------------------
UPDATE S
SET S.SkuName='3803-Suite-UAL-8-0'
from Sku S
where S.skuid=3803
---------------------------------------
UPDATE S
SET S.SkuName='3835-Suite-UAL-9-4'
from Sku S
where S.skuid=3835
---------------------------------------
UPDATE S
SET S.SkuName='3852-Suite-UAL-5-12'
from Sku S
where S.skuid=3852
---------------------------------------
UPDATE S
SET S.SkuName='3860-Suite-UMI-3-4'
from Sku S
where S.skuid=3860
---------------------------------------
UPDATE S
SET S.SkuName='3869-Suite-UMI-9-4'
from Sku S
where S.skuid=3869
------------------------------------
UPDATE S
SET S.SkuName='3892-Suite-UMI-5-0'
from Sku S
where S.skuid=3892
-------------------------------------
UPDATE S
SET S.SkuName='3909-Suite-UNO-10-9'
from Sku S
where S.skuid=3909
------------------------------------
UPDATE S
SET S.SkuName='3925-Suite-USE-4-13'
from Sku S
where S.skuid=3925
------------------------------------
UPDATE S
SET S.SkuName='3941-Suite-UAL-7-6'
from Sku S
where S.skuid=3941
------------------------------------
UPDATE S
SET S.SkuName='3966-Suite-UAL-70-0'
from Sku S
where S.skuid=3966
------------------------------------
UPDATE S
SET S.SkuName='3983-Suite-UNO-1-4'
from Sku S
where S.skuid=3983
-------------------------------------
UPDATE S
SET S.SkuName='4017-Suite-USC-1-4'
from Sku S
where S.skuid=4017
--------------------------------------
UPDATE S
SET S.SkuName='4039-Suite-USE-4-3'
from Sku S
where S.skuid=4039
---------------------------------------
UPDATE S
SET S.SkuName='4073-Suite-USC-6-4'
from Sku S
where S.skuid=4073
---------------------------------------
UPDATE S
SET S.SkuName='4108-Suite-UAL-4-6'
from Sku S
where S.skuid=4108
--------------------------------------
UPDATE S
SET S.SkuName='4116-Suite-UAL-4-7'
from Sku S
where S.skuid=4116
--------------------------------------
UPDATE S
SET S.SkuName='4150-Suite-UAL-10-7'
from Sku S
where S.skuid=4150
--------------------------------------
UPDATE S
SET S.SkuName='4167-Suite-UNO-4-9'
from Sku S
where S.skuid=4167
--------------------------------------
UPDATE S
SET S.SkuName='4178-Suite-UMI-9-9'
from Sku S
where S.skuid=4178
--------------------------------------
UPDATE S
SET S.SkuName='4266-Suite-UAL-10-11'
from Sku S
where S.skuid=4266
--------------------------------------
UPDATE S
SET S.SkuName='4282-Suite-UMI-10-0'
from Sku S
where S.skuid=4282
--------------------------------------
UPDATE S
SET S.SkuName='4324-Suite-UAL-2-6'
from Sku S
where S.skuid=4324
--------------------------------------
UPDATE S
SET S.SkuName='4394-Suite-UAL-21-4'
from Sku S
where S.skuid=4394
---------------------------------------
UPDATE S
SET S.SkuName='4442-Suite-UMI-2-7'
from Sku S
where S.skuid=4442
---------------------------------------
UPDATE S
SET S.SkuName='4624-Suite-USE-1-12'
from Sku S
where S.skuid=4624
--------------------------------------
UPDATE S
SET S.SkuName='4640-Suite-USE-5-12'
from Sku S
where S.skuid=4640
--------------------------------------
UPDATE S
SET S.SkuName='4659-Suite-UAL-14-13'
from Sku S
where S.skuid=4659
--------------------------------------
UPDATE S
SET S.SkuName='4842-Suite-ULO-3-13'
from Sku S
where S.skuid=4842
--------------------------------------
UPDATE S
SET S.SkuName='4862-Suite-UNW-5-10'
from Sku S
where S.skuid=4862
--------------------------------------
UPDATE S
SET S.SkuName='4986-Suite-UNO-4-12'
from Sku S
where S.skuid=4986
------------------------------------
UPDATE S
SET S.SkuName='5018-Suite-UAL-6-3'
from Sku S
where S.skuid=5018
-------------------------------------
UPDATE S
SET S.SkuName='5239-Combo-CHI-4-4'
from Sku S
where S.skuid=5239
-------------------------------------
UPDATE S
SET S.SkuName='5659-Combo-WAS-1-0'
from Sku S
where S.skuid=5659
--------------------------------------
UPDATE S
SET S.SkuName='5659-Combo-WAS-1-0'
from Sku S
where S.skuid=5659
-------------------------------------
UPDATE S
SET S.SkuName='6084-Suite-CHI-2-0'
from Sku S
where S.skuid=6084
-------------------------------------
UPDATE S
SET S.SkuName='6688-Suite-SFO-6-4'
from Sku S
where S.skuid=6688
-------------------------------------
UPDATE S
SET S.SkuName='6710-Combo-CHI-1-4'
from Sku S
where S.skuid=6710
-------------------------------------
UPDATE S
SET S.SkuName='6732-Combo-GA1-1-0'
from Sku S
where S.skuid=6732
-------------------------------------
UPDATE S
SET S.SkuName='7180-Property-SBA-2-0'
from Sku S
where S.skuid=7180
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
----------------------------  LAST PLACE TO START FROM 04.11.17 ----------------------------------------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
UPDATE S
SET S.SkuName='3629-Suite-USC-2-5'
from Sku S
where S.skuid=3629
----------------------------------------------------------
UPDATE S
SET S.SkuName='4690-Suite-ULO-4-0'
from Sku S
where S.skuid=4690
-----------------------------------------------------------
UPDATE S
SET S.SkuName='4811-Suite-CCA-4-7'
from Sku S
where S.skuid=4811
------------------------------------------------------------
UPDATE S
SET S.SkuName='4819-Suite-CVA-4-7'
from Sku S
where S.skuid=4819
------------------------------------------------------------
UPDATE S
SET S.SkuName='4827-Suite-CGO-4-7'
from Sku S
where S.skuid=4827
------------------------------------------------------------
UPDATE S
SET S.SkuName='9579-Suite-SFO-2-4'
from Sku S
where S.skuid=9579
------------------------------------------------------------
UPDATE S
SET S.SkuName='9594-Combo-NNJ-1-0'
from Sku S
where S.skuid=9594
-----------------------------------------------------------
UPDATE S
SET S.SkuName='10139-Suite-USE-6-4'
from Sku S
where S.skuid=10139
----------------------------------------------------------
UPDATE S
SET S.SkuName='10139-Suite-USE-6-4'
from Sku S
where S.skuid=10139
-----------------------------------------------------------
UPDATE S
SET S.SkuName='10922-Suite-SFO-76-4'
from Sku S
where S.skuid=10922
------------------------------------------------------------
UPDATE S
SET S.SkuName='11010-Suite-CHI-5-4'
from Sku S
where S.skuid=11010
------------------------------------------------------------
UPDATE S
SET S.SkuName='11010-Suite-CHI-5-4'
from Sku S
where S.skuid=11010
------------------------------------------------------------
UPDATE S
SET S.SkuName='11099-Suite-UAL-2-15'
from Sku S
where S.skuid=11099
------------------------------------------------------------
UPDATE S
SET S.SkuName='11212-Suite-CHI-3-0'
from Sku S
where S.skuid=11212
-------------------------------------------------------------
UPDATE S
SET S.SkuName='11330-Suite-SFO-2-7'
from Sku S
where S.skuid=11330
--------------------------------------------------------------
UPDATE S
SET S.SkuName='11452-Property-CO1-2-0'
from Sku S
where S.skuid=11452
-------------------------------------------------------------
UPDATE S
SET S.SkuName='11452-Property-CO1-2-0'
from Sku S
where S.skuid=11452
-------------------------------------------------------------
UPDATE S
SET S.SkuName='11455-Suite-CHI-3-7'
from Sku S
where S.skuid=11455
------------------------------------------------------------
UPDATE S
SET S.SkuName='11735-Suite-SFO-23-4'
from Sku S
where S.skuid=11735
-------------------------------------------------------------
UPDATE S
SET S.SkuName='11959-Property-SFL-2-0'
from Sku S
where S.skuid=11959
------------------------------------------------------------
UPDATE S
SET S.SkuName='12004-Suite-CHI-2-10'
from Sku S
where S.skuid=12004
------------------------------------------------------------
UPDATE S
SET S.SkuName='12057-Suite-CHI-1-7'
from Sku S
where S.skuid=12057
------------------------------------------------------------
UPDATE S
SET S.SkuName='12122-Suite-UAL-152-4'
from Sku S
where S.skuid=12122
------------------------------------------------------------
UPDATE S
SET S.SkuName='12192-Suite-UAL-86-4'
from Sku S
where S.skuid=12192
------------------------------------------------------------
UPDATE S
SET S.SkuName='12413-Suite-ULO-7-4'
from Sku S
where S.skuid=12413
------------------------------------------------------------
UPDATE S
SET S.SkuName='13079-Suite-SFO-3-0'
from Sku S
where S.skuid=13079
-------------------------------------------------------------
UPDATE S
SET S.SkuName='13079-Suite-SFO-3-0'
from Sku S
where S.skuid=13079
---------------------------------------------------------------
UPDATE S
SET S.SkuName='14099-Suite-UAL-30-4'
from Sku S
where S.skuid=14099
---------------------------------------------------------
UPDATE S
SET S.SkuName='14268-Suite-CHI-1-10'
from Sku S
where S.skuid=14268
---------------------------------------------------------
UPDATE S
SET S.SkuName='14777-Suite-SFO-4-12'
from Sku S
where S.skuid=14777
--------------------------------------------------------
UPDATE S
SET S.SkuName='14929-Suite-SFO-8-0'
from Sku S
where S.skuid=14929
--------------------------------------------------------
UPDATE S
SET S.SkuName='14937-Suite-CHI-2-13'
from Sku S
where S.skuid=14937
-------------------------------------------------------
UPDATE S
SET S.SkuName='15533-Suite-UAL-9-1'
from Sku S
where S.skuid=15533
------------------------------------------------------
UPDATE S
SET S.SkuName='15533-Suite-UAL-9-1'
from Sku S
where S.skuid=15533
-----------------------------------------------------
UPDATE S
SET S.SkuName='15630-Suite-CHI-4-12'
from Sku S
where S.skuid=15630
------------------------------------------------------
UPDATE S
SET S.SkuName='15696-Suite-SFO-4-4'
from Sku S
where S.skuid=15696
-----------------------------------------------------
UPDATE S
SET S.SkuName='15841-Property-SLO-22-4'
from Sku S
where S.skuid=15841
----------------------------------------------------
UPDATE S
SET S.SkuName='16056-Suite-UMI-1-3'
from Sku S
where S.skuid=16056
------------------------------------------------------
UPDATE S
SET S.SkuName='16319-Suite-CHI-1-13'
from Sku S
where S.skuid=16319
-------------------------------------------------------
UPDATE S
SET S.SkuName='16881-Suite-UKN-1-4'
from Sku S
where S.skuid=16881
------------------------------------------------------
UPDATE S
SET S.SkuName='17002-Suite-CHI-4-13'
from Sku S
where S.skuid=17002
------------------------------------------------------
UPDATE S
SET S.SkuName='17012-Combo-SFO-1-9'
from Sku S
where S.skuid=17012
------------------------------------------------------
UPDATE S
SET S.SkuName='17012-Combo-SFO-1-9'
from Sku S
where S.skuid=17012
-----------------------------------------------------
UPDATE S
SET S.SkuName='18237-Suite-CHI-36-9'
from Sku S
where S.skuid=18237
-----------------------------------------------------
UPDATE S
SET S.SkuName='18979-Suite-SFO-1-16'
from Sku S
where S.skuid=18979
------------------------------------------------------
UPDATE S
SET S.SkuName='18987-Suite-CHI-4-0'
from Sku S
where S.skuid=18987
------------------------------------------------------
UPDATE S
SET S.SkuName='19011-Property-WA1-4-4'
from Sku S
where S.skuid=19011
-----------------------------------------------------
UPDATE S
SET S.SkuName='19011-Property-WA1-4-4'
from Sku S
where S.skuid=19011
-----------------------------------------------------
UPDATE S
SET S.SkuName='19034-Combo-TN1-4-0'
from Sku S
where S.skuid=19034
------------------------------------------------
UPDATE S
SET S.SkuName='19037-Combo-AR1-4-0'
from Sku S
where S.skuid=19037
---------------------------------------------
UPDATE S
SET S.SkuName='19089-Suite-CHI-3-4'
from Sku S
where S.skuid=19089
---------------------------------------------
UPDATE S
SET S.SkuName='19175-Suite-CHI-2-4'
from Sku S
where S.skuid=19175
---------------------------------------------
UPDATE S
SET S.SkuName='19549-Property-TX1-12-0'
from Sku S
where S.skuid=19549
---------------------------------------------
UPDATE S
SET S.SkuName='19784-Property-SMC-2-0'
from Sku S
where S.skuid=19784
---------------------------------------------
UPDATE S
SET S.SkuName='19804-Property-SMC-4-0'
from Sku S
where S.skuid=19804
---------------------------------------------
UPDATE S
SET S.SkuName='19940-Property-0AA-1-0'
from Sku S
where S.skuid=19940
---------------------------------------------
UPDATE S
SET S.SkuName='20960-Suite-UAL-264-4'
from Sku S
where S.skuid=20960
---------------------------------------------
UPDATE S
SET S.SkuName='21107-Combo-AVL-1-0'
from Sku S
where S.skuid=21107
----------------------------------------------
UPDATE S
SET S.SkuName='21225-Property-SLO-1-0'
from Sku S
where S.skuid=21225
----------------------------------------------
UPDATE S
SET S.SkuName='21372-Property-MA1-2-0'
from Sku S
where S.skuid=21372
---------------------------------------------
UPDATE S
SET S.SkuName='21400-Combo-CHT-4-0'
from Sku S
where S.skuid=21400
---------------------------------------------
UPDATE S
SET S.SkuName='21757-Suite-UKN-6-7'
from Sku S
where S.skuid=21757
--------------------------------------------
UPDATE S
SET S.SkuName='21757-Suite-UKN-6-7'
from Sku S
where S.skuid=21757
-------------------------------------------
UPDATE S
SET S.SkuName='21823-Property-TX1-1-12'
from Sku S
where S.skuid=21823
-------------------------------------------
UPDATE S
SET S.SkuName='21826-Property-DE1-1-12'
from Sku S
where S.skuid=21826
-------------------------------------------
UPDATE S
SET S.SkuName='22005-Suite-UAL-237-0'
from Sku S
where S.skuid=22005
-------------------------------------------
UPDATE S
SET S.SkuName='22132-Suite-CHI-14-0'
from Sku S
where S.skuid=22132
-------------------------------------------
UPDATE S
SET S.SkuName='22156-Property-OH1-5-0'
from Sku S
where S.skuid=22156
------------------------------------------
UPDATE S
SET S.SkuName='22245-Property-IL1-5-4'
from Sku S
where S.skuid=22245
------------------------------------------
UPDATE S
SET S.SkuName='22249-Combo-FL1-1-4'
from Sku S
where S.skuid=22249
------------------------------------------
UPDATE S
SET S.SkuName='22271-Suite-SFO-5-0'
from Sku S
where S.skuid=22271
------------------------------------------
UPDATE S
SET S.SkuName='22492-Property-SBA-4-4'
from Sku S
where S.skuid=22492
------------------------------------------
UPDATE S
SET S.SkuName='22561-Property-4ON-1-0'
from Sku S
where S.skuid=22561
-----------------------------------------
UPDATE S
SET S.SkuName='22645-Suite-CHI-1-6'
from Sku S
where S.skuid=22645
----------------------------------------
UPDATE S
SET S.SkuName='22767-Combo-FL1-1-0'
from Sku S
where S.skuid=22767
---------------------------------------
UPDATE S
SET S.SkuName='22825-Suite-CHI-9-4'
from Sku S
where S.skuid=22825
----------------------------------------
UPDATE S
SET S.SkuName='22895-Suite-NNJ-17-0'
from Sku S
where S.skuid=22895
-----------------------------------------
UPDATE S
SET S.SkuName='22975-Property-WA1-7-0'
from Sku S
where S.skuid=22975
-------------------------------------------
UPDATE S
SET S.SkuName='23076-Suite-UAL-26-4'
from Sku S
where S.skuid=23076
-------------------------------------------
UPDATE S
SET S.SkuName='23194-Combo-FL1-15-0'
from Sku S
where S.skuid=23194
---------------------------------------------
----UPDATE S
----SET S.SkuName='23355-Suite-UKN-13-0'
----from Sku S
----where S.skuid=23355
------------------------------------------------
UPDATE S
SET S.SkuName='23757-Combo-SBA-2-0'
from Sku S
where S.skuid=23757
------------------------------------------------
UPDATE S
SET S.SkuName='24341-Combo-BFL-5-0'
from Sku S
where S.skuid=24341
------------------------------------------------
UPDATE S
SET S.SkuName='24386-Combo-SBA-7-0'
from Sku S
where S.skuid=24386
------------------------------------------------
UPDATE S
SET S.SkuName='24409-Property-SLO-1-7'
from Sku S
where S.skuid=24409
------------------------------------------------
UPDATE S
SET S.SkuName='24718-Property-SLO-4-0'
from Sku S
where S.skuid=24718
--------------------------------------------------
UPDATE S
SET S.SkuName='24773-Suite-SFO-6-0'
from Sku S
where S.skuid=24773
-------------------------------------------------
UPDATE S
SET S.SkuName='24795-Combo-ROC-1-0'
from Sku S
where S.skuid=24795
-----------------------------------------------
UPDATE S
SET S.SkuName='24898-Combo-MA1-2-4'
from Sku S
where S.skuid=24898
-----------------------------------------------
UPDATE S
SET S.SkuName='25023-Combo-WA1-7-0'
from Sku S
where S.skuid=25023
------------------------------------------------
UPDATE S
SET S.SkuName='25046-Combo-ALB-1-0'
from Sku S
where S.skuid=25046
-----------------------------------------------
UPDATE S
SET S.SkuName='25169-Combo-TX1-6-4'
from Sku S
where S.skuid=25169
----------------------------------------------
UPDATE S
SET S.SkuName='25435-Combo-NC1-8-0'
from Sku S
where S.skuid=25435
----------------------------------------------
UPDATE S
SET S.SkuName='25623-Suite-SFO-21-4'
from Sku S
where S.skuid=25623
------------------------------------------------
UPDATE S
SET S.SkuName='25773-Suite-SFO-15-4'
from Sku S
where S.skuid=25773
------------------------------------------------
UPDATE S
SET S.SkuName='25802-Suite-SFO-17-0'
from Sku S
where S.skuid=25802
-------------------------------------------------
UPDATE S
SET S.SkuName='25926-Combo-SLO-1-0'
from Sku S
where S.skuid=25926
--------------------------------------------------
UPDATE S
SET S.SkuName='26110-Combo-SYR-1-0'
from Sku S
where S.skuid=26110
----------------------------------------------------















































































