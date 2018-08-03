 --------------------------------------------------------------------------------------
 SELECT * FROM [DCSQLPRD104].Enterprise.dbo.LineItem LI where ProductID in (
 SELECT ProductID 
 FROM [DCSQLPRD104].Enterprise.dbo.Product WHERE ProductDesc like '%Apartments.com%')
 AND LI.LineItemStatusID=1 and LI.BundleID is not null
 --------------------------------------------------------------------------------------
 SELECT contractid, OriginalMonthlyPrice,  * FROM LineItem LI where ProductID in (
 SELECT ProductID 
 FROM Product WHERE ProductDesc like '%Apartments.com Gold%')
 AND LI.LineItemStatusID=1 
 order by LI.contractid
 --AND LI.BundleID is not null
  -------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------
  SELECT contractid, OriginalMonthlyPrice,  * FROM LineItem LI where ProductID in (
 SELECT ProductID 
 FROM Product WHERE ProductDesc like '%Apartments.com Silver%')
 AND LI.LineItemStatusID=1 
 order by LI.contractid
 --AND LI.BundleID is not null
 
  -----------------------------------------------------------------------------------
    SELECT contractid, OriginalMonthlyPrice,  * FROM LineItem LI where ProductID in (
 SELECT ProductID 
 FROM Product WHERE ProductDesc like '%Apartments.com Platinum%')
 AND LI.LineItemStatusID=1 
 order by LI.contractid
 --AND LI.BundleID is not null

  -----------------------------------------------------------------------------------

      SELECT contractid, OriginalMonthlyPrice,  * FROM LineItem LI where ProductID in (
 SELECT ProductID 
 FROM Product WHERE ProductDesc like '%Apartments.com Diamond%')
 AND LI.LineItemStatusID=1 
 order by LI.contractid
 --AND LI.BundleID is not null
 
  -------------------------------------------------------------------------------------

 SELECT contractid, OriginalMonthlyPrice,  * FROM LineItem LI where ProductID in (
 SELECT ProductID 
 FROM Product WHERE ProductID IN (
225,
228,
231,
233,
249,
245,
246,
247,
250,
251,
252,
227,
232,
265,
281,
241,
226,
229,
230,
234,
239,
240,
248,
253,
261
))
AND LI.LineItemStatusID=1 
 --order by LI.contractid
 --AND LI.BundleID is not null




  ---------------------------------------------------------------------------------------
    SELECT ProductID, ProductDesc  FROM Product WHERE ProductDesc like '%Apartments.com%'

	---Apartments.com Platinum Package
	---Apartments.com Diamond Package Advance Billed

