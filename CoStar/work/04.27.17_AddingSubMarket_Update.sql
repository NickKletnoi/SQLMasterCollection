SELECT * 
--INTO #National_Skus
FROM SkuPriceLG WHERE SkuName LIKE '%National Subscription%' and Price>0

update S
Set S.SkuName='92-Suite-National Subscription-2-Lender(Dallas/FortWorth)'
from SkuLG S where SKUID=92
----------------------------------
update SP
Set SP.SkuName='92-Suite-National Subscription-2-Lender(Dallas/FortWorth)'
from SkuPriceLG SP where SKUID=92
-----------
-----------
update S
Set S.SkuName='697-Suite-National Subscription-20-N/A(Houston)'
from SkuLG S where SKUID=697
----------------------------------
update SP
Set SP.SkuName='697-Suite-National Subscription-20-N/A(Houston)'
from SkuPriceLG SP where SKUID=697
--------
--------
update S
Set S.SkuName='3497-Suite-National Subscription-3-N/A(Atlanta)'
from SkuLG S where SKUID=697
----------------------------------
update SP
Set SP.SkuName='3497-Suite-National Subscription-3-N/A(Atlanta)'
from SkuPriceLG SP where SKUID=697
-------
-------
update S
Set S.SkuName='27753-Suite-National Subscription-6-Appraisal/Valuation/Tax Appeal(Philadelphia)'
from SkuLG S where SKUID=27753
----------------------------------
update SP
Set SP.SkuName='27753-Suite-National Subscription-6-Appraisal/Valuation/Tax Appeal(Philadelphia)'
from SkuPriceLG SP where SKUID=27753
-------------
--------------
update S
Set S.SkuName='8481-Suite-National Subscription-0-Brokerage/Consultants(Atlanta)(Atlanta)'
from SkuLG S where SKUID=8481
----------------------------------
update SP
Set SP.SkuName='8481-Suite-National Subscription-0-Brokerage/Consultants(Atlanta)(Atlanta)'
from SkuPriceLG SP where SKUID=8481
----------
----------
update S
Set S.SkuName='11528-Suite-National Subscription-16-Brokerage/Consultants(New York)'
from SkuLG S where SKUID=11528
----------------------------------
update SP
Set SP.SkuName='11528-Suite-National Subscription-16-Brokerage/Consultants(New York)'
from SkuPriceLG SP where SKUID=11528
--------
--------
update S
Set S.SkuName='28085-Suite-National Subscription-6-Brokerage/Consultants(Montréal)'
from SkuLG S where SKUID=28085
----------------------------------
update SP
Set SP.SkuName='28085-Suite-National Subscription-6-Brokerage/Consultants(Montréal)'
from SkuPriceLG SP where SKUID=28085
----------
----------
update S
Set S.SkuName='29004-Suite-National Subscription-64-Brokerage/Consultants(Plymouth)'
from SkuLG S where SKUID=29004
----------------------------------
update SP
Set SP.SkuName='29004-Suite-National Subscription-64-Brokerage/Consultants(Plymouth)'
from SkuPriceLG SP where SKUID=29004
---------------
---------------
update S
Set S.SkuName='29045-Suite-National Subscription-125-Brokerage/Consultants(Greenbelt)'
from SkuLG S where SKUID=29045
----------------------------------
update SP
Set SP.SkuName='29045-Suite-National Subscription-125-Brokerage/Consultants(Greenbelt)'
from SkuPriceLG SP where SKUID=29045
---------
--------
update S
Set S.SkuName='29113-Suite-National Subscription-23-Appraisal/Valuation/Tax Appeal(Portland)'
from SkuLG S where SKUID=29113
----------------------------------
update SP
Set SP.SkuName='29113-Suite-National Subscription-23-Appraisal/Valuation/Tax Appeal(Portland)'
from SkuPriceLG SP where SKUID=29113
------------
------------
update S
Set S.SkuName='29179-Suite-National Subscription-50-Appraisal/Valuation/Tax Appeal(Woodland Hills)'
from SkuLG S where SKUID=29179
----------------------------------
update SP
Set SP.SkuName='29179-Suite-National Subscription-50-Appraisal/Valuation/Tax Appeal(Woodland Hills)'
from SkuPriceLG SP where SKUID=29179
----------
---------
update S
Set S.SkuName='29199-Suite-National Subscription-7-Appraisal/Valuation/Tax Appeal(Madison)'
from SkuLG S where SKUID=29199
----------------------------------
update SP
Set SP.SkuName='29199-Suite-National Subscription-7-Appraisal/Valuation/Tax Appeal(Madison)'
from SkuPriceLG SP where SKUID=29199
---------
---------