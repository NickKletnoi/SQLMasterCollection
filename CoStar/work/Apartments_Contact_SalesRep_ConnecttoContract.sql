

SELECT 
C.ContractID, L.CurrentAEContactID , CT.FirstName, CT.LastName
FROM Contract C JOIN Location L 

ON C.LocationID=L.LocationID JOIN Contact CT 
ON L.CurrentAEContactID=CT.ContactID 
WHERE C.ContractID=148859

select top 10 * from Location