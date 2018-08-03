USE RevenueProcessing

DECLARE @line INT 
	--= 
	--879144
	--1065256
	--1514403
	--695699	--Dates do not work for determining term length. All have a term start of 2009
	--88578		--Dates do not work for determining term length. Term start was manipulated to appear as 8/3/2001, which isnt correct for current term. ALSO, the Renewal and Term End Dates do NOT match.
	--1064508	--Generates erroneous lines caused by bad data. Should be able to flag them as error for exclusion in final load based on UnitSellPrice = -999999, but need to verify with larger dataset.
	--1534860	--Rebill and term change

DECLARE @contract INT
	--113911
	--10867		--See error for line 1064508 --1064508 not resolved, but records arent in scope.
	--58368
	--11618
	--157900


DECLARE @cust INT 
	= 476
	--41264081
	--31427726
	--116790
	--36829203
	--2694502
	--56285121	--APTs early cancel
	--31427726
	--53181661
	--1430043	--Cust with varying MEAs across multiple contracts.



/*----------  TODO  --------
1. Check and make sure that dates are not null for those used with DATEDIFF
2. For #Events can we remove the GroupBy all together or do we actually make use of the MAX() values.
3. #ValidTerms - may need to consider user count changes
------------  TODO  --------*/


--IF OBJECT_ID('tempdb..#Majors') IS NOT NULL DROP TABLE #Majors
IF OBJECT_ID('tempdb..#StartTerms') IS NOT NULL DROP TABLE #StartTerms
IF OBJECT_ID('tempdb..#Terms') IS NOT NULL DROP TABLE #Terms
IF OBJECT_ID('tempdb..#Events') IS NOT NULL DROP TABLE #Events
IF OBJECT_ID('tempdb..#ValidTerms') IS NOT NULL DROP TABLE #ValidTerms
IF OBJECT_ID('tempdb..#MAXValidTermRows') IS NOT NULL DROP TABLE #MAXValidTermRows
IF OBJECT_ID('tempdb..#SalesOrders') IS NOT NULL DROP TABLE #SalesOrders
IF OBJECT_ID('tempdb..#tmpInvoiceDetail') IS NOT NULL DROP TABLE #tmpInvoiceDetail
IF OBJECT_ID('tempdb..#SKUs') IS NOT NULL DROP TABLE #SKUs
IF OBJECT_ID('tempdb..#RevProSalesOrders') IS NOT NULL DROP TABLE #RevProSalesOrders


-- /**** BEGIN ** DETERMINE ACTIVE LINE ITEMS and SET ParentMEA ****/ --
DECLARE @FindActiveLines BIT = 1,
        @TotalActiveLines INT = 0;

IF OBJECT_ID('tempdb..##ActiveLineItems') IS NOT NULL
BEGIN
	SELECT @TotalActiveLines = (COUNT(1)) FROM ##ActiveLineItems;
	PRINT @TotalActiveLines
END

IF OBJECT_ID('tempdb..##ActiveLineItems') IS NOT NULL AND @TotalActiveLines = 0
BEGIN
	INSERT INTO ##ActiveLineItems
	(
	 LocationID, 
	 ContractID,
	 ContractMinCreateDate,
	 ContractMinMEA,
	 LineItemID,
	 LineItemMEA,
	 LineItemCreatedDate,
	 IsActive2016,
	 SiteLocationID,
	 ProductID,
	 ComboID
    )
	SELECT DISTINCT 
		   c.LocationID,
		   l.ContractID,
		   fcd.ContractFirstCreateDate as ContractMinCreateDate,
		   CAST(YEAR(fcd.ContractFirstCreateDate) as VARCHAR(4)) + RIGHT('00' + CAST(MONTH(fcd.ContractFirstCreateDate) AS VARCHAR(2)), 2) AS ContractMinMEA,
		   l.LineItemID,
		   CAST(YEAR(l.CreatedDate) as VARCHAR(4)) + RIGHT('00' + CAST(MONTH(l.CreatedDate) AS VARCHAR(2)), 2) AS LineItemMEA,
		   l.CreatedDate AS LineItemCreatedDate,

		   CASE 
				WHEN l.BillingStartDate IS NULL					THEN 0
				WHEN (l.LineItemStatusID IN (4,5,6) 
					AND l.LineItemStatusDate >= '2016-01-01')	THEN 1
				WHEN l.LineItemStatusID IN (1,2,3,7)			THEN 1 
																ELSE 0
		   END AS [IsActive2016],

		   l.SiteLocationID,
		   l.ProductID,
		   ISNULL(l.BundleID,0) AS ComboID
	FROM Enterprise.dbo.LineItem l (NOLOCK)
		JOIN Enterprise.dbo.[Contract] c (NOLOCK) ON l.contractid = c.contractid
		JOIN (
			  SELECT l2.ContractID,
			         MIN(l2.CreatedDate) AS ContractFirstCreateDate
		      FROM Enterprise.dbo.LineItem l2 (NOLOCK)
		      GROUP BY l2.contractid
	         ) fcd ON l.contractid = fcd.contractid 
	ORDER BY c.LocationID, l.SiteLocationID, ComboID, l.CreatedDate, l.ProductID


	UPDATE ali
	SET ParentMEA = parent.ContractMinMEA, 
	    ParentIdentity = parent.identitykey, 
		ParentLineItemID = parent.LineItemID
	FROM ##ActiveLineItems ali
	JOIN 
	    (
	     SELECT IdentityKey,
			    LineItemID,
			    LocationID,
			    ContractID,
			    ContractMinCreateDate,
			    ContractMinMEA,
			    ROW_NUMBER() OVER(PARTITION BY ali2.LocationID, ali2.ContractMinMEA ORDER BY ali2.contractid) AS CreateOrder
         FROM ##ActiveLineItems ali2
	    ) parent ON ali.locationid = parent.locationid 
		     AND ali.ContractMinMEA = parent.ContractMinMEA
			 AND CreateOrder = 1
	 
END
-- /**** END ** DETERMINE ACTIVE LINE ITEMS ****/ --


-- /**** BEGIN ** DETERMINE MAJORS ACCOUNTS ****/ --
-- 2016-1006 RSturm: Per Denning, Major accounts should be identified by the specific location (not the HQ) and the subsidiary.
--		Similarly, the major flag should be a property of the lineitem, not the contract. Therefore, the site location and product's subsidiary ID will define Majors.
IF OBJECT_ID('tempdb..#Majors') IS NULL
BEGIN
	SELECT LocationID, 
	       CoStarSubsidiaryID,
	       CASE
				WHEN CoStarSubsidiaryID = 1 
				AND LocationID IN (29876840, 53663, 34653756, 4525273, 157964, 521722,
			                       22692637, 625994, 101894, 330353, 190639, 25725062, 1452,
			                       32419108, 54205, 22525888, 25881227, 23740109, 12519456) THEN 1
		        ELSE MajorAccountFlag
	       END AS MajorAccountFlag
	INTO #Majors
	FROM Enterprise.dbo.CustomerInfo
	ORDER BY 1, 2
END
-- /**** END ** DETERMINE MAJORS ACCOUNTS ****/ --

