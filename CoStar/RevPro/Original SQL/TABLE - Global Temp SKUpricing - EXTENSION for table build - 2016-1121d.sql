--select *
--from contract
--where contractid in (
--	--99521,122392, 
--	116365, 116399)

--create table ##

select distinct 
	UPPER(CASE WHEN LEN(ProductName) < 10 THEN NULL
		WHEN [ProductName] like '%Finder%' THEN LEFT(RIGHT([ProductName], LEN([ProductName]) - 11), 4)
		WHEN [ProductName] like '%.com%' THEN LEFT(RIGHT([ProductName], LEN([ProductName]) - 9), 4)
		ELSE NULL END)
	, 'A' + [ProductLevel] + [MinusPlus] + [StandardValue] + RIGHT('00' + CAST([TermLength] as varchar(2)), 2) + 'NET'
	, s.*
from ##SKUpricing s

select * from ##ActiveLineItems where locationID = 41264081

select count(*) from ##ControlTable where ProductID in (270,268,269,267,282)

