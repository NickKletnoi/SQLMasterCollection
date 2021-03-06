USE [RevPro]
GO
/****** Object:  StoredProcedure [stg].[spMapCreditMemos]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [stg].[spMapCreditMemos]
	 @pDebug bit , @pRevenueRunID int
AS
	
		--For a credit memo, 
		-- try and find 
			update t set mea = m.mea
		from stg.[RevenueItemRaw] t
			inner join opt.meacontract mc on mc.contractid = t.contractid 
				inner join opt.mea m on m.mea = mc.mea
					and t.AdjustedEventDate between m.meastartdate and m.meaenddate
					and t.RevenueRunID = @pRevenueRunID
					and t.RevenueItemType = 'NAVCreditMemo'

		update t set DerivedProductID = tt.DerivedProductID, 
						DerivedProductName = tt.DerivedProductName,
						DerivedSalesUnitID = tt.DerivedSalesUnitID,
						BundleId = tt.bundleid,
						Quantity_ORdered = tt.Quantity_Ordered
			from stg.[vwCreditMemoRevenueItemRaw] t
							inner join stg.vwSalesOrderRevenueItemRaw tt
								on tt.lineitemid = t.LineItemID and t.mea = tt.mea
								where tt.IgnoreFlag = 0 and t.RevenueRunID = @pRevenueRunID

--update t set t.ListPrice  = ListPrice * ( DiscountedMonthlyPrice / UNIT_SELL_PRICE)
--		FROM stg.vwInvoiceRevenueItemRaw  t 
--			inner join opt.mea m on m.mea = t.mea
--		where RevenueItemType = 'navinvoice' and RevenueRunID = @pRevenueRunID 
--			and m.MEAType = 'Contract Creation'

						

		--update t set EXT_AMOUNT = DiscountedMonthlyPrice,
		--	EXT_AMOUNT_LISTPRICE = ListPrice,
		--	MonthlyPrice = DiscountedMonthlyPrice
			
		--	from stg.vwInvoiceRevenueItemRaw t
		--	where t.IgnoreFlag = 0 and t.RevenueRunID = @pRevenueRunID


RETURN 0

GO
