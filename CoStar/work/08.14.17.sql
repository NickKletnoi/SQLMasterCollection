select count(*) from [dbo].[Invoice_Feed]
select count(*) from [dbo].[Invoice_Feed1]

select count(*) from [dbo].[Sales_Order_Feed] 
select count(*) from [dbo].[Sales_Order_Feed1]

select count(*) from [dbo].[Credit_Memo_Feed]
select count(*) from [dbo].[Credit_Memo_Feed1]
-----------
select SALES_ORDER_LINE_ID from [dbo].[Invoice_Feed] where SALES_ORDER_LINE_ID not in 
(select distinct SALES_ORDER_LINE_ID from [dbo].[Sales_Order_Feed]);
--------------
select SALES_ORDER_LINE_ID from [dbo].[Invoice_Feed] where SALES_ORDER_LINE_ID not in 
(select distinct SALES_ORDER_LINE_ID from RevPro..[Invoice_Raw]);

select distinct SALES_ORDER_LINE_ID from [dbo].[Invoice_Feed] 


