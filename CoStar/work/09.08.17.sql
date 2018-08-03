
select L.LocationID,L.LocationPhone from 
[DCSQLPRD104].Enterprise.dbo.Location L where CAST(L.LocationID as varchar(50)) IN (
select  CAST(HQCustomerNumber as varchar(50)) from [dbo].[NewHQMatchName3])
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
select DISTINCT L.LocationID,NN.[HQCustomerNameLong] ,L.LocationPhone from 
[DCSQLPRD104].Enterprise.dbo.LocationProfile L LEFT JOIN [dbo].[NewHQMatchName3] NN ON 
CAST(L.LocationID as varchar(50))= CAST(NN.HQCustomerNumber as varchar(50))
------------------------------------------------------------------------------->>>
------------------------------------------------------------------------------->>>
------------------------------------------------------------------------------->>>
------------------------------------------------------------------------------->>>
where CAST(LocationID as varchar(50)) in (
select distinct CAST(HQCustomerNumber as varchar(50)) from [dbo].[NewHQMatchName3] NN)

select [HQCustomerNumber],[HQCustomerNameLong] from [dbo].[NewHQMatchName3]


select * from [dbo].[NewHQMatchName3]