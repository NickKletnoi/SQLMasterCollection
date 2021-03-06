USE [RDWODS]
GO
/****** Object:  StoredProcedure [dbo].[p_RDWOLAP_Source_Dim_AssetType]    Script Date: 04/04/2008 15:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure  [dbo].[p_RDWOLAP_Source_Dim_AssetType]
AS  

Declare @Nullreplace varchar(20)
set @Nullreplace = 'None'

SELECT cast(ASSET_TYP_ID as numeric(18))								 as SrcAssetTypeId,		
       cast(ltrim(rtrim(isnull(NM,@Nullreplace))) as nvarchar(100))      as AssetTypeName,        		
       cast(ltrim(rtrim(ACTV_IN)) as nvarchar(1))		     as AssetTypeActive		
FROM  ASSET_TYP where ASSET_TYP_ID is not NULL

RETURN @@Error  