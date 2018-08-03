



select 
CurrentTermStartDate,
RenewalDate,
* from [dbo].[LineItemDiscount] LID JOIN dbo.LineItem L on LID.LineItemID=L.LineItemID where L.ContractID=187964
/*
---------------------------------------- CODE FOR THE DISCOUNTS -----------------------------
1. Take the CurrentTermStartDate ,
2. Increment by the 'Discount Month' >>> arrive at the start Month for the discounts
3. Take the #2 add the number of months indicated in Column 'RecurringMonths' >> arrive at the end month of the Discount
4. Create the waterfall from that point; applying the discount;
5. Arrive at the end Contract Amount after applying the discount amount to the final end amount; 
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
SELECT * FROM [dbo].[StraightLineContracts] WHERE CONTRACTID=175582
--------------------------------------------------------------------------------------------
*/