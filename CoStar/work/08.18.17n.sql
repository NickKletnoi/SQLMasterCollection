SELECT 			
              -- IL.CustomerAccountName AS [CUSTOMER ACCOUNT NAME],
              -- IL.CustomerAccountCode AS [CUSTOMER ACCOUNT ID],   
              -- IH.[Customer Posting Group] AS [CUSTOMER POSTING GROUP],
              IH.[Bill-to Name] AS [Parent Company Name],     
               --IL.[Bill-to Customer No_] AS [Parent Company LOC ID],
              -- IL.[Description] As [Product Name],
              -- IL.[Business Unit Code] as [Product Code],
              -- IL.[Contract ID] as [Contract ID],
             ----  IL.[Site ID] as [Site Location ID],
             --  IL.[Site Name] as [Site Name],
			  -- IL.[Line Item ID] As [Linte Item ID],
              -- IL.[Description 3] as [Billing Period],
              -- IL.[Document No_] as [Invoice No],
			 -- CAST(CONVERT(VARCHAR(10),IL.[Posting Date],101)AS NVARCHAR(10)) as [Posting Date],                          
              SUM(convert(money,IL.[Amount])) as [Amount]                     
             --  IL.[Gen_ Prod_ Posting Group] as [Product Posting Group] 
                                  		
  FROM [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Line] IL
  INNER JOIN [DCSQLDEV135\ACCT].[NAVISIONDB260_PRD].[dbo].[RIG$Sales Invoice Header] IH ON IL.[Document No_] = IH.No_
  WHERE [Business Unit Code] IN
  ('AFPAK','AFPLUS','AFPRO','AFPROODD','APN','APT','APT001','APT002','APT003', 
'APT004','APT005','APTSDIAMDA','APTSDIAMON','APTSGOLD','APTSGOLDA','APTSMYMEA','APTSMYMED',
'APTSPHTRTK','APTSPLATIN','APTSPLATNA','APTSSILVER','APTSSILVRA','APTSVDRSHT')
  --AND IL.[Posting Date]  BETWEEN @Fdaymonth AND @Ldaymonth  
    AND IL.[Posting Date]  BETWEEN '08/01/2017' AND '08/31/2017' 
GROUP BY   IH.[Bill-to Name] 


  --AND IL.[Document No_] = '103285286-1'
  order by IH.[Bill-to Name] 
  ----------------------------------------------------------------------------------

  --select 
  
  Update C
  SET C.ParentCustomerName =LEFT(CustomerName, CHARINDEX('-',CustomerName)-1) 
  from [cube].[D_Customer] C where CustomerName like '%-%'
  ------------
   Update C
  SET C.ParentCustomerName = C.CustomerName
  from [cube].[D_Customer] C where C.ParentCustomerName IS NULL;
  ---------------------------------------------------------------------
  ---------------------------------------------------------------------
  ALTER TABLE [cube].[D_Customer] ADD ParentCustomerName varchar(150) null;
  --------------------------------------------------------------------------
  SELECT CustomerName, LEFT(CustomerName, CHARINDEX('-',CustomerName)-1) FROM [cube].[D_Customer]
  WHERE CustomerName like '%-%'
  