SELECT DISTINCT
    
	 V.[No_]              AS  VendorNo,
	 V.[Name]             AS  VendorName,
	 V.[Address]          AS  Adderess,
	 V.[City]			  AS  City, 
	 V.[County]           AS  [State], 
	 V.[E-Mail]           AS  Email,
	 V.[Vendor Posting Group]  AS VendorPostingGroup,
	 VL.[Global Dimension 1 Code] AS Department,
	 V.[Vendor Posting Group] AS BusinessUnitCode,
	 
	 --VL.[Document No_]    AS PaymentNo,
	 --VL.[Posting Date]    AS  LastPaymentDate,
	 --PIH.[PO Number]      AS PurchaseOrder_No
	  SUM(VDL.[Amount])    AS SpentAmount
	  
	 FROM [RIG$Vendor Ledger Entry] VL          
		JOIN [RIG$Vendor] V
		  ON VL.[Vendor No_]= V.[No_]
        JOIN [RIG$Detailed Vendor Ledg_ Entry] VDL
		  ON VL.[Entry No_] = VDL.[Vendor Ledger Entry No_]

	    --JOIN ( SELECT V.Ve  	
	 WHERE V.[Blocked] = '' 
	 AND VL.[Document Type] = '1'
	 AND VDL.[Entry Type]  ='1'
	 AND VL.[Posting Date] BETWEEN '2016-01-01' AND '2016-12-31'
	 AND V.[Vendor Posting Group] IN ('TRADE','FINDER')
	
	GROUP BY V.[No_], V.[Name],V.[Address],V.[City],V.[County],V.[E-Mail],V.[Vendor Posting Group],
	 VL.[Global Dimension 1 Code] ,
	 V.[Vendor Posting Group]
	--SUM(VDL.[Amount])
	
	-- AND VL.[Posting Date] IN ( SELECT  MAX(VL.[Posting Date]) from [RIG$Vendor Ledger Entry] VL)
	 --group by V.[No_]

