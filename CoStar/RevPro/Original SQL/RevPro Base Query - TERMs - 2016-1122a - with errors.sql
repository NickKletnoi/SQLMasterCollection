USE RevenueProcessing

declare @line int 
	--= 
	--879144
	--1065256
	--1514403
	--695699 --Dates do not work for determining term length. All have a term start of 2009
	--88578 --Dates do not work for determining term length. Term start was manipulated to appear as 8/3/2001, which isnt correct for current term. ALSO, the Renewal and Term End Dates do NOT match.
	--1064508 -- generates erroneous lines caused by bad data. Should be able to flag them as error for exclusion in final load based on UnitSellPrice = -999999, but need to verify with larger dataset.
	--1534860 --rebill and term change

declare @contract int
	--=
	--113911
	--10867 --See error for line 1064508 --1064508 not resolved, but records arent in scope.
	--58368
	--11618
	--157900


declare @cust int 
	=
	476
	--41264081
	--31427726
	--116790
	--36829203
	--2694502
	--56285121 --APTs early cancel
	--31427726
	--53181661
	--1430043 --Cust with varying MEAs across multiple contracts.



/*----------  TODO  --------
1. Check and make sure that dates are not null for those used with DATEDIFF
2. For #Events can we remove the GroupBy all together or do we actually make use of the MAX() values.
3. #ValidTerms - may need to consider user count changes
------------  TODO  --------*/


--IF OBJECT_ID('tempdb..#Majors') IS not NULL drop table #Majors
IF OBJECT_ID('tempdb..#StartTerms') IS not NULL drop table #StartTerms
IF OBJECT_ID('tempdb..#Terms') IS not NULL drop table #Terms
IF OBJECT_ID('tempdb..#Events') IS not NULL drop table #Events
IF OBJECT_ID('tempdb..#ValidTerms') IS not NULL drop table #ValidTerms
IF OBJECT_ID('tempdb..#MaxValidTermRows') IS not NULL drop table #MaxValidTermRows
IF OBJECT_ID('tempdb..#SalesOrders') IS not NULL drop table #SalesOrders
IF OBJECT_ID('tempdb..#tmpInvoiceDetail') IS not NULL drop table #tmpInvoiceDetail
IF OBJECT_ID('tempdb..#SKUs') IS not NULL drop table #SKUs
IF OBJECT_ID('tempdb..#RevProSalesOrders') IS not NULL drop table #RevProSalesOrders

/*
drop table #StartTerms
drop table #Terms
drop table #Events
drop table #ValidTerms
drop table #MaxValidTermRows
drop table #tmpInvoiceDetail
drop table #SalesOrders
drop table #SKUs
drop table #RevProSalesOrders
*/


-- /**** BEGIN ** DETERMINE ACTIVE LINE ITEMS and SET ParentMEA ****/ --
declare @FindActiveLines bit = 1;
declare @TotalActiveLines int = 0;
IF OBJECT_ID('tempdb..##ActiveLineItems') IS not NULL
BEGIN
select @TotalActiveLines = (count(1)) from ##ActiveLineItems;
PRINT @TotalActiveLines
--select (count(1)) from ##ActiveLineItems
END

IF OBJECT_ID('tempdb..##ActiveLineItems') IS not NULL and @TotalActiveLines = 0
BEGIN
INSERT INTO ##ActiveLineItems
(
	LocationID, ContractID
	, ContractMinCreateDate
	, ContractMinMEA
	, LineItemID
	, LineItemMEA
	, LineItemCreatedDate
	--, CurrentMEA
	, IsActive2016
	, SiteLocationID
	, ProductID
	, ComboID
)
	----[IdentityKey] int identity(1,1) NOT NULL, 
	--[CurrentMEA] varchar(100) NULL,
	--[LineItemMEA] varchar(100) NULL,
	--[ParentMEA] varchar(100) NULL,
	--[ParentIdentity] int, 
	----[RevenueItemType] [varchar](15) NOT NULL,
	--[LocationID] int NOT NULL,
	--[ContractID] int NOT NULL,
	--[ContractMinCreateDate] date,
	--[ContractMinMEA] varchar(100) NULL,
	--[LineItemID] int NOT NULL,
	----[AdjustedEventDate] date NOT NULL,
	----[CurrentSKU] varchar(100) NULL,
	----[SequenceNumber] int NOT NULL,
	--[IsActive2016] bit NOT NULL
SELECT DISTINCT 
	c.LocationID
	, l.ContractID
	, fcd.ContractFirstCreateDate as ContractMinCreateDate
	, cast(year(fcd.ContractFirstCreateDate) as varchar(4)) + right('00' + cast(month(fcd.ContractFirstCreateDate) as varchar(2)), 2) as ContractMinMEA
	, l.LineItemID
	, cast(year(l.CreatedDate) as varchar(4)) + right('00' + cast(month(l.CreatedDate) as varchar(2)), 2) as LineItemMEA
	, l.CreatedDate as LineItemCreatedDate
	, CASE 
		--WHEN (id.ChargeYear >= 2016 or id.InvoiceYear >= 2016) THEN 1
		WHEN l.BillingStartDate is null THEN 0
		WHEN (l.LineItemStatusID in (4,5,6) and l.LineItemStatusDate >= '2016-01-01') THEN 1
		WHEN l.LineItemStatusID in (1,2,3,7) THEN 1 
		ELSE 0
	END AS [IsActive2016]
	, l.SiteLocationID
	, l.ProductID
	, isnull(l.BundleID,0) as ComboID
FROM Enterprise.dbo.LineItem l (NOLOCK)
join Enterprise.dbo.Contract c (NOLOCK) ON l.contractid = c.contractid
join (
		select 
			--ROW_NUMBER() OVER(partition by l2.ContractID ORDER BY l2.CreatedDate) as CreateOrder
			--, l2.ContractID
			--, l2.CreatedDate
			--ROW_NUMBER() OVER(partition by l2.ContractID ORDER BY l2.CreatedDate) as CreateOrder
			l2.ContractID
			, min(l2.CreatedDate) as ContractFirstCreateDate
		from Enterprise.dbo.LineItem l2 (NOLOCK)
		--join Enterprise.dbo.Contract c2 (NOLOCK) no l2.contractid = c2.contractid
		group by l2.contractid
	) fcd on l.contractid = fcd.contractid --Determine first create date from a given contract's set of line items
--left join Enterprise.dbo.InvoiceDetail id (NOLOCK) on l.lineitemid = id.lineitemid --<<--TODO - need to include
--where 
--	(l.LineItemStatusID in (4,5,6) and l.LineItemStatusDate >= '2016-01-01')
--	or (id.ChargeYear >= 2016 or id.InvoiceYear >= 2016) 
--	or l.LineItemStatusID in (1,2,3,7)
order by c.LocationID, l.SiteLocationID, ComboID, l.CreatedDate, l.ProductID
--PRINT 'RUN'

--select top 100 * from ##ActiveLineItems where locationid = 476

UPDATE ali
SET ParentMEA = parent.ContractMinMEA, ParentIdentity = parent.identitykey, ParentLineItemID = parent.LineItemID
from ##ActiveLineItems ali
join 
	(
		select 
			IdentityKey
			, LineItemID
			, LocationID 
			, ContractID
			, ContractMinCreateDate
			, ContractMinMEA
			, ROW_NUMBER() OVER(partition by ali2.LocationID, ali2.ContractMinMEA ORDER BY ali2.contractid) as CreateOrder
		from ##ActiveLineItems ali2
	) parent on ali.locationid = parent.locationid and CreateOrder = 1
		and ali.ContractMinMEA = parent.ContractMinMEA

--select * from ##ActiveLineItems where locationid = 2694502 --31427726	
--select * from ##ActiveLineItems where lineitemid = 1368412
	 
END
-- /**** END ** DETERMINE ACTIVE LINE ITEMS ****/ --


-- /**** BEGIN ** DETERMINE MAJORS ACCOUNTS ****/ --
-- 2016-1006 RSturm: Per Denning, Major accounts should be identified by the specific location (not the HQ) and the subsidiary.
--		Similarly, the major flag should be a property of the lineitem, not the contract. Therefore, the site location and product's subsidiary ID will define Majors.
IF OBJECT_ID('tempdb..#Majors') IS NULL
BEGIN
select LocationID 
	, CoStarSubsidiaryID
	, case
		when CoStarSubsidiaryID = 1 and 
			LocationID in (29876840, 53663, 34653756, 4525273, 157964, 521722,
			22692637, 625994, 101894, 330353 , 190639, 25725062, 1452,
			32419108, 54205, 22525888, 25881227, 23740109, 12519456) then 1
		else MajorAccountFlag
	end as MajorAccountFlag
INTO #Majors
from Enterprise.dbo.CustomerInfo
order by 1, 2