-- /**** BEGIN ** ASSIGN PROPER TERM START DATES TO POSSIBLE TERMS FROM LINE ITEM SNAP SHOTS ****/ --
IF OBJECT_ID('tempdb..#StartTerms') IS NULL
BEGIN
	SELECT liss.LineItemID,
	       liss.ContractID,

	       CASE 
		        WHEN liss.CurrentTermStartDate IS NULL 
				     OR liss.RenewalDate IS NULL THEN re.AdjustedEventDate  
		        WHEN DATEDIFF(MONTH, CAST(liss.CurrentTermStartDate AS DATE), CAST(liss.RenewalDate AS DATE)) > 24 THEN re.AdjustedEventDate 
				ELSE CAST(liss.CurrentTermStartDate AS DATE)
		   END AS TermStDt,

		   CAST(ISNULL(liss.RenewalDate, '1900-01-01') AS DATE) AS TermRenewDt, 
		   liss.LineItemStartDate, 
		   liss.LineItemEndDate
	INTO #StartTerms
	FROM EnterpriseDataMart.dbo.lineitemsnapshot liss (NOLOCK)
	JOIN ##ActiveLineItems ali 
		ON liss.lineitemid = ali.lineitemid 
		AND ali.IsActive2016 = 1
	JOIN Enterprise.dbo.[contract] con (NOLOCK) 
		ON liss.ContractID = con.ContractID
		AND (liss.LineItemID = @line OR liss.ContractID = @contract OR con.LocationID = @cust)
		AND liss.billingstartdate IS NOT NULL
	LEFT JOIN EnterpriseReporting.[dbo].[RevenueEvent] re (NOLOCK) 
		ON liss.LineItemID = re.LineItemID 
		AND re.EventType = 'Renewal' 
		AND
	       ( 
	        re.AdjustedEventDate BETWEEN liss.LineItemStartDate AND liss.LineItemEndDate
	       )
END
-- /**** END ** ASSIGN PROPER TERM START DATES TO POSSIBLE TERMS FROM LINE ITEM SNAP SHOTS ****/ --



-- /**** BEGIN ** LOCATE POSSIBLE TERMS WITHIN LINE ITEM SNAP SHOTS ****/ --
IF OBJECT_ID('tempdb..#Terms') IS NULL
BEGIN
	SELECT ROW_NUMBER() OVER(partition by liss.LineItemID ORDER BY TermStDt, TermRenewDt) AS TERM,
	       liss.LineItemID,
	       liss.ContractID,
	       TermStDt, 
	       TermRenewDt 
	INTO #Terms
	FROM #StartTerms liss (NOLOCK)
	WHERE liss.TermStDt IS NOT NULL
	GROUP BY 
			liss.LineItemID, 
			liss.ContractID,
			TermStDt, TermRenewDt 
END
-- /**** END ** LOCATE POSSIBLE TERMS WITHIN LINE ITEM SNAP SHOTS ****/ --


-- /**** BEGIN ** CONTINUE TO DEFINE TERMS BASED ON LINE ITEM SNAP SHOTS ****/ --
IF OBJECT_ID('tempdb..#Events') IS NULL
BEGIN
	 SELECT terms.TERM,
	        liss.LineItemID,
	        ISNULL(terms.TermStDt, liss.BillingStartDate) AS TermStDt,
	        CAST(ISNULL(liss.CurrentTermStartDate, '1900-01-01') AS DATE) AS TermORIGStDt, 
			CAST(ISNULL(liss.RenewalDate, '1900-01-01') AS DATE) AS TermRenewDt,
	        liss.lineitemstartdate,
	        liss.LineItemEndDate,
	        liss.DiscountedMONTHlyPrice,

	        CASE 
				WHEN CAST(liss.LineItemStartDate AS DATE) <= CAST(liss.CurrentTermStartDate AS DATE) THEN 1
				ELSE ROW_NUMBER() OVER(ORDER BY terms.TermStDt, liss.lineitemstartdate, liss.snapshotcreateddate) 
			END AS GrpFlag,

	        CASE 
				WHEN CAST(liss.LineItemStartDate AS DATE) <= CAST(liss.CurrentTermStartDate AS DATE) THEN 1
				ELSE ROW_NUMBER() OVER(ORDER BY  terms.TermStDt, liss.lineitemstartdate, liss.snapshotcreateddate) 
			END AS GrpFlag2,

			liss.NumberOfUsers,
			CAST(DATEADD(MONTH, DATEDIFF(MONTH, 0, liss.LineItemStartDate), 0) AS DATE) MONTHofEvent,
			liss.LineItemStatusID,

	        CAST(liss.CreatedDate AS DATE) AS CreatedDate,
			
			CASE
				WHEN liss.PendingLineItemStatusID IS NULL THEN 0
				ELSE 1
			END AS StatusChangeFlag,

			liss.SalesUnitID,
			liss.BundleID,
			liss.SiteLocationID,
			liss.ProductID,
			liss.BillingStartDate,
			liss.LineItemTypeID,
			liss.RenewalDate,
			liss.TermEndDate,
			liss.ContractID,
			liss.CoStarSubsidiaryID,
			liss.MonetaryUnitID,
			liss.BillingLocationID,
			liss.CurrentMONTHlyPrice,
			liss.CurrentTermStartDate
			INTO #Events
			FROM EnterpriseDataMart.dbo.lineitemsnapshot liss (NOLOCK) 
				JOIN Enterprise.dbo.[Contract] con (NOLOCK) 
					ON liss.ContractID = con.ContractID
					AND (liss.LineItemID = @line OR liss.ContractID = @contract OR con.LocationID = @cust)
				LEFT JOIN #Terms terms 
					ON liss.LineItemID = terms.LineItemID
				AND CAST(liss.RenewalDate AS DATE) = terms.TermRenewDt
			WHERE liss.billingstartdate IS NOT NULL 
			ORDER BY terms.TermStDt, liss.lineitemstartdate, liss.snapshotcreateddate
END
-- /**** BEGIN ** CONTINUE TO DEFINE TERMS BASED ON LINE ITEM SNAP SHOTS ****/ --



-- /**** BEGIN ** FILTER TERMS TO VALID SUBSET ****/ --
IF OBJECT_ID('tempdb..#ValidTerms') IS NULL
BEGIN
	SELECT 
	       CASE 
			   WHEN e2.TERM IS NULL THEN 1
			   ELSE e1.TERM
		   END AS TERM,

		   e1.TERM AS E1_TERM,
		   e1.LineItemID,
		   TermStDt,
		   TermRenewDt,
		   e1.LineItemStartDate,
		   e1.LineItemEndDate,
		   e1.DiscountedMONTHlyPrice,
		   GrpFlag,
		   e1.NumberofUsers,
		   e1.LineItemStatusID,
		   e1.CreatedDate,
		   ROW_NUMBER() OVER(PARTITION BY e1.lineitemid, e1.TermStDt ORDER BY  e1.TermStDt, e1.lineitemstartdate) AS TermRow,
		   e1.StatusChangeFlag,
		   e1.SalesUnitID,
		   e1.BundleID,
		   e1.SiteLocationID,
		   e1.ProductID,
		   e1.BillingStartDate,
		   e1.LineItemTypeID,
		   e1.RenewalDate,
		   e1.TermEndDate,
		   e1.ContractID,
		   e1.CoStarSubsidiaryID,
		   e1.MonetaryUnitID,
		   e1.BillingLocationID,
		   e1.CurrentMONTHlyPrice,
		   e1.CurrentTermStartDate,
		   e2.LineItemID as E2_LineItemID,
		   e2.LineItemStartDate as E2_LineItemStartDate,
		   e2.TERM as E2_TERM,

	       CASE 
			   WHEN e1.TermRenewDt >= e1.LineItemStartDate AND e1.TermStDt <= e1.LineItemStartDate THEN 1
			   WHEN e1.TermRenewDt >= e1.LineItemEndDate AND e1.TermStDt <= e1.LineItemEndDate THEN 1
			   ELSE 0 
		   END AS IsEvent

	INTO #ValidTerms
	FROM #Events e1
	LEFT JOIN 
	         (
		      SELECT TERM, LineItemID, MAX(LineItemStartDate) AS LineItemStartDate
		      FROM #Events 
		      WHERE LineItemStartDate <= termstdt
		      GROUP BY TERM, LineItemID
	         ) e2 ON e1.TERM = e2.TERM 
			      AND e1.LineItemID = e2.LineItemID 
	WHERE 
	(
	 e2.LineItemID IS NULL
	 OR
     (
	  (e1.TermRenewDt >= e1.LineItemStartDate AND e1.TermStDt <= e1.LineItemStartDate)
	   OR (e1.TermRenewDt >= e1.LineItemEndDate AND e1.TermStDt <= e1.LineItemEndDate)
	   OR (e1.LineItemStartDate < e1.CurrentTermStartDate AND e1.LineItemEndDate < e1.CurrentTermStartDate))

	  OR 

	  e1.LineItemEndDate = '9999-12-31' 
	)

