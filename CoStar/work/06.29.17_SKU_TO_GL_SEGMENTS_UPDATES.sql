select count(DISTINCT SKUID) from [dbo].[SkuPrice];
select * from [revenue].[SkuPrice];
 ALTER TABLE [revenue].[SkuPrice] ADD GLSegmentName Varchar(150) null;
 ----------------------------------------------------------------------
 ----------------------------------------------------------------------
 ---- SEGMENT UPDATES START HERE --------------------------------------
 ----------------------------------------------------------------------
 ----------------------------------------------------------------------
 UPDATE SP  SET SP.[GLSegmentName]='247' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Appts-Platinum%';
 ----------------
 UPDATE SP  SET SP.[GLSegmentName]='248' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Appts-Diamond%';
 ----------------
 UPDATE SP  SET SP.[GLSegmentName]='245' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Appts-Gold%';
 ----------------
 UPDATE SP  SET SP.[GLSegmentName]='246' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Appts-Silver%';
 ---------------
 UPDATE SP  SET SP.[GLSegmentName]='269' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Finder-Platinum%';
 --------------
 UPDATE SP  SET SP.[GLSegmentName]='270' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Finder-Diamond%';
 -------------
  UPDATE SP  SET SP.[GLSegmentName]='267' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Finder-Silver%';
  -------------
  UPDATE SP  SET SP.[GLSegmentName]='268' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Finder-Gold%';
 --------------
  UPDATE SP  SET SP.[GLSegmentName]='277' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%FinderSites%';
  -------------
  UPDATE SP  SET SP.[GLSegmentName]='101' FROM [revenue].[SkuPrice] SP WHERE SP.SkuName LIKE '%Suite%';
  -------------



  select * from [revenue].[SkuPrice] where SkuName like '%RSV%'

    select * from [revenue].[SkuPrice] where ProductCategory like '%Other%'

  /*
30830-RSV - Request License--1 -0-4-Brokerage/Consultants
31113-RSV – Portfolio Maximizer Term Of Service License--1 -0-4-Brokerage/Consultants
31114-RSV - Change Orders--1 -0-4-Brokerage/Consultants
33415-RSV – Request Maintenance--1 -0-7-OwnerPMC
34807-RSV - Request License-1 -0-12-Vendor
50427-RSV – Data Complete (Excel Tool) License--1 -0-4-Brokerage/Consultants
  */
  