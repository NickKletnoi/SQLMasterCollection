


USE [EnterpriseSalesPricing]
     
       DECLARE @DataTable AS prc.ProductType
      INSERT @DataTable (ProductID,Productname)
      Values (2,'TenantWeb'),
              (5,'CompsWeb')
      
       EXEC [prc].[spPropertyTenantPrice] 
            @pLocationID = 2927,
            @pnumberofMarket = 5,
            @pUserCount = 1,
            @pProducts = @DataTable,
            @pDetail = 0
