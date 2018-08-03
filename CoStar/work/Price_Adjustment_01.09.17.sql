select 
--top 10 
LIPD.LineItemID as LineItemID,
LIPD.CurrentMonthlyPrice as PriceAdjustment1, --- ? ---- 
LIPD.DiscountedMonthlyPrice as PriceAdjustment2, ---- ? ---- 
LIPDT.LineItemPricingDetailTypeDesc as Price,
LIPDS.LineItemPricingDetailStatusDesc,
PA.AdjustmentAmount

 from [DCSQLPRD104].Enterprise.dbo.LineItemPricingDetail LIPD 
 LEFT JOIN [DCSQLPRD104].Enterprise.dbo.PriceAdjustment PA ON LIPD.LineItemID=PA.LineItemID
 LEFT JOIN [DCSQLPRD104].Enterprise.dbo.LineItemPricingDetailType LIPDT 
 ON LIPD.LineItemPricingDetailTypeID=LIPDT.LineItemPricingDetailTypeID
 LEFT JOIN [DCSQLPRD104].Enterprise.dbo.LineItemPricingDetailStatus LIPDS ON LIPD.LineItemPricingDetailStatusID=LIPDS.LineItemPricingDetailStatusID
  where LIPDT.LineItemPricingDetailTypeDesc='Initial Price' and LIPDS.LineItemPricingDetailStatusDesc='Active'
  --and PA.AdjustmentAmount is not null
    AND LIPD.LineItemID IN (select LineItemID from pa.LineItem )





 