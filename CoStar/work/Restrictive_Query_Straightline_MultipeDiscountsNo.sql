


SELECT 
LI.ContractID,
LID.DiscountMonth AS DM,
SUM(LI.EffectiveDiscountAmount) AS  Amt
FROM 
Staging..LineItem LI 
JOIN Staging..LineItemDiscount LID 
ON LI.LineItemID=LID.LineItemID 
GROUP BY LI.ContractID,LID.DiscountAmount
------------

select * from stg.Contract_Input_List