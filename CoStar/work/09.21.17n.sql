--------------------------------------------------
select count(*) from [Apt].[SalesPricingReport];
select count(*) from [Apt].[SalesPricingReport1];
---------------------------------------------------
---------------------------------------------------
/*

It will run through the month of June;
this will flood the end of the month;
this will be a test run to be right;
all of the entries will turn into the 
right values for the correct term;

*/

select * from [out].[ActiveSOLines] where [ContractID]=183732

select * from [cube].[F_ProductRevenueNAV] where ContractID=183732;
select * from [cube].[F_ProductRevenueENT] where ContractID=183732;

select * from [DCSQLPRD104].Enterprise.dbo.LineItem where ContractID=183732;