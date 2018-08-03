select DATEADD(DAY,1,EOMONTH(getdate(),-1)) as FirstDayOfMonth
select  EOMONTH(getdate()) as LastDayOfMonth	