-- 2016-1006 RSturm: Major accounts identified by Scott Summerall and Lior.
--		HQLocationID in (29876840,53663,34653756,4525273	,157964	,521722	,			
--		22692637	,625994	,101894	,330353	,190639	,25725062	,1452	,
--		32419108	,54205	,22525888	,25881227	,23740109	,12519456)		

--select LocationID --408 occurrences
--	--, AcctRegionID
--	, count(distinct CoStarSubsidiaryID)
--	, count(distinct MajorAccountFlag)
--from Enterprise.dbo.CustomerInfo
--group by LocationID --, CoStarSubsidiaryID --, AcctRegionID
--having count(distinct MajorAccountFlag) > 1
--order by 2
--select * from #Majors where majoraccountflag = 1 order by 1
END
-- /**** END ** DETERMINE MAJORS ACCOUNTS ****/ --


--select top 10 * from Enterprise.dbo.InvoiceDetail id (NOLOCK)
--select * from Enterprise.dbo.LineItemStatus


-- /**** BEGIN ** ASSIGN PROPER TERM START DATES TO POSSIBLE TERMS FROM LINE ITEM SNAP SHOTS ****/ --
IF OBJECT_ID('tempdb..#StartTerms') IS NULL
BEGIN
select 
	--ROW_NUMBER() OVER(ORDER BY  /*liss.CurrentTermStartDate,*/ liss.RenewalDate) as TERM
	--, 
	liss.LineItemID
	, liss.ContractID
	, case 
		when liss.CurrentTermStartDate is null or liss.RenewalDate is null then re.AdjustedEventDate --isnull(re.AdjustedEventDate, '1900-01-01')
		when DATEDIFF(month, cast(liss.CurrentTermStartDate as date), cast(liss.RenewalDate as date)) > 24 then re.AdjustedEventDate --isnull(re.AdjustedEventDate, '1900-01-01')
		else cast(liss.CurrentTermStartDate as date)
		end as TermStDt
	--, cast(liss.CurrentTermStartDate as date) as TermStDt
	, cast(isnull(liss.RenewalDate, '1900-01-01') as date) as TermRenewDt 
	, liss.LineItemStartDate, liss.LineItemEndDate
	--, DATEDIFF(month, cast(liss.CurrentTermStartDate as date), cast(liss.RenewalDate as date)) as MonthsApart
	--, DATEDIFF(day, cast(liss.CurrentTermStartDate as date), cast(liss.RenewalDate as date)) as DaysApart
	--, case when DATEDIFF(month, cast(liss.CurrentTermStartDate as date), cast(liss.RenewalDate as date)) > 24 then re.AdjustedEventDate
	--	else cast(liss.CurrentTermStartDate as date)
	--	end as TermStartDt
	--, re.*
INTO #StartTerms
from EnterpriseDataMart.dbo.lineitemsnapshot liss (NOLOCK)
join ##ActiveLineItems ali on liss.lineitemid = ali.lineitemid and ali.IsActive2016 = 1
join Enterprise.dbo.contract con (NOLOCK) on liss.ContractID = con.ContractID
--where 
	and (liss.LineItemID = @line or liss.ContractID = @contract or con.LocationID = @cust)
	and liss.billingstartdate is not null
left join EnterpriseReporting.[dbo].[RevenueEvent] re (NOLOCK) on liss.LineItemID = re.LineItemID and re.EventType = 'Renewal' and
	(
		--liss.LineItemStartDate = re.AdjustedEventDate
		--or 
		re.AdjustedEventDate between liss.LineItemStartDate and liss.LineItemEndDate
	)
--group by 
--	liss.LineItemID
--	, liss.CurrentTermStartDate
--	, liss.RenewalDate
--	, cast(liss.CurrentTermStartDate as date)
--	, cast(liss.RenewalDate as date)
--	, case when DATEDIFF(month, cast(liss.CurrentTermStartDate as date), cast(liss.RenewalDate as date)) > 24 then re.AdjustedEventDate
--		else cast(liss.CurrentTermStartDate as date)
--		end
END
-- /**** END ** ASSIGN PROPER TERM START DATES TO POSSIBLE TERMS FROM LINE ITEM SNAP SHOTS ****/ --

--select * from #StartTerms order by 2,1,4

-- /**** BEGIN ** LOCATE POSSIBLE TERMS WITHIN LINE ITEM SNAP SHOTS ****/ --
IF OBJECT_ID('tempdb..#Terms') IS NULL
BEGIN
select 
	ROW_NUMBER() OVER(partition by liss.LineItemID ORDER BY  TermStDt, TermRenewDt) as TERM
	, liss.LineItemID
	, liss.ContractID
	, TermStDt, TermRenewDt 
INTO #Terms
from /*EnterpriseDataMart.dbo.lineitemsnapshot*/ #StartTerms liss (NOLOCK)
--join Enterprise.dbo.contract con (NOLOCK) on liss.ContractID = con.ContractID
where 
	--and (liss.LineItemID = @line or liss.ContractID = @contract or con.LocationID = @cust)
	--and 
	liss.TermStDt is not null
group by 
	liss.LineItemID, liss.ContractID
	, TermStDt, TermRenewDt 
END
-- /**** END ** LOCATE POSSIBLE TERMS WITHIN LINE ITEM SNAP SHOTS ****/ --

/*
select * from #StartTerms where lineitemid = 1947895 order by 2,1,4
select * from #Terms where lineitemid = 1392234 --1947895
*/

-- /**** BEGIN ** CONTINUE TO DEFINE TERMS BASED ON LINE ITEM SNAP SHOTS ****/ --
IF OBJECT_ID('tempdb..#Events') IS NULL
BEGIN
select 
	--ROW_NUMBER() OVER(ORDER BY  liss.snapshotcreateddate) as ROW
	--
	terms.TERM
	--, 
	--'//---LISS---\\'
	, liss.LineItemID
	, isnull(terms.TermStDt, liss.BillingStartDate) as TermStDt
	, cast(isnull(liss.CurrentTermStartDate, '1900-01-01') as date) as TermORIGStDt, cast(isnull(liss.RenewalDate, '1900-01-01') as date) as TermRenewDt
	--, MAX(liss.lineitemstartdate) LineItemStartDate
	, liss.lineitemstartdate
	, liss.LineItemEndDate
	--, MAX(liss.DiscountedMonthlyPrice) DiscountedMonthlyPrice
	, liss.DiscountedMonthlyPrice
	, case 
		--when cast(DATEADD(month, DATEDIFF(month, 0, liss.LineItemStartDate), 0) as DATE) = cast(liss.CurrentTermStartDate as DATE) then ROW_NUMBER() OVER(ORDER BY  liss.snapshotcreateddate)
		when cast(liss.LineItemStartDate as DATE) <= cast(liss.CurrentTermStartDate as DATE) then 1
		else ROW_NUMBER() OVER(ORDER BY  terms.TermStDt, liss.lineitemstartdate, liss.snapshotcreateddate) end as GrpFlag
	, case 
		--when cast(DATEADD(month, DATEDIFF(month, 0, liss.LineItemStartDate), 0) as DATE) = cast(liss.CurrentTermStartDate as DATE) then ROW_NUMBER() OVER(ORDER BY  liss.snapshotcreateddate)
		when cast(liss.LineItemStartDate as DATE) <= cast(liss.CurrentTermStartDate as DATE) then 1
		else ROW_NUMBER() OVER(ORDER BY  terms.TermStDt, liss.lineitemstartdate, liss.snapshotcreateddate) end as GrpFlag2
	--, liss.LineItemStartDate
	--, MAX(liss.NumberOfUsers) NumberofUsers
	, liss.NumberOfUsers
	, cast(DATEADD(month, DATEDIFF(month, 0, liss.LineItemStartDate), 0) as DATE) MonthofEvent
	, liss.LineItemStatusID
	--, '//---FSR---\\'
	--, fsr.*
	, cast(liss.CreatedDate as date) as CreatedDate
	, case
		when liss.PendingLineItemStatusID is null then 0
		else 1
	end as StatusChangeFlag
	, liss.SalesUnitID
	, liss.BundleID
	, liss.SiteLocationID
	, liss.ProductID
	, liss.BillingStartDate
	, liss.LineItemTypeID
	, liss.RenewalDate
	, liss.TermEndDate
	, liss.ContractID
	, liss.CoStarSubsidiaryID
	, liss.MonetaryUnitID
	, liss.BillingLocationID
	--, liss.DiscountedMonthlyPrice
	, liss.CurrentMonthlyPrice
	, liss.CurrentTermStartDate
into #Events
from --#FirstSalesRecord fsr (NOLOCK)
--join 
	EnterpriseDataMart.dbo.lineitemsnapshot liss (NOLOCK) --on --l.LineItemID = liss.LineItemID and
--	fsr.LineItemID = liss.LineItemID
join Enterprise.dbo.Contract con (NOLOCK) on liss.ContractID = con.ContractID
	and (liss.LineItemID = @line or liss.ContractID = @contract or con.LocationID = @cust)
