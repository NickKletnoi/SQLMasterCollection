select * from [DCSQLPRD104].[Enterprise].dbo.LineItem LI 
where LI.LineItemID IN (
select distinct [Line Item ID] from [dbo].[ZeroContractsNavision]);
-------------------------------------------------------------------
select distinct * from [DCSQLPRD104].[Enterprise].dbo.LineItem LI 
where LI.LineItemID IN (
select distinct [LineItemID] from [dbo].[ZeroContractsEnterprise]);
--------------------------------------------------------------------
select count(*) from [DCSQLPRD104].[Enterprise].dbo.LineItem;
--------------------------------------------------------------------