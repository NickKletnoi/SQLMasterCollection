---------------------------------------------------------------------------
------------- ESCALATIONS COUNT -------------------------------------------
---------------------------------------------------------------------------
SELECT SLC.ContractID, COUNT(DISTINCT LIE.FirstEscalationMonth)  AS ESCALATION_COUNT FROM 
[dbo].[vwStraightLineContracts] SLC JOIN Staging..LineItem LI ON SLC.ContractID=LI.ContractID JOIN 
Staging..LineItemEscalation LIE ON LI.LineItemID=LIE.LineItemID
GROUP BY SLC.ContractID
ORDER BY COUNT(DISTINCT LIE.FirstEscalationMonth)  DESC
----------------------------------------------------------------------------
----------------------------------------------------------------------------
------------- DISCOUNTS COUNT ----------------------------------------------
----------------------------------------------------------------------------
SELECT SLC.ContractID, COUNT(DISTINCT LID.DiscountMonth)  AS DISCOUNT_COUNT FROM 
[dbo].[vwStraightLineContracts] SLC JOIN Staging..LineItem LI ON SLC.ContractID=LI.ContractID JOIN 
Staging..LineItemDiscount LID ON LI.LineItemID=LID.LineItemID
GROUP BY SLC.ContractID
ORDER BY COUNT(DISTINCT LID.DiscountMonth)  DESC
------------------------------------------------------------------
------------------------------------------------------------------
SELECT * FROM vwStraightLineContracts WHERE ContractID=187369
------------------------------------------------------------------
------------------------------------------------------------------

---Contract#187369 (supposed to have  ESC )
DECLARE @CURRENT_TERM INT
DECLARE @CONTRACTID INT=187369
DECLARE @CurrentTermStartDate DATE
DECLARE @RenewalDate DATE

SELECT 
@CURRENT_TERM=datediff(mm,MAX(BillingStartDate),MAX(RenewalDate)),
@CurrentTermStartDate=MAX(CurrentTermStartDate),
@RenewalDate=MAX(RenewalDate)
FROM Staging..LineItem  WHERE ContractID=@CONTRACTID
SELECT @CURRENT_TERM CURRENT_TERM, @CurrentTermStartDate CurrentTermStartDate,@RenewalDate RenewalDate

--------------------------------------------------------------------------
SELECT 
LI.ContractID,
LIE.LineItemID ,
LI.DiscountedMonthlyPrice,
LIE.FirstEscalationMonth,
LIE.EscalationAmount 
FROM 
--[dbo].[vwStraightLineContracts] SLC 
Staging..LineItem LI 
--ON SLC.ContractID=LI.ContractID 
JOIN Staging..LineItemEscalation LIE 
ON LI.LineItemID=LIE.LineItemID 
WHERE LI.ContractID =187369 
ORDER BY LIE.FirstEscalationMonth ASC
---------------------------------------
---------------------------------------