left join #Terms terms on liss.LineItemID = terms.LineItemID
	--and cast(liss.CurrentTermStartDate as date) = terms.TermStDt
	and cast(liss.RenewalDate as date) = terms.TermRenewDt
where 
	liss.billingstartdate is not null --and liss.PendingLineItemStatusID is null
--group by 	
--	terms.TERM
--	, liss.LineItemID
--	, terms.TermStDt
--	, liss.CurrentTermStartDate, liss.RenewalDate
--	, liss.DiscountedMonthlyPrice
--	, case when liss.LineItemStartDate <= cast(liss.CurrentTermStartDate as date) then 1
--		else 0 end 
--	, liss.LineItemStartDate
--	, liss.LineItemEndDate
--	, liss.snapshotcreateddate
--	, liss.LineItemStatusID
--	, cast(liss.CreatedDate as date)
order by 
	--liss.RenewalDate
	--, terms.TermStDt
	--, liss.CurrentTermStartDate
	terms.TermStDt, liss.lineitemstartdate, liss.snapshotcreateddate
END
-- /**** BEGIN ** CONTINUE TO DEFINE TERMS BASED ON LINE ITEM SNAP SHOTS ****/ --

--select * from #Events where lineitemid = 1392234 --1947895 order by TERM

-- /**** BEGIN ** FILTER TERMS TO VALID SUBSET ****/ --
IF OBJECT_ID('tempdb..#ValidTerms') IS NULL
BEGIN
select   
	case 
		when e2.TERM is null then 1
		else e1.TERM
	end as TERM
	, e1.TERM as E1_TERM
	, e1.LineItemID
	, TermStDt
	, TermRenewDt
	, e1.LineItemStartDate
	, e1.LineItemEndDate
	, e1.DiscountedMonthlyPrice
	, GrpFlag
	, e1.NumberofUsers
	, e1.LineItemStatusID
	, e1.CreatedDate
	, ROW_NUMBER() OVER(PARTITION BY e1.lineitemid, e1.TermStDt ORDER BY  e1.TermStDt, e1.lineitemstartdate) AS TermRow
	, e1.StatusChangeFlag
	, e1.SalesUnitID
	, e1.BundleID
	, e1.SiteLocationID
	, e1.ProductID
	, e1.BillingStartDate
	, e1.LineItemTypeID
	, e1.RenewalDate
	, e1.TermEndDate
	, e1.ContractID
	, e1.CoStarSubsidiaryID
	, e1.MonetaryUnitID
	, e1.BillingLocationID
	, e1.CurrentMonthlyPrice
	, e1.CurrentTermStartDate
	--, case
	, e2.LineItemID as E2_LineItemID
	, e2.LineItemStartDate as E2_LineItemStartDate
	, e2.TERM as E2_TERM
	, case 
		when e1.TermRenewDt >= e1.LineItemStartDate and e1.TermStDt <= e1.LineItemStartDate then 1
		when e1.TermRenewDt >= e1.LineItemEndDate and e1.TermStDt <= e1.LineItemEndDate then 1
		else 0 end as IsEvent

INTO #ValidTerms
from #Events e1
left join 
	(
		select TERM, LineItemID, max(LineItemStartDate) LineItemStartDate
		from #Events 
		where LineItemStartDate <= termstdt
		group by TERM, LineItemID
	) e2 on e1.TERM = e2.TERM and e1.LineItemID = e2.LineItemID --and e1.LineItemStartDate = e2.LineItemStartDate
--join Enterprise.dbo.LineItemAudit lia (NOLOCK) on e1.LineItemID = lia.LineItemID and e1.
--join EnterpriseDataMart.dbo.lineitemsnapshot liss (NOLOCK) on 
--	e1.LineItemID = liss.LineItemID
--	and e1.TermStDt = cast(liss.CurrentTermStartDate as date)
--	and e1.TermRenewDt = cast(liss.RenewalDate as date)
--	and e1.LineItemStartDate = liss.LineItemStartDate
where 
	--e1.TermRenewDt >= '2013-01-01' --<<-- Commented out as it may produce error based on need to know first invoice
	--and 
	(
		e2.LineItemID is null
		or
		(
			(e1.TermRenewDt >= e1.LineItemStartDate and e1.TermStDt <= e1.LineItemStartDate)
			or (e1.TermRenewDt >= e1.LineItemEndDate and e1.TermStDt <= e1.LineItemEndDate)
			or (e1.LineItemStartDate < e1.CurrentTermStartDate and e1.LineItemEndDate < e1.CurrentTermStartDate)
		)
		or 
		e1.LineItemEndDate = '9999-12-31' --<--add to pull in line items with only one event(snapshot)
	)
	--(
	--	e1.LineItemStartDate = e2.LineItemStartDate
	--	or 
	--	e1.LineItemStartDate > e2.LineItemStartDate
	--)
order by TermRenewDt, LineItemStartDate--, LineItemEndDate
END
-- /**** END ** FILTER TERMS TO VALID SUBSET ****/ --

/*
select * from #Events 
where lineitemid = 1947895
order by 2 where lineitemid = 1016193
select loc.* from #ValidTerms v
join enterprise..contract c on v.contractid = c.contractid
join enterprise..location loc on c.locationid = loc.locationid
where lineitemid = 1368409
where lineitemid = 1392234 --1947895 --1016193 
order by lineitemid, TermRenewDt, LineItemStartDate, LineItemEndDate 
*/

-- /**** BEGIN ** FILTER TERMS TO VALID SUBSET ****/ --
IF OBJECT_ID('tempdb..#MaxValidTermRows') IS NULL
BEGIN
select  
	vt.TERM
	, vt.LineItemID
	, max(TermRow) as MaxTermRow
INTO #MaxValidTermRows
from #ValidTerms vt
where vt.StatusChangeFlag = 0 and vt.LineItemStatusID in (1,2,3,7)
group by 
	vt.TERM
	, vt.LineItemID

END
-- /**** END ** FILTER TERMS TO VALID SUBSET ****/ --

--select *  from #MaxValidTermRows where lineitemid = 1392234 --1016193

