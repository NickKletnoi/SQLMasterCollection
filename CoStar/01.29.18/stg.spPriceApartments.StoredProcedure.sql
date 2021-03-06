USE [RevPro]
GO
/****** Object:  StoredProcedure [stg].[spPriceApartments]    Script Date: 1/29/2018 3:17:40 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [stg].[spPriceApartments]
	
  @pVersionID tinyint = null
  ,@pUnitCount int
  ,@pWeightedAvgRentPerSqFt float
  ,@pIsBundle int
  ,@pEquivalentProductID int
, @pContractTermID int= Null
, @pDebug bit = 0
AS

DECLARE @AsOfDate DATETIME = GETDATE()  

DECLARE @SKU                Varchar(30)
DECLARE @ListPrice money

 IF @pContractTermID IS NULL
    SET @pContractTermID=1
 
  IF @pContractTermID IN(2,3,5)
    SET @pContractTermID=1

           
--Getting the latest version
 
  SELECT @pVersionID =Max(VersionID) 
  FROM  [EnterpriseSalesPricing].prc.[AptsProductPrice] m (nolock)
  WHERE m.ContractTermID=@pContractTermID AND currentpriceflag=1 and m.productid = @pEquivalentProductID

 -- prefix
 select @sku  = s.SKUPrefix + 'NET' from lookups.AptsSKUSetup s where  s.ProductID = @pEquivalentProductID 

select @SKU = @SKU  +CASE WHEN @pUnitCount <80          THEN 'M' ELSE  'P' END+
	                         +CASE WHEN @pWeightedAvgRentPerSqFt <1 THEN 'V' ELSE 'S'  END, 
           @ListPrice=CASE --WHEN sp.DiscountedMonthlyPrice < app.ListPrice THEN  sp.DiscountedMonthlyPrice 
		                   WHEN @pIsBundle  = 1 THEN app.ListPrice else app.ListPrice END
	FROM [EnterpriseSalesPricing].[prc].[AptsProductPrice]  app 
			where  app.ProductID = @pEquivalentProductID
			and @pUnitCount between app.MinNumUnits and app.MaxNumUnits
			and case when @pWeightedAvgRentPerSqFt < 1 then .1 else 1 end = app.PricePerSqFt
			and app.contracttermid =@pContractTermID
			AND VersionID = @pVersionID and currentpriceFlag=1 
		
		select @SKU, @ListPrice ;
 

 
RETURN 0

GO
