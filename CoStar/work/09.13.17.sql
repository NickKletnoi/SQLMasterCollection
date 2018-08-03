--------------------------------------------------------------------------------
SELECT 
c.ContactID, 
c.FirstName, 
c.LastName, 
c.JobTitle, 
cr.RoleID, 
cr.RoleName
FROM Enterprise.dbo.CoStarContact as cc
INNER JOIN Enterprise.dbo.Contact as c on
       c.ContactID = cc.ContactID
LEFT OUTER JOIN Enterprise.dbo.CoStarRole as cr on
       cr.RoleID = cc.RoleID
WHERE
       cc.DeptID = 20 AND -- 20=Sales Dept.
       cc.Status = 1 -- Active
	   -----------------------------------------------------------------
------------------------------------------------------------------------
select top 10 * from Enterprise.dbo.LineItem
select top 10 * from  Enterprise.dbo.Contract
---------------------------------------------
---------------------------------------------

/*
---------------------------------------------------------
---------------------------------------------------------
--------------- GOALS FOR THE DAY :----------------------
---------------------------------------------------------
1. Write the first pass at the report for Apartments;-----
----------------------------------------------------------
2. Do the next 30 question for the 461 exam prep (60-90);
----------------------------------------------------------
3. Explore the VS2017 Reporting Services tutorials;-------
----------------------------------------------------------
--- Complete the SQL after Lunch and Release the Report 
--- by Thursday; Make sure that you get your 30 Questions 
--- In Today;---------------------------------------------
----------------------------------------------------------
Probably the vast majority of the time you don't have 
any clue whatsoever as to what is going on or what really
is getting planned or what is happening overall; you might
really get ahead not really thinking about all of the shit
scenarios that are happening in the token field out there;
----------------------------------------------------------
*/

/* 

--- Current locID list ---- 
LocationID
-------------
748376
36109921
55652401
23736558
290881
413205
37323391
65337521
54590301
34858252
27262
38230841
-------------------------------
*/

SELECT distinct
--SUM([TotalMonthlyPrice]) as MonthlyAmount,
--SUM([ListedAmount]) as ListedAmount,
--P.SkuName,
C.CustomerName,
C.LocationID as CustomerLocationID,
CT_RP.FirstName + ' ' + CT_RP.LastName AS SalesRep,
CNTR.ContractSignedDate as ContractSignedDate
FROM 
[cube].[F_ProductRevenueENT] E JOIN 
[cube].[D_Customer] C ON E.LocationID=C.LocationID JOIN 
[cube].[D_Product] P ON E.SKUID=P.SKUID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Contract CNTR ON E.ContractID=CNTR.ContractID LEFT JOIN
[DCSQLPRD104].Enterprise.dbo.Contact CT_RP ON CNTR.ContractContactID=CT_RP.ContactID

WHERE C.CustomerName  Like '%Lighthouse%'

 IN (
748376,
36109921,
55652401,
23736558,
290881,
413205,
37323391,
65337521,
54590301,
34858252,
27262,
38230841
)
GROUP BY 
P.SkuName,
C.CustomerName,
C.LocationID,
CT_RP.FirstName,
CT_RP.LastName,
CNTR.ContractSignedDate



select top 100 * from [DCSQLPRD104].Enterprise.dbo.Contract
select * from [Apt].[ProductList]
-------------------------------------------------------------

alter table [Apt].[ProductList] add SKUID INT null;

update P
SET P.[UpdatedFlg]='N'
FROM [Apt].[ProductList] P 
--------------------------------

select * from [dbo].[SkuPrice]

select * from [Apt].[ProductList]

update PL
set PL.[SKUID]=CAST(LEFT(PL.ProductName,5) AS INT)
FROM [Apt].[ProductList] PL

select * from [Apt].[ProductList]


update E
SET E.[ManualListPrice]=PL.[ManualListPrice]
--select PL.SKUID,PL.ProductName,SP.SkuName,SP.Price as SkuTableListPrice, PL.ManualListPrice as TrishListPrice 
from [cube].[F_ProductRevenueENT] E JOIN Apt.ProductList PL ON E.SKUID=PL.SKUID


select * from [Apt].[ProductList]

alter table [cube].[F_ProductRevenueENT] add ManualListPrice money null;

select distinct contractid 
from [cube].[F_ProductRevenueENT] E JOIN [cube].[D_Customer] C on E.LocationID=C.LocationID 



where C.CustomerName Like '%JJS Property Management%'
--148149

select ContactFi