-- /**** BEGIN ** FIND FIRST INVOICE DETAIL ****/ --
--drop table #tmpInvoiceDetail
IF OBJECT_ID('tempdb..#tmpInvoiceDetail') IS NULL --or not exists (select top 1 * from #tmpInvoiceDetail)
BEGIN
	select det.LineItemID, det2.EarliestInvoiceDetailID, det.GrossMonthlyPrice, det.MonthlyPrice, det.BillingStartDate, 
		cast(CAST(det.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(det.chargemonth AS VARCHAR(2)), 2) + '01' as DATE) as [MEAInvoiceFirstDateOfPeriod]
		, det.ChargeMonth, det.ChargeYear, det.PreviousPrice	--<<-- need to add to RevenueItemRaw table
		, CAST(det.BillingStartDate as DATE) as MEAInvoiceBillingStartDatedateKey --<<-- need to add to RevenueItemRaw table
		, case
			when CAST(det.BillingStartDate as DATE) <= cast(CAST(det.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(det.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
				then cast(CAST(det.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(det.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
			else CAST(det.BillingStartDate as DATE)
		end as AdjustedBillingStartDate
		--, cast(DATEADD(month, DATEDIFF(month, 0, ), 0) as DATE)
		, case 
			when right(left(billingdescription, 10), 1) = 't' then cast((rtrim(left(billingdescription, 8))) as date)
			else cast(rtrim(left(billingdescription, 10)) as date)
		end as FirstBillingTermStart
		, cal.DaysRemain as StubDays
		, cal.DaysInMonth as DaysInStubMonth
	into #tmpInvoiceDetail 
	from Enterprise.dbo.InvoiceDetail det (NOLOCK)
	join
		(
		select id.LineItemID as line2
			, min(InvoiceDetailID) EarliestInvoiceDetailID
			--, InvoiceDetailID
			--, (cast(id.chargeyear as nvarchar(4)) + '-' + right('00' + cast(id.chargemonth as nvarchar(2)),2) + '-01')
		from Enterprise.dbo.InvoiceDetail id (NOLOCK)
		join Enterprise.dbo.Contract con (NOLOCK) on id.ContractID = con.ContractID
		join #ValidTerms vt on id.lineitemid = vt.LineItemID and vt.TERM = 1 and vt.TermRow = 1
			and cast(DATEADD(month, DATEDIFF(month, 0, vt.TermStDt), 0) as DATE) <= cast((cast(id.chargeyear as nvarchar(4)) + '-' + right('00' + cast(id.chargemonth as nvarchar(2)),2) + '-01') as date) 
			and vt.TermRenewDt >= cast((cast(id.chargeyear as nvarchar(4)) + '-' + right('00' + cast(id.chargemonth as nvarchar(2)),2) + '-01') as date) 
		/*****TEST CODE*/
		where (id.LineItemID = @line or 
			id.ContractID = @contract or con.LocationID = @cust
		)
		/*****TEST CODE*/ 
		group by id.LineItemID
		) det2 on det.InvoiceDetailID = det2.EarliestInvoiceDetailID
	join [RevenueProcessing].lookups.Calendar cal (NOLOCK) on (case 
		when right(left(billingdescription, 10), 1) = 't' then cast((rtrim(left(billingdescription, 8))) as date)
		else cast(rtrim(left(billingdescription, 10)) as date) end) = cal.DateKey
END

--select * from #validterms order by lineitemid
--select * from Enterprise.dbo.InvoiceDetail id (NOLOCK) where id.contractid = 58368 id.invoicedetailid = 20654597--12800907
--select * from #tmpInvoiceDetail --where LineItemID = 1514403
-- /**** END ** FIND FIRST INVOICE DETAIL ****/ --


-- /**** BEGIN ** CONSTRUCT SALES ORDERS WITH DISCOUNTED MONTHLY PRICE AND BSD ****/ --
IF OBJECT_ID('tempdb..#SalesOrders') IS NULL
--IF OBJECT_ID('tempdb..#SalesOrders') IS not NULL drop table #SalesOrders
BEGIN
select
	--ROW_NUMBER() OVER(ORDER BY id.InvoiceDetailID) as ROW
	--, mininv.EarliestInvoiceDetailID
	--, 
	/* REVENUEITEMRAW Columns --START-- */
	terms.LineItemID
	--, id.InvoiceID
	, '' AS EventDate --is this required?
	, l.ProductID --[ITEM_ID]
	, 'RULE_START_DATE' AS [AdjustedEventDate] --is this required? if so use RULE START
    , 'year(RULE_START_DATE)' AS [AdjustedEventYear] --is this required? if so use RULE START
    , 'month(RULE_START_DATE)' AS [AdjustedEventMonth] --is this required? if so use RULE START
	, terms.BillingStartDate AS [BillingStartDate]
	, '' AS [BillingMonth]
    , terms.LineItemTypeID
    , terms.[RenewalDate]
	, '' AS [OldRenewalDate]
    , terms.[TermEndDate]
    , terms.[NumberOfUsers]
    , terms.[ContractID]
    , terms.[CoStarSubsidiaryID]
    , terms.[MonetaryUnitID]
    , terms.[BillingLocationID]
	, terms.[SiteLocationID]
    , siteloc.LocationName AS [SiteLocationName]
    , isnull(loc.CurrentAEContactID, 0) AS AEContactID
    , terms.[LineItemStatusID]
    , isnull(terms.DiscountedMonthlyPrice, 0) AS DiscountedMonthlyPrice
	, '' AS PriorDiscountedMonthlyPrice
	, '' AS DiscountedMonthlyPriceDifference
	, isnull(terms.CurrentMonthlyPrice, 0) AS MonthlyPrice
	, mininv.MonthlyPrice AS MonthlyPrice2
    , con.AcctApprovedDate AS ContractApprovedDate
	, terms.SalesUnitID
	, terms.BundleID
	, 'SalesOrder' AS RevenueItemType
	, terms.CurrentTermStartDate
	, con.LocationID AS LocationID 
	, '' AS RevenueRunID
	, '' AS SequenceNumber --ROW_NUMBER() over (partition by lineitemid, AdjustedEventDate order by eventdate)
	, '' AS [RevenueEventType]
	, case
		when majors.MajorAccountFlag = 1 then 'Y'
		else 'N'
	end as IsMajor --ATTRIBUTE24
	/* REVENUEITEMRAW Columns --END-- */
	, '0083' as CLIENT_ID
	, cast(year(l.CreatedDate) as varchar(4)) + right('0' + cast(month(l.CreatedDate) as varchar(4)), 2) + '_' + cast(con.locationid as nvarchar(20)) as ORIG_MEA_ID
	, case
		when terms.TERM = 1 and terms.GrpFlag = 1 then cast(year(terms.CreatedDate) as varchar(4)) + right('0' + cast(month(terms.CreatedDate) as varchar(4)), 2)
		--else cast(year(terms.TermStDt) as varchar(4)) + right('0' + cast(month(terms.TermStDt) as varchar(2)), 2)
		else cast(year(case when terms.TermRow = 1 then terms.TermStDt else terms.LineItemStartDate end) as varchar(4))
			+ right('0' + cast(month(case when terms.TermRow = 1 then terms.TermStDt else terms.LineItemStartDate end) as varchar(2)), 2)
	end as MEA_EVENT
	, cast(terms.TERM as varchar(10)) as MEA_TERM
	, cast(terms.TermRow as varchar(10)) as MEA_TERMROW
	, cast(year(l.CreatedDate) as varchar(4)) + right('0' + cast(month(l.CreatedDate) as varchar(4)), 2) + '_' + cast(con.locationid as nvarchar(20)) + '_'
	--	+ case
	--	when terms.TERM = 1 then cast(year(terms.CreatedDate) as varchar(4)) + right('0' + cast(month(l.CreatedDate) as varchar(4)), 2)
	--	else cast(year(terms.TermStDt) as varchar(4)) + right('0' + cast(month(terms.TermStDt) as varchar(4)), 2)
	--end 
		+
			case
			when terms.TERM = 1 and terms.GrpFlag = 1 then cast(year(terms.CreatedDate) as varchar(4)) + right('0' + cast(month(terms.CreatedDate) as varchar(4)), 2)
			--else cast(year(terms.TermStDt) as varchar(4)) + right('0' + cast(month(terms.TermStDt) as varchar(2)), 2)
			else cast(year(case when terms.TermRow = 1 then terms.TermStDt else terms.LineItemStartDate end) as varchar(4))
				+ right('0' + cast(month(case when terms.TermRow = 1 then terms.TermStDt else terms.LineItemStartDate end) as varchar(2)), 2)
		end 
		+ '_' + cast(terms.TERM as varchar(10)) + '_' + cast(terms.TermRow as varchar(10)) as 'DEAL_ID'

	, ROW_NUMBER() OVER(PARTITION BY l.lineitemID ORDER BY  terms.TERM, terms.TermRow) as 'DEAL_JOINID'
	--, LIsnap.CurrentTermStartDate
	--, LIsnap.RenewalDate
	--, mininv.AdjustedBillingStartDate
	, loc.CountryCode as [BILL_TO_COUNTRY]
	, loc.LocationName as [BILL_TO_CUSTOMER_NAME]
	, loc.LocationID as [BILL_TO_CUSTOMER_NUMBER]
	, '??' as [BUSINESS_UNIT]
	, siteloc.LocationID as [CUSTOMER_ID]
	, siteloc.LocationName as [CUSTOMER_NAME]
	, 'Y' as [DEFERRED_REVENUE_FLAG]
	, case
		when terms.TERM = 1 and year(terms.CreatedDate) < 2016 then 'N'
		when terms.TERM = 1 and year(terms.CreatedDate) >= 2016 then 'Y'
		when year(terms.TermStDt) < 2016 then 'N'
		else 'Y'
	end	as [ELIGIBLE_FOR_CV]
	, case
		when terms.TERM = 1 and year(terms.CreatedDate) < 2016 then 'N'
		when terms.TERM = 1 and year(terms.CreatedDate) >= 2016 then 'Y'
		when year(terms.TermStDt) < 2016 then 'N'
		else 'Y'
	end	as [ELIGIBLE_FOR_FV]
	
	, case
		when terms.TERM = 1 and CAST(terms.TermStDt as DATE) <= cast(CAST(mininv.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(mininv.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
			then cast(CAST(mininv.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(mininv.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
		else cast(DATEADD(month, DATEDIFF(month, 0, terms.TermStDt), 0) as DATE)
	end as [AdjustedBillingStartDate]
	, mininv.chargeyear, mininv.chargemonth
	, cast(DATEADD(month, DATEDIFF(month, 0, terms.TermStDt) + 1, 0) as DATE) as TermStPlus1Month
	, mininv.AdjustedBillingStartDate as InvAdjBillStart
	, case 
		when day(terms.TermStDt) = 1 then cast(DATEADD(month, DATEDIFF(month, 0, terms.TermStDt), 0) as DATE) 
		when day(terms.TermStDt) > 1 then cast(DATEADD(month, DATEDIFF(month, 0, terms.TermStDt) + 1, 0) as DATE) 
	end as [RULE_START_DATE]
	--, id.lineitemid
	--, CAST(case
	--	when mininv.AdjustedBillingStartDate <= cast(CAST(id.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(id.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
	--		and cast(LIsnap.CurrentTermStartDate as DATE) < cast(CAST(id.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(id.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
	--		then cast(CAST(id.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(id.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
	--	when cast(LIsnap.CurrentTermStartDate as DATE) > cast(DATEADD(month, DATEDIFF(month, 0, LIsnap.CurrentTermStartDate), 0) as DATE)
	--		then DATEADD(month, DATEDIFF(month, 0, LIsnap.CurrentTermStartDate) + 1, 0)
	--	else DATEADD(month, DATEDIFF(month, 0, LIsnap.CurrentTermStartDate), 0)
	--	end AS DATE) as RuleStartDate
	--, CAST(LIsnap.RenewalDate AS DATE) as RuleEndDate
	, terms.TermRenewDt as [RULE_END_DATE] --RenewalDate?
	, l.ContractID as [SALES_ORDER]
	, l.ContractID as [SALES_ORDER_ID]
	, cast(l.ContractID as varchar(40)) + '_' + cast(terms.LineItemID as varchar(40)) + '_' + 
		case
			when terms.TERM = 1 and terms.GrpFlag = 1 
			--then cast(year(terms.CreatedDate) as varchar(4))
		--	else cast(year(terms.TermStDt) as varchar(4))
		--end	+
		--case
		--	when terms.TERM = 1 
				then cast(year(terms.CreatedDate) as varchar(4)) + right('0' + cast(month(terms.CreatedDate) as varchar(4)), 2)
			--else cast(year(terms.TermStDt) as varchar(4)) + right('0' + cast(month(terms.TermStDt) as varchar(2)), 2)
			else cast(year(case when terms.TermRow = 1 then terms.TermStDt else terms.LineItemStartDate end) as varchar(4))
				+ right('0' + cast(month(case when terms.TermRow = 1 then terms.TermStDt else terms.LineItemStartDate end) as varchar(2)), 2)
		end 
		+ '_' + cast(terms.TERM as varchar(10)) + '_' + cast(terms.TermRow as varchar(10))
		as [SALES_ORDER_LINE_ID]
	, case
		when terms.TERM = 1 and terms.GrpFlag = 1 then cast(year(terms.CreatedDate) as varchar(4))
		else cast(year(case when terms.TermRow = 1 then terms.TermStDt else terms.LineItemStartDate end) as varchar(4))
	end	as [FV_YEAR]
	, case
		when terms.TERM = 1 and terms.TermRow = 1 then cast(year(terms.CreatedDate) as varchar(4))
		else cast(year(case when terms.TermRow = 1 then terms.TermStDt else terms.LineItemStartDate end) as varchar(4))
	end	as [FV_YEAR2-CORRECT?-]
	, fsr.TermStDt as [SHIP_DATE]

	, terms.CreatedDate as [TRANS_DATE]
	, 'N' as [STANDALONE_FLAG]
	, 'N' as [STATED_FLAG]
	, 'SO' as [TRAN_TYPE]
	, /*isnull(round(case
		when mininv.EarliestInvoiceDetailID = id.InvoiceDetailID
			then cast(((id.MonthlyPrice / mininv.StubDays) * mininv.DaysInStubMonth)  as numeric(20,8))
		else cast(id.monthlyprice as numeric(20,8)) 
		--when invcal.DateKey <= cast(CAST(id.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(id.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
		--	then cast(id.monthlyprice as numeric(20,8))
		--else cast(((id.monthlyprice / invcal.DaysRemain) * invcal.DaysInMonth)  as numeric(20,8))
		end, 2), -999999)*/
		isnull(round(case
		when terms.TERM = 1 and terms.TermRow = 1 and mininv.EarliestInvoiceDetailID is not null and round(terms.discountedmonthlyprice,2) = mininv.MonthlyPrice
			then round(terms.discountedmonthlyprice,2)
		when terms.TERM = 1 and terms.TermRow = 1 and mininv.EarliestInvoiceDetailID is not null and round(terms.discountedmonthlyprice,2) <> mininv.MonthlyPrice
			then cast(((mininv.MonthlyPrice / mininv.StubDays) * mininv.DaysInStubMonth)  as numeric(20,8))
		when terms.TERM = 1 and mininv.EarliestInvoiceDetailID is null  
			then -999999
		else round(terms.discountedmonthlyprice,2) --need to pull data from actual invoice --cast(mininv.monthlyprice as numeric(20,8)) 
	end, 2), -999999) as [UNIT_SELL_PRICE]
	--, mininv.MonthlyPrice
	--, terms.DiscountedMonthlyPrice
	, round(terms.discountedmonthlyprice,2) as DiscMnthPriceRounded
	--, term
	, /*DATEDIFF(month, CAST(case
		when mininv.AdjustedBillingStartDate <= cast(CAST(id.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(id.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
			and cast(LIsnap.CurrentTermStartDate as DATE) < cast(CAST(id.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(id.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
			then cast(CAST(id.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(id.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
		when cast(LIsnap.CurrentTermStartDate as DATE) > cast(DATEADD(month, DATEDIFF(month, 0, LIsnap.CurrentTermStartDate), 0) as DATE)
			then DATEADD(month, DATEDIFF(month, 0, LIsnap.CurrentTermStartDate) + 1, 0)
		else DATEADD(month, DATEDIFF(month, 0, LIsnap.CurrentTermStartDate), 0)
		end AS DATE), CAST(LIsnap.RenewalDate + 1 AS DATE))*/
		1 as QtyOrdered
	, /*isnull(round(case
		when mininv.EarliestInvoiceDetailID = id.InvoiceDetailID
			then cast(((id.MonthlyPrice / mininv.StubDays) * mininv.DaysInStubMonth)  as numeric(20,8))
		else cast(id.monthlyprice as numeric(20,8)) 
		--when invcal.DateKey <= cast(CAST(id.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(id.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
		--	then cast(id.monthlyprice as numeric(20,8))
		--else cast(((id.monthlyprice / invcal.DaysRemain) * invcal.DaysInMonth)  as numeric(20,8))
		end, 2), -999999) *
		DATEDIFF(month, CAST(case
		when mininv.AdjustedBillingStartDate <= cast(CAST(id.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(id.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
			and cast(LIsnap.CurrentTermStartDate as DATE) < cast(CAST(id.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(id.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
			then cast(CAST(id.chargeyear AS VARCHAR(4)) + RIGHT('0' + CAST(id.chargemonth AS VARCHAR(2)), 2) + '01' as DATE)
		when cast(LIsnap.CurrentTermStartDate as DATE) > cast(DATEADD(month, DATEDIFF(month, 0, LIsnap.CurrentTermStartDate), 0) as DATE)
			then DATEADD(month, DATEDIFF(month, 0, LIsnap.CurrentTermStartDate) + 1, 0)
		else DATEADD(month, DATEDIFF(month, 0, LIsnap.CurrentTermStartDate), 0)
	end AS DATE), CAST(LIsnap.RenewalDate + 1 AS DATE))*/
		1 as EXT_SELL_PRICE

	, case
		--when isnull(terms.TERM, terms.GrpFlag) = 1 and datediff(month, terms.CreatedDate, terms.TermStDt) < 13 and year(terms.CreatedDate) < 2016 then 'CONVERSION'
		when isnull(terms.TERM, terms.GrpFlag) = 1 and datediff(month, terms.CreatedDate, terms.TermStDt) < 13 
			and year(case when terms.TERM = 1 and terms.GrpFlag = 1 then terms.CreatedDate else terms.TermStDt end) < 2016 then 'CONVERSION'
		when year(terms.TermStDt) < 2016 then 'CONVERSION'
		when isnull(terms.TERM, 0) > 1 and year(terms.TermStDt) >= 2016 then ''
		when year(terms.CreatedDate) >= 2016 then ''
		else '--->>POSSIBLE ERROR<<---'
	end	as [CONVERSION_DATA]
	, terms.CreatedDate, terms.TermStDt
	--, isnull(terms.TERM, terms.GrpFlag) as 'AAA'
	--, datediff(month, terms.CreatedDate, terms.TermStDt) as 'Months'
	--, case when terms.TERM = 1 and terms.GrpFlag = 1 then year(terms.CreatedDate) else year(terms.TermStDt) end as 'CASER'
	, /*case
		when mininv.EarliestInvoiceDetailID = id.InvoiceDetailID then cast(cast(id.MonthlyPrice as numeric(20,2)) as nvarchar(24))
		else '' 
	end*/
		case
		 
		when terms.term = 1 and terms.TermRow = 1 and mininv.EarliestInvoiceDetailID is not null 
			then cast(isnull(round(cast(mininv.MonthlyPrice  as numeric(20,8)), 2), -999999) as varchar(30))
		when terms.term = 1 and terms.TermRow = 1 and mininv.EarliestInvoiceDetailID is null  
			then cast(-999999 as varchar(30))
		else '' --need to pull data from actual invoice --cast(mininv.monthlyprice as numeric(20,8)) 
	end as STUB_AMOUNT
	--, case when id.BillingStartDate <= LIsnap.BillingStartDate then 'ID'
	--	else 'FRE'
	--end as BSD_Src
	--, case when id.BillingStartDate <= LIsnap.BillingStartDate then id.BillingStartDate
	--	else LIsnap.BillingStartDate
	--end as BillingStartDate
	--, id.InvoiceDetailID
	--, '---MININV---' as '---MININV---', mininv.*
	--, '---ID---' as '---ID---', id.*
	--, '---FPD---' as '---FPD---', fpd.*
	--, '---FRE---' as '---FRE---', LIsnap.*
	, case when terms.TermRow = 1 then terms.TermStDt else terms.LineItemStartDate end as AdjustedTermStDt
	, case when terms.TermRow = mvt.MaxTermRow then terms.TermRenewDt else terms.LineItemEndDate end as AdjustedTermRenewDt
	, terms.TERM, terms.TermRow, mvt.MaxTermRow, terms.GrpFlag
	, terms.LineItemStartDate
	, terms.LineItemEndDate
	--, terms.LineItemStatusID
	, terms.StatusChangeFlag
	, su.SalesUnitDesc
	/* OTHER REVENUEITEMSRAW Columns -- from spMapData --START-- */
	, '' AS IgnoreFlag
	, '' AS IsContractCreatedThisMonth
	, '' AS [IsContractInActiveAtEndOfMonth]
	, '' AS [IsLineItemInActiveAtEndOfMonth]
	, '' AS ActionType
	--, '' AS RevenueEventType
	, '' AS IsRenewal
	, p.CoStarBrandID
	, csb.CoStarBrandCode
	, p.ProductDesc AS ProductName
	, pm.ProductMarketTypeID
	, CASE WHEN isnull(su.ProductMarketTypeID, 0) = 6 THEN 1 ELSE isnull(su.ProductMarketTypeID, 0) END AS ProductMarketTypeID2
	, mt.ProductMarketTypeDesc
	, CASE WHEN pm.ProductMarketTypeID = 2 AND su.SalesUnitCD IS NOT NULL THEN left(su.SalesUnitCD, 2) ELSE NULL END AS StateCD
	, '' AS OrigSalesUnit --used to handle PLUS markets.
	, '' AS UpdatedSalesUnit --used to handle PLUS markets.
	, '-->--not needed?--<--' AS PropertyID
	, null AS CurrentContractTerm --BH: floor((datediff(mm, billingstartdate, AdjustedEventDate) + case when DatePart (DAY,AdjustedEventDate) > DatePart(day, billingstartdate) then 1 else 0 end) /12.00) + 1
	, DATEDIFF(MONTH, case 
		when day(terms.TermStDt) = 1 then CAST(DATEADD(month, DATEDIFF(month, 0, terms.TermStDt), 0) AS DATE) 
		when day(terms.TermStDt) > 1 then CAST(DATEADD(month, DATEDIFF(month, 0, terms.TermStDt) + 1, 0) AS DATE) 
	end, DATEADD(month, 1, terms.TermRenewDt))  AS CurrentTermMonths
	, terms.CreatedDate as LineItemCreatedDate --aka [SO_BOOK_DATE]
	, '' AS ContractTermID
	, (cc.firstName + ' ' + cc.LastName) AS AEContactName
	, CASE l.LineItemInvoiceConfigurationID 
		WHEN 1 THEN billloc.LocationName
		ELSE siteloc.LocationName END AS BillingLocationName
	, CASE l.LineItemInvoiceConfigurationID 
		WHEN 1 THEN billloc.CountryCode
		ELSE siteloc.CountryCode END AS CountryCode
	, CASE 
		WHEN terms.ProductID in (225,226,227,228,229,230,231,232,233,234,239
			,240,241,245,246,247,248,249,250,251,252,253,261,265,267,268,269,270,277,281,282,284) THEN 0
		ELSE rm.RevenueMarketID
		END AS DerivedSalesUnitID
	, CASE WHEN terms.BundleID is null THEN CAST(terms.ProductID AS NVARCHAR(20))
		ELSE CAST(terms.BundleID AS NVARCHAR(20)) --+ 'BID'
		END AS DerivedProductID
	, CASE WHEN terms.BundleID is null THEN CAST(p.ProductName AS NVARCHAR(50))
		ELSE CAST(bt.BundleTypeDesc AS NVARCHAR(50)) + 'BID'
		END AS DerivedProductName
	, '' AS MonthSequence
	/* OTHER REVENUEITEMSRAW Columns -- from spMapData --END-- */

	, '' AS SOB_ID
	, '' AS CurrentSKU
	, mininv.DaysInStubMonth AS DaysInStubMonth
	, mininv.StubDays AS StubDays
	, '' AS StubDailyRate
	, '' AS HasInvalidStubData
	, '' AS StubDailyListRate
	, '' AS StubPeriodMonthlyDiscountedRate
	, mininv.EarliestInvoiceDetailID AS MEAFirstPricingDetailID
	, '' AS MEAFirstPricingDetailDiscountedMonthlyPrice
	, mininv.EarliestInvoiceDetailID AS MEAFirstInvoiceDetailID
	, mininv.MEAInvoiceFirstDateOfPeriod
	, mininv.BillingStartDate AS MEAInvoiceBillingStartDate
	, day(mininv.BillingStartDate) AS MEAInvoiceBillingStartDateDay
	, mininv.GrossMonthlyPrice AS MEAInvoiceBillingFirstPeriodGross
	, mininv.MonthlyPrice AS MEAInvoiceBillingFirstPeriodDiscounted
	, '' AS MEAInvoiceBillingFirstPeriodStubAmount
	, '' AS AptBundleID
	, '' AS ProductCount
	, '' AS LineType
	, '' AS NAVDocumentNo
	, '' AS NAVLineNo
	, '' AS NAVQuantity
	, '' AS NAVUnitPrice
	, '' AS NAVAmount
	, '' AS NAVBillingStartDate
	, '' AS NAVBillingEndDate
	, '' AS NAVInvoiceDate
	, '' AS CRMInvoiceDate
	, '' AS NAVDescription3
	, '' AS CRMInvoiceDetailID
	, '' AS IsMappedToNAV
	, '' AS IsCreditCard
	, '' AS EventSource
	, '' AS CanBePriced
	, '' AS PricingType
	, '' AS CheckOutOk
	, '' AS MonthsOfFullDiscount
	, '' AS IsInternContract
	, '' AS MarketCount
	, '' AS LineitemCreadedDate
	, '' AS PreviousSKU
	, '' AS PipelineID
	, '' AS LineItemPricingDetailTypeID
	, '' AS LineItemPricingDetailSubTypeID
	, '' AS ListPrice
	, '' AS SalesUnits
	, '' AS QUANTITY_ORDERED
	, '' AS STUB_AMOUNT_LISTPRICE
	, '' AS EXT_AMOUNT
	, '' AS EXT_AMOUNT_LISTPRICE
	, '' AS ProductMarketTypeCounts
	, '' AS UseContractUserLimit
	, '' AS CurrentTermID
	, '' AS UpdatedDate
	, '' AS RevenueItemRawID
	, '' AS IsLineItemCreatedThisMonth
	/* --TODO: --> spDetermineStartDates */

INTO #SalesOrders
FROM #ValidTerms terms
--left join Enterprise.dbo.InvoiceDetail id (NOLOCK)
JOIN Enterprise.dbo.LineItem l (NOLOCK) ON terms.lineitemid = l.lineitemid
JOIN Enterprise.dbo.Contract con (NOLOCK) ON terms.contractid = con.contractid
JOIN Enterprise.dbo.Product p (NOLOCK) ON terms.ProductID = p.ProductID
LEFT JOIN Enterprise.dbo.CoStarBrand csb (NOLOCK) ON p.CoStarBrandID = csb.CoStarBrandID
--join Enterprise.dbo.CustomerInfo ci (NOLOCK) ON con.LocationID = ci.LocationID
JOIN Enterprise.dbo.Location loc (NOLOCK) ON con.LocationID = loc.LocationID
JOIN Enterprise.dbo.Location siteloc (NOLOCK) ON terms.SiteLocationID = siteloc.LocationID
JOIN Enterprise.dbo.Location billloc (NOLOCK) ON terms.SiteLocationID = billloc.LocationID
LEFT JOIN Enterprise.dbo.Bundle b ON terms.BundleID = b.BundleID
LEFT JOIN Enterprise.dbo.BundleType bt ON b.BundleTypeID = bt.BundleTypeID
LEFT JOIN Enterprise.dbo.SalesUnit su (NOLOCK) ON terms.SalesUnitID = su.SalesUnitID
LEFT JOIN Enterprise.dbo.SalesUnitProductMarket supm (NOLOCK) ON terms.SalesUnitID = supm.SalesUnitID
LEFT JOIN Enterprise.dbo.ProductMarket pm (NOLOCK) ON pm.ProductMarketID = supm.ProductMarketID
LEFT JOIN Enterprise.dbo.ProductMarketType mt (NOLOCK) ON mt.ProductMarketTypeID = pm.ProductMarketTypeID
LEFT JOIN Enterprise.dbo.Contact cc (NOLOCK) ON isnull(loc.CurrentAEContactID,0) = cc.ContactID
LEFT JOIN Enterprise.dbo.RevenueMarket rm (NOLOCK) on su.RevenueMarketID = rm.RevenueMarketID 
LEFT JOIN #ValidTerms fsr ON terms.LineItemID = fsr.LineItemID and fsr.TERM = 1 and fsr.TermRow = 1 and fsr.E1_TERM = 1
LEFT JOIN #Majors majors ON l.SiteLocationID = majors.locationid and csb.CoStarSubsidiaryID = majors.CoStarSubsidiaryID
LEFT JOIN #MaxValidTermRows mvt ON terms.TERM = mvt.TERM and terms.LineItemID = mvt.LineItemID 
LEFT JOIN #tmpInvoiceDetail
--	--(
--	--  select LineItemID, min(id2.InvoiceID) as InvoiceID
--	--  from Enterprise.dbo.InvoiceDetail id2
--	--  group by LineItemID
--	--) 
	mininv ON terms.LineItemID = mininv.LineItemID
--left join #firstPricingDetail fpd on fpd.LineItemID = id.LineItemID
--left join #firstlinesnap LIsnap on LIsnap.LineItemID = id.LineItemID
--where id.LineItemID = @line
ORDER BY terms.LineItemID, RULE_START_DATE, adjustedtermstdt
END
-- /**** END ** CONSTRUCT SALES ORDERS WITH DISCOUNTED MONTHLY PRICE AND BSD ****/ --

/*
select * from #SalesOrders 
*/
select locationid, * from #SalesOrders s where s.LocationID = 476 --32991956

-- /**** BEGIN ** CONSTRUCT SKUs ****/ --
IF OBJECT_ID('tempdb..#SKUs') IS NULL
--IF OBJECT_ID('tempdb..#SKUs') IS not NULL drop table #SalesOrders
BEGIN
select 
	so.LineItemID
	, so.DEAL_ID
	, so.SALES_ORDER_LINE_ID
	, CASE so.ProductID	
		WHEN 246 THEN 'SILV'
		WHEN 245 THEN 'GOLD'
		WHEN 246 THEN 'SILV'
		WHEN 247 THEN 'PLAT'
		WHEN 248 THEN 'DIAM'
		WHEN 267 THEN 'SILV'
		WHEN 268 THEN 'GOLD'
		WHEN 269 THEN 'PLAT'
		WHEN 270 THEN 'DIAM'
	END AS ProductLevel
	, so.CurrentTermMonths
INTO #SKUs

from #SalesOrders so
--join lookups.AptsSKUSetup asetup on so.ProductID = asetup.ProductID

END
-- /**** END ** CONSTRUCT SKUs ****/ --


/*** TODO -- Start -- TODO ***/
--spAssignMEA - did not incorporate the following:
--		set up 2 product bundles
--		set suite 3 bundles
--		all code forward to next comment
--		Suite Pricing Data Points -- all code to end of PROC

/*** TODO --  End  -- TODO ***/



-- /**** BEGIN ** CONSTRUCT SALES ORDERS TERM LINE WHICH SHORTEN WATERFALL ****/ --
--IF OBJECT_ID('tempdb..#SalesCXLEARLY') IS NULL
--BEGIN
--select
--	'CANCEL SO'
--	, cxl.[deal_joinid]
--	, so.*
--	, cxl.LineItemStatusID
--	, cxl.AdjustedTermRenewDt
--	, cxl.LineItemStartDate
--	, cxl.LineItemEndDate
--from #SalesOrders so
--join #SalesOrders cxl on so.LineItemID = cxl.LineItemID and so.DEAL_JOINID = cxl.DEAL_JOINID-1 and cxl.lineitemstatusid in (4,5,6)
--	and so.LineItemStatusID in (1,2,3,7) 
----where so.lineitemid = 1368409
--END
-- /**** END ** CONSTRUCT SALES ORDERS WITH DISCOUNTED MONTHLY PRICE AND BSD ****/ --

/*
select distinct * from #SalesOrders 
where lineitemid in (1368409, 1368413) --= 1392234 
order by 1
*/

-- /**** BEGIN ** BUILD stg.[RevenueItemRaw] OUTPUT ****/ --
--select 
--	DEAL_ID as [MEA]
--	, RevenueItemType
--	, LineItemID
--	, RULE_START_DATE
--	, AdjustedEventDate
--	, CurrentSKU
--	, SequenceNumber
--	, ActionType
--	, SOB_ID
--	, MonthSequence
--	, CurrentContractTerm
--	, DaysInStubMonth
--	, StubDays
--	, StubDailyRate
--	, HasInvalidStubData
--	, StubDailyListRate
--	, StubPeriodMonthlyDiscountedRate
--	, MEAFirstPricingDetailID
--	, MEAFirstPricingDetailDiscountedMonthlyPrice
--	, EventDate
--	, RevenueEventType
--	, ProductID
--	, DerivedProductID
--	, DerivedProductName
--	, DerivedSalesUnitID
--	, AdjustedEventYear
--	, AdjustedEventMonth
--	, MEAFirstInvoiceDetailID
--	, MEAInvoiceFirstDateOfPeriod
--	, MEAInvoiceBillingStartDate
--	, MEAInvoiceBillingStartDateDay
--	, MEAInvoiceBillingFirstPeriodGross
--	, MEAInvoiceBillingFirstPeriodDiscounted
--	, MEAInvoiceBillingFirstPeriodStubAmount
--	, LineItemTypeID
--	, BillingStartDate
--	, CurrentTermStartDate
--	, BillingMonth
--	, LineItemEndDate
--	, AptBundleID
--	, RenewalDate
--	, OldRenewalDate
--	, TermEndDate
--	, ContractApprovedDate
--	, ProductName
--	, NumberOfUsers
--	, ContractID
--	, SalesUnitID
--	, SalesUnitDesc
--	, CoStarBrandID
--	, BundleID
--	, ProductCount
--	, CoStarSubsidiaryID
--	, SiteLocationID
--	, MonetaryUnitID
--	, BillingLocationID
--	, SiteLocationName
--	, LineType
--	, NAVDocumentNo
--	, NAVLineNo
--	, NAVQuantity
--	, NAVUnitPrice
--	, NAVAmount
--	, NAVBillingStartDate
--	, NAVBillingEndDate
--	, NAVInvoiceDate
--	, CRMInvoiceDate
--	, NAVDescription3
--	, CRMInvoiceDetailID
--	, IsMappedToNAV
--	, AEContactID
--	, LineItemStatusID
--	, IsCreditCard
--	, DiscountedMonthlyPrice
--	, PriorDiscountedMonthlyPrice
--	, DiscountedMonthlyPriceDifference
--	, EventSource
--	, CanBePriced
--	, PricingType
--	, ProductMarketTypeID
--	, CheckOutOk
--	, MonthsOfFullDiscount
--	, IsInternContract
--	, PropertyID
--	, ProductMarketTypeDesc
--	, MarketCount
--	, LineitemCreadedDate
--	, PreviousSKU
--	, StateCD
--	, PipelineID
--	, LineItemPricingDetailTypeID
--	, LineItemPricingDetailSubTypeID
--	, ListPrice
--	, MonthlyPrice
--	, SalesUnits
--	, QUANTITY_ORDERED
--	, STUB_AMOUNT
--	, AdjustedBillingStartDate
--	, STUB_AMOUNT_LISTPRICE
--	, EXT_AMOUNT
--	, EXT_AMOUNT_LISTPRICE
--	, BillingLocationName
--	, CountryCode
--	, AEContactName
--	, ProductMarketTypeCounts
--	, IsMajor
--	, UseContractUserLimit
--	, CurrentTermMonths
--	, CurrentTermID
--	, LocationID
--	, LineItemCreatedDate
--	, CreatedDate
--	, UpdatedDate
--	, RevenueRunID
--	, RevenueItemRawID
--	, IgnoreFlag
--	, IsContractCreatedThisMonth
--	, IsLineItemCreatedThisMonth
--	, IsContractInactiveAtEndOfMonth
--	, IsLineItemInactiveAtEndOfMonth
--	, IsRenewal
----select *
--from #SalesOrders s
----where lineitemstatusid not in (4,5,6)
--order by LineItemID, RULE_START_DATE, adjustedtermstdt
-- /**** END ** BUILD stg.[RevenueItemRaw] OUTPUT ****/ --


-- /**** BEGIN ** BUILD opt.[vwSalesOrder] OUTPUT ****/ --
--IF OBJECT_ID('tempdb..#RevProSalesOrders') IS NULL
IF OBJECT_ID('tempdb..#RevProSalesOrders') IS not NULL drop table #RevProSalesOrders
BEGIN
select
	s.ContractID
	, s.LineItemID
	, s.SiteLocationID
	, s.DerivedSalesUnitID
	, s.CreatedDate

	, s.CLIENT_ID
	, s.DEAL_ID
	, s.DerivedProductID
	, s.ProductID
	, '2281' AS CARVE_IN_DEF_REVENUE_SEG1		
	, 'SAL' AS CARVE_IN_DEF_REVENUE_SEG3		
	--, dpd.GenProdGroup AS CARVE_IN_DEF_REVENUE_SEG4		
	, '1125' AS UNBILLED_AR_SEG1		
	, 'SAL' AS UNBILLED_AR_SEG3		
	--, dpd.GenProdGroup AS UNBILLED_AR_SEG4		
	--, crd.CarveInOut AS CARVE_IN_REVENUE_SEG1		
	, 'SAL' AS CARVE_IN_REVENUE_SEG3		
	--, dpd.GenProdGroup AS CARVE_IN_REVENUE_SEG4		
	--, crd.CarveInOut AS CARVE_OUT_REVENUE_SEG1		
	, 'SAL' AS CARVE_OUT_REVENUE_SEG3		
	--, dpd.GenProdGroup AS CARVE_OUT_REVENUE_SEG4
	, s.IsMajor AS ATTRIBUTE24
	, 'SAL' AS ATTRIBUTE26
	--, dpd.GenProdGroup AS ATTRIBUTE27
	, mu.MonetaryUnitCode AS BASE_CURR_CODE
	, s.[CountryCode] AS BILL_TO_COUNTRY
	, s.[BillingLocationName] AS BILL_TO_CUSTOMER_NAME
	, s.[BillingLocationID] AS BILL_TO_CUSTOMER_NUMBER
	, s.CoStarBrandCode AS BUSINESS_UNIT--CASE WHEN l.CurrentSku like '%NET%' THEN 'APTS' ELSE b.costarBrandName  END   as BUSINESS_UNIT
	, s.[SiteLocationID] AS CUSTOMER_ID
	, s.[SiteLocationName] AS CUSTOMER_NAME
	, '2280' AS DEF_ACCTG_SEG1
	, 'SAL' AS DEF_ACCTG_SEG3
    --, dpd.GenProdGroup AS DEF_ACCTG_SEG4
    , 'Y' AS DEFERRED_REVENUE_FLAG 
	, --CASE WHEN CAST(mm.MEAStartDate  as Date) <'01/01/2016' THEN 'N' ELSE 'Y' END  
		'??' AS ELIGIBLE_FOR_CV
    , --CASE WHEN CAST(mm.MEAStartDate  as Date) <'01/01/2016' THEN 'N' ELSE 'Y' END  
		'??' AS ELIGIBLE_FOR_FV
	, 1 AS EX_RATE
	, s.EXT_AMOUNT_LISTPRICE AS EXT_LIST_PRICE
    , s.EXT_AMOUNT AS EXT_SELL_PRICE   --l.DiscountedMonthlyPrice
	, 'N' AS FLAG_97_2
    , '' AS INVOICE_DATE
    , '' AS INVOICE_ID
    , '' AS INVOICE_LINE
	, '' AS [INVOICE_NUMBER]
    , '' AS INVOICE_TYPE
    , s.[DerivedProductName] AS ITEM_DESC
	, s.[DerivedProductID] AS ITEM_ID
	, s.CurrentSKU AS ITEM_NUMBER
	, '2282' AS LT_DEFERRED_ACCOUNT
	, 'N' AS NON_CONTINGENT_FLAG
	, '' AS ORDER_LINE_TYPE
	, '' AS ORDER_TYPE
    , s.[CoStarBrandID] AS ORG_ID
    , '' AS [ORIG_INV_LINE_ID]           
	, 'N' AS [PCS_FLAG]
    , '' AS [PO_NUM]
	, s.[LineItemTypeID] AS PRODUCT_CATEGORY
	, 2 AS PRODUCT_CLASS
	, s.[DerivedProductName] AS PRODUCT_FAMILY
    , s.[DerivedProductName] AS PRODUCT_LINE
	, '' AS QUANTITY_INVOICED
    , QUANTITY_ORDERED AS QUANTITY_ORDERED
	, QUANTITY_ORDERED AS QUANTITY_SHIPPED
    , '' AS QUOTE_NUM
    , 1 AS RCURR_EX_RATE
	, 'N' AS RETURN_FLAG
    --, rad.REVACCTGSEG1 AS REV_ACCTG_SEG1
    , 'SAL' AS REV_ACCTG_SEG3
    --, dpd.GenProdGroup AS REV_ACCTG_SEG4
	, Cast(s.RenewalDate AS Date) AS RULE_END_DATE
    , CASE WHEN DAY(s.CurrentTermStartDate)>1 THEN  DATEADD(MONTH, DATEDIFF(MONTH, '19000101', s.CurrentTermStartDate) + 1, '19000101') 
		ELSE s.CurrentTermStartDate END AS RULE_START_DATE
    , s.ContractID AS SALES_ORDER
    , s.[ContractID] AS SALES_ORDER_ID
	, --(((CONVERT([varchar](15), s.ContractID,(0))+'_')+CONVERT([varchar](10), [SOB_ID],(0)))+'_')+CONVERT([char](6),mm.MEAStartDate ,(112)) AS 
		'' AS SALES_ORDER_LINE
	, s.AEContactID AS [SALES_REP_ID]
	, s.AEContactName AS [SALESREP_NAME]
	, 'RIG' AS SEC_ATTR_VALUE
    , cast(s.LineItemCreatedDate AS Date) AS SO_BOOK_DATE
	, SOB_ID
	, 'N' AS STANDALONE_FLAG
    , 'N' AS STATED_FLAG
    , 'SO' AS TRAN_TYPE
	, mu.MonetaryUnitCode AS TRANS_CURR_CODE
	, cast(s.LineItemCreatedDate AS Date) AS TRANS_DATE
	, 'Y' AS UNBILLED_ACCOUNTING_FLAG
	, 'N' AS UNDELIVERED_FLAG
	, ISNULL(s.ListPrice ,0) AS UNIT_LIST_PRICE
	, s.MonthlyPrice AS UNIT_SELL_PRICE
	, --YEAR(mm.MEAStartDate) AS 
		FV_YEAR
	, s.STUB_AMOUNT AS STUB_AMOUNT
	, s.STUB_AMOUNT_LISTPRICE AS STUB_AMOUNT_LISTPRICE
	--, @pRevenueRunID
	, 'N' AS CANCELLED_FLAG
	--, DerivedSalesUnitID
	, s.CoStarBrandID 
	, s.AdjustedEventYear
	, s.AdjustedEventMonth
	, CASE WHEN s.LineItemStatusID = 200 THEN 1 ELSE 0 END AS IsCorrectingEntry	
INTO #RevProSalesOrders	
from #SalesOrders s
left join Enterprise..MonetaryUnit mu on s.MonetaryUnitID = mu.MonetaryUnitID
END

--DROP TABLE #COMBOkeys
select *
	, --CASE WHEN s.ProductID in (248,245,247,246,281,270,268,269,267,282) THEN
		ROW_NUMBER() OVER(--PARTITION BY s.SiteLocationID, s.DerivedSalesUnitID--, s.ProductID 
		ORDER BY s.SiteLocationID, s.DerivedSalesUnitID--, s.ProductID
		) 
		--END 
		AS COMBO_ID --make this column an Indentity column in the final table
--INTO #COMBOkeys
from (select distinct
	s.SiteLocationID
	--, s.ContractID
	--, s.LineItemID
	
	, s.DerivedSalesUnitID
	--, s.CreatedDate
	--, s.ProductID
	--, s.ITEM_DESC as ProdoctDesc

	--, s.CLIENT_ID
	--, s.DEAL_ID
	, count(distinct s.lineitemID) AS CNT
	from #RevProSalesOrders s
	WHERE s.ProductID in (248,245,247,246,281,270,268,269,267,282)
	GROUP BY s.SiteLocationID, s.DerivedSalesUnitID
	) s

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
--where 
--	CUSTOMER_ID = 473 --45047521 --<<--Customer_ID is SITE Location. If wanting Contract Sell-to Location, you must choose another field.
--	--dpd.GenProdGroup is null and 
--	--s.DerivedProductID < 2000
--	s.LineItemID in (1368409,1368413)
ORDER BY 1,2,3,4,5
-- /****  END  ** BUILD opt.[vwSalesOrder] OUTPUT ****/ --

--select * from #SalesOrders s where s.DerivedProductID = '40452BID'
--select *
--from #ValidTerms --where  TERM = 1
--order by LineItemID, TERM

--select *
--from EnterpriseDataMart.dbo.lineitemsnapshot liss (NOLOCK)
--join Enterprise.dbo.Contract con (NOLOCK) on liss.ContractID = con.ContractID
--where
--	--liss.ContractID = @contract or 
--	LineItemID = 695699 --88578 --@line
--	--or con.LocationID = @cust
--order by 1,3

--select * from #tmpInvoiceDetail

--select *
--from EnterpriseReporting.[dbo].[RevenueEvent] re (NOLOCK)
--where LineItemID = 88578
--order by 1,2

--select * from #ValidTerms fsr 
----where fsr.TERM = 1 
--order by 4, 5, 6

--select * from #Events order by 4, 5

--select * from #Terms

--select * from #MaxValidTermRows