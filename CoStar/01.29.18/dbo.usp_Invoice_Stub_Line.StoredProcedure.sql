USE [RevPro]
GO
/****** Object:  StoredProcedure [dbo].[usp_Invoice_Stub_Line]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_Invoice_Stub_Line]
AS

/* ==========================================================================
DESCRIPTION

	Proc Name:  usp_Invoice_Stub_Line
	Purpose:    

	NOTES

	MODIFICATIONS

	Date	    Author		Purpose
	------------------------------------------------

	2017-09-14  Vitaly Romm	Initial version
	
	EXEC dbo.usp_Invoice_Stub_Line

========================================================================== */ 


/* Update necessary fields to reflect the stub record */
UPDATE IR
SET Rule_End_Date = CAST(EOMONTH(Rule_Start_Date) AS DATETIME),
    Deal_ID_LocationID = 'S' + Deal_ID_LocationID,
	Sales_Order_Line_ID = 'S' + Sales_Order_Line_ID, 
	Stub_Amount = 2
FROM Revpro..Invoice_Raw IR
	JOIN RevPro..Active_LineItems_Archive AL
		ON IR.Sales_Order_Line = AL.LineItemID
		AND CAST(IR.Rule_Start_Date AS DATE) = CAST(AL.CurrentTermStartDate AS DATE)
WHERE AL.Stub_Fl = 1


/* Update the remaining non stub records to 1 */
UPDATE IR
SET Stub_Amount = 1
FROM Revpro..Invoice_Raw IR
	JOIN Revpro..Invoice_Raw IR2
		ON IR.Sales_Order = IR2.Sales_Order
WHERE LEFT(IR.Sales_Order_Line_ID,1) <> 'S'
AND LEFT(IR2.Sales_Order_Line_ID,1) = 'S'


/* Default to 1 if the stub amount is 0 */
UPDATE IR
SET Stub_Amount = 1
FROM Revpro..Invoice_Raw IR
WHERE Stub_Amount = 0


/* Update the Ext list/Sell prices for scheduled price scenarios (straightlines) that will include both Step-ups and discount expirations */
UPDATE IR
SET Unit_List_Price = A.Unit_List_Price,
    Unit_Sell_Price = A.Unit_Sell_Price,
	Ext_List_Price = A.Ext_List_Price,
	Ext_Sell_Price = A.Ext_Sell_Price
--SELECT A.*, IR.Rule_Start_Date, IR.Rule_End_Date, IR.Item_Number, IR.*
FROM Revpro..Invoice_Raw IR
	JOIN (
	      SELECT IR.Sales_Order,
		         Unit_List_Price = SLC.WaterFall_Amt/COUNT(IR.Sales_Order_Line),
				 Unit_Sell_Price = SLC.WaterFall_Amt/COUNT(IR.Sales_Order_Line),
				 Ext_List_Price = SLC.Contract_Final_Amt_LessStubAmt/COUNT(IR.Sales_Order_Line),
				 Ext_Sell_Price = SLC.Contract_Final_Amt_LessStubAmt/COUNT(IR.Sales_Order_Line)
	      FROM Revpro..Invoice_Raw IR
			JOIN vwStraightLineContracts SLC
				ON IR.Sales_Order = SLC.ContractID
		  --WHERE IR.Sales_Order = 175582
		  AND IR.Stub_Amount = 1
		  GROUP BY IR.Sales_Order, IR.Stub_Amount, SLC.WaterFall_Amt, SLC.Contract_Final_Amt_LessStubAmt
		 ) A
	ON IR.Sales_Order = A.Sales_Order
	WHERE IR.Stub_Amount = 1



/* Update the Ext list/Sell prices for scheduled price scenarios (straightlines) that will include both Step-ups and discount expirations */
UPDATE IR
SET Unit_List_Price = A.Unit_List_Price,
    Unit_Sell_Price = A.Unit_Sell_Price,
	Ext_List_Price = A.Ext_List_Price,
	Ext_Sell_Price = A.Ext_Sell_Price
--SELECT A.*, IR.Rule_Start_Date, IR.Rule_End_Date, IR.Item_Number, IR.*
FROM Revpro..Invoice_Raw IR
	JOIN (
	      SELECT IR.Sales_Order,
		         Unit_List_Price = SLC.WaterFall_Stub_Amt/COUNT(IR.Sales_Order_Line),
				 Unit_Sell_Price = SLC.WaterFall_Stub_Amt/COUNT(IR.Sales_Order_Line),
				 Ext_List_Price = SLC.WaterFall_Stub_Amt/COUNT(IR.Sales_Order_Line),
				 Ext_Sell_Price = SLC.WaterFall_Stub_Amt/COUNT(IR.Sales_Order_Line)
	      FROM Revpro..Invoice_Raw IR
			JOIN vwStraightLineContracts SLC
				ON IR.Sales_Order = SLC.ContractID
		  --WHERE IR.Sales_Order = 175582
		  AND IR.Stub_Amount = 2
		  GROUP BY IR.Sales_Order, IR.Stub_Amount, SLC.WaterFall_Stub_Amt
		 ) A
	ON IR.Sales_Order = A.Sales_Order
	WHERE IR.Stub_Amount = 2
GO
