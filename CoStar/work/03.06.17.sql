select [ContractID],[ProductID],[BundleID], sum([CurrentMonthlyPrice]) as price 
from [dbo].[LineItem]
where [LastChargeDate] between '2017-01-01'and '2017-01-31' and [CurrentMonthlyPrice]>1
group by  [ContractID],[ProductID],[BundleID]
order by [ContractID]
--------------------------------------------------------------------------------------------------------

select [ContractID],LI.[ProductID],P.ProductName as ProductName,[BundleID], [CurrentMonthlyPrice],SiteLocationID,* from  [dbo].[LineItem] LI JOIN [dbo].Product P
ON LI.ProductID=P.ProductID
where [LastChargeDate] between '2017-01-01'and '2017-01-31' and [CurrentMonthlyPrice]>1
and contractID=62304
------------------------------------------------------------------------------------------------------------------------------
--where contractID=12 -- 636
--where contractID=12
select * from [dbo].[LineItem]
-------------------------------------------------------------------------------------------------------------------------------
select [ContractID],count([BundleID]) as BundleCount,Count(SiteLocationID) SiteLocationCount, sum([CurrentMonthlyPrice]) as price 
from [dbo].[LineItem]
--where  [LastChargeDate] between '2017-01-01'and '2017-01-31' and [CurrentMonthlyPrice]>1 and count([BundleID])>0
group by  [ContractID],[ProductID],[BundleID]
--having count([BundleID])>0
--order by [ContractID]
having count([BundleID])>1 and count([BundleID])<>Count(SiteLocationID)
--and  [LastChargeDate] between '2017-01-01'and '2017-01-31' and [CurrentMonthlyPrice]>1 and count([BundleID])>0