ORDER BY TermRenewDt, LineItemStartDate
END
-- /**** END ** FILTER TERMS TO VALID SUBSET ****/ --


-- /**** BEGIN ** FILTER TERMS TO VALID SUBSET ****/ --
IF OBJECT_ID('tempdb..#MAXValidTermRows') IS NULL
BEGIN
	SELECT vt.TERM,
		   vt.LineItemID,
	       MAX(TermRow) AS MAXTermRow
	INTO #MAXValidTermRows
	FROM #ValidTerms vt
	WHERE vt.StatusChangeFlag = 0 
	AND vt.LineItemStatusID IN (1,2,3,7)
	GROUP BY vt.TERM, vt.LineItemID
END
-- /**** END ** FILTER TERMS TO VALID SUBSET ****/ --


-- /**** BEGIN ** FIND FIRST INVOICE DETAIL ****/ --
IF OBJECT_ID('tempdb..#tmpInvoiceDetail') IS NULL --or not exists (SELECT top 1 * FROM #tmpInvoiceDetail)
BEGIN
	SELECT det.LineItemID, det2.EarliestInvoiceDetailID, det.GrossMONTHlyPrice, det.MONTHlyPrice, det.BillingStartDate, 
		   CAST(CAST(det.chargeYEAR AS VARCHAR(4)) + RIGHT('0' + CAST(det.chargeMONTH AS VARCHAR(2)), 2) + '01' AS DATE) AS [MEAInvoiceFirstDateOfPeriod],
		   det.ChargeMONTH, det.ChargeYEAR, det.PreviousPrice,	
		   CAST(det.BillingStartDate AS DATE) as MEAInvoiceBillingStartDatedateKey, 

		   CASE
			   WHEN CAST(det.BillingStartDate AS DATE) <= CAST(CAST(det.chargeYEAR AS VARCHAR(4)) + RIGHT('0' + CAST(det.chargeMONTH AS VARCHAR(2)), 2) + '01' AS DATE)
					THEN CAST(CAST(det.chargeYEAR AS VARCHAR(4)) + RIGHT('0' + CAST(det.chargeMONTH AS VARCHAR(2)), 2) + '01' AS DATE)
					ELSE CAST(det.BillingStartDate AS DATE)
		   END AS AdjustedBillingStartDate,

		   CASE 
			   WHEN RIGHT(LEFT(billingdescription, 10), 1) = 't' THEN CAST((RTRIM(LEFT(billingdescription, 8))) AS DATE)
																 ELSE CAST(RTRIM(LEFT(billingdescription, 10)) AS DATE)
		   END AS FirstBillingTermStart,

		   cal.DaysRemain AS StubDays,
		   cal.DaysInMONTH AS DaysInStubMONTH
	into #tmpInvoiceDetail 
	FROM Enterprise.dbo.InvoiceDetail det (NOLOCK)
	JOIN
		(
		 SELECT id.LineItemID AS line2,
			    MIN(InvoiceDetailID) EarliestInvoiceDetailID
		 FROM Enterprise.dbo.InvoiceDetail id (NOLOCK)
			 JOIN Enterprise.dbo.[Contract] con (NOLOCK) 
				ON id.ContractID = con.ContractID
			 JOIN #ValidTerms vt 
				ON id.lineitemid = vt.LineItemID 
				AND vt.TERM = 1 
				AND vt.TermRow = 1
				AND CAST(DATEADD(MONTH, DATEDIFF(MONTH, 0, vt.TermStDt), 0) AS DATE) <= CAST((CAST(id.chargeYEAR AS NVARCHAR(4)) + '-' + RIGHT('00' + CAST(id.chargeMONTH as nVARCHAR(2)),2) + '-01') AS DATE) 
				AND vt.TermRenewDt >= CAST((CAST(id.chargeYEAR as nVARCHAR(4)) + '-' + RIGHT('00' + CAST(id.chargeMONTH AS nVARCHAR(2)),2) + '-01') AS DATE) 
		  WHERE (id.LineItemID = @line 
		         OR 
			     id.ContractID = @contract 
				 OR con.LocationID = @cust
		         )
		  GROUP BY id.LineItemID
		 ) det2 on det.InvoiceDetailID = det2.EarliestInvoiceDetailID
			JOIN [RevenueProcessing].lookups.Calendar cal (NOLOCK) 
				ON (
				    CASE WHEN RIGHT(LEFT(billingdescription, 10), 1) = 't' THEN CAST((rtrim(LEFT(billingdescription, 8))) AS DATE)
		                                                                   ELSE CAST(rtrim(LEFT(billingdescription, 10)) AS DATE) 
					END) = cal.DateKey
END


-- /**** BEGIN ** CONSTRUCT SALES ORDERS WITH DISCOUNTED MONTHLY PRICE AND BSD ****/ --
IF OBJECT_ID('tempdb..#SalesOrders') IS NULL
BEGIN

SELECT
	  terms.LineItemID,
	  '' AS EventDate ,
      l.ProductID ,
      'RULE_START_DATE' AS [AdjustedEventDate],
      'YEAR(RULE_START_DATE)' AS [AdjustedEventYEAR] ,
      'MONTH(RULE_START_DATE)' AS [AdjustedEventMONTH] ,
      terms.BillingStartDate AS [BillingStartDate],
      '' AS [BillingMONTH],
      terms.LineItemTypeID,
      terms.[RenewalDate],
      '' AS [OldRenewalDate],
      terms.[TermEndDate],
      terms.[NumberOfUsers],
      terms.[ContractID],
      terms.[CoStarSubsidiaryID],
      terms.[MonetaryUnitID],
      terms.[BillingLocationID],
      terms.[SiteLocationID],
      siteloc.LocationName AS [SiteLocationName],
      ISNULL(loc.CurrentAEContactID, 0) AS AEContactID,
      terms.[LineItemStatusID],
      ISNULL(terms.DiscountedMONTHlyPrice, 0) AS DiscountedMONTHlyPrice,
      '' AS PriorDiscountedMONTHlyPrice,
      '' AS DiscountedMONTHlyPriceDifference,
      ISNULL(terms.CurrentMONTHlyPrice, 0) AS MONTHlyPrice,
      mininv.MONTHlyPrice AS MONTHlyPrice2,
      con.AcctApprovedDate AS ContractApprovedDate,
      terms.SalesUnitID,
      terms.BundleID,
      'SalesOrder' AS RevenueItemType,
      terms.CurrentTermStartDate,
      con.LocationID AS LocationID ,
      '' AS RevenueRunID,
      '' AS SequenceNumber,
      '' AS [RevenueEventType],
      CASE
		  WHEN majors.MajorAccountFlag = 1 THEN 'Y'
		  ELSE 'N'
	  END AS IsMajor, --ATTRIBUTE24
      '0083' AS CLIENT_ID,
      CAST(YEAR(l.CreatedDate) as VARCHAR(4)) + RIGHT('0' + CAST(MONTH(l.CreatedDate) as VARCHAR(4)), 2) + '_' + CAST(con.locationid as nVARCHAR(20)) as ORIG_MEA_ID,

      CASE
		  WHEN terms.TERM = 1 AND terms.GrpFlag = 1 THEN CAST(YEAR(terms.CreatedDate) AS VARCHAR(4)) + RIGHT('0' + CAST(MONTH(terms.CreatedDate) AS VARCHAR(4)), 2)
		  ELSE CAST(YEAR(CASE WHEN terms.TermRow = 1 THEN terms.TermStDt ELSE terms.LineItemStartDate END) AS VARCHAR(4))
			+ RIGHT('0' + CAST(MONTH(CASE WHEN terms.TermRow = 1 THEN terms.TermStDt ELSE terms.LineItemStartDate END) AS VARCHAR(2)), 2)
	  END AS MEA_EVENT,

      CAST(terms.TERM AS VARCHAR(10)) as MEA_TERM,
      CAST(terms.TermRow AS VARCHAR(10)) as MEA_TERMROW,

      CAST(YEAR(l.CreatedDate) AS VARCHAR(4)) + RIGHT('0' + CAST(MONTH(l.CreatedDate) AS VARCHAR(4)), 2) + '_' + CAST(con.locationid AS nVARCHAR(20)) + '_'
		+
			CASE
			    WHEN terms.TERM = 1 and terms.GrpFlag = 1 THEN CAST(YEAR(terms.CreatedDate) as VARCHAR(4)) + RIGHT('0' + CAST(MONTH(terms.CreatedDate) AS VARCHAR(4)), 2)
			    ELSE CAST(YEAR(
				               CASE WHEN terms.TermRow = 1 THEN terms.TermStDt 
				                                           ELSE terms.LineItemStartDate 
							   END
							  ) AS VARCHAR(4))
				+ RIGHT('0' + CAST(MONTH(CASE when terms.TermRow = 1 THEN terms.TermStDt ELSE terms.LineItemStartDate END) AS VARCHAR(2)), 2)
			END 
		+ '_' + CAST(terms.TERM AS VARCHAR(10)) + '_' + CAST(terms.TermRow AS VARCHAR(10)) AS 'DEAL_ID',

      ROW_NUMBER() OVER(PARTITION BY l.lineitemID ORDER BY  terms.TERM, terms.TermRow) AS 'DEAL_JOINID',
      loc.CountryCode AS [BILL_TO_COUNTRY],
      loc.LocationName AS [BILL_TO_CUSTOMER_NAME],
      loc.LocationID AS [BILL_TO_CUSTOMER_NUMBER],
      '??' AS [BUSINESS_UNIT],
      siteloc.LocationID AS [CUSTOMER_ID],
      siteloc.LocationName AS [CUSTOMER_NAME],
      'Y' AS [DEFERRED_REVENUE_FLAG],

      CASE
		  WHEN terms.TERM = 1 AND YEAR(terms.CreatedDate) < 2016	THEN 'N'
		  WHEN terms.TERM = 1 AND YEAR(terms.CreatedDate) >= 2016	THEN 'Y'
		  WHEN YEAR(terms.TermStDt) < 2016							THEN 'N'
		  ELSE 'Y'
	  END	AS [ELIGIBLE_FOR_CV],

	  CASE
		  WHEN terms.TERM = 1 AND YEAR(terms.CreatedDate) < 2016	THEN 'N'
		  WHEN terms.TERM = 1 AND YEAR(terms.CreatedDate) >= 2016	THEN 'Y'
		  WHEN YEAR(terms.TermStDt) < 2016							THEN 'N'
		  ELSE 'Y'
	  END AS [ELIGIBLE_FOR_FV],
	
	  CASE
		  WHEN terms.TERM = 1 AND CAST(terms.TermStDt AS DATE) <= CAST(CAST(mininv.chargeYEAR AS VARCHAR(4)) + RIGHT('0' + CAST(mininv.chargeMONTH AS VARCHAR(2)), 2) + '01' AS DATE)
				THEN CAST(CAST(mininv.chargeYEAR AS VARCHAR(4)) + RIGHT('0' + CAST(mininv.chargeMONTH AS VARCHAR(2)), 2) + '01' AS DATE)
		  ELSE CAST(DATEADD(MONTH, DATEDIFF(MONTH, 0, terms.TermStDt), 0) AS DATE)
	  END AS [AdjustedBillingStartDate],

	  mininv.chargeYEAR, 
	  mininv.chargeMONTH,
	  CAST(DATEADD(MONTH, DATEDIFF(MONTH, 0, terms.TermStDt) + 1, 0) AS DATE) AS TermStPlus1MONTH,
	  mininv.AdjustedBillingStartDate AS InvAdjBillStart,

	  CASE 
		  WHEN DAY(terms.TermStDt) = 1 THEN CAST(DATEADD(MONTH, DATEDIFF(MONTH, 0, terms.TermStDt), 0) AS DATE) 
		  WHEN DAY(terms.TermStDt) > 1 THEN CAST(DATEADD(MONTH, DATEDIFF(MONTH, 0, terms.TermStDt) + 1, 0) AS DATE) 
	  END AS [RULE_START_DATE],

      terms.TermRenewDt AS [RULE_END_DATE] ,
	  l.ContractID AS [SALES_ORDER],
	  l.ContractID AS [SALES_ORDER_ID],

	  CAST(l.ContractID AS VARCHAR(40)) + '_' + CAST(terms.LineItemID AS VARCHAR(40)) + '_' + 
	  CASE
		  WHEN terms.TERM = 1 AND terms.GrpFlag = 1 
				THEN CAST(YEAR(terms.CreatedDate) AS VARCHAR(4)) + RIGHT('0' + CAST(MONTH(terms.CreatedDate) AS VARCHAR(4)), 2)
		  ELSE CAST(YEAR(
		                 CASE WHEN terms.TermRow = 1 
		                      THEN terms.TermStDt 
						 ELSE terms.LineItemStartDate END
						) AS VARCHAR(4))
		  + RIGHT('0' + CAST(MONTH(
		                           CASE WHEN terms.TermRow = 1 
		                                THEN terms.TermStDt 
									ELSE terms.LineItemStartDate END
								   ) AS VARCHAR(2)), 2)
	  END + '_' + CAST(terms.TERM AS VARCHAR(10)) + '_' + CAST(terms.TermRow AS VARCHAR(10))
	  AS [SALES_ORDER_LINE_ID],

	  CASE
		WHEN terms.TERM = 1 AND terms.GrpFlag = 1 THEN CAST(YEAR(terms.CreatedDate) AS VARCHAR(4))
		ELSE CAST(YEAR(
		               CASE WHEN terms.TermRow = 1 
		                    THEN terms.TermStDt 
							ELSE terms.LineItemStartDate 
					   END
					   ) AS VARCHAR(4))
	  END AS [FV_YEAR],

	  CASE
		WHEN terms.TERM = 1 AND terms.TermRow = 1 THEN CAST(YEAR(terms.CreatedDate) AS VARCHAR(4))
		ELSE CAST(YEAR(
		               CASE WHEN terms.TermRow = 1 
		                    THEN terms.TermStDt 
							ELSE terms.LineItemStartDate 
					   END
					   ) AS VARCHAR(4))
	    END AS [FV_YEAR2-CORRECT?-],

      fsr.TermStDt AS [SHIP_DATE],

      terms.CreatedDate AS [TRANS_DATE],
      'N' AS [STANDALONE_FLAG],
      'N' AS [STATED_FLAG],
      'SO' AS [TRAN_TYPE],

	  ISNULL(ROUND(CASE WHEN terms.TERM = 1 AND terms.TermRow = 1 AND mininv.EarliestInvoiceDetailID IS NOT NULL AND ROUND(terms.discountedMONTHlyprice,2) = mininv.MONTHlyPrice
							THEN ROUND(terms.discountedMONTHlyprice,2)
		                WHEN terms.TERM = 1 AND terms.TermRow = 1 and mininv.EarliestInvoiceDetailID IS NOT NULL AND ROUND(terms.discountedMONTHlyprice,2) <> mininv.MONTHlyPrice
							THEN CAST(((mininv.MONTHlyPrice / mininv.StubDays) * mininv.DaysInStubMONTH) AS NUMERIC(20,8))
		                WHEN terms.TERM = 1 AND mininv.EarliestInvoiceDetailID IS NULL  
			                THEN -999999
		           ELSE ROUND(terms.discountedMONTHlyprice,2) 
	               END, 2), -999999) 
	  AS [UNIT_SELL_PRICE],

      ROUND(terms.discountedMONTHlyprice,2) AS DiscMnthPriceRounded,
      1 AS QtyOrdered,
      1 AS EXT_SELL_PRICE,

	  CASE
		  WHEN ISNULL(terms.TERM, terms.GrpFlag) = 1 
			AND DATEDIFF(MONTH, terms.CreatedDate, terms.TermStDt) < 13 
			AND YEAR(
			         CASE WHEN terms.TERM = 1 AND terms.GrpFlag = 1 
			              THEN terms.CreatedDate 
						  ELSE terms.TermStDt 
					 END
					 ) < 2016 THEN 'CONVERSION'
		  WHEN YEAR(terms.TermStDt) < 2016 THEN 'CONVERSION'
		  WHEN ISNULL(terms.TERM, 0) > 1 AND YEAR(terms.TermStDt) >= 2016 THEN ''
		  WHEN YEAR(terms.CreatedDate) >= 2016 THEN ''
	  ELSE '--->>POSSIBLE ERROR<<---'
	  END AS [CONVERSION_DATA],

	  terms.CreatedDate, 
	  terms.TermStDt,

	  CASE
		  WHEN terms.term = 1 
			AND terms.TermRow = 1 
			AND mininv.EarliestInvoiceDetailID IS NOT NULL 
		  THEN CAST(ISNULL(round(CAST(mininv.MONTHlyPrice  AS NUMERIC(20,8)), 2), -999999) as VARCHAR(30))
		  WHEN terms.term = 1 
		    AND terms.TermRow = 1 
		    AND mininv.EarliestInvoiceDetailID IS NULL  
		  THEN CAST(-999999 AS VARCHAR(30))
	  ELSE '' 
	  END AS STUB_AMOUNT,

	  CASE WHEN terms.TermRow = 1 THEN terms.TermStDt ELSE terms.LineItemStartDate END AS AdjustedTermStDt,
	  CASE WHEN terms.TermRow = mvt.MAXTermRow THEN terms.TermRenewDt ELSE terms.LineItemENDDate END AS AdjustedTermRenewDt,

	  terms.TERM, 
	  terms.TermRow, 
	  mvt.MAXTermRow, 
	  terms.GrpFlag,
	  terms.LineItemStartDate,
	  terms.LineItemEndDate,
	  terms.StatusChangeFlag,
	  su.SalesUnitDesc,
	  '' AS IgnoreFlag,
	  '' AS IsContractCreatedThisMONTH,
	  '' AS [IsContractInActiveAtEndOfMONTH],
	  '' AS [IsLineItemInActiveAtEndOfMONTH],
	  '' AS ActionType,
	  '' AS IsRenewal,
	  p.CoStarBrandID,
	  csb.CoStarBrandCode,
	  p.ProductDesc AS ProductName,
	  pm.ProductMarketTypeID,

	  CASE WHEN ISNULL(su.ProductMarketTypeID, 0) = 6 THEN 1 ELSE ISNULL(su.ProductMarketTypeID, 0) END AS ProductMarketTypeID2,

	  mt.ProductMarketTypeDesc,

	  CASE WHEN pm.ProductMarketTypeID = 2 AND su.SalesUnitCD IS NOT NULL THEN LEFT(su.SalesUnitCD, 2) ELSE NULL END AS StateCD,

	  '' AS OrigSalesUnit ,
	  '' AS UpdatedSalesUnit ,
	  '-->--not needed?--<--' AS PropertyID,
	  NULL AS CurrentContractTerm,

	  DATEDIFF(MONTH, CASE 
		                  WHEN DAY(terms.TermStDt) = 1 THEN CAST(DATEADD(MONTH, DATEDIFF(MONTH, 0, terms.TermStDt), 0) AS DATE) 
		                  WHEN DAY(terms.TermStDt) > 1 THEN CAST(DATEADD(MONTH, DATEDIFF(MONTH, 0, terms.TermStDt) + 1, 0) AS DATE) 
	                  END, DATEADD(MONTH, 1, terms.TermRenewDt))  
	  AS CurrentTermMONTHs,

	  terms.CreatedDate AS LineItemCreatedDate ,
	  '' AS ContractTermID,
	  (cc.firstName + ' ' + cc.LastName) AS AEContactName,

	  CASE l.LineItemInvoiceConfigurationID 
		WHEN 1 THEN billloc.LocationName
	           ELSE siteloc.LocationName 
	  END AS BillingLocationName,

      CASE l.LineItemInvoiceConfigurationID 
		WHEN 1 THEN billloc.CountryCode
		       ELSE siteloc.CountryCode 
	  END AS CountryCode,

      CASE 
		  WHEN terms.ProductID IN (225,226,227,228,229,230,231,232,233,234,239,240,241,245,246,247,
			                       248,249,250,251,252,253,261,265,267,268,269,270,277,281,282,284) THEN 0
		  ELSE rm.RevenueMarketID
	  END AS DerivedSalesUnitID,

      CASE 
	      WHEN terms.BundleID IS NULL THEN CAST(terms.ProductID AS NVARCHAR(20))
		  ELSE CAST(terms.BundleID AS NVARCHAR(20)) 
	  END AS DerivedProductID,

      CASE 
	      WHEN terms.BundleID IS NULL THEN CAST(p.ProductName AS NVARCHAR(50))
	      ELSE CAST(bt.BundleTypeDesc AS NVARCHAR(50)) + 'BID'
	  END AS DerivedProductName

	  , '' AS MONTHSequence,

	  /* OTHER REVENUEITEMSRAW Columns -- FROM spMapData --END-- */

      '' AS SOB_ID,
      '' AS CurrentSKU,
      mininv.DaysInStubMONTH AS DaysInStubMONTH,
      mininv.StubDays AS StubDays,
      '' AS StubDailyRate,
      '' AS HasInvalidStubData,
      '' AS StubDailyListRate,
      '' AS StubPeriodMONTHlyDiscountedRate,
      mininv.EarliestInvoiceDetailID AS MEAFirstPricingDetailID,
      '' AS MEAFirstPricingDetailDiscountedMONTHlyPrice,
      mininv.EarliestInvoiceDetailID AS MEAFirstInvoiceDetailID,
      mininv.MEAInvoiceFirstDateOfPeriod,
      mininv.BillingStartDate AS MEAInvoiceBillingStartDate,
      DAY(mininv.BillingStartDate) AS MEAInvoiceBillingStartDateDay,
      mininv.GrossMONTHlyPrice AS MEAInvoiceBillingFirstPeriodGross,
      mininv.MONTHlyPrice AS MEAInvoiceBillingFirstPeriodDiscounted,
      '' AS MEAInvoiceBillingFirstPeriodStubAmount,
      '' AS AptBundleID,
      '' AS ProductCount,
      '' AS LineType,
      '' AS NAVDocumentNo,
      '' AS NAVLineNo,
      '' AS NAVQuantity,
      '' AS NAVUnitPrice,
      '' AS NAVAmount,
      '' AS NAVBillingStartDate,
      '' AS NAVBillingEndDate,
      '' AS NAVInvoiceDate,
      '' AS CRMInvoiceDate,
      '' AS NAVDescription3,
      '' AS CRMInvoiceDetailID,
      '' AS IsMappedToNAV,
      '' AS IsCreditCard,
      '' AS EventSource,
      '' AS CanBePriced,
      '' AS PricingType,
      '' AS CheckOutOk,
      '' AS MONTHsOfFullDiscount,
      '' AS IsInternContract,
      '' AS MarketCount,
      '' AS LineitemCreadedDate,
      '' AS PreviousSKU,
      '' AS PipelineID,
      '' AS LineItemPricingDetailTypeID,
      '' AS LineItemPricingDetailSubTypeID,
      '' AS ListPrice,
      '' AS SalesUnits,
      '' AS QUANTITY_ORDERED,
      '' AS STUB_AMOUNT_LISTPRICE,
      '' AS EXT_AMOUNT,
      '' AS EXT_AMOUNT_LISTPRICE,
      '' AS ProductMarketTypeCounts,
      '' AS UseContractUserLimit,
      '' AS CurrentTermID,
      '' AS UpdatedDate,
       '' AS RevenueItemRawID,
      '' AS IsLineItemCreatedThisMONTH

INTO #SalesOrders
FROM #ValidTerms terms
	JOIN Enterprise.dbo.LineItem l (NOLOCK) 
		ON terms.lineitemid = l.lineitemid
	JOIN Enterprise.dbo.[Contract] con (NOLOCK) 
		ON terms.contractid = con.contractid
	JOIN Enterprise.dbo.Product p (NOLOCK) 
		ON terms.ProductID = p.ProductID
	LEFT JOIN Enterprise.dbo.CoStarBrand csb (NOLOCK) 
		ON p.CoStarBrandID = csb.CoStarBrandID
	JOIN Enterprise.dbo.Location loc (NOLOCK) 
		ON con.LocationID = loc.LocationID
	JOIN Enterprise.dbo.Location siteloc (NOLOCK) 
		ON terms.SiteLocationID = siteloc.LocationID
	JOIN Enterprise.dbo.Location billloc (NOLOCK) 
		ON terms.SiteLocationID = billloc.LocationID
	LEFT JOIN Enterprise.dbo.Bundle b 
		ON terms.BundleID = b.BundleID
	LEFT JOIN Enterprise.dbo.BundleType bt 
		ON b.BundleTypeID = bt.BundleTypeID
	LEFT JOIN Enterprise.dbo.SalesUnit su (NOLOCK) 
		ON terms.SalesUnitID = su.SalesUnitID
	LEFT JOIN Enterprise.dbo.SalesUnitProductMarket supm (NOLOCK) 
		ON terms.SalesUnitID = supm.SalesUnitID
	LEFT JOIN Enterprise.dbo.ProductMarket pm (NOLOCK) 
		ON pm.ProductMarketID = supm.ProductMarketID
	LEFT JOIN Enterprise.dbo.ProductMarketType mt (NOLOCK) 
		ON mt.ProductMarketTypeID = pm.ProductMarketTypeID
	LEFT JOIN Enterprise.dbo.Contact cc (NOLOCK) 
		ON ISNULL(loc.CurrentAEContactID,0) = cc.ContactID
	LEFT JOIN Enterprise.dbo.RevenueMarket rm (NOLOCK) 
		ON su.RevenueMarketID = rm.RevenueMarketID 
	LEFT JOIN #ValidTerms fsr 
		ON terms.LineItemID = fsr.LineItemID 
		  AND fsr.TERM = 1 
		  AND fsr.TermRow = 1
		  AND fsr.E1_TERM = 1
	LEFT JOIN #Majors majors 
		ON l.SiteLocationID = majors.locationid 
		  AND csb.CoStarSubsidiaryID = majors.CoStarSubsidiaryID
	LEFT JOIN #MAXValidTermRows mvt 
		ON terms.TERM = mvt.TERM 
		  AND terms.LineItemID = mvt.LineItemID 
	LEFT JOIN #tmpInvoiceDetail mininv 
		ON terms.LineItemID = mininv.LineItemID
ORDER BY terms.LineItemID, RULE_START_DATE, adjustedtermstdt

END
-- /**** END ** CONSTRUCT SALES ORDERS WITH DISCOUNTED MONTHLY PRICE AND BSD ****/ --


-- /**** BEGIN ** CONSTRUCT SKUs ****/ --
IF OBJECT_ID('tempdb..#SKUs') IS NULL
BEGIN
     SELECT 
	       so.LineItemID,
           so.DEAL_ID,
	       so.SALES_ORDER_LINE_ID,
	       CASE so.ProductID	
				WHEN 246 THEN 'SILV'
				WHEN 245 THEN 'GOLD'
				WHEN 246 THEN 'SILV'
				WHEN 247 THEN 'PLAT'
				WHEN 248 THEN 'DIAM'
				WHEN 267 THEN 'SILV'
				WHEN 268 THEN 'GOLD'
				WHEN 269 THEN 'PLAT'
				WHEN 270 THEN 'DIAM'
		   END AS ProductLevel,
		   so.CurrentTermMONTHs
INTO #SKUs
FROM #SalesOrders so

END


-- /**** BEGIN ** BUILD opt.[vwSalesOrder] OUTPUT ****/ --
IF OBJECT_ID('tempdb..#RevProSalesOrders') IS NOT NULL DROP TABLE #RevProSalesOrders
BEGIN
SELECT
	  s.ContractID,
	  s.LineItemID,
	  s.SiteLocationID,
	  s.DerivedSalesUnitID,
	  s.CreatedDate,
	  s.CLIENT_ID,
	  s.DEAL_ID,
	  s.DerivedProductID,
	  s.ProductID,
	  '2281' AS CARVE_IN_DEF_REVENUE_SEG1,		
	  'SAL' AS CARVE_IN_DEF_REVENUE_SEG3,			
	  '1125' AS UNBILLED_AR_SEG1,		
	  'SAL' AS UNBILLED_AR_SEG3,		
	  'SAL' AS CARVE_IN_REVENUE_SEG3,		
	  'SAL' AS CARVE_OUT_REVENUE_SEG3,		
	  s.IsMajor AS ATTRIBUTE24,
	  'SAL' AS ATTRIBUTE26,
	  mu.MonetaryUnitCode AS BASE_CURR_CODE,
	  s.[CountryCode] AS BILL_TO_COUNTRY,
	  s.[BillingLocationName] AS BILL_TO_CUSTOMER_NAME,
	  s.[BillingLocationID] AS BILL_TO_CUSTOMER_NUMBER,
	  s.CoStarBrandCode AS BUSINESS_UNIT,
	  s.[SiteLocationID] AS CUSTOMER_ID,
	  s.[SiteLocationName] AS CUSTOMER_NAME,
	  '2280' AS DEF_ACCTG_SEG1,
	  'SAL' AS DEF_ACCTG_SEG3,
	  'Y' AS DEFERRED_REVENUE_FLAG ,
	  '??' AS ELIGIBLE_FOR_CV,
	  '??' AS ELIGIBLE_FOR_FV,
	  1 AS EX_RATE,
	  s.EXT_AMOUNT_LISTPRICE AS EXT_LIST_PRICE,
	  s.EXT_AMOUNT AS EXT_SELL_PRICE  , 
	  'N' AS FLAG_97_2,
	  '' AS INVOICE_DATE,
	  '' AS INVOICE_ID,
	  '' AS INVOICE_LINE,
	  '' AS [INVOICE_NUMBER],
	  '' AS INVOICE_TYPE,
	  s.[DerivedProductName] AS ITEM_DESC,
	  s.[DerivedProductID] AS ITEM_ID,
	  s.CurrentSKU AS ITEM_NUMBER,
	  '2282' AS LT_DEFERRED_ACCOUNT,
	  'N' AS NON_CONTINGENT_FLAG,
	  '' AS ORDER_LINE_TYPE,
	  '' AS ORDER_TYPE,
	  s.[CoStarBrandID] AS ORG_ID,
	  '' AS [ORIG_INV_LINE_ID]  ,         
	  'N' AS [PCS_FLAG],
	  '' AS [PO_NUM],
	  s.[LineItemTypeID] AS PRODUCT_CATEGORY,
	  2 AS PRODUCT_CLASS,
	  s.[DerivedProductName] AS PRODUCT_FAMILY,
	  s.[DerivedProductName] AS PRODUCT_LINE,
	  '' AS QUANTITY_INVOICED,
	  QUANTITY_ORDERED AS QUANTITY_ORDERED,
	  QUANTITY_ORDERED AS QUANTITY_SHIPPED,
	  '' AS QUOTE_NUM,
	  1 AS RCURR_EX_RATE,
	  'N' AS RETURN_FLAG,
	  'SAL' AS REV_ACCTG_SEG3,
	  CAST(s.RenewalDate AS DATE) AS RULE_END_DATE,

	  CASE WHEN DAY(s.CurrentTermStartDate) > 1 THEN  DATEADD(MONTH, DATEDIFF(MONTH, '19000101', s.CurrentTermStartDate) + 1, '19000101') 
		ELSE s.CurrentTermStartDate 
	  END AS RULE_START_DATE,

	  s.ContractID AS SALES_ORDER,
	  s.[ContractID] AS SALES_ORDER_ID,
	  '' AS SALES_ORDER_LINE,
	  s.AEContactID AS [SALES_REP_ID],
	  s.AEContactName AS [SALESREP_NAME],
	  'RIG' AS SEC_ATTR_VALUE,
	  CAST(s.LineItemCreatedDate AS DATE) AS SO_BOOK_DATE,
	  SOB_ID,
	  'N' AS STANDALONE_FLAG,
	  'N' AS STATED_FLAG,
      'SO' AS TRAN_TYPE,
      mu.MonetaryUnitCode AS TRANS_CURR_CODE,
	  CAST(s.LineItemCreatedDate AS DATE) AS TRANS_DATE,
	  'Y' AS UNBILLED_ACCOUNTING_FLAG,
	  'N' AS UNDELIVERED_FLAG,
	  ISNULL(s.ListPrice ,0) AS UNIT_LIST_PRICE,
	  s.MONTHlyPrice AS UNIT_SELL_PRICE,
	  FV_YEAR,
	  s.STUB_AMOUNT AS STUB_AMOUNT,
	  s.STUB_AMOUNT_LISTPRICE AS STUB_AMOUNT_LISTPRICE,
	  'N' AS CANCELLED_FLAG,
	  s.CoStarBrandID,
	  s.AdjustedEventYEAR,
	  s.AdjustedEventMONTH,
	  CASE WHEN s.LineItemStatusID = 200 THEN 1 ELSE 0 END AS IsCorrectingEntry	
INTO #RevProSalesOrders	
FROM #SalesOrders s
	LEFT JOIN Enterprise..MonetaryUnit mu 
		ON s.MonetaryUnitID = mu.MonetaryUnitID

END


SELECT *,
		ROW_NUMBER() OVER(ORDER BY s.SiteLocationID, s.DerivedSalesUnitID) AS COMBO_ID 
FROM (SELECT DISTINCT
	         s.SiteLocationID,
             s.DerivedSalesUnitID,
             COUNT(DISTINCT s.lineitemID) AS CNT
	  FROM #RevProSalesOrders s
	  WHERE s.ProductID in (248,245,247,246,281,270,268,269,267,282)
	  GROUP BY s.SiteLocationID, s.DerivedSalesUnitID
	) s


SELECT 
	  s.SiteLocationID,
	  s.ContractID,
	  s.LineItemID,
	
	  s.DerivedSalesUnitID,
	  s.CreatedDate,
	  s.ProductID,
	  s.ITEM_DESC AS ProdoctDesc,

	  s.CLIENT_ID,
	  s.DEAL_ID,
	  s.CARVE_IN_DEF_REVENUE_SEG1,
	  'USA' AS CARVE_IN_DEF_REVENUE_SEG2, 
	  s.CARVE_IN_DEF_REVENUE_SEG3,
	  '' AS CARVE_IN_DEF_REVENUE_SEG4, 

	  s.UNBILLED_AR_SEG1,
	  'USA' AS UNBILLED_AR_SEG2, 
	  s.UNBILLED_AR_SEG3,
	  '' AS UNBILLED_AR_SEG4,
		
	  '' AS CARVE_IN_REVENUE_SEG1, 
	  'USA' AS CARVE_IN_REVENUE_SEG2, 
	  s.CARVE_IN_REVENUE_SEG3,
	  '' AS CARVE_IN_REVENUE_SEG4, 	

	  '' AS CARVE_OUT_REVENUE_SEG1, 
	  'USA' AS CARVE_OUT_REVENUE_SEG2, 
	  s.CARVE_OUT_REVENUE_SEG3,
	  '' AS CARVE_OUT_REVENUE_SEG4, 

	  s.ATTRIBUTE24,
	  'USA' AS ATTRIBUTE25,
	  s.ATTRIBUTE26,
	  '' AS ATTRIBUTE27,

	  s.BASE_CURR_CODE,
	  s.BILL_TO_COUNTRY,
	  s.BILL_TO_CUSTOMER_NAME,
	  s.BILL_TO_CUSTOMER_NUMBER,
	  s.BUSINESS_UNIT,
	  s.CUSTOMER_ID,
	  s.CUSTOMER_NAME,

	  s.DEF_ACCTG_SEG1,
	  'USA' AS DEF_ACCTG_SEG2, -
	  s.DEF_ACCTG_SEG3,
	  '' AS DEF_ACCTG_SEG4, 

	  s.DEFERRED_REVENUE_FLAG,
	  '' AS DISCOUNT_AMOUNT,
	  '' AS DISCOUNT_PERCENT,

	  CASE WHEN FV_YEAR < 2016 THEN 'N' ELSE 'Y' END AS ELIGIBLE_FOR_CV,
	  CASE WHEN FV_YEAR < 2016 THEN 'N' ELSE 'Y' END AS ELIGIBLE_FOR_FV,

      s.EX_RATE,
      '??' AS EXT_LIST_PRICE,
      '??' AS EXT_SELL_PRICE,
      s.FLAG_97_2,

      s.INVOICE_DATE,
      s.INVOICE_ID,
      s.INVOICE_LINE,
      '' AS INVOICE_LINE_ID,
      s.INVOICE_NUMBER,
      s.INVOICE_TYPE,

      s.ITEM_DESC,
      s.ITEM_ID,
      s.ITEM_NUMBER,
      s.LT_DEFERRED_ACCOUNT,
      s.NON_CONTINGENT_FLAG,

      s.ORDER_LINE_TYPE,
      s.ORDER_TYPE,
      s.ORG_ID,
      s.ORIG_INV_LINE_ID,

      s.PCS_FLAG,
      s.PO_NUM,
      s.PRODUCT_CATEGORY,
      s.PRODUCT_CLASS,
      s.PRODUCT_FAMILY,
      s.PRODUCT_LINE,

      s.QUANTITY_INVOICED,
      s.QUANTITY_ORDERED,
      s.QUANTITY_SHIPPED,

      s.QUOTE_NUM,
      s.RCURR_EX_RATE,
      s.RETURN_FLAG,

      '' AS REV_ACCTG_SEG1, 
      'USA' AS REV_ACCTG_SEG2, 
      s.REV_ACCTG_SEG3,
      '' AS REV_ACCTG_SEG4,

      s.RULE_END_DATE,
      s.RULE_START_DATE,
      s.SALES_ORDER,
      s.SALES_ORDER_ID,
      s.SALES_ORDER_LINE,
      '' AS SALES_ORDER_LINE_ID,

      s.SALES_REP_ID,
      s.SALESREP_NAME,
      '' AS SCHEDULE_SHIP_DATE,
      s.SEC_ATTR_VALUE,
      '' AS SHIP_DATE,
      s.SO_BOOK_DATE,

      s.SOB_ID,
      s.STANDALONE_FLAG,
      s.STATED_FLAG,
      s.TRAN_TYPE,
      s.TRANS_CURR_CODE,
      s.TRANS_DATE,

      s.UNBILLED_ACCOUNTING_FLAG,
      s.UNDELIVERED_FLAG,
      s.UNIT_LIST_PRICE,
      s.UNIT_SELL_PRICE,
      s.FV_YEAR,
      s.STUB_AMOUNT,

      CASE WHEN FV_YEAR < 2016 THEN 'CONVERSION' ELSE '' END AS CONVERSION_DATA,

      s.CANCELLED_FLAG,

      '' AS CARVE_IN_DEF_REVENUE_SEG5,
      '' AS UNBILLED_AR_SEG5,
      '' AS CARVE_IN__REVENUE_SEG5,
      '' AS CARVE_OUT_REVENUE_SEG5,
      '' AS DEF_ACCTG_SEG5,
      '' AS REV_ACCTG_SEG5,
      '' AS LT_DEFERRED_ACCOUNT_SEG5,
      '' AS ATTRIBUTE28,
	  '' AS NUMBER5
FROM #RevProSalesOrders s
	LEFT JOIN lookups.GenProdPostingGroup dpd 
		ON s.DerivedProductID = dpd.ProductID
	LEFT JOIN lookups.CarveInRevenue crd 
		ON s.DerivedProductID = crd.ProductID
	LEFT JOIN lookups.RevenueACCTGSEG1 rad 
		ON s.DerivedProductID = rad.ProductID
ORDER BY 1,2,3,4,5


/*
--OLD CODE AND THIS WORKS

select 
	s.SiteLocationID
	, s.ContractID
	, s.LineItemID
	
	, s.DerivedSalesUnitID
	, s.CreatedDate
	, s.ProductID
	, s.ITEM_DESC as ProdoctDesc

	, s.CLIENT_ID
	, s.DEAL_ID
	, s.CARVE_IN_DEF_REVENUE_SEG1
	, 'USA' AS CARVE_IN_DEF_REVENUE_SEG2 -- ISNULL(su.SalesUnitCD,0)
	, s.CARVE_IN_DEF_REVENUE_SEG3
	, '' AS CARVE_IN_DEF_REVENUE_SEG4 --, dpd.GenProdGroup AS CARVE_IN_DEF_REVENUE_SEG4

	, s.UNBILLED_AR_SEG1
	, 'USA' AS UNBILLED_AR_SEG2 -- ISNULL(su.SalesUnitCD,0)
	, s.UNBILLED_AR_SEG3
	, '' AS UNBILLED_AR_SEG4 --, dpd.GenProdGroup AS UNBILLED_AR_SEG4
		
	, '' AS CARVE_IN_REVENUE_SEG1 --, crd.CarveInOut AS CARVE_IN_REVENUE_SEG1	
	, 'USA' AS CARVE_IN_REVENUE_SEG2 -- ISNULL(su.SalesUnitCD,0),
	, s.CARVE_IN_REVENUE_SEG3
	, '' AS CARVE_IN_REVENUE_SEG4 --, dpd.GenProdGroup AS CARVE_IN_REVENUE_SEG4		

	, '' AS CARVE_OUT_REVENUE_SEG1 --, crd.CarveInOut AS CARVE_OUT_REVENUE_SEG1
    , 'USA' AS CARVE_OUT_REVENUE_SEG2 -- ISNULL(su.SalesUnitCD,0),
	, s.CARVE_OUT_REVENUE_SEG3
	, '' AS CARVE_OUT_REVENUE_SEG4 --, dpd.GenProdGroup AS CARVE_OUT_REVENUE_SEG4

	, s.ATTRIBUTE24
    , 'USA' AS ATTRIBUTE25 -- ISNULL(su.SalesUnitCD,0),
	, s.ATTRIBUTE26
	, '' AS ATTRIBUTE27 --, dpd.GenProdGroup AS ATTRIBUTE27

	, s.BASE_CURR_CODE
	, s.BILL_TO_COUNTRY
	, s.BILL_TO_CUSTOMER_NAME
	, s.BILL_TO_CUSTOMER_NUMBER
	, s.BUSINESS_UNIT
	, s.CUSTOMER_ID
	, s.CUSTOMER_NAME

	, s.DEF_ACCTG_SEG1
    , 'USA' AS DEF_ACCTG_SEG2 -- ISNULL(su.SalesUnitCD,0),
	, s.DEF_ACCTG_SEG3
	, '' AS DEF_ACCTG_SEG4 --, dpd.GenProdGroup AS DEF_ACCTG_SEG4

	, s.DEFERRED_REVENUE_FLAG
	, '' AS DISCOUNT_AMOUNT --, (s.UNIT_LIST_PRICE - s.UNIT_SELL_PRICE) AS DISCOUNT_AMOUNT
	, '' AS DISCOUNT_PERCENT --, ((s.[UNIT_LIST_PRICE] - s.[UNIT_SELL_PRICE]) / s.[UNIT_LIST_PRICE]) AS DISCOUNT_PERCENT
	, CASE WHEN FV_YEAR < 2016 THEN 'N' ELSE 'Y' END AS ELIGIBLE_FOR_CV
	, CASE WHEN FV_YEAR < 2016 THEN 'N' ELSE 'Y' END AS ELIGIBLE_FOR_FV

	, s.EX_RATE
	, '??' AS EXT_LIST_PRICE
    , '??' AS EXT_SELL_PRICE  
	, s.FLAG_97_2

	, s.INVOICE_DATE
	, s.INVOICE_ID
	, s.INVOICE_LINE
	, '' AS INVOICE_LINE_ID
	, s.INVOICE_NUMBER
	, s.INVOICE_TYPE

	, s.ITEM_DESC
	, s.ITEM_ID
	, s.ITEM_NUMBER
	, s.LT_DEFERRED_ACCOUNT
	, s.NON_CONTINGENT_FLAG

	, s.ORDER_LINE_TYPE
	, s.ORDER_TYPE
	, s.ORG_ID
	, s.ORIG_INV_LINE_ID

	, s.PCS_FLAG
	, s.PO_NUM
	, s.PRODUCT_CATEGORY
	, s.PRODUCT_CLASS
	, s.PRODUCT_FAMILY
	, s.PRODUCT_LINE

	, s.QUANTITY_INVOICED
	, s.QUANTITY_ORDERED
	, s.QUANTITY_SHIPPED

	, s.QUOTE_NUM
	, s.RCURR_EX_RATE
	, s.RETURN_FLAG

	, '' AS REV_ACCTG_SEG1 --, rad.REVACCTGSEG1 AS REV_ACCTG_SEG1
    , 'USA' AS REV_ACCTG_SEG2 -- ISNULL(su.SalesUnitCD,0),
	, s.REV_ACCTG_SEG3
	, '' AS REV_ACCTG_SEG4 --, dpd.GenProdGroup AS REV_ACCTG_SEG4

	, s.RULE_END_DATE
	, s.RULE_START_DATE
	, s.SALES_ORDER
	, s.SALES_ORDER_ID
	, s.SALES_ORDER_LINE
	, '' AS SALES_ORDER_LINE_ID

	, s.SALES_REP_ID
	, s.SALESREP_NAME
	, '' AS SCHEDULE_SHIP_DATE
	, s.SEC_ATTR_VALUE
	, '' AS SHIP_DATE
	, s.SO_BOOK_DATE

	, s.SOB_ID
	, s.STANDALONE_FLAG
	, s.STATED_FLAG
	, s.TRAN_TYPE
	, s.TRANS_CURR_CODE
	, s.TRANS_DATE

	, s.UNBILLED_ACCOUNTING_FLAG
	, s.UNDELIVERED_FLAG
	, s.UNIT_LIST_PRICE
	, s.UNIT_SELL_PRICE
	, s.FV_YEAR
	, s.STUB_AMOUNT
	, CASE WHEN FV_YEAR < 2016 THEN 'CONVERSION' ELSE '' END AS CONVERSION_DATA
	, s.CANCELLED_FLAG

	, '' AS CARVE_IN_DEF_REVENUE_SEG5
	, '' AS UNBILLED_AR_SEG5
	, '' AS CARVE_IN__REVENUE_SEG5
	, '' AS CARVE_OUT_REVENUE_SEG5
	, '' AS DEF_ACCTG_SEG5
	, '' AS REV_ACCTG_SEG5
	, '' AS LT_DEFERRED_ACCOUNT_SEG5
	, '' AS ATTRIBUTE28
	, '' AS NUMBER5
FROM #RevProSalesOrders s
LEFT JOIN lookups.GenProdPostingGroup dpd on s.DerivedProductID = dpd.ProductID
LEFT JOIN lookups.CarveInRevenue crd on s.DerivedProductID = crd.ProductID
LEFT JOIN lookups.RevenueACCTGSEG1 rad on s.DerivedProductID = rad.ProductID
ORDER BY 1,2,3,4,5
*/
