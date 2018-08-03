/* 
---------------------------------
----Objectives for the day:------
---------------------------------
---------------------------------
1. Assemble the list of Customers; (Done)

2. Map the reporting elements from; (Working)
   the requirements list to the columns;

3. Write SQL for the report;
 
--------------------------------
*/

select * from [dbo].[NewHQMatchName2] 
select * from [cube].[D_Customer] WHERE CustomerName IN (
'Strategic Diversified Real Estate Holdings',
'Flourish Living',
'Realty Center Management, Inc.',
'Black Oak Knoxville Partners',
'McKinley, Inc.',
'ParaWest Management',
'JJS Property Management',
'Village Green',
'Lighthouse Management Services, LLC',
'Milestone'
);

select * from [cube].[D_Customer] WHERE CustomerName LIKE '%Flourish Living%';
select * from [cube].[D_Customer] WHERE CustomerName LIKE '%Black Oak Knoxville Partners%';

/* 


/*
----------------- ORIGINAL LIST OF  LOCID's to be used for the POC for the Apartments Report --------------------
392250
748376
36109921
55652401
23736558
290881
413205
37323391
-------------------------------------------------------------------------------------------
*/


*/



/*

------------------------------------------ Company Names to be used for the report -------------
Strategic Diversified Real Estate Holdings
Realty Center Management, Inc.
McKinley, Inc.
ParaWest Management
JJS Property Management
--Village Green ( This is a PMC )
Lighthouse Management Services, LLC
Milestone


*/

SELECT * FROM [dbo].[NewHQMatchName2] WHERE BillingLocID
IN (
'392250',
'748376',
'36109921',
'55652401',
'23736558',
'290881',
'413205',
'37323391'
);
------------------------------------------------------------
SELECT * FROM [dbo].[NewHQMatchName2] WHERE NewHQID
IN (
--'392250',
'748376',
'36109921',
'55652401',
'23736558',
'290881',
'413205',
'37323391'
);
-------------------------------------------------------
SELECT * FROM [cube].[D_Customer] WHERE LocationID
IN (
'748376',
'36109921',
'55652401',
'23736558',
'290881',
'413205',
'37323391'
);
---------------------------------------------------------

--------------------------------------------------------- 
/*
---- Updated POC Customer ID listings -------------------

748376
36109921
55652401
23736558
290881
413205
37323391

---------------------------------------------------------
*/
