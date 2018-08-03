

SELECT * FROM Sales_Order_Feed

SELECT SALES_ORDER AS ContractID, Deal_ID_CreatedDate, SUM(UNIT_SELL_PRICE) 
FROM ##SalesOrder SO
	JOIN LineItem L
		ON SO.SALES_ORDER_LINE = L.LineItemID
WHERE L.LineItemStatusID = 1
GROUP BY SALES_ORDER, Deal_ID_CreatedDate
ORDER BY ISNULL(SUM(UNIT_SELL_PRICE),0), Deal_ID_CreatedDate

SELECT * 
FROM [Contract] 
WHERE Contractid = 15557

SELECT DiscountedMonthlyPrice, * 
FROM LineItem 
WHERE Lineitemstatusdate BETWEEN '2005-02-01' AND '2005-02-28'

SELECT DiscountedMonthlyPrice, COUNT(*) 
FROM LineItem
GROUP BY DiscountedMonthlyPrice
ORDER BY 2 DESC


SELECT COUNT(*) 
FROM LineItem 
WHERE ISNULL(DiscountedMonthlyPrice,0) = 0

SELECT lineitemstatusdate, COUNT(*) 
FROM LineItem 
WHERE ISNULL(DiscountedMonthlyPrice,0) = 0
AND Lineitemstatusdate < '1/1/2016'
GROUP BY Lineitemstatusdate
ORDER BY 2 DESC

SELECT * 
FROM [Contract]

SELECT DiscountedMonthlyPrice, * 
FROM lineitem 
WHERE DiscountedMonthlyPrice IS NOT NULL