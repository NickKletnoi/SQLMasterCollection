USE [Enterprise]
GO
/****** Object:  UserDefinedFunction [dbo].[SpaceForLeasePrimaryBroker]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[SpaceForLeasePrimaryBroker]
GO
/****** Object:  UserDefinedFunction [dbo].[LandForLeasePrimaryBroker]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[LandForLeasePrimaryBroker]
GO
/****** Object:  UserDefinedFunction [dbo].[ForSalePrimaryBroker]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[ForSalePrimaryBroker]
GO
/****** Object:  UserDefinedFunction [dbo].[fnStrToPhoneKeys]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnStrToPhoneKeys]
GO
/****** Object:  UserDefinedFunction [dbo].[fnPropertyPInPShapeGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnPropertyPInPShapeGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnMFProperties]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnMFProperties]
GO
/****** Object:  UserDefinedFunction [dbo].[fnListingScrapeBrokerContactFieldsParse]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnListingScrapeBrokerContactFieldsParse]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetLocationNameFTS]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetLocationNameFTS]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCRMEnabledCountryCodes]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetCRMEnabledCountryCodes]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCurrentApartmentUnitMix]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCurrentApartmentUnitMix]
GO
/****** Object:  UserDefinedFunction [dbo].[fnPropertyMultifamilyNeighborhoods]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnPropertyMultifamilyNeighborhoods]
GO
/****** Object:  UserDefinedFunction [dbo].[fnMFPropertyUnitCounts]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnMFPropertyUnitCounts]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCompDerivedPriceGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCompDerivedPriceGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCompAssignmentPriceGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCompAssignmentPriceGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCompEntityDerivedPriceGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCompEntityDerivedPriceGet]
GO
/****** Object:  UserDefinedFunction [loopnet].[fnContractProductGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [loopnet].[fnContractProductGet]
GO
/****** Object:  UserDefinedFunction [dbo].[VacuousGeometryToGeography]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[VacuousGeometryToGeography]
GO
/****** Object:  UserDefinedFunction [dbo].[VacuousGeographyToGeometry]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[VacuousGeographyToGeometry]
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_NCOAProperCase]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[UDF_NCOAProperCase]
GO
/****** Object:  UserDefinedFunction [dbo].[SmithWatermanGotoh]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[SmithWatermanGotoh]
GO
/****** Object:  UserDefinedFunction [dbo].[Similarity]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[Similarity]
GO
/****** Object:  UserDefinedFunction [dbo].[ShiftGeometry]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[ShiftGeometry]
GO
/****** Object:  UserDefinedFunction [dbo].[MakeValidGeographyFromText]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[MakeValidGeographyFromText]
GO
/****** Object:  UserDefinedFunction [dbo].[MakeValidGeographyFromGeometry]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[MakeValidGeographyFromGeometry]
GO
/****** Object:  UserDefinedFunction [dbo].[LocateAlongGeom]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[LocateAlongGeom]
GO
/****** Object:  UserDefinedFunction [dbo].[LocateAlongGeog]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[LocateAlongGeog]
GO
/****** Object:  UserDefinedFunction [dbo].[JaroWinkler]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[JaroWinkler]
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidGeographyFromText]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[IsValidGeographyFromText]
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidGeographyFromGeometry]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[IsValidGeographyFromGeometry]
GO
/****** Object:  UserDefinedFunction [dbo].[InterpolateBetweenGeom]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[InterpolateBetweenGeom]
GO
/****** Object:  UserDefinedFunction [dbo].[InterpolateBetweenGeog]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[InterpolateBetweenGeog]
GO
/****** Object:  UserDefinedFunction [dbo].[fnWorkday]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnWorkday]
GO
/****** Object:  UserDefinedFunction [dbo].[fnWeekBeginDate]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnWeekBeginDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fnWebUsersAFLoginName]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnWebUsersAFLoginName]
GO
/****** Object:  UserDefinedFunction [dbo].[fnValidateTelephoneNumber]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnValidateTelephoneNumber]
GO
/****** Object:  UserDefinedFunction [dbo].[fnValidatePropertyFloor]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnValidatePropertyFloor]
GO
/****** Object:  UserDefinedFunction [dbo].[fnValidatePrimaryAddress]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnValidatePrimaryAddress]
GO
/****** Object:  UserDefinedFunction [dbo].[fnUsageTrend]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnUsageTrend]
GO
/****** Object:  UserDefinedFunction [dbo].[fnTransactionHistoryReviewStatusCheck]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnTransactionHistoryReviewStatusCheck]
GO
/****** Object:  UserDefinedFunction [dbo].[fnTimePeriodDays]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnTimePeriodDays]
GO
/****** Object:  UserDefinedFunction [dbo].[fnTimeDimIDs]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnTimeDimIDs]
GO
/****** Object:  UserDefinedFunction [dbo].[fnStrToInt]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnStrToInt]
GO
/****** Object:  UserDefinedFunction [dbo].[fnStripTrivialWords]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnStripTrivialWords]
GO
/****** Object:  UserDefinedFunction [dbo].[fnStripChars]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnStripChars]
GO
/****** Object:  UserDefinedFunction [dbo].[fnStringToTable]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnStringToTable]
GO
/****** Object:  UserDefinedFunction [dbo].[fnStringAtDef]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnStringAtDef]
GO
/****** Object:  UserDefinedFunction [dbo].[fnStringAt]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnStringAt]
GO
/****** Object:  UserDefinedFunction [dbo].[fnStreetRangeCompare]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnStreetRangeCompare]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplitName]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnSplitName]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSoundexConvertAlpha]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnSoundexConvertAlpha]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSlavoGermanic]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnSlavoGermanic]
GO
/****** Object:  UserDefinedFunction [dbo].[fnRSIPriceEstimator]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnRSIPriceEstimator]
GO
/****** Object:  UserDefinedFunction [dbo].[fnReturnPhoneNumberOnly]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnReturnPhoneNumberOnly]
GO
/****** Object:  UserDefinedFunction [dbo].[fnRemoveNoiseWords]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnRemoveNoiseWords]
GO
/****** Object:  UserDefinedFunction [dbo].[fnQuoteDoubler]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnQuoteDoubler]
GO
/****** Object:  UserDefinedFunction [dbo].[fnQuoteDelimitString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnQuoteDelimitString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnPRSOriginalFilename]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnPRSOriginalFilename]
GO
/****** Object:  UserDefinedFunction [dbo].[fnPropertyTenantFloorStringGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnPropertyTenantFloorStringGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnPropertyResearchStatusGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnPropertyResearchStatusGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnPropertyFloorStringGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnPropertyFloorStringGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnProperCase]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnProperCase]
GO
/****** Object:  UserDefinedFunction [dbo].[fnProductListGet2]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnProductListGet2]
GO
/****** Object:  UserDefinedFunction [dbo].[fnProductListGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnProductListGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnProductCategory]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnProductCategory]
GO
/****** Object:  UserDefinedFunction [dbo].[fnPreviousWeekEndDate]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnPreviousWeekEndDate]
GO
/****** Object:  UserDefinedFunction [dbo].[FnPopulateTimeDim]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[FnPopulateTimeDim]
GO
/****** Object:  UserDefinedFunction [dbo].[fnPipelineIDListGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnPipelineIDListGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnPermissionGroupAuthorizedManagerCSVListGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnPermissionGroupAuthorizedManagerCSVListGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnPeriodFirstDayGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnPeriodFirstDayGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnNum2Words]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnNum2Words]
GO
/****** Object:  UserDefinedFunction [dbo].[fnNum2FTSSearch]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnNum2FTSSearch]
GO
/****** Object:  UserDefinedFunction [dbo].[fnNickNames]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnNickNames]
GO
/****** Object:  UserDefinedFunction [dbo].[fnMostRecentDate]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnMostRecentDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fnMostRecentCharDate]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnMostRecentCharDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fnMonthlyPriceCalcSubsidiary]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnMonthlyPriceCalcSubsidiary]
GO
/****** Object:  UserDefinedFunction [dbo].[fnMonthlyPriceCalcMonetaryUnit]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnMonthlyPriceCalcMonetaryUnit]
GO
/****** Object:  UserDefinedFunction [dbo].[fnMonthlyPriceCalc3]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnMonthlyPriceCalc3]
GO
/****** Object:  UserDefinedFunction [dbo].[fnMaskToRegExpression]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnMaskToRegExpression]
GO
/****** Object:  UserDefinedFunction [dbo].[fnMaskCalculation]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnMaskCalculation]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLongDateFormat]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnLongDateFormat]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLockOutRemaining]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnLockOutRemaining]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLocationIdFromName]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnLocationIdFromName]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLocationHQChildrenGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnLocationHQChildrenGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLocationDescendantsGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnLocationDescendantsGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnListingChangeStatementTextSampleGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnListingChangeStatementTextSampleGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLineItemUsersGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnLineItemUsersGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLineItemDupCheck]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnLineItemDupCheck]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLeaseDealDidUpdateColumn]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnLeaseDealDidUpdateColumn]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLeadResultSummaryGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnLeadResultSummaryGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLeadResultDetailGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnLeadResultDetailGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsVowel]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsVowel]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsValidResearcher]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsValidResearcher]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsValidEmail]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsValidEmail]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsUserLockedOut]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsUserLockedOut]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsTrueOwner]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsTrueOwner]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsSubscriber]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsSubscriber]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsResearchManager]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsResearchManager]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsResearchDirector]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsResearchDirector]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsReallyInteger]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsReallyInteger]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsManager]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsManager]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsFieldResearchUser]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsFieldResearchUser]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsDaylightSavingsTime]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsDaylightSavingsTime]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsCountrySubjectToValidation]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsCountrySubjectToValidation]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsCoStarEmail]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsCoStarEmail]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsContactHQChanging]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsContactHQChanging]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsCompPropertyOnMarketFlag]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsCompPropertyOnMarketFlag]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsCompanyAClient]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsCompanyAClient]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsBroker]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsBroker]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsApartmentsCustomer]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnIsApartmentsCustomer]
GO
/****** Object:  UserDefinedFunction [dbo].[fnInactivePropertyPointCalc]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnInactivePropertyPointCalc]
GO
/****** Object:  UserDefinedFunction [dbo].[fnHasPRSReferences]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnHasPRSReferences]
GO
/****** Object:  UserDefinedFunction [dbo].[fnHasPermissionToEditLockedHierarchy]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnHasPermissionToEditLockedHierarchy]
GO
/****** Object:  UserDefinedFunction [dbo].[fnHasPermissionToChangeHierarchy]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnHasPermissionToChangeHierarchy]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGoSellSupportedProducts]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGoSellSupportedProducts]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGoSellLoopnetTieredListingProducts]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGoSellLoopnetTieredListingProducts]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGoSellLoopnetHQProducts]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGoSellLoopnetHQProducts]
GO
/****** Object:  UserDefinedFunction [dbo].[FNGetTimeDimID]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[FNGetTimeDimID]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetResearchPortfolioIDCountyString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetResearchPortfolioIDCountyString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetPropertyTypeDesc]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetPropertyTypeDesc]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGETListOfSitesStructure]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGETListOfSitesStructure]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetLeadResearchPortfolioIDCountyString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetLeadResearchPortfolioIDCountyString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetHomepageContacts]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetHomepageContacts]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCountyDocNumRegExString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetCountyDocNumRegExString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCountyDocNumMaskString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetCountyDocNumMaskString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCountyAPNRegExString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetCountyAPNRegExString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCountyAPNMaskString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetCountyAPNMaskString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCompGeneralPriority]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetCompGeneralPriority]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCompDocNumString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetCompDocNumString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCompAssignmentPriority]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetCompAssignmentPriority]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCompAPNString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetCompAPNString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetBATCHLISTStructure]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetBATCHLISTStructure]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetAKAList]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnGetAKAList]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFTSTenantGeneralAddrCriteriaEx]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFTSTenantGeneralAddrCriteriaEx]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFTSCriteriaEx2]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFTSCriteriaEx2]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFTSCriteriaEx]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFTSCriteriaEx]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatUKPhoneNumber2]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatUKPhoneNumber2]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatStreetNumSort]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatStreetNumSort]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatStreetInternational]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatStreetInternational]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatStreet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatStreet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatSQLStr]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatSQLStr]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatPostalInfo]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatPostalInfo]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatPhoneNumber2]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatPhoneNumber2]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatPhoneNumber]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatPhoneNumber]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatName]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatName]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatMoney]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatMoney]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatInt]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatInt]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatGlobalPhoneNumber]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatGlobalPhoneNumber]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatDateTime2]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatDateTime2]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatDateTime]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatDateTime]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatCurrency]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatCurrency]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatCityStateZip]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatCityStateZip]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatBigInt]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatBigInt]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatAltBillingStreet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFormatAltBillingStreet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFindNextWhiteSpaceChar]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFindNextWhiteSpaceChar]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFieldLeadBrokerContactFieldsParse]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnFieldLeadBrokerContactFieldsParse]
GO
/****** Object:  UserDefinedFunction [dbo].[fnDoubleMetaphoneTable]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnDoubleMetaphoneTable]
GO
/****** Object:  UserDefinedFunction [dbo].[fnDoubleMetaphoneScalar]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnDoubleMetaphoneScalar]
GO
/****** Object:  UserDefinedFunction [dbo].[fnDistanceBetweenLocationsNumeric]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnDistanceBetweenLocationsNumeric]
GO
/****** Object:  UserDefinedFunction [dbo].[fnDistanceBetweenLocations]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnDistanceBetweenLocations]
GO
/****** Object:  UserDefinedFunction [dbo].[fnDetermineLocationHierarchyIDScheme]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnDetermineLocationHierarchyIDScheme]
GO
/****** Object:  UserDefinedFunction [dbo].[fnDetermineLocationAncestry]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnDetermineLocationAncestry]
GO
/****** Object:  UserDefinedFunction [dbo].[fnDateWhereClause]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnDateWhereClause]
GO
/****** Object:  UserDefinedFunction [dbo].[fnDateOnly]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnDateOnly]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCRMEnvironmentIDGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCRMEnvironmentIDGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCRMDefaultGet2]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCRMDefaultGet2]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCRMDefaultGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCRMDefaultGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCreditCardCheck]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCreditCardCheck]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCreateExpenseStopString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCreateExpenseStopString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCreateEscalationString2]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCreateEscalationString2]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCreateEscalationString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCreateEscalationString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnConvertServicesToShortHand]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnConvertServicesToShortHand]
GO
/****** Object:  UserDefinedFunction [dbo].[fnContactSubordinatesGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnContactSubordinatesGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnContactSecurityAreaGroupMembershipCSVListGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnContactSecurityAreaGroupMembershipCSVListGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnContactNameWhereClause2]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnContactNameWhereClause2]
GO
/****** Object:  UserDefinedFunction [dbo].[fnContactHasActiveSubscriptions]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnContactHasActiveSubscriptions]
GO
/****** Object:  UserDefinedFunction [dbo].[fnContactHasActiveListings]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnContactHasActiveListings]
GO
/****** Object:  UserDefinedFunction [dbo].[fnContactHasAcceptedTermsOfUse]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnContactHasAcceptedTermsOfUse]
GO
/****** Object:  UserDefinedFunction [dbo].[fnContactGroupMembershipCSVListGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnContactGroupMembershipCSVListGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnContactActivityProductLists]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnContactActivityProductLists]
GO
/****** Object:  UserDefinedFunction [dbo].[fnConfirmedOccupancyBySpaceOccupied]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnConfirmedOccupancyBySpaceOccupied]
GO
/****** Object:  UserDefinedFunction [dbo].[fnConfirmedOccupancyByLocationOccupancy]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnConfirmedOccupancyByLocationOccupancy]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCondoUnitSpaceUseList]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCondoUnitSpaceUseList]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCondoUnitFloorList]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCondoUnitFloorList]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCompPriceHistoryGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCompPriceHistoryGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCompAssessmentTotalCalc]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCompAssessmentTotalCalc]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCommunityCallerConcessionTransform]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCommunityCallerConcessionTransform]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCleanString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCleanString]
GO
/****** Object:  UserDefinedFunction [dbo].[fnChangeLogStatementTextSampleGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnChangeLogStatementTextSampleGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalculatePropertyApartmentEffectiveRent]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnCalculatePropertyApartmentEffectiveRent]
GO
/****** Object:  UserDefinedFunction [dbo].[fnBrokerContactMethod]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnBrokerContactMethod]
GO
/****** Object:  UserDefinedFunction [dbo].[fnAlphaNumericSortVal]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnAlphaNumericSortVal]
GO
/****** Object:  UserDefinedFunction [dbo].[fnAdvLastUpdate]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fnAdvLastUpdate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_UseClassDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_UseClassDescGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ThrowError]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_ThrowError]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SpreadOverTermTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_SpreadOverTermTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SpaceUseNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_SpaceUseNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SpaceTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_SpaceTypeDescGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SignagePayerTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_SignagePayerTypeDescGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ServiceTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_ServiceTypeDescGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ResidentialParkingTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_ResidentialParkingTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_RentPlusTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_RentPlusTypeDescGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_RateEscalationTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_RateEscalationTypeDescGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_RateEscalationAmountTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_RateEscalationAmountTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_RateBasisDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_RateBasisDescGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_RateAmountTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_RateAmountTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_RateActualIncreaseMethodTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_RateActualIncreaseMethodTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_PetTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_PetTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ParseString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_ParseString]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ParseIntsAddIdentity]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_ParseIntsAddIdentity]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_MonetaryUnitDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_MonetaryUnitDescGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LoanAmortizationTermTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_LoanAmortizationTermTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LeaseTermTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_LeaseTermTypeDescGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LeaseDealTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_LeaseDealTypeDescGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LeaseDealStatusNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_LeaseDealStatusNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LeaseDealSourceTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_LeaseDealSourceTypeDescGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LeaseDealEntitySourceTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_LeaseDealEntitySourceTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LandlordConcessionAmountTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_LandlordConcessionAmountTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_IntToBase36]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_IntToBase36]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSPParamCallString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_GetSPParamCallString]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetLastDayOfMonth]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_GetLastDayOfMonth]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetFirstDayOfMonth]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_GetFirstDayOfMonth]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCycleEndDate]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_GetCycleEndDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_FreeRentMethodTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_FreeRentMethodTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_EscapeString]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_EscapeString]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_DateToDate]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_DateToDate]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_DataSourceTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_DataSourceTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CpiAnnualTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_CpiAnnualTypeNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Base36ToInt]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_Base36ToInt]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_AmenityNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_AmenityNameGet]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ACSNumericMod10CheckDigit]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[fn_ACSNumericMod10CheckDigit]
GO
/****** Object:  UserDefinedFunction [dbo].[FilterArtifactsGeometry]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[FilterArtifactsGeometry]
GO
/****** Object:  UserDefinedFunction [dbo].[FilterArtifactsGeography]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[FilterArtifactsGeography]
GO
/****** Object:  UserDefinedFunction [dbo].[f_companyStrip]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[f_companyStrip]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvexHullGeographyFromText]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[ConvexHullGeographyFromText]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvexHullGeography]    Script Date: 12/18/2017 11:22:53 AM ******/
DROP FUNCTION [dbo].[ConvexHullGeography]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvexHullGeography]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[ConvexHullGeography](@geog [geography])
RETURNS [geography] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[ConvexHullGeography]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvexHullGeographyFromText]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[ConvexHullGeographyFromText](@inputWKT [nvarchar](max), @srid [int])
RETURNS [geography] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[ConvexHullGeographyFromText]
GO
/****** Object:  UserDefinedFunction [dbo].[f_companyStrip]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f_companyStrip] (@str varchar(1024))
  returns varchar(1024)
as
begin

  return
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(

    Upper(' ' + Upper(@Str) + ' ')
  ,'!','')
  ,'"','')
  ,'#','')
  ,'$','')
  ,'%','')
  ,'&','')
  ,'''','')
  ,'(','')
  ,')','')
  ,'*','')
  ,'+','')
  ,',','')
  ,'-','')
  ,'.','')
  ,'/','')
  ,':','')
  ,';','')
  ,'<','')
  ,'=','')
  ,'>','')
  ,'?','')
  ,'@','')
  ,'[','')
  ,'\','')
  ,']','')
  ,'^','')
  ,'_','')
  ,'`','')
  ,'{','')
  ,'|','')
  ,'}','')
  ,'~','')
  ,' CO ','')
  ,' INC ','')
  ,' CORPORATION ','')
  ,' CORP ','')
  ,' COMPANY ','')
  ,' INCORPORATED ','')
  ,' LLP ','')
  ,' LLC ','')
  ,' PARTNERS ','')
  ,' PARTNER ','')
  ,' THE ','')
  ,' OF ','')
  ,' AS ','')
  ,' FROM ','')
  ,' IT ','')
  ,' ALL ','')


End

GO
/****** Object:  UserDefinedFunction [dbo].[FilterArtifactsGeography]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[FilterArtifactsGeography](@g [geography], @filterEmptyShapes [bit], @filterPoints [bit], @lineStringTolerance [float], @ringTolerance [float])
RETURNS [geography] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[FilterArtifactsGeography]
GO
/****** Object:  UserDefinedFunction [dbo].[FilterArtifactsGeometry]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[FilterArtifactsGeometry](@g [geometry], @filterEmptyShapes [bit], @filterPoints [bit], @lineStringTolerance [float], @ringTolerance [float])
RETURNS [geometry] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[FilterArtifactsGeometry]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ACSNumericMod10CheckDigit]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_ACSNumericMod10CheckDigit](

@pStr varchar(100)

)

Returns int

AS

/***************************************************************************************
**  Name:  	fn_ACSNumericMod10CheckDigit
**
**  Purpose:  	Function to calculate ACS Numeric Check Digit using Mod10 Algorithm
**
**  2006/07/07  DBZ  Function creation
***************************************************************************************/

Begin

	/*  Table var for CheckDigit calc  */
	Declare
		@ACSCheckDigit Table(
			TempID int not null identity(1,1),
			Value int,
			Weight int,
			Tens int,
			Ones int)

	Declare
		@PositionCounter int,
		@CheckDigit int
	
	Select
		@PositionCounter = 1,
		@pStr = replace(@pStr, ' ', '')
	

	/*  Populate @ACSCheckDigit with parsed @pStr  */
	While @PositionCounter <= len(@pStr)
	Begin
		Insert into @ACSCheckDigit(
			Value)

		Select
			substring(@pStr, @PositionCounter, 1)
	
		Select
			@PositionCounter = @PositionCounter + 1
	End


	/*  Determine Weight, Tens and Ones values  */
	Update
		@ACSCheckDigit
	Set 	Weight = (case when TempID % 2 = 0 then Value else (Value * 2) end),			-- If odd position, multiply by 2
		Tens = floor((case when TempID % 2 = 0 then Value else (Value * 2) end) / 10),		-- Determine Tens digit
		Ones = (case when TempID % 2 = 0 then Value else (Value * 2) end)			-- Determine Ones digit
				- (floor((case when TempID % 2 = 0 then Value else (Value * 2) end) / 10) * 10)


	/*  Calculate Check Digit  */	
	Select
		/*  Take right most digit of Sum(Tens * 10 + Sum(Ones)) and subtract from 10.  If right most digit = 0, CheckDigit =  0  */
		@CheckDigit = 	(case 	when (cast(right(cast(Sum(Tens + Ones) as varchar(30)), 1) as int)) > 0
					then 10 - cast(right(cast(Sum(Tens + Ones) as varchar(30)), 1) as int)
					else 0 
				end)
	From	@ACSCheckDigit

	Return  
		@CheckDigit
End

GO
/****** Object:  UserDefinedFunction [dbo].[fn_AmenityNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_AmenityNameGet]
	(@AmenityID INT)
RETURNS VARCHAR (30)
AS
BEGIN
	DECLARE @retval VARCHAR (30)
	SELECT @retval = Amenity.AmenityName FROM [dbo].Amenity WITH (NOLOCK)
	WHERE AmenityID = @AmenityID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_Base36ToInt]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_Base36ToInt] (@Base36Code varChar(7)) Returns int

as

Begin
	declare 
		@s Char(1),
		@i int,
		@iVal int

	set @i = 1
	set @iVal = 0
	While @i <= len(lTrim(@Base36Code))
	   Begin
		set @s = upper(subString(right(@Base36Code,@i),1,1))
	
		If isNumeric(@s) > 0 set @iVal = @iVal + 
			(convert(int, @s) * Case when @i > 1 then power(36, @i -1) else 1 end)
		Else set @iVal = @iVal + 
			(convert(int,ascii(@s)-55) * Case when @i > 1 then power(36, @i -1) else 1 end)
	
		set @i = @i + 1
	   End
	Return @iVal
End

GO
/****** Object:  UserDefinedFunction [dbo].[fn_CpiAnnualTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_CpiAnnualTypeNameGet]
	(@CpiAnnualTypeID SMALLINT)
RETURNS VARCHAR (100)
AS
BEGIN
	DECLARE @retval VARCHAR (100)
	SELECT @retval = CpiAnnualType.CpiAnnualTypeName FROM [dbo].CpiAnnualType WITH (NOLOCK)
	WHERE CpiAnnualTypeID = @CpiAnnualTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_DataSourceTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_DataSourceTypeNameGet]
	(@DataSourceTypeID INT)
RETURNS VARCHAR (25)
AS
BEGIN
	DECLARE @retval VARCHAR (25)
	SELECT @retval = DataSourceType.DataSourceTypeName FROM [dbo].DataSourceType WITH (NOLOCK)
	WHERE DataSourceTypeID = @DataSourceTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_DateToDate]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------------
-- File: c:\CoStarProjects\CRM.WS.Database\CRM.WS.DB.Contracts\Functions\fn_DateToDate.sql
CREATE FUNCTION [dbo].[fn_DateToDate] (@NumToDateType varchar(4), @ReturnType varchar(4), @EDate datetime)        /* CRM Version 5.1.1.3 */
Returns varchar(50)
as

/****************************************************************************
This function calculates MTD, YTD, QTD or specific date to a specific date
@NumToDateType takes YTD,QTD,MTD, NULL or any integer
@ReturnType takes Days, Date
*****************************************************************************/


Begin
Declare @Sdate datetime, @l_Time_Period int

--set @Edate=dateadd(day, 1, convert(varchar(10), @Edate,101))

If @NumToDateType='YTD'
	begin
		set @Sdate=convert(datetime, '1/1/'+convert(varchar(4),year(@Edate)))
		set @l_Time_Period=datediff(day, @Sdate, @Edate)
	end

else If @NumToDateType='QTD'
	begin
		if datepart(quarter, @Edate)=1
			set @Sdate=convert(datetime, '1/1/'+convert(varchar(4),year(@Edate)))
		else if datepart(quarter, @Edate)=2
			set @Sdate=convert(datetime, '4/1/'+convert(varchar(4),year(@Edate)))	
		else if datepart(quarter, @Edate)=3
			set @Sdate=convert(datetime, '7/1/'+convert(varchar(4),year(@Edate)))
		else
			set @Sdate=convert(datetime, '10/1/'+convert(varchar(4),year(@Edate)))
		set @l_Time_Period=datediff(day, @Sdate, @Edate)
	end
else If @NumToDateType='MTD'
	begin
		set @Sdate=convert(datetime, convert(varchar(2),month(@Edate))+'/1/'+convert(varchar (4), year(@edate)))
		set @l_Time_Period=datediff(day, @Sdate, @Edate)
	end
else If isnull(@NumToDateType,'XX')='XX'
	begin
		set @Sdate='1/1/1900'
		set @l_Time_Period=datediff(dd, @Sdate, @Edate)
	end
else
	begin
		set @l_Time_Period=@NumToDateType
		set @Sdate=dateadd(day, -@l_Time_period, @Edate)
	end

Declare @ReturnValue varchar(50)
if upper(@ReturnType)='DAYS'
	set @ReturnValue=@l_Time_Period+1
else
	set @ReturnValue=@SDate	

return @ReturnValue

END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_EscapeString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------
-- File: C:\CoStarProjects\CoStarInternalApps\Dev\Ent-US\Source\CRM.WS.DATABASE\CRM.WS.DB.Lookups\Functions\fn_EscapeString.sql

CREATE FUNCTION [dbo].[fn_EscapeString](@body NVARCHAR(MAX))
	   RETURNS NVARCHAR(MAX)
AS 

/***************************************************************************************
**  Name:  	fn_EscapeString
**
**  Purpose:  	Quote escaper
**
**  Function creation date: 2016/08/03  
***************************************************************************************/

BEGIN
	RETURN replace(CAST(N'''' AS NVARCHAR(MAX)) + REPLACE(@body, '''', '''''') + CAST(N'''' AS NVARCHAR(MAX)), '''''','''')
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_FreeRentMethodTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_FreeRentMethodTypeNameGet]
	(@FreeRentMethodTypeID SMALLINT)
RETURNS VARCHAR (100)
AS
BEGIN
	DECLARE @retval VARCHAR (100)
	SELECT @retval = FreeRentMethodType.FreeRentMethodTypeName FROM [dbo].FreeRentMethodType WITH (NOLOCK)
	WHERE FreeRentMethodTypeID = @FreeRentMethodTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCycleEndDate]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[fn_GetCycleEndDate]  (@BillingFrequencyCD char(1),
                                         @InvoiceBatchDate smalldatetime, 
                                         @InvoiceMonth int,
                                         @InvoiceYear int,
                                         @QuarterlyCycleOne int,
                                         @QuarterlyCycleTwo int,
                                         @QuarterlyCycleThree int,
                                         @QuarterlyCycleFour int,
                                         @SemiAnnualCycleOne int,
                                         @SemiAnnualCycleTwo int,
                                         @AnnualCycle int
                                         ) 
RETURNS smalldatetime
AS

BEGIN 

/*
This function calculates the last day of a billing cycle.  The approach is to insert the possible cycle end dates
into a table variable and then select the one minimum one that is greater than the current billing period.  Possible
dates include the previous year, current year, and future year.  

*/


DECLARE @CycleEndDate smalldatetime

DECLARE @EndDates TABLE (EndDate smalldatetime)

IF @BillingFrequencyCD IN ('M','O')  --monthly or bill once
  BEGIN
    SET @CycleEndDate = @InvoiceBatchDate
  END

ELSE IF @BillingFrequencyCD = 'Q'
  BEGIN

	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycycleone,@invoiceyear)))

	INSERT INTO @EndDates
        SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycycleone,@invoiceyear + 1)))

	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycycleone,@invoiceyear - 1)))


	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycycletwo,@invoiceyear)))

	INSERT INTO @EndDates
        SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycycletwo,@invoiceyear + 1)))

	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycycletwo,@invoiceyear - 1)))


	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycyclethree,@invoiceyear)))

	INSERT INTO @EndDates
        SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycyclethree,@invoiceyear + 1)))

	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycyclethree,@invoiceyear - 1)))


	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycyclefour,@invoiceyear)))

	INSERT INTO @EndDates
        SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycyclefour,@invoiceyear + 1)))

	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,3,dbo.fn_GetFirstDayOfMonth(@quarterlycyclefour,@invoiceyear - 1)))

	SELECT @CycleEndDate = MIN(EndDate)
	FROM @EndDates
	WHERE EndDate >= @InvoiceBatchDate

  END

ELSE IF @BillingFrequencyCD = 'S'
  BEGIN

	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,6,dbo.fn_GetFirstDayOfMonth(@semiannualcycleone,@invoiceyear)))

	INSERT INTO @EndDates
        SELECT DATEADD(dd,-1,DATEADD(mm,6,dbo.fn_GetFirstDayOfMonth(@semiannualcycleone,@invoiceyear + 1)))

	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,6,dbo.fn_GetFirstDayOfMonth(@semiannualcycleone,@invoiceyear - 1)))


	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,6,dbo.fn_GetFirstDayOfMonth(@semiannualcycletwo,@invoiceyear)))

	INSERT INTO @EndDates
        SELECT DATEADD(dd,-1,DATEADD(mm,6,dbo.fn_GetFirstDayOfMonth(@semiannualcycletwo,@invoiceyear + 1)))

	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,6,dbo.fn_GetFirstDayOfMonth(@semiannualcycletwo,@invoiceyear - 1)))

	SELECT @CycleEndDate = MIN(EndDate)
	FROM @EndDates
	WHERE EndDate >= @InvoiceBatchDate

  END


ELSE IF @BillingFrequencyCD = 'A'

  BEGIN


	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,12,dbo.fn_GetFirstDayOfMonth(@annualcycle,@invoiceyear)))

	INSERT INTO @EndDates
        SELECT DATEADD(dd,-1,DATEADD(mm,12,dbo.fn_GetFirstDayOfMonth(@annualcycle,@invoiceyear + 1)))

	INSERT INTO @EndDates
	SELECT DATEADD(dd,-1,DATEADD(mm,12,dbo.fn_GetFirstDayOfMonth(@annualcycle,@invoiceyear - 1)))

	SELECT @CycleEndDate = MIN(EndDate)
	FROM @EndDates
	WHERE EndDate >= @InvoiceBatchDate

  END
 
RETURN @CycleEndDate

END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetFirstDayOfMonth]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  function [dbo].[fn_GetFirstDayOfMonth] ( @Month int, @Year int ) 
Returns smallDateTime
As
Begin
        Declare @ReturnDate smalldatetime

	Set @ReturnDate = cast(@month as varchar(2)) + '/1/' + cast(@year as varchar(4))

	Return @ReturnDate
End

GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetLastDayOfMonth]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  function [dbo].[fn_GetLastDayOfMonth] ( @Month int, @Year int ) 
Returns smallDateTime
As
Begin
	declare 
		@dtLast smallDateTime
		,@dtFirst smallDateTime

	If (@Month NOT Between 1 AND 12)
	OR (@Year NOT Between 1800 AND 3000)
	   Begin
		Set @dtLast = Null
		Return @dtLast
	   End

	Set @dtFirst = Convert(smallDateTime, cast(@month as varchar(2)) + '/1/' + cast(@year as varchar(4)))
	Set @dtLast = dateAdd(day, -1, dateAdd(month, 1, @dtFirst))

	Return @dtLast
End

GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSPParamCallString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetSPParamCallString]
(
	@ProcName Varchar(128)
)
RETURNS Varchar(max)
AS
BEGIN
	Declare @Temp   Varchar(1024)
	Declare @SPCall Varchar(1024)

	select @SPCall = 
	IsNull(@SPCall +',','') + parameter_name + '=''{' + parameter_name + '}'''
	from information_schema.parameters
	where specific_name =  @ProcName

	Return @ProcName + ' ' + @SPcall 
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_IntToBase36]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_IntToBase36] (@int integer, @size tinyInt) Returns varChar(6)
Begin
	declare
		@i		int
		,@base36Code	varchar(6)
		,@iFactor	int
		,@power		int
	
	set @power = 5
	Set @i = @int
	set @base36Code = ''
	
	While @power >= 0
	   Begin
		Set @iFactor = power(36,@power)
		If @int >= case when @iFactor = 1 then 0 else @iFactor end
		   Begin
			set @base36Code = @base36Code +
			Case 
			 when (@i / @iFactor) < 10 then cast(@i / @iFactor as Char(1))
			 Else char((@i / @iFactor) + 55) 
			End
			Set @i = @i % @iFactor
		   End --@i >= case when @iFactor = 1 then 0 else @iFactor end
		--Select @int,@i,@base36Code,@iFactor,@power
		Set @power = @power - 1
	   End --While
	set @base36Code = Replicate(' ', 6-len(@base36Code)) + @base36Code
	Return Right(@base36Code,@size)
End

GO
/****** Object:  UserDefinedFunction [dbo].[fn_LandlordConcessionAmountTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_LandlordConcessionAmountTypeNameGet]
(@LandlordConcessionAmountTypeID SMALLINT)
RETURNS VARCHAR (100)
AS
BEGIN
	DECLARE @retval VARCHAR (100)
	SELECT @retval = LandlordConcessionAmountType.LandlordConcessionAmountTypeName FROM [dbo].LandlordConcessionAmountType WITH (NOLOCK)
	WHERE LandlordConcessionAmountTypeID = @LandlordConcessionAmountTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_LeaseDealEntitySourceTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_LeaseDealEntitySourceTypeNameGet]
	(@LeaseDealEntitySourceTypeID TINYINT)
RETURNS VARCHAR (100)
AS
BEGIN
	DECLARE @retval VARCHAR (100)
	SELECT @retval = LeaseDealEntitySourceType.LeaseDealEntitySourceTypeName FROM [dbo].LeaseDealEntitySourceType WITH (NOLOCK)
	WHERE LeaseDealEntitySourceTypeID = @LeaseDealEntitySourceTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_LeaseDealSourceTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_LeaseDealSourceTypeDescGet]
	(@LeaseDealSourceTypeID TINYINT)
RETURNS VARCHAR (30)
AS
BEGIN
	DECLARE @retval VARCHAR (30)
	SELECT @retval = LeaseDealSourceType.LeaseDealSourceTypeDesc FROM [dbo].LeaseDealSourceType WITH (NOLOCK)
	WHERE LeaseDealSourceTypeID = @LeaseDealSourceTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_LeaseDealStatusNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_LeaseDealStatusNameGet]
	(@LeaseDealStatusID TINYINT)
RETURNS VARCHAR (100)
AS
BEGIN
	DECLARE @retval VARCHAR (100)
	SELECT @retval = LeaseDealStatus.LeaseDealStatusName FROM [dbo].LeaseDealStatus WITH (NOLOCK)
	WHERE LeaseDealStatusID = @LeaseDealStatusID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_LeaseDealTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_LeaseDealTypeDescGet]
	(@LeaseDealTypeID TINYINT)
RETURNS VARCHAR (30)
AS
BEGIN
	DECLARE @retval VARCHAR (30)
	SELECT @retval = LeaseDealType.LeaseDealTypeDesc FROM [dbo].LeaseDealType WITH (NOLOCK)
	WHERE LeaseDealTypeID = @LeaseDealTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_LeaseTermTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_LeaseTermTypeDescGet]
	(@LeaseTermTypeID TINYINT)
RETURNS VARCHAR (20)
AS
BEGIN
	DECLARE @retval VARCHAR (20)
	SELECT @retval = LeaseTermType.LeaseTermTypeDesc FROM [dbo].LeaseTermType WITH (NOLOCK)
	WHERE LeaseTermTypeID = @LeaseTermTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_LoanAmortizationTermTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_LoanAmortizationTermTypeNameGet]
	(@LoanAmortizationTermTypeID TINYINT)
RETURNS VARCHAR (30)
AS
BEGIN
	DECLARE @retval VARCHAR (30)
	SELECT @retval = LoanAmortizationTermType.LoanAmortizationTermTypeName FROM [dbo].LoanAmortizationTermType WITH (NOLOCK)
	WHERE LoanAmortizationTermTypeID = @LoanAmortizationTermTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_MonetaryUnitDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_MonetaryUnitDescGet]
	(@MonetaryUnitID TINYINT)
RETURNS VARCHAR (20)
AS
BEGIN
	DECLARE @retval VARCHAR (20)
	SELECT @retval = MonetaryUnit.MonetaryUnitDesc FROM [dbo].MonetaryUnit WITH (NOLOCK)
	WHERE MonetaryUnitID = @MonetaryUnitID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_ParseIntsAddIdentity]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE FUNCTION [dbo].[fn_ParseIntsAddIdentity](
  @str   varchar(8000)  --Delimited String (ex. "1;2;3;4;5")
, @delim char(1)        --Delimiter (ex. ";")
)
  Returns @rTbl Table (ParseVal int, sortID int identity(1,1))
as
Begin
  declare @delimPos int --Index of the delimiter in the string

  set @str=nullif(@str,'')+@delim  
  while (len(@str)>0) begin
    set @delimPos = charindex(@delim,@str)
    insert @rTbl (ParseVal) select substring(@str,1,(@delimPos-1))             --Jump to @delimPos
    set @str=substring(@str,(@delimPos+1),1+len(@str)-(@delimPos))  --Chop @str at @delimPos
  end
  return
End

GO
/****** Object:  UserDefinedFunction [dbo].[fn_ParseString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------
-- File: C:\COSTARPROJECTS\COSTARINTERNALAPPS\MAIN\ENTERPRISE\SOURCE\CRM.WS.Database\CRM.WS.DB.Lookups\Functions\fn_ParseString.sql
/************************************************************
Note:  This function has been copied to Product User.  
If any changes are made please deploy to Product User as well.

DJR 04/04/2007 Changed to use a table instead of while loop
			   to traverse the string.
************************************************************/

CREATE Function [dbo].[fn_ParseString](        /* CRM Version  */
  @str   varchar(8000)  --Delimited String (ex. "1;2;3;4;5")
, @delim char(1)        --Delimiter (ex. ";")
)
  Returns @rTbl Table (ParseVal varchar(8000))
as
Begin

    insert @rTbl
    select substring(@str, num, charindex(@delim, @str + @delim, num) - num)
    from   dbo.IndexedNumbers_fn_ParseString (NOLOCK)
    where  num <= len (@str)
    and    substring(@delim + @str, Num, 1) = @delim

  return

End

GO
/****** Object:  UserDefinedFunction [dbo].[fn_PetTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_PetTypeNameGet] (@PetTypeID TINYINT)  
RETURNS VARCHAR (100)  
AS  
BEGIN  
 
 DECLARE @retval VARCHAR (100)  
 SELECT @retval = PetTypeDesc FROM [dbo].PetType WITH (NOLOCK)  
 WHERE PetTypeID = @PetTypeID  
  
 RETURN @retval  
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_RateActualIncreaseMethodTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_RateActualIncreaseMethodTypeNameGet]
	(@RateActualIncreaseMethodTypeID SMALLINT)
RETURNS VARCHAR (100)
AS
BEGIN
	DECLARE @retval VARCHAR (100)
	SELECT @retval = RateActualIncreaseMethodType.RateActualIncreaseMethodTypeName FROM [dbo].RateActualIncreaseMethodType WITH (NOLOCK)
	WHERE RateActualIncreaseMethodTypeID = @RateActualIncreaseMethodTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_RateAmountTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_RateAmountTypeNameGet]
	(@RateAmountTypeID SMALLINT)
RETURNS VARCHAR (100)
AS
BEGIN
	DECLARE @retval VARCHAR (100)
	SELECT @retval = RateAmountType.RateAmountTypeName FROM [dbo].RateAmountType WITH (NOLOCK)
	WHERE RateAmountTypeID = @RateAmountTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_RateBasisDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_RateBasisDescGet]
	(@RateBasisID TINYINT)
RETURNS VARCHAR (20)
AS
BEGIN
	DECLARE @retval VARCHAR (20)
	SELECT @retval = RateBasis.RateBasisDesc FROM [dbo].RateBasis WITH (NOLOCK)
	WHERE RateBasisID = @RateBasisID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_RateEscalationAmountTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_RateEscalationAmountTypeNameGet]
	(@RateEscalationAmountTypeID SMALLINT)
RETURNS VARCHAR (100)
AS
BEGIN
	DECLARE @retval VARCHAR (100)
	SELECT @retval = RateEscalationAmountType.RateEscalationAmountTypeName FROM [dbo].RateEscalationAmountType WITH (NOLOCK)
	WHERE RateEscalationAmountTypeID = @RateEscalationAmountTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_RateEscalationTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_RateEscalationTypeDescGet]
	(@RateEscalationType TINYINT)
RETURNS VARCHAR (30)
AS
BEGIN
	DECLARE @retval VARCHAR (30)
	SELECT @retval = RateEscalationType.RateEscalationTypeDesc FROM [dbo].RateEscalationType WITH (NOLOCK)
	WHERE RateEscalationTypeID = @RateEscalationType

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_RentPlusTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_RentPlusTypeDescGet]
	(@RentPlusTypeID TINYINT)
RETURNS VARCHAR (50)
AS
BEGIN
	DECLARE @retval VARCHAR (50)
	SELECT @retval = RentPlusType.RentPlusTypeID FROM [dbo].RentPlusType WITH (NOLOCK)
	WHERE RentPlusTypeID = @RentPlusTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_ResidentialParkingTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_ResidentialParkingTypeNameGet] (@ResidentialParkingTypeID TINYINT)  
RETURNS VARCHAR (100)  
AS  
BEGIN  
 
 DECLARE @retval VARCHAR (100)  
 SELECT @retval = ResidentialParkingTypeDesc FROM [dbo].ResidentialParkingType WITH (NOLOCK)  
 WHERE ResidentialParkingTypeID = @ResidentialParkingTypeID  
  
 RETURN @retval  
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_ServiceTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_ServiceTypeDescGet]
	(@ServiceTypeID TINYINT)
RETURNS VARCHAR (30)
AS
BEGIN
	DECLARE @retval VARCHAR (30)
	SELECT @retval = ServiceType.ServiceTypeDesc FROM [dbo].ServiceType WITH (NOLOCK)
	WHERE ServiceTypeID = @ServiceTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_SignagePayerTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_SignagePayerTypeDescGet]
	(@SignagePayerTypeID TINYINT)
RETURNS VARCHAR (30)
AS
BEGIN
	DECLARE @retval VARCHAR (30)
	SELECT @retval = SignagePayerType.SignagePayerTypeDesc FROM [dbo].SignagePayerType WITH (NOLOCK)
	WHERE SignagePayerTypeID = @SignagePayerTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_SpaceTypeDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_SpaceTypeDescGet]
	(@SpaceTypeID TINYINT)
RETURNS VARCHAR (10)
AS
BEGIN
	DECLARE @retval VARCHAR (10)
	SELECT @retval = SpaceType.SpaceTypeDesc FROM [dbo].SpaceType WITH (NOLOCK)
	WHERE SpaceTypeID = @SpaceTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_SpaceUseNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_SpaceUseNameGet]
	(@SpaceUseID TINYINT)
RETURNS VARCHAR (10)
AS
BEGIN
	DECLARE @retval VARCHAR (10)
	SELECT @retval = SpaceUse.SpaceUseName FROM [dbo].SpaceUse WITH (NOLOCK)
	WHERE SpaceUseID = @SpaceUseID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_SpreadOverTermTypeNameGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_SpreadOverTermTypeNameGet]
	(@SpreadOverTermTypeID SMALLINT)
RETURNS VARCHAR (100)
AS
BEGIN
	DECLARE @retval VARCHAR (100)
	SELECT @retval = SpreadOverTermType.SpreadOverTermTypeName FROM [dbo].SpreadOverTermType WITH (NOLOCK)
	WHERE SpreadOverTermTypeID = @SpreadOverTermTypeID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_ThrowError]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_ThrowError]
(
	@ProcName  Varchar(128)  
	,@ParamList XML  
)
RETURNS XML
AS
BEGIN
	  Declare @PC Int; Set @PC = (Select Count(*) From Information_Schema.Parameters Where Specific_Name = @ProcName)  
	  Declare @SEQ Int; Set @SEQ = 1  
	  Declare @SPPC Varchar(Max)  

	Set @SPPC =  dbo.fn_GetSPParamCallString(@ProcName)  

  
	  While @SEQ <= @PC  
	  Begin  
    
		Select @SPPC = replace(@SPPC,'{'+PNAME+'}',VAL)  
		From (  
		Select PNAME = Item.rows.value('@paramname', 'varchar(128)')  
			,  VAL = Item.rows.value('@paramval', 'varchar(128)')  
			,  SEQ = Item.rows.value('@seq', 'int')  
		From @ParamList.nodes('/Item') Item (rows)  
		) X  
		Where SEQ = @SEQ  
    
		Set @SEQ = @SEQ + 1  
  
	  End   
  
	  Return 
	  ( 
	   Select *  
		From 
		(  
		  Select  
			ErrorNumber    = error_number()
		  , ErrorLine      = error_line()  
		  , ErrorMessage   = error_message()
		  , ErrorProcedure = error_procedure()  
		  , ErrorSeverity  = error_severity()  
		  , ErrorState     = error_state()  
		  , ErrorCall      = IsNull(@SPPC,'')  
 
		)as  Error  
		For Xml auto,elements,root('ErrorList')
	   )
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_UseClassDescGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_UseClassDescGet]
	(@UseClassID TINYINT)
RETURNS VARCHAR (50)
AS
BEGIN
	DECLARE @retval VARCHAR (50)
	SELECT @retval = UseClass.UseClassDesc FROM [dbo].UseClass WITH (NOLOCK)
	WHERE UseClassID = @UseClassID

	RETURN @retval
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnAdvLastUpdate]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Name:		fnAdvLastUpdate
	Author:		Chris Li
	Created Date:	10/17/2006
*/
CREATE FUNCTION [dbo].[fnAdvLastUpdate]
(
	@piPropertyID			int
)
RETURNS datetime
BEGIN
	DECLARE	@LastResearchedDate		datetime,
			@pdtLastEventUpdatedDate	datetime,
			@LastUpdatedDate		datetime

	SELECT
		@LastResearchedDate = MAX(pr.LastResearchedDate)
	FROM
	(
		(
			/*------------------------------------------------------
			Get last researched date from SpaceForLease table
			--------------------------------------------------------*/
			SELECT
				pf.PropertyID,
				MAX(sfl.LastResearchedDate) AS LastResearchedDate
			FROM
				SpaceForLease	sfl	(NOLOCK)
			INNER JOIN
				PropertyFloor	pf	(NOLOCK)
			ON
				sfl.PropertyFloorID = pf.PropertyFloorID
			WHERE
				pf.PropertyID	= @piPropertyID
			GROUP BY
				pf.PropertyID
		)
		UNION ALL
		(
			/*------------------------------------------------------
			Get last researched date from PropertyForSale table
			--------------------------------------------------------*/
			SELECT
				pfs.PropertyID,
				MAX(pfs.LastResearchedDate) AS LastResearchedDate
			FROM
				PropertyForSale	pfs (NOLOCK)
			WHERE
				pfs.PropertyID	= @piPropertyID	
			GROUP BY	
				pfs.PropertyID
		)
		UNION ALL
		(
			/*------------------------------------------------------
			Get last researched date from CondoForSale table
			--------------------------------------------------------*/
			SELECT
				cu.PropertyID,
				MAX(cfs.LastResearchedDate) AS LastResearchedDate
			FROM
				CondoForSale	cfs (NOLOCK)
			INNER JOIN
				CondoUnit	cu (NOLOCK)
			ON
				cu.CondoUnitID = cfs.CondoUnitID
			WHERE
				cu.PropertyID	= @piPropertyID	
			GROUP BY	
				cu.PropertyID	
		)
		UNION ALL
		(
			/*------------------------------------------------------
			Get last researched date from Property table
			--------------------------------------------------------*/
			SELECT
				p.PropertyID,
				p.LastResearchedDate AS LastResearchedDate
			FROM
				Property p (NOLOCK)
			WHERE
				p.PropertyID = 	@piPropertyID
		)
	) pr

	-- Get latest updated date in PropertyUpdateEvent table.
	SELECT
			@pdtLastEventUpdatedDate = MAX(pue.updateeventdate)
	FROM
			PropertyUpdateEvent pue (NOLOCK)
	WHERE
			pue.PropertyID = @piPropertyID
	AND
		pue.UpdateEventTypeID IN (6,7,8,10)



	IF (@pdtLastEventUpdatedDate IS NULL) AND (@LastResearchedDate IS NULL)
		SELECT @LastUpdatedDate = NULL
	IF (@pdtLastEventUpdatedDate IS NULL) AND (@LastResearchedDate IS NOT NULL)
		SELECT @LastUpdatedDate = @LastResearchedDate

	IF (@pdtLastEventUpdatedDate IS NOT NULL) AND (@LastResearchedDate IS NULL)
		SELECT @LastUpdatedDate = @pdtLastEventUpdatedDate

	IF @pdtLastEventUpdatedDate > @LastResearchedDate
		SELECT @LastUpdatedDate = @pdtLastEventUpdatedDate
	ELSE
		SELECT @LastUpdatedDate = @LastResearchedDate

	RETURN	@LastUpdatedDate
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnAlphaNumericSortVal]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnAlphaNumericSortVal] 
	(@pInStr varchar(50), 
	 @pLength tinyint)
RETURNS varchar(50)
/******************************************************************************
**  Name: fnAlphaNumericSortVal
**  
**  Desc: Sorts character & numeric values
		numeric strings as their number value (not character sorted)
**		by padding numeric portion of @InStr with leading 0's. 
**
**  This function is called from resPropertyGet
**
**  rl, 09/08/04  Created
**
*******************************************************************************/

AS
BEGIN
	DECLARE @OutStr varchar(50)
	SELECT @OutStr = 
		CASE 
		WHEN LEFT( @pInStr,1 ) LIKE '%[0-9]%' 
			AND ( PATINDEX('%[^0-9]%', @pInStr) > 0 )  -- MIXED NUMBER & CHAR
			THEN  REPLICATE( '0', @pLength - DATALENGTH( LEFT( @pInStr, PATINDEX( '%[^0-9]%', @pInStr ) -1 ) ) )
				+ LEFT( @pInStr, PATINDEX( '%[^0-9]%', @pInStr ) -1 )   
		WHEN ( PATINDEX( '%[^0-9]%', @pInStr ) = 0 )  -- NUMBER ONLY
			THEN REPLICATE( '0', @pLength - DATALENGTH( @pInStr ) ) 
				+ @pInStr
		ELSE @pInStr
		END

	RETURN @OutStr

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnBrokerContactMethod]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnBrokerContactMethod](	 @pAgentContactId int )
	
RETURNS VarChar( 100 )

AS

/******************************************************************************
**		Name: fnBrokerContactMethod
**		Desc:  Returns the preferred contact method details for the given broker.
**
**		The preferred contact method can be one of the following:
**
**		Home	-	Retrieves the home phone number of the broker or the broker's alternate contact if the alternate contact is set...
**		Cell		-	Retrieves the cell phone number of the broker or the broker's alternate contact if the alternate contact is set...
**		Email	-	Retrieves the email address of the broker or the broker's alternate contact if the alternate contact is set...
**		Office	-	Retrieves the office phone number of the broker or the broker's alternate contact if the alternate contact is set...
**		Other	-	Retrieves the other phone number of the broker or the broker's alternate contact if the alternate contact is set...
**
**
**		This function is called from spContactGet and spPropertyResearchWorkflowGet
*******************************************************************************/
BEGIN

	DECLARE 
		@Notification varchar( 100 ),
		@ContactID int,
		@ChoosePrimary bit;
		
	SELECT @ChoosePrimary = 1;
	
	-- Check to see if the broker has an alternate; if so, get it...
	SELECT @ContactID = ISNULL( BrokerAlternateContactID, ContactID )
	FROM dbo.Contact with ( nolock )
	WHERE ContactID = @pAgentContactID
	/*	
	-- If the broker had an alternate, we need to see if the alternate has an alternate...
	IF( @ContactID <> @pAgentContactID )
		SELECT @ContactID = ISNULL( BrokerAlternateContactID, ContactID )
		FROM dbo.Contact with ( nolock )
		WHERE ContactID = @ContactID
	*/	

	SET @Notification = ''

	SELECT @Notification =
		CASE a.PreferredContactMethodId 
			-- Mobile Phone...
			WHEN 1 THEN dbo.fnFormatPhoneNumber( a.MobilePhone )
			-- Email...
			WHEN 2 THEN a.EmailAddress 
			-- Phone...
			WHEN 3 THEN dbo.fnFormatPhoneNumber( a.PhoneNumber )
			-- Othe Phone...
			WHEN 4 THEN dbo.fnFormatPhoneNumber( a.OtherPhone )
			ELSE ''
		END
	FROM dbo.Contact a with (nolock)
	WHERE a.ContactID = @ContactID
	
	/*
	SELECT @ChoosePrimary = 1;
	
	-- Check to see if the broker has an alternate; if so, get it...
	SELECT @ContactID = ISNULL( BrokerAlternateContactID, ContactID ),
				@ChoosePrimary = CASE WHEN BrokerAlternateContactID IS NOT NULL THEN 0 ELSE 1 END
	FROM dbo.Contact with ( nolock )
	WHERE ContactID = @pAgentContactID

	SET @Notification = ''

	SELECT @Notification =
		CASE a.PreferredContactMethodId 
			-- Home Phone...
			WHEN 1 THEN ''
			-- Cell...
			WHEN 2 THEN dbo.fnFormatPhoneNumber( CASE @ChoosePrimary WHEN 1 THEN a.MobilePhone ELSE alt.MobilePhone END )
			-- Email...
			WHEN 3 THEN CASE @ChoosePrimary WHEN 1 THEN a.EmailAddress ELSE alt.EmailAddress END
			-- Office...
			WHEN 4 THEN dbo.fnFormatPhoneNumber( CASE @ChoosePrimary WHEN 1 THEN a.PhoneNumber ELSE alt.PhoneNumber END )
			-- Other...
			WHEN 5 THEN dbo.fnFormatPhoneNumber( CASE @ChoosePrimary WHEN 1 THEN a.OtherPhone ELSE alt.OtherPhone END )
			ELSE ''
		END
	FROM dbo.Contact a with (nolock)
	LEFT OUTER JOIN dbo.Contact alt with (nolock) on alt.ContactId = a.BrokerAlternateContactId
	WHERE a.ContactID = @pAgentContactId
	*/
	
	RETURN @Notification
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnCalculatePropertyApartmentEffectiveRent]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCalculatePropertyApartmentEffectiveRent]
(
	@pRentAmount int
	,@pNumFreeMonths decimal(5,2)
	,@pTotalConcessionValue int
	,@pMonthlyDiscount int
	,@pIsDailyPricingFlag bit
) 
RETURNS INT
AS
BEGIN
	DECLARE @retval int;
	
	IF 	(@pNumFreeMonths IS NULL AND @pTotalConcessionValue IS NULL and @pMonthlyDiscount IS NULL)
		BEGIN
			SET @retval  = NULL;
		END
	ELSE
		BEGIN
			SET @retval = ROUND((CONVERT(float, @pRentAmount) - ((ISNULL(CONVERT(float,@pNumFreeMonths),0.00) * @pRentAmount)/12.00)-(ISNULL(CONVERT(float, @pTotalConcessionValue),0)/ 12.00) - ISNULL(@pMonthlyDiscount,0)),0) ;
		END
	
	IF @retval IS NULL and @pIsDailyPricingFlag = 0x01
		BEGIN
			SET @retval = @pRentAmount;
		END
	RETURN @retval;
END


GO
/****** Object:  UserDefinedFunction [dbo].[fnChangeLogStatementTextSampleGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnChangeLogStatementTextSampleGet] (@ChangeLogStatementID int)
RETURNS nvarchar(4000)
AS
BEGIN
	--Return the full sample statement text with the substituted token values
	DECLARE @StatementTextSample nvarchar(4000)=''
	
	--Get the StatementText
	SELECT @StatementTextSample=StatementText FROM dbo.ChangeLogStatement (NOLOCK) WHERE ChangeLogStatementID=@ChangeLogStatementID
	
	--Get all the Token data
	DECLARE @ChangeLogTokenData TABLE (TokenID int, TokenKey varchar(30), TokenName varchar(50), TokenEntityType varchar(100), TokenKeyType varchar(100), KeySymbol char(2), TokenFullName varchar(100))
	INSERT INTO @ChangeLogTokenData
	SELECT 
		clt.ChangeLogTokenID, clt.TokenKey, cltt.TokenName, clet.ChangeLogEntityTypeName, clkt.TokenKeyTypeName, clkt.KeySymbol, TokenFullName=rtrim(KeySymbol)+rtrim(cltt.TokenName)+rtrim(KeySymbol)
		FROM 
		dbo.ChangeLogStatementToken clst (NOLOCK) 
		JOIN dbo.ChangeLogToken clt (NOLOCK) ON clst.ChangeLogTokenID=clt.ChangeLogTokenID
		JOIN dbo.ChangeLogTokenType cltt (NOLOCK) ON clt.ChangeLogTokenTypeID=cltt.ChangeLogTokenTypeID
		JOIN dbo.ChangeLogEntityType clet (NOLOCK) ON cltt.ChangeLogEntityTypeID=clet.ChangeLogEntityTypeID
		JOIN dbo.ChangeLogTokenKeyType clkt (NOLOCK) ON clt.ChangeLogTokenKeyTypeID=clkt.ChangeLogTokenKeyTypeID
	WHERE
		clst.ChangeLogStatementID=@ChangeLogStatementID
		
		--SELECT * FROM @ChangeLogTokenData
		
	SELECT @StatementTextSample=
		REPLACE(@StatementTextSample,TokenKey,TokenFullName)
	FROM @ChangeLogTokenData
	
	--SELECT StatementTextSample=@StatementTextSample
	
	RETURN @StatementTextSample
	
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnCleanString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCleanString]
(@pString varchar(1000)
)
RETURNS varchar(1000)
AS
BEGIN
	DECLARE @CleansedString varchar(1000)
	/* Remove special characters: space, brackets, dashes, periods, commas */
	SET @CleansedString=
						REPLACE(
							REPLACE(
									REPLACE(
										REPLACE(
											REPLACE(
												REPLACE (
													REPLACE (
														REPLACE (
															REPLACE (
																REPLACE(@pString,'(','') --open parenthesis
															,')','') --close parenthesis
														,'-','') --dash
													,' ','') --blank space
												,'.','') --period
											,',','') --comma
											,'/','') --forward slash
										,'\','') --back slash
									,CHAR(10),'')
								,CHAR(13),'')
	RETURN @CleansedString
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnCommunityCallerConcessionTransform]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCommunityCallerConcessionTransform]
(
	@ccSpecialOfferTypeID TINYINT
	,@ccNumFreeMonths INT
	,@ccNumDiscountedMonths INT
	,@ccMonthlyDiscountAmount INT
	,@ccMonthlyDiscountPct DECIMAL(5,2)
	,@MinRent int
)
RETURNS  @RESULT TABLE 
(
	NumFreeMonths int
	,TotalConcessionValue int
	,MonthlyDiscount int
)
BEGIN
	DECLARE @NumFreeMonths int
			,@TotalConcessionValue int
			,@MonthlyDiscount int

	IF 	(ISNULL(@ccNumFreeMonths,0) = 0 AND ISNULL(@ccNumDiscountedMonths,0) = 0 AND ISNULL(@ccMonthlyDiscountAmount,0) = 0 AND ISNULL(@ccMonthlyDiscountPct,0) = 0)
		BEGIN
			SET @NumFreeMonths = NULL;
			SET @TotalConcessionValue = NULL;
			SET @MonthlyDiscount = NULL;
		END

	ELSE IF @ccSpecialOfferTypeID = 4 /*Free Rent*/ and ISNULL(@ccNumFreeMonths,0) > 0 AND ISNULL(@ccNumFreeMonths,0) <= 6
		BEGIN
			SET @NumFreeMonths = @ccNumFreeMonths;
			SET @TotalConcessionValue = 0;
			SET @MonthlyDiscount = 0;
		END
	ELSE IF @ccSpecialOfferTypeID = 2 /*Temporary Rent Reducation*/ AND ISNULL(@ccNumDiscountedMonths,0) > 0 and  ISNULL(@ccNumDiscountedMonths,0) <= 12 and ISNULL(@ccMonthlyDiscountAmount,0) > 0
		BEGIN
			SET @NumFreeMonths = 0;
			SET @TotalConcessionValue = @ccNumDiscountedMonths * @ccMonthlyDiscountAmount;
			SET @MonthlyDiscount = 0;
		END
	ELSE IF @ccSpecialOfferTypeID = 2 /*Temporary Rent Reducation*/ AND ISNULL(@ccNumDiscountedMonths,0) > 0 and  ISNULL(@ccNumDiscountedMonths,0) <= 12 AND ISNULL(@ccMonthlyDiscountAmount,0) = 0 AND ISNULL(@ccMonthlyDiscountPct, 0.00) > 0.00
		BEGIN
			SET @NumFreeMonths = 0;
			SET @TotalConcessionValue = @ccNumDiscountedMonths * @MinRent * (@ccMonthlyDiscountPct /100.00);
			SET @MonthlyDiscount = 0;
		END
	ELSE IF @ccSpecialOfferTypeID = 1 /*Permanent Rent Reduction*/ AND ISNULL(@ccMonthlyDiscountAmount,0) > 0 
		BEGIN
			SET @NumFreeMonths = 0;
			SET @TotalConcessionValue = 0;
			SET @MonthlyDiscount = @ccMonthlyDiscountAmount;
		END
	ELSE IF @ccSpecialOfferTypeID = 1 /*Permanent Rent Reduction*/ AND ISNULL(@ccMonthlyDiscountAmount,0) = 0  AND  ISNULL(@ccMonthlyDiscountPct, 0.00) > 0.00
		BEGIN
			SET @NumFreeMonths = 0;
			SET @TotalConcessionValue = 0;
			SET @MonthlyDiscount = @MinRent * (@ccMonthlyDiscountPct /100.00);
		END
	ELSE
		BEGIN
			SET @NumFreeMonths = NULL;
			SET @TotalConcessionValue = NULL;
			SET @MonthlyDiscount = NULL;
		END

	/*Monthly Discount Cannot exceed min rent*/
	IF @MonthlyDiscount > @MinRent
		BEGIN
			SET @MonthlyDiscount = NULL;
		END
	/*Total Concession value cannot exceed years rent*/
	IF @TotalConcessionValue > (@MinRent * 12)
		BEGIN 
			SET @TotalConcessionValue = NULL;
		END


	INSERT INTO @Result	
		(NumFreeMonths, TotalConcessionValue, MonthlyDiscount)
	VALUES
		(@NumFreeMonths, @TotalConcessionValue, @MonthlyDiscount);

	RETURN;
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnCompAssessmentTotalCalc]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[fnCompAssessmentTotalCalc](@pCompID int)  
 RETURNS  @CompAssessmentTotal TABLE 
 (
     CompID int  not null,
     AssessedImprovementValue  bigint , 
     AssessedLandValue bigint,
     AssessedTotalValue bigint
 )     
  
  AS 
  
  begin   
/***************************************************************************************************  
** Name: fnCompAssessmentTotalCalc  
**  
**  Goal:  
**  Return CompAPNAssessment AssessedImprovementValue,AssessedLandValue and AssessedTotalValue for given a CompId when a   
**  APN record is added or deleted from a comp.  (TFS #41882 )  
**  Note :  if any of the Assessement values have NULLs, we should not roll up.
  
***************************************************************************************************/  
    
  Declare @AssessedImprovementValue bigint, 
          @AssessedLandValue bigint,
          @AssessedTotalValue bigint 
       
        
       
        insert @CompAssessmentTotal
          Select COMPID ,
                 CompAPNAssessment.AssessedImprovementValue,     
                  CompAPNAssessment.AssessedLandValue,
                  CompAPNAssessment.AssessedTotalValue 
                 
          from   dbo.CompAPNAssessment CompAPNAssessment With (NOLOCK)
          join   dbo.CompDocument      CompDocument      With (NOLOCK) 
            on CompDocument.CompDocumentId = CompAPNAssessment.CompDocumentId
           where CompID =@pCompID  
        
        
     
       
    if exists 
    ( Select 1  from @CompAssessmentTotal where  AssessedImprovementValue is null )
      Select @AssessedImprovementValue=Null 
       else 
      Select @AssessedImprovementValue=SUM(AssessedImprovementValue)   from @CompAssessmentTotal        
      
     
     
    if exists 
    ( Select 1  from @CompAssessmentTotal where  AssessedLandValue is null )
      Select @AssessedLandValue=Null 
       else 
      Select @AssessedLandValue=SUM(AssessedLandValue)   from @CompAssessmentTotal        
      
    
     if exists 
    ( Select 1  from @CompAssessmentTotal where  AssessedTotalValue is null )
      Select @AssessedTotalValue=Null 
       else 
      Select @AssessedTotalValue=SUM(AssessedTotalValue)   from @CompAssessmentTotal  
       
      delete from @CompAssessmentTotal 
     
      insert @CompAssessmentTotal
      Select @pCompID ,@AssessedImprovementValue as AssessedImprovementValue
             ,@AssessedLandValue as AssessedLandValue
             ,@AssessedTotalValue as  AssessedTotalValue
     
      RETURN      
      
   end                  
   

  
          









/*



  --Test 
         Select  compID , AssessedImprovementValue,AssessedLandValue,AssessedTotalValue 
            from  fnCompAssessmentTotalCalc(4664)

*/



GO
/****** Object:  UserDefinedFunction [dbo].[fnCompPriceHistoryGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCompPriceHistoryGet]
( @pPropertyTypeID int,@pPropertySubTypeID int,@pBldgClassCode char(1),@pYr smallint, @pQtr tinyint
 , @SubmarketID int, @ClusterID int, @CountyID int, @MarketID int, @StateID int, @CountryID int
 , @pRent decimal(8,3), @pThreshold int=5, @pTop int=1
)
RETURNS @retCompPriceHistory TABLE 
(
	--Columns returned by the function
	CompPriceHistoryID int,
	AvgPricePerSqFt decimal(22,3),
	AvgPricePerUnit decimal(22,3),
	AvgPricePerRoom decimal(22,3),
	Yr smallint,
	Qtr tinyint,
	------------------ For debugging --------------------------
	GeographyDimTypeDesc varchar(50),
	GeographyDimEntityID int,
	GeographyDimEntityDesc varchar(255),
	PropertyTypeID int,
	BldgClassCode char(1),
	RentQuartile tinyint,
	RentMin decimal(22,3),
	RentMax decimal(22,3),
	NumberOfCompsSold int,
	PrimarySortOrder int,
	SecondarySortOrder int
)
AS
BEGIN
	DECLARE @CompPriceHistoryIDs TABLE
		(CompPriceHistoryID int PRIMARY KEY,
		 Yr smallint,
		 Qtr tinyint,
		 GeographyDimTypeDesc varchar(50),
		 GeographyDimEntityDesc varchar(255),
		 GeographyDimEntityID int
		 )
	
	Insert Into @CompPriceHistoryIDs
		(CompPriceHistoryID,Yr,Qtr,GeographyDimTypeDesc,GeographyDimEntityDesc,GeographyDimEntityID)
	(
	Select td.CompPriceHistoryID,td.Yr,td.Qtr,chGeo.GeographyDimTypeDesc,chGeo.GeographyDimEntityDesc,chGeo.GeographyDimEntityID
	FROM
		(
		Select cph.CompPriceHistoryID,td.Yr,td.Qtr
		From dbo.CompPriceHistory cph (nolock)
		Join dbo.CompPriceHistoryTimeDim td (nolock) on cph.CompPriceHistoryTimeDimID=td.CompPriceHistoryTimeDimID
		Where
			----- For @pYr=2008, @pQtr=1, get all rows for Q1-Y2008, Y2008, Y2007 ------
			td.Yr=@pYr AND td.Qtr=@pQtr
--		UNION ALL
--		Select cph.CompPriceHistoryID,td.Yr,td.Qtr
--		From dbo.CompPriceHistory cph (nolock)
--		Join dbo.CompPriceHistoryTimeDim td (nolock) on cph.CompPriceHistoryTimeDimID=td.CompPriceHistoryTimeDimID
--		Where
--			td.Yr=@pYr and td.Qtr IS NULL
		UNION ALL
		Select cph.CompPriceHistoryID,Datepart("Year",td.StartDate) as Yr,td.Qtr
		From dbo.CompPriceHistory cph (nolock)
		Join dbo.CompPriceHistoryTimeDim td (nolock) on cph.CompPriceHistoryTimeDimID=td.CompPriceHistoryTimeDimID
		Where
			td.Yr=@pYr and td.Qtr IS NULL
		)td
		--Join dbo.CompPriceHistory cph (nolock) on td.CompPriceHistoryID=cph.CompPriceHistoryID
		Join
			 (
			--SUBMARKET
			Select CompPriceHistoryID,GeographyDimTypeDesc='Submarket',sm.SubMarketName as GeographyDimEntityDesc,GeographyDimEntityID=@SubmarketID
			 From dbo.CompPriceHistory chSubmkt with (nolock, index(ndxCompPriceHistory_CompPriceHistoryGeographyDimID_GeographyDimEntityID))
			 Join dbo.Submarket sm on chSubmkt.GeographyDimEntityID=sm.SubmarketID
			 Where chSubmkt.CompPriceHistoryGeographyDimID=1 and chSubmkt.GeographyDimEntityID=@SubmarketID
		 Union All --CLUSTER
			 Select CompPriceHistoryID,GeographyDimTypeDesc='Cluster',cl.ClusterName as GeographyDimEntityDesc,GeographyDimEntityID=@ClusterID
			 From dbo.CompPriceHistory chClust with (nolock, index(ndxCompPriceHistory_CompPriceHistoryGeographyDimID_GeographyDimEntityID))
			 Join dbo.Cluster cl on chClust.GeographyDimEntityID=cl.ClusterID
			 Where chClust.CompPriceHistoryGeographyDimID=2  and chClust.GeographyDimEntityID=@ClusterID
		 Union All --COUNTY
			Select CompPriceHistoryID,GeographyDimTypeDesc='County',c.CountyName as GeographyDimEntityDesc,GeographyDimEntityID=@CountyID
			From dbo.CompPriceHistory chCounty with (nolock, index(ndxCompPriceHistory_CompPriceHistoryGeographyDimID_GeographyDimEntityID))
			Join dbo.County c on chCounty.GeographyDimEntityID=c.CountyID
			Where chCounty.CompPriceHistoryGeographyDimID=3  and chCounty.GeographyDimEntityID=@CountyID
		 Union All --MARKET
			Select CompPriceHistoryID,GeographyDimTypeDesc='Market',rm.ResearchMarketName as GeographyDimEntityDesc,GeographyDimEntityID=@MarketID
			From dbo.CompPriceHistory chMkt with (nolock, index(ndxCompPriceHistory_CompPriceHistoryGeographyDimID_GeographyDimEntityID))
			Join dbo.ResearchMarket rm on chMkt.GeographyDimEntityID=rm.ResearchMarketID
			Where chMkt.CompPriceHistoryGeographyDimID=4  and chMkt.GeographyDimEntityID=@MarketID
			and @MarketID<>23 --MarketID 23 = Other US Market Areas - needs to be ignored
		 Union All --STATE
			Select CompPriceHistoryID,GeographyDimTypeDesc='State',st.StateCD as GeographyDimEntityDesc,GeographyDimEntityID=@StateID
			From dbo.CompPriceHistory chState with (nolock, index(ndxCompPriceHistory_CompPriceHistoryGeographyDimID_GeographyDimEntityID))
			Join dbo.[State] st on chState.GeographyDimEntityID = st.StateID
			Where chState.CompPriceHistoryGeographyDimID=5  and chState.GeographyDimEntityID=@StateID
		Union All --COUNTRY
			Select CompPriceHistoryID,GeographyDimTypeDesc='Country','USA' as GeographyDimEntityDesc,GeographyDimEntityID=@CountryID
			From dbo.CompPriceHistory chCountry with (nolock, index(ndxCompPriceHistory_CompPriceHistoryGeographyDimID_GeographyDimEntityID))
			Where chCountry.CompPriceHistoryGeographyDimID=6  and chCountry.GeographyDimEntityID=@CountryID
		)chGeo on chGeo.CompPriceHistoryID=td.CompPriceHistoryID
	)

	--If the PropertySubTypeId is 'ParkingLot' then use the LAND PropertyType
	--If @pPropertySubTypeID=17 and @pPropertyTypeID<>3
	--	Set @pPropertyTypeID=3
		
	INSERT @retCompPriceHistory
	(
		CompPriceHistoryID,	AvgPricePerSqFt, AvgPricePerUnit, AvgPricePerRoom,
		Yr,Qtr,
		GeographyDimTypeDesc,
		GeographyDimEntityID,
		GeographyDimEntityDesc,
		PropertyTypeID,
		BldgClassCode,
		RentQuartile,
		RentMin,
		RentMax,
		NumberOfCompsSold,
		PrimarySortOrder,
		SecondarySortOrder
	)
	Select
		Top (@pTop)
		CompPriceHistoryID,AvgPricePerSqFt,AvgPricePerUnit,AvgPricePerRoom
		------------------ For debugging --------------------------
		,Yr,Qtr,
		GeographyDimTypeDesc,
		GeographyDimEntityID,
		GeographyDimEntityDesc,
		PropertyTypeID,
		BldgClassCode,
		RentQuartile,
		RentMin,
		RentMax,
		NumberOfCompsSold,
		PrimarySortOrder,
		SecondarySortOrder
		-------------------------------------------------------------
	FROM
	(
		Select 
			cph.CompPriceHistoryID,cph.Yr,cph.Qtr,cph.GeographyDimTypeDesc,GeographyDimEntityID,cph.GeographyDimEntityDesc,
			PrimarySortOrder,SecondarySortOrder,PropertyTypeID,BldgClassCode,AvgPricePerSqFt,AvgPricePerUnit,AvgPricePerRoom,RentQuartile=NULL,RentMin=NULL,RentMax=NULL,NumberOfCompsSold
		From
		@CompPriceHistoryIDs cph
		JOIN dbo.CompPriceHistoryByClass class (NoLock) on cph.CompPriceHistoryID=class.CompPriceHistoryID
		WHERE
			(
			class.NumberOfCompsSold >= @pThreshold
			AND class.PropertyTypeID=@pPropertyTypeID
			AND
				(	class.BldgClassCode Is Null
					OR
				--Only look at BldgClass if the PropertyType is Office
					(@pPropertyTypeID=5 AND class.BldgClassCode=@pBldgClassCode)
				)
			)
		UNION ALL
		Select
			cph.CompPriceHistoryID,cph.Yr,cph.Qtr,cph.GeographyDimTypeDesc,GeographyDimEntityID,cph.GeographyDimEntityDesc,
			PrimarySortOrder,SecondarySortOrder,PropertyTypeID=5,BldgClassCode=NULL,AvgPricePerSqFt,AvgPricePerUnit=NULL,AvgPricePerRoom=NULL,RentQuartile,RentMin,RentMax,NumberOfCompsSold
		From @CompPriceHistoryIDs cph
		JOIN dbo.CompPriceHistoryByRentQuartile rentq (NoLock) on rentq.CompPriceHistoryID=cph.CompPriceHistoryID
		WHERE
			(
			 rentq.NumberOfCompsSold >= @pThreshold
			 AND @pPropertyTypeID=5 --RentQuartiles only applies to Office type properties
			 AND
				(rentq.RentQuartile Is Not Null AND rentq.RentMin<=@pRent And rentq.RentMax>=@pRent) 
				OR 
				(rentq.RentQuartile Is Null)
			)
		)x
		Order by 
			PrimarySortOrder,SecondarySortOrder
		
		RETURN
	
END


--select 
--* from
--dbo.fnCompPriceHistoryGet 
--				(  
--				--PropertyTypeID,BldgClass,Yr,Qtr
--				5,'B',2007,4
--				--Submkt,Cluster,County,Market,State,Country
--				 , 1041,287,12,244,6, 1
--				 --Rent,Threshold,Top
--				 , NULL, 1, 100)
--				 order by PrimarySortOrder,Secondarysortorder


--select 
--*
-- from 
--dbo.fnCompPriceHistoryGet 
--				(  
--				--PropertyTypeID,BldgClass,Yr,Qtr
--				10,NULL,2007,4
--				--Submkt,Cluster,County,Market,State,Country
--				 , 1041,287,12,244,6, 1
--				 --Rent,Threshold,Top
--				 , NULL, 1, 100)
--				 order by PrimarySortOrder,Secondarysortorder

--select * from dbo.fnCompPriceHistoryGet(5,'B',2007,2,NULL,NULL,NULL,2,NULL,1,NULL,1,25)

GO
/****** Object:  UserDefinedFunction [dbo].[fnCondoUnitFloorList]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
                   
CREATE FUNCTION [dbo].[fnCondoUnitFloorList] (@pCondoUnitID INT )                  
RETURNS varchar(8000) AS               
            
/******************************************************************************              
            
* Name: fnCondoUnitFloorList              
* Desc: Returns a comma delimited Floors for a CondoUnit         
*              
            
******************************************************************************/              
             
BEGIN              
             
 DECLARE @List Varchar(8000)              
 SET @List = null              
             
 IF @pCondoUnitID  IS NOT NULL             
 BEGIN              
         
  DECLARE @CondoUnitFloor TABLE (  
  CondoUnitFloorID INT NOT NULL,
  CondoUnitID INT NOT NULL,             
  FormattedName  VARCHAR(5)     
 )                
            
 ;WITH CTE (CondoUnitFloorID,CondoUnitID ,FormattedName,Row)
    AS (
    SELECT cuaf.CondoUnitFloorID,cu.CondoUnitID ,fn.FormattedName
           ,ROW_NUMBER()  OVER (PARTITION BY cu.CondoUnitID,fn.FormattedName ORDER BY cuaf.CondoUnitFloorID ASC) AS Row        
    
    FROM dbo.CondoUnit cu WITH(NOLOCK)        
    JOIN dbo.CondoUnitFloor cuaf WITH(NOLOCK)        
        ON cu.CondoUnitID = cuaf.CondoUnitID 
    JOIN dbo.PropertyFloor pf with(nolock) 
        ON pf.PropertyFloorID = cuaf.PropertyFloorID 
    JOIN   dbo.Floorname  fn (NOLOCK)         
    ON fn.FloorNameID = pf.FloorNameID                   
    WHERE cuaf.CondoUnitID = @pCondoUnitID    
    )
    
     
 INSERT INTO  @CondoUnitFloor (CondoUnitFloorID,CondoUnitID,FormattedName)                 
 SELECT CondoUnitFloorID,CondoUnitID,FormattedName  
 FROM CTE WHERE ROW=1   
    
   	
 SELECT @List = RTRIM(ISNULL(@List+', ','') + RTRIM(FormattedName))        
 FROM   @CondoUnitFloor  cuaf         
 WHERE  cuaf.CondoUnitID  =@pCondoUnitID         
 ORDER BY CondoUnitFloorID  
 
          
                
 END              
            
 RETURN @List              
END            
            
          
          
          
/*          
--test          
 Select dbo.fnCondoUnitFloorList(7895164) as CondoUniFloorList       
 Select dbo.fnCondoUnitFloorList(8900894) as CondoUnitFloorList       
*/

GO
/****** Object:  UserDefinedFunction [dbo].[fnCondoUnitSpaceUseList]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
                        
CREATE FUNCTION [dbo].[fnCondoUnitSpaceUseList] (@pCondoUnitID INT )                
RETURNS varchar(8000) AS             
          
/******************************************************************************            
          
* Name: fnCondoUnitSpaceUseList           
* Desc: Returns a comma delimited Floors for a CondoUnit       
*            
          
******************************************************************************/            
           
BEGIN            
           
 DECLARE @List Varchar(8000)            
 SET @List = null            
           
 IF @pCondoUnitID  IS NOT NULL           
 BEGIN            
       
  DECLARE @CondoUnitFloor TABLE ( 
  CondoUnitFloorID INT NOT NULL,       
  CondoUnitID INT NOT NULL,        
  SpaceUseDesc   varchar(20)  NULL      
  )              
          
    
              
   ;WITH CTE (CondoUnitFloorID,CondoUnitID ,SpaceUseDesc,Row)
    AS (
    SELECT cuaf.CondoUnitFloorID,cu.CondoUnitID ,SpaceUseDesc
           ,ROW_NUMBER()  OVER (PARTITION BY cu.CondoUnitID,su.SpaceUseDesc ORDER BY cuaf.CondoUnitFloorID ASC) AS Row        
    
    FROM dbo.CondoUnit cu WITH(NOLOCK)        
    JOIN dbo.CondoUnitFloor cuaf WITH(NOLOCK)        
        ON cu.CondoUnitID = cuaf.CondoUnitID 
    LEFT JOIN dbo.SpaceUse  su (NOLOCK)         
    ON su.SpaceUseID = cuaf.SpaceUseID                
    WHERE cuaf.CondoUnitID = @pCondoUnitID    
    )
    
    INSERT INTO  @CondoUnitFloor (CondoUnitFloorID,CondoUnitID,SpaceUseDesc)       
     Select CondoUnitFloorID,CondoUnitID,SpaceUseDesc  from CTE WHERE ROW=1   
       
          
    SELECT @List = RTRIM(ISNULL(@List+', ','') + RTRIM(SpaceUSeDesc))      
	 FROM   @CondoUnitFloor  cuaf       
	 ORDER BY CondoUnitFloorID       
         
              
 END            
          
 RETURN @List            
END          
          
        
        
        
/*        
--test        
Select dbo.fnCondoUnitSpaceUseList(7895164) as CondoUnitSpaceUseList 
Select dbo.fnCondoUnitSpaceUseList(8900894) as CondoUnitSpaceUseList          
*/

GO
/****** Object:  UserDefinedFunction [dbo].[fnConfirmedOccupancyByLocationOccupancy]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[fnConfirmedOccupancyByLocationOccupancy](@LocationOccupancyID Int, @pAsOfDate DateTime)
  Returns Bit
As
Begin

  /*
  The objective of this function is to determine if occupancy (at the LocationOccupancy level) is
  confirmed as of a particular date "@pAsOfDate".  Occupancy - at the location level - is considered
  confirmed if one of the following is true:
  
  1. The LocationOccupancy is tied to occupancy that has a signed deal (LeaseDeal.SignDate Is Not Null)
  2. The LocationOccupancy is tied to a previous listing (SpaceOccupied.SpaceForLeaseID)
  3. The LocationOccupancy is tied to a current listing - "Vacating Tenant".  
    (The LocationOccupancy exists in SpaceForLeasespaceOccupied)

  Note: See fnConfirmedOccupancyBySpaceOccupied

  RBM 20050209 Creation
  */

  --Both input parameters must be non-null
  If (@LocationOccupancyID is Null) Or (@pAsOfDate is Null)
    Return 0

  If Exists (
    Select 1
    From dbo.LocationOccupancy                lo    (NoLock)
    Inner Join dbo.SpaceOccupied              so    (NoLock) On so.LocationOccupancyID = lo.LocationOccupancyID
    Left  Join dbo.LocationOccupancyLeaseDeal lold  (NoLock) On lo.LocationOccupancyID = lold.LocationOccupancyID
    Left  Join dbo.LeaseDeal                  ld    (NoLock) On ld.LeaseDealID = lold.LeaseDealID
                                                            And ld.LeaseSignDate Is Not Null
    Left  Join dbo.SpaceForLeaseSpaceOccupied sflso (NoLock) On sflso.CurrentSpaceOccupiedID  = so.SpaceOccupiedID
    Left  Join dbo.SpaceForLease              sfl   (NoLock) On sfl.SpaceForLeaseID = sflso.SpaceforLeaseID
                                                            And sfl.DateOnMarket <= @pAsOfDate
                                                            And (sfl.DateOffMarket Is Not Null Or
                                                                 sfl.DateOffMarket > @pAsOfDate)
    Where lo.LocationOccupancyID = @LocationOccupancyID
      And (
          sfl.spaceforleaseid Is Not Null
       Or so.SpaceForLeaseID  Is Not Null
       Or ld.leasedealid      Is Not Null
       )
  )
    Return 1   

  Return 0

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnConfirmedOccupancyBySpaceOccupied]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnConfirmedOccupancyBySpaceOccupied](@SpaceOccupiedID Int, @pAsOfDate DateTime)
  Returns Bit
As
Begin

  /*
  The objective of this function is to determine if occupancy (at the SpaceOccupied level) is
  confirmed as of a particular date "@pAsOfDate".  Occupancy - at the space level - is considered
  confirmed if one of the following is true:
  
  1. The space is tied to occupancy that has a signed deal (LeaseDeal.SignDate Is Not Null)
  2. The space is tied to a previous listing (SpaceOccupied.SpaceForLeaseID)
  3. The space is tied to a current listing - "Vacating Tenant".  
    (The space exists in SpaceForLeasespaceOccupied)

  Note: See fnConfirmedOccupancyByLocationOccupancy

  RBM 20050209 Creation
  */

  --Both input parameters must be non-null
  If (@SpaceOccupiedID is Null) Or (@pAsOfDate is Null)
    Return 0

  If Exists (
    Select 1
    From dbo.SpaceOccupied                    so    (NoLock)
    Inner Join dbo.LocationOccupancy          lo    (NoLock) On so.LocationOccupancyID = lo.LocationOccupancyID
    Left  Join dbo.LocationOccupancyLeaseDeal lold  (NoLock) On lo.LocationOccupancyID = lold.LocationOccupancyID
    Left  Join dbo.LeaseDeal                  ld    (NoLock) On ld.LeaseDealID = lold.LeaseDealID
                                                            And ld.LeaseSignDate Is Not Null
    Left  Join dbo.SpaceForLeaseSpaceOccupied sflso (NoLock) On sflso.CurrentSpaceOccupiedID  = so.SpaceOccupiedID
    Left  Join dbo.SpaceForLease              sfl   (NoLock) On sfl.SpaceForLeaseID = sflso.SpaceforLeaseID
                                                            And sfl.DateOnMarket <= @pAsOfDate
                                                            And (sfl.DateOffMarket Is Not Null Or
                                                                 sfl.DateOffMarket > @pAsOfDate)
    Where so.SpaceOccupiedID = @SpaceOccupiedID
      And (
          sfl.spaceforleaseid Is Not Null
       Or so.SpaceForLeaseID  Is Not Null
       Or ld.leasedealid      Is Not Null
       )
  )
    Return 1   

  Return 0

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnContactActivityProductLists]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnContactActivityProductLists](  @pContactActivityId int = null )
RETURNS varchar( 1200 )

AS

/******************************************************************************
**		Name: fnContactActivityProductLists

**		Desc: 	When the ContactActivity record is displayed, the associated products descriptions are displayed as a comma-separated
					list in a multi-line text box.  Rather than use a separate form, the UI allows the user to update 
					these relationships via a pick-list dialog where the user can make multiple selections. 
	
					In order to implement this behavior, this function must use a cursor loop to build the comma-separated lists.
					
**		Return values:		varchar( 1200 ) containing:
									tokenized list of productids seperated with commas and 
									tokenized list of product descriptions seperated with commas
									
									Example
									
									Token Pos 1prodids	| Token position 2 prod descriptions
									_____________________________________________
									1,2,3,4,5,6				;  Exchange,Property,Tenant,Comps
									
									The token positions are seperated by a comman(;)
									
									Your return results would be similar to:
									
									"1,2,3,4;Exchange,Property,Tenant,Comps"
																			
**		THIS FUNCTION IS CALLED RECURSIVELY.  EACH TIME A CONTACTACTIVITY RECORD IS RETRIEVED, THIS FUNCTION 
		MUST BE CALLED TO GET THE PRODUCT INFORMATION...  LOOK IN spContactActivityGet.
		
** 
**		Called by:				spContactActivityGet
**              
**		Parameters:
**		Input							
**     ----------						
**		@ContactActivity - Activity Record to search for products...
**
**		Auth:	Steven L. Verner
**
**		Date:	01.29.2002
**
*******************************************************************************
**		Change History
*******************************************************************************
**		Date:		Author:				Description:
**		--------		--------				-------------------------------------------
**    
*******************************************************************************/
BEGIN

	DECLARE @pIDList varchar( 100 );
	DECLARE @pDescList varchar( 1000 );
	DECLARE @Result varchar( 1200 );

	IF NOT EXISTS( SELECT ProductId FROM ContactActivityProduct WHERE ContactActivityId = @pContactActivityId )
		RETURN( ';' );
	
	-- Initializations
	SET @pIdList = '';
	SET @pDescList = '';
	
	SELECT @pIdList = @pIDList + LTRIM( RTRIM( CONVERT( VARCHAR( 10 ), p.ProductID ) )) +',',
				@pDescList = @pDescList + LTRIM( RTRIM( p.ProductDesc )) + ','
	FROM dbo.ContactActivityProduct c with (nolock)
	INNER JOIN dbo.Product p with (nolock) on p.ProductId = c.ProductId
	WHERE c.ContactActivityId = @pContactActivityId

	-- Check for commas at the end of the Id and Desc lists...
	IF RIGHT( @pIdList, 1 ) = ','
		SET @pIdList = SUBSTRING( @pIdList,1,LEN( @pIdList ) - 1 );
	
	IF RIGHT( @pDescList, 1 ) = ','
		SET @pDescList = SUBSTRING( @pDescList,1,LEN( @pDescList ) - 1 );
	
	IF @pIdList <> '' 
		SET @Result = @pIdList + ';' + @pDescList
	ELSE
		SET @Result = ';'

	Return( @Result );
	
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnContactGroupMembershipCSVListGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[fnContactGroupMembershipCSVListGet] (        
@pContactID INT
) returns varchar(1024)
/*	
	dbo.fnContactGroupMembershipCSVListGet
	
	function to return multiple Group names, comma separated ie  "Research, ResearchManager, Collections"  - for a given User 

	ex: 
		select dbo.fnContactGroupMembershipCSVListGet(ContactID)

	4/21/04 gpv Created

*/
AS
BEGIN

DECLARE @acc VARCHAR(1024)

SELECT
	@acc = isnull(@acc + ', ','') + pg.PermissionGroupName
FROM 	dbo.Contact c with (nolock)
	join dbo.PermissionGroupMember pgm with (nolock) on c.ContactID = pgm.MemberContactID
	join dbo.PermissionGroup pg with (nolock) on pgm.PermissionGroupID = pg.PermissionGroupID 

WHERE 	pgm.MemberContactID = @pContactID
	AND pg.IsActiveFlag = 1

ORDER BY pg.PermissionGroupName

--select @acc
return @acc

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnContactHasAcceptedTermsOfUse]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[fnContactHasAcceptedTermsOfUse]
	(
		@pContactID INT
	)
	RETURNS BIT
	AS
	BEGIN
		DECLARE @HasAcceptedTermsOfUse BIT = 0;
		DECLARE @TermsMustHaveAcceptedAfter DATETIME = '5/5/2012 8:54:00'
		
		IF EXISTS (SELECT 1 
		FROM WebUsers WU (NOLOCK)
		INNER JOIN 
		AcceptedTermsOfUse ATU (NOLOCK)
		ON WU.UserId = ATU.UserID
		WHERE
		WU.UserContactID = @pContactID
		AND ATU.DateAccepted >= @TermsMustHaveAcceptedAfter)
		BEGIN
			SET @HasAcceptedTermsOfUse = 1;
		END
		
		RETURN @HasAcceptedTermsOfUse;
	END

GO
/****** Object:  UserDefinedFunction [dbo].[fnContactHasActiveListings]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnContactHasActiveListings] 
( 
@pContactID int ,
@pLocationID INT = NULL
) 

Returns varchar(20)       

/**********************************************************************************
**  FunctionName:  	dbo.fnContactHasActiveListings
**
**  Purpose:    	Returns an error msg if the contact have active for sale or for lease listings
**					If no listings, returns empty string
**					If for lease listings, returns "lease"
**					If sale listings, returns "sale"
**
**  2007/05/01  DBZ 	TFS 4031 - Rewritten since not validating ForSale scenario propertly.  
**				Did not include check against PropertyForSale / CondoForSale.
**				See TFS for previous versions.
***********************************************************************************/

Begin
	Declare
		@Rtn varchar(200)

	Select
		@Rtn = ''


	-- Check for active SpaceForLease listings
	If exists (
		Select
			1
		From	dbo.SpaceForLease sfl (nolock)
		Inner	Join dbo.SpaceForLeaseContact sflc (nolock) on sflc.SpaceForLeaseID = sfl.SpaceForLeaseID
					and sflc.ContactID = @pContactID
					and sflc.ContactRoleID = 20
					and (@pLocationID IS NULL OR sflc.LocationID <> @pLocationID)
		Where	sfl.DateOffMarket is null
		)
	Begin
		Select
			@rtn = 'lease'
	End


	-- Check for active ForSale listings (both Property and Condo)
	If exists (
		Select
			1
		From	dbo.PropertyForSale pfs (nolock)
		Inner	Join dbo.ForSale fs (nolock) on fs.ForSaleID = pfs.ForSaleID
					and fs.DateOffMarket is null
		Inner	Join dbo.ForSaleContact fsc (nolock) on fsc.ForSaleID = fs.ForSaleID
					and fsc.ContactID = @pContactID
					and fsc.ContactRoleID in (10, 11)
					and (@pLocationID IS NULL OR fsc.LocationID <> @pLocationID)
		)
	OR exists (
		Select
			1
		From	dbo.CondoForSale cfs (nolock)
		Inner	Join dbo.ForSale fs (nolock) on fs.ForSaleID = cfs.ForSaleID
					and fs.DateOffMarket is null
		Inner	Join dbo.ForSaleContact fsc (nolock) on fsc.ForSaleID = fs.ForSaleID
					and fsc.ContactID = @pContactID
					and fsc.ContactRoleID in (10, 11)
					and (@pLocationID IS NULL OR fsc.LocationID <> @pLocationID)
		)	
	Begin
		Select
			@rtn = 'sale'
	End
	
	Return @rtn
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnContactHasActiveSubscriptions]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[fnContactHasActiveSubscriptions]
	(
		@pContactID INT
	)
	RETURNS BIT 
	AS
	BEGIN
		DECLARE @HasActiveSubscriptions BIT = 0;
		
		IF EXISTS(
		SELECT 1 
		FROM WebUsers WU (NOLOCK)
		INNER JOIN WebSubscriptions WS (NOLOCK) ON WU.UserId = WS.UserID
		INNER JOIN LineItem LI (NOLOCK) ON LI.LineItemID = WS.LineItemID
		WHERE 
		WU.UserContactID = @pContactID
			AND LI.LineItemStatusID IN (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
			AND LI.LineItemTypeID = 1 -- 1= Subscription
			AND LI.ProductID IN (1,2,3,5,40,42,43,47,48,103) -- Property, Tenant, Connect, Comps, CPD, Comps Express, Property Express, For Sale Pro, For Sale Express, GO
		)
		BEGIN
			SET @HasActiveSubscriptions = 1;
		END
		
		RETURN @HasActiveSubscriptions;
	END

GO
/****** Object:  UserDefinedFunction [dbo].[fnContactNameWhereClause2]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--=======================================================================================
-- This function is a carbon-copy of fnContactNameWhereClause except that it has an 
-- extra parameter, tbl, which specifies the table name containing the FirstName and
-- LastName columns.  This is needed for the WebUsers table.  Sometimes the WebUsers table
-- is the source for the name columns, sometimes the Contact table is the source.
--=======================================================================================

CREATE FUNCTION [dbo].[fnContactNameWhereClause2] (@sIn varChar(50), @tbl varchar(50)) Returns varchar(2000)
AS
BEGIN

--Dynamically build whereClause with NickNames Qualified
declare 
	@W varchar(2000)	--Where Clause 
	,@name varChar(30)
	,@inNames varChar(1000)
	,@nickName varChar(30)
	,@NumberOfInputNames tinyint

set @inNames = ''
set @NumberOfInputNames = 1

set @sIn = Replace(@sin, '''','''''' )

Set @W = '	(' + @tbl + '.Lastname Like ''' + @sIn + '%''
	OR '


--Look at each Name section (seperated by spaces)
While charIndex(' ', @sIn) > 0 AND @NumberOfInputNames <= 4
   Begin
	Set @NickName = Cast(Replace(subString(@sIn, 1, CharIndex(' ', @sIn) - 1),'!', ' ') as varChar(50))

	--Get all possible nicknames for each possible FirstName
	Declare crs Cursor for
	Select NickName from dbo.fnNickNames(@nickName) where NickName is NOT NULL
	Open crs
	Fetch Next from crs into @Name
	While @@Fetch_Status = 0
	   Begin
		If len(@inNames) = 0
			Set @inNames = '''' + @Name + '''' 
		Else
			Set @inNames = @inNames + ', ''' + @Name + '''' 

		Fetch Next from crs into @Name
	   End
	close crs
	deallocate crs

	Set @W = @W + '(' + @tbl + '.FirstName IN (' + @inNames + ') AND ' + @tbl + '.LastName Like '''
	 + subString(@sIn, charIndex(' ', @sIn) + 1, 50) + '%'')
	OR '

	Select @sIn = Stuff(@sIn, charIndex(' ', @sIn), 1, '!')
	Set @NumberOfInputNames = @NumberOfInputNames + 1
   End


Set @NickName = cast(Replace(@sIn, '!', ' ') as varChar(50))
Set @inNames = ''

--Get all possible nicknames for whole input string
Declare crs Cursor for
Select NickName from dbo.fnNickNames(@nickName) where NickName is NOT NULL
Open crs
Fetch Next from crs into @Name
While @@Fetch_Status = 0
   Begin
	If len(@inNames) = 0
		Set @inNames = '''' + @Name + '''' 
	Else
		Set @inNames = @inNames + ', ''' + @Name + '''' 
		Fetch Next from crs into @Name
   End
close crs
deallocate crs

If charIndex(',', @inNames) > 0
	Set @W = @W + @tbl + '.FirstName IN (' + @inNames + ') OR ' + @tbl + '.FirstName like ''' + @NickName + '%'')'
Else
	Set @W = @W + @tbl + '.FirstName like ''' + @NickName + '%'')'

Return @W

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnContactSecurityAreaGroupMembershipCSVListGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[fnContactSecurityAreaGroupMembershipCSVListGet] (        
@pContactID INT
,@pSecurityArea varchar(50)
) returns varchar(1000)
/*	
	dbo.fnContactSecurityAreaGroupMembershipCSVListGet
	
	function to return multiple Permission Sources, comma separated ie  "Research, ResearchManager, Collections"  - for a given User within a given SecurityArea	

	ex: 
		select dbo.fnContactSecurityAreaGroupMembershipCSVListGet(ContactID, 'Inbox')

	4/20/04 gpv Created

*/
AS
BEGIN

DECLARE @acc VARCHAR(1000)

SELECT
	@acc = isnull(@acc + ', ','') + pg.PermissionGroupName

FROM 	Permission p with (nolock)
	join dbo.PermissionGroup pg with (nolock) on p.PermissionID = pg.PermissionGroupID
	join dbo.PermissionGroupMember pgm with (nolock) on pgm.PermissionGroupID = pg.PermissionGroupID
	join dbo.CoStarContact csc with (nolock) on pgm.MemberContactID = csc.ContactID

WHERE 	pgm.MemberContactID = @pContactID
	AND pg.IsActiveFlag = 1
	AND p.SecurityArea = @pSecurityArea
	order by pg.PermissionGroupName


/* Get Individual Perms */
SELECT
	@acc = isnull(@acc + ', ','') + '(Individual)'

FROM 	Permission p with (nolock)

WHERE 	p.PermissionID = @pContactID
	AND p.SecurityArea = @pSecurityArea


return @acc


END

GO
/****** Object:  UserDefinedFunction [dbo].[fnContactSubordinatesGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnContactSubordinatesGet] (@ManagerContactID int)
Returns @ContactSubordinates Table (ContactID int, ManagerLevel int)
AS

Begin

	Declare @ManLev int
	Set @ManLev = 0

	Insert @ContactSubordinates (ContactID, ManagerLevel)
	Values (@ManagerContactID, @ManLev)

	While @ManLev is NOT NULL
	Begin
		Insert @ContactSubordinates (ContactID, ManagerLevel)
		Select	a.ContactID, @ManLev + 1
		from	dbo.CoStarContact a with (nolock)
		JOIN	@ContactSubordinates b ON a.ManagerContactID = b.ContactID
		Left JOIN @ContactSubordinates c ON c.ContactID = a.ContactID
		Where	c.ContactID is NULL
		AND	b.ManagerLevel = @ManLev

		Select @ManLev = max(ManagerLevel) 
		from @ContactSubordinates
		Where ManagerLevel > @ManLev
	End
	Return
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnConvertServicesToShortHand]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnConvertServicesToShortHand] (

@pService varchar(255)
)

RETURNS VARCHAR(12)

AS

/*
WHO  WHEN        WHAT
---  ----------  --------------------------------------------------------------
AJV  09/12/2003  Created. Converts Services to Shorthand! No Lookup for me!
*/


BEGIN

declare @lameVarName varchar(12)
	if (@pService = '''') set @lameVarName = '''' else
	if (@pService = 'Full Service') set @lameVarName = 'fs' else
	if (@pService = 'Triple Net') set @lameVarName = 'nnn' else
	if (@pService = 'Negotiable') set @lameVarName = 'negot' else
	if (@pService = 'Plus Electric') set @lameVarName = '+elec'  else
	if (@pService = 'Modified Gross') set @lameVarName = 'mg'  else
	if (@pService = 'Industrial Gross') set @lameVarName = 'ig'  else
	if (@pService = 'Plus All Utilities') set @lameVarName = '+util'  else
	if (@pService = 'To Be Determined') set @lameVarName = 'tbd'  else
	if (@pService = 'Tenant Electric') set @lameVarName = 'te'  else
	if (@pService = '+ Elec & Clean') set @lameVarName = 'e&c'  else
	if (@pService = 'Net') set @lameVarName = 'n'  else
	if (@pService = 'Plus Cleaning') set @lameVarName = '+clea'  else
	if (@pService = 'Utilities & Char') set @lameVarName = '+u&ch'  else
	if (@pService = 'Double Net') set @lameVarName = 'nn'
	
	return @lameVarName
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnCreateEscalationString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[fnCreateEscalationString] (
	@type 		tinyint,
	@amt 		numeric(6,2),
	@pct		decimal(5,2)
)
   Returns varchar(20)
As 
/*
==========================================================================
DESCRIPTION

	Func Name:  fnCreateEscalationString
	Purpose:    Creates string to populate Space.Escalation

	NOTES

	MODIFICATIONS

	Date	    Author		Purpose
	------------------------------------------------

	2002-12-03  John Walbert	Initial version
	2004-06-24  Fred Miller		Updated to use Research values
	2011-12-01	Edward Hellyer	Converted this function as a wrapper to the new version of this function that has an 
								optional fourth parameter.

==========================================================================
*/  
  Begin
	Return dbo.fnCreateEscalationString2(@type, @amt, @pct, default)
  End


GO
/****** Object:  UserDefinedFunction [dbo].[fnCreateEscalationString2]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[fnCreateEscalationString2] (
	@type 		tinyint,
	@amt 		numeric(6,2),
	@pct		decimal(5,2),
	@pCountryCode char(3) = null
)
   Returns varchar(20)
As 
/*
==========================================================================
DESCRIPTION

	Func Name:  fnCreateEscalationString
	Purpose:    Creates string to populate Space.Escalation

	NOTES

	MODIFICATIONS

	Date	    Author		Purpose
	------------------------------------------------

	2002-12-03  John Walbert	Initial version
	2004-06-24  Fred Miller		Updated to use Research values
	2011-12-01	Edward Hellyer	Converted to be a global formatter using country code.  
								Note:- Caller must be responsible for passing in a valid and supported country code.
==========================================================================
*/  
  Begin
       
	Declare @result	varchar(20)
	Declare @valueCode int
	Declare @valueString varchar(7)
	Declare @valueFinal varchar(5)
	Declare @value numeric(6,2)
	Declare @MonetarySymbol varchar(4)
	Declare @DefaultMonetarySymbol varchar(4)

	--Determine the @MonetarySymbol.
	set @MonetarySymbol = (
		select mu.MonetarySymbol
		from dbo.MonetaryUnit as mu with (nolock)
		join dbo.Country as c with (nolock) on c.MonetaryUnitID = mu.MonetaryUnitID
		where c.CountryCode = @pCountryCode
	)
	
	--Determine the @DefaultMonetarySymbol
	set @DefaultMonetarySymbol = '$'
	
	--Check if @DefaultMonetarySymbol required and remove white space on right (from the char(4) column data type).
	set @MonetarySymbol = RTRIM(ISNULL(@MonetarySymbol, @DefaultMonetarySymbol))
	
	--Determine the RateEscalationType result string
	if (@type  in  (1, 5, 6, 7))  -- monterary increase,  porter wage with fring, porter wage without fringe, fuel
		set @value = @amt
	else
		set @value = @pct

	--Default @value if not set
	set @value = isnull(@value, 0.0)

	--Format the value into a string with the correct number of decimal places.
	set @valueString=str(@value, 7,2)

	--Yet more string presentation formatting...
	select @valueFinal= case
					  when (@value <= 0.0 or @value >=100.0) then ''
					  when right(@valueString, 3)='.00' then ltrim(str(@value,5,0))  -- remove .00
					  when right(@valueString,1)='0' then ltrim(str(@value,5,1))  -- change .20 to .2
					  else ltrim(str(@value,5,2))
					  end

	--Build the result string
     select @result = case @type
                      -- 'Ai'
                      when 1 then
                                case @valueFinal
                                       when '' then 'Increased Amt'
                                       else @MonetarySymbol + rtrim(@valueFinal) + ' Increase'
                                end 
                      -- 'Cpi'
                      when 2 then 
                                case @valueFinal
                                       when '' then 'CPI'
                                       else  rtrim(@valueFinal) + '% CPI' 
                                end 
                      -- 'Fixed'
                      when 3 then
                                case @valueFinal
                                       when '' then 'Fixed Pct'
                                        else  rtrim(@valueFinal) + '% Fixed'     
                                end 
                      -- 'Negot'
                      when 4 then 'Negotiable'
                      -- 'Pwwf'
                      when 5 then
                                case @valueFinal
                                       when '' then 'PWWF'
                                       else @MonetarySymbol + rtrim(@valueFinal) + ' PWWF'
                                       --else rtrim(@amountFinal)  + '% of PWWF' 
                                end 
                      -- 'Pwwo'
                      when 6 then
                                case @valueFinal
                                       when '' then 'PWWOF'
                                       else @MonetarySymbol + rtrim(@valueFinal) + ' PWWOF'
                                       --else rtrim(@amountFinal)  + '% of PWWOF' 
                                end 

                      -- 'Fuel'
                      when 7 then
                                case @valueFinal
                                       when '' then 'Fuel'
                                       else @MonetarySymbol + rtrim(@valueFinal) + ' Fuel'
                                       --else  rtrim(@amountFinal) + '% of Fuel' 
                                end 
                      -- Retail Percentage Increase
                      when 8 then 
                                case @valueFinal
                                       when '' then 'Gross Sales'
                                       else  rtrim(@valueFinal) + '% Gross Sales' 
                                end 
                      -- Retail Overage Increase'
                      when 9 then 
                                case @valueFinal
                                       when '' then 'Over Base'
                                       else  rtrim(@valueFinal) + '% Over Base' 
                                end 
                      else NULL                
              end

     return @result
  End


GO
/****** Object:  UserDefinedFunction [dbo].[fnCreateExpenseStopString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCreateExpenseStopString] (
	@SpaceTaxExpenseTypeID		tinyint,
	@TaxExpenseStopAmount		decimal(6,2),
	@TaxExpenseStopBaseYear		smallint,
	@SpaceOperatingExpenseTypeID	tinyint,
	@OperatingExpenseStopAmount	decimal(6,2),
	@OperatingExpenseStopBaseYear	smallint,
	@CombinedStopAmount		decimal(6,2)
) 
	Returns varchar(40)
As
/*
==========================================================================
DESCRIPTION

	Func Name:  fnCreateExpenseStopString 
	Purpose:    Creates string to populate 
			Product..Space.ExpenseStop

	NOTES

		The Value Mappings for SpaceExpenseType are:
		Old	New
		B	1	Base Year
		S	2	Stop

		Combined is derived where @CombinedStopAmount is NOT NULL.

	MODIFICATIONS

	Date	    Author		Purpose
	------------------------------------------------

	2002-12-03  John Walbert	Initial version
	2004-07-29  Fred Miller		Updated for new version.

==========================================================================
*/   
Begin

Declare	@expenseStop	varchar(40),
	@taxExpense	varchar(20),
	@opsExpense	varchar(20),
	@StopType_B	tinyint,
	@StopType_S	tinyint

set @StopType_B = 1
set @StopType_S = 2

set @taxExpense = '' 
set @opsExpense = '' 

if (@CombinedStopAmount is NOT NULL)
Begin
	If (@CombinedStopAmount > 0)

		set @taxExpense = '$' + cast(@CombinedStopAmount as varchar(10)) + ' '
	Else
		set @taxExpense = ''
	set @taxExpense = @taxExpense + 'Cmb Tax/Ops Stop'
End
Else
Begin
	select @taxExpense = 
		Case @SpaceTaxExpenseTypeID
			When @StopType_S Then
				Case When @TaxExpenseStopAmount > 0
					Then '$' + rtrim(cast(@TaxExpenseStopAmount as char(10))) + ' '
					Else '' 
				End    +  'Tax Stop'
			When @StopType_B Then 
				Case When @TaxExpenseStopBaseYear > 0
					Then rtrim(cast(@TaxExpenseStopBaseYear as char(4))) + ' '
					Else '' 
				End    +  'BaseYr Tax'
			Else NULL
		End
	
	select @opsExpense =
		Case @SpaceOperatingExpenseTypeID
			When @StopType_S Then
				Case
					When @OperatingExpenseStopAmount > 0
						and @taxExpense is NOT NULL
						Then  ',' +  '$' + rtrim(cast(@OperatingExpenseStopAmount as char(10))) + ' '
					When @OperatingExpenseStopAmount > 0
						Then  '$'+ rtrim(cast(@OperatingExpenseStopAmount as char(10))) + ' '
					When @taxExpense is NOT NULL Then  ', '
					Else '' 
				End  + 'Ops Stop'
	                                                             
			When @StopType_B Then 
				Case 
					When @OperatingExpenseStopBaseYear = @TaxExpenseStopBaseYear
						and @SpaceTaxExpenseTypeID = @StopType_B
						Then '/Ops'
					When @OperatingExpenseStopBaseYear  > 0
						and @taxExpense is NOT NULL 
						Then  ',' +  rtrim(cast(@OperatingExpenseStopBaseYear as char(4))) + ' '
					When @OperatingExpenseStopBaseYear  > 0
						Then  rtrim(cast(@OperatingExpenseStopBaseYear as char(4))) + ' '
					When @taxExpense is NOT NULL
						Then  ', '
					Else '' 
				End  + 
					Case
						When @OperatingExpenseStopBaseYear = @TaxExpenseStopBaseYear
							and @SpaceTaxExpenseTypeID = @StopType_B
							Then ''  
						Else  'BaseYr Ops' 
					End
			Else NULL
		End
End

select @expenseStop=isnull(ltrim(rtrim(@taxExpense)),'') 
			+ isnull(ltrim(rtrim(@opsExpense)),'')

Return Case When @expenseStop='' Then NULL Else @expenseStop End

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnCreditCardCheck]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCreditCardCheck] (
  @pCreditCardNumber			varchar(30) = null
, @pCreditCardExpirationMonth	int = null
, @pCreditCardExpirationYear	int = null
)
RETURNS	Varchar(80)  AS  
BEGIN
	DECLARE @errMsg varchar(80)
	SET @errMsg = ''
	SET @pCreditCardNumber = ltrim(rtrim(isnull(@pCreditCardNumber,'')))
	IF @pCreditCardNumber = '' 
		RETURN ''
	SET @pCreditCardExpirationMonth = IsNull(@pCreditCardExpirationMonth, 0)
	SET @pCreditCardExpirationYear = IsNull(@pCreditCardExpirationYear, 0)
	IF @pCreditCardExpirationMonth < 1 OR @pCreditCardExpirationMonth > 12
		SET @ErrMsg = 'Invalid credit card expiration month'
	ELSE IF @pCreditCardExpirationYear < 1950 OR @pCreditCardExpirationYear > 2050
		SET @ErrMsg = 'Invalid credit card expiration year'
	ELSE BEGIN
		-- The front-end app is *supposed* to encrypt the credit card number.  	
		-- Verify that card number is encrypted (as evidenced by the presence of at least 1 non-numeric character)
		DECLARE @i int
		DECLARE @ClearText bit 
		SET @ClearText = 1
		SET @i = 1
		WHILE @i <= len(@pCreditCardNumber) AND @ClearText = 1 BEGIN
			IF Substring (@pCreditCardNumber, @i, 1) IN ('0','1','2','3','4','5','6','7','8','9') 
				SET @i = @i + 1
			ELSE 
				SET @ClearText = 0
		END
		IF @ClearText = 1
			SET @errMsg = 'Credit card number is not encrypted.  Please contact customer support.'
	END
	RETURN @ErrMsg
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnCRMDefaultGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCRMDefaultGet] ( @pDefaultName varchar(50) ) returns varchar(255)
AS
Begin
DECLARE @DefaultValue				varchar(255)
DECLARE @CRMEnvironmentID			tinyint

-- CRMDefault has 4 columns, which hold the default values for the 4 environments (development,
-- testing, production, training). 
SELECT @CRMEnvironmentID = CRMEnvironmentID FROM dbo.CRMDBServer  with (nolock)
	WHERE ServerName = @@ServerName 
SELECT @DefaultValue = dbo.fnCRMDefaultGet2 (@pDefaultName, @CRMEnvironmentID)
RETURN @DefaultValue
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnCRMDefaultGet2]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCRMDefaultGet2] ( @pDefaultName varchar(50), @pCRMEnvironmentID tinyint ) returns varchar(255)
AS
Begin
DECLARE @DefaultValue				varchar(255)
DECLARE @CRMEnvironmentID			tinyint

-- CRMDefault has 4 columns, which hold the default values for the 4 environments (development,
-- testing, production, training). 
IF @pCRMEnvironmentID = 1
	SELECT @DefaultValue = Production FROM dbo.CRMDefault with (nolock) WHERE DefaultName = @pDefaultName
ELSE IF @pCRMEnvironmentID = 2
	SELECT @DefaultValue = Testing FROM dbo.CRMDefault with (nolock) WHERE DefaultName = @pDefaultName
ELSE IF @pCRMEnvironmentID = 3
	SELECT @DefaultValue = Development FROM dbo.CRMDefault with (nolock) WHERE DefaultName = @pDefaultName
ELSE IF @pCRMEnvironmentID = 4
	SELECT @DefaultValue = Training FROM dbo.CRMDefault with (nolock) WHERE DefaultName = @pDefaultName
ELSE BEGIN
	SET @DefaultValue = null
END
RETURN @DefaultValue
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnCRMEnvironmentIDGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCRMEnvironmentIDGet] ( ) returns tinyint
AS
Begin

DECLARE @Env tinyint

SELECT @Env = isNull(a.CRMEnvironmentID,0)
	FROM dbo.CRMDBServer a with (nolock)
	JOIN dbo.CRMEnvironment b with (nolock) on a.CRMEnvironmentID = b.CRMEnvironmentID
	WHERE ServerName = @@ServerName 

return @Env
end

GO
/****** Object:  UserDefinedFunction [dbo].[fnDateOnly]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Returns just the date portion of the supplied date
CREATE FUNCTION [dbo].[fnDateOnly] (@pDateTime DateTime) Returns DateTime
AS
BEGIN
	return convert (DateTime, convert(varchar(20),@pDateTime,101))
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnDateWhereClause]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Returns a string of the form:  (ColName >= DateStart AND ColName < DateEnd)
/************************************************************************************
NOTE:

2/6/05 LReddy 	This function has been copied to ProductUser.  
		If there are any changes made please deploy to Product User as well.

************************************************************************************/
CREATE FUNCTION [dbo].[fnDateWhereClause] (
	@pColName		VarChar(50)
,	@pDateStart		DateTime
,	@pDateEnd		DateTime
) RETURNS	VarChar(100) AS  
BEGIN
	DECLARE @where VarChar(100);
	DECLARE @sDateEnd VarChar(16);
	SET @where = ''
	IF @pDateStart IS NULL
		RETURN @where				-- do nothing if DateStart is not supplied
	IF @pDateEnd IS NULL				
		SET @pDateEnd = @pDateStart	
	-- Add 1 day to the end date
	SET @sDateEnd = CONVERT (varchar(16), @pDateEnd, 101);
	SET @pDateEnd = CONVERT (datetime, @sDateEnd);
	SET @pDateEnd = DATEADD (day, 1, @pDateEnd);
	SET @where = '(' + @pColName + ' >= ' + '''' +  CONVERT (varchar(16), @pDateStart, 101) + ''''
		+ ' AND ' + @pColName + ' < ' +  '''' + CONVERT (varchar(16), @pDateEnd, 101) + '''' + ')' 
	RETURN @where;
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnDetermineLocationAncestry]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnDetermineLocationAncestry]
(
@pLocationID int
)

Returns
	@AncestryResults Table(
		TempID int,
		LocationID int,
		AncestorLocationID int,
		AncestorOfficeTypeID int,
		Level int)

AS

/******************************************************************************************
**  FunctionName:  fnDetermineLocationAncestry
**
**  Purpose:  Function to return the ancestors for a given location.  Enumerates the direct
**			path back to the Headquarters
**
**  05/20/2005  DBZ  Creation
**
********************************************************************************************/

Begin

Declare
	@SearchLocationID int,
	@Level int

Select
	@Level = 0


/*  Store Location hierarchy and Ancestry Structures  */
Declare
	@Location Table(
		TempID int not null identity(1,1),
		LocationID int,
		ParentLocationID int,
		InheritProfileFrom int,
		HQLocationID int,
		OfficeTypeID int)	


Declare
	@Ancestry Table(
		TempID int not null identity(1,1),
		LocationID int,
		AncestorLocationID int,
		AncestorOfficeTypeID int,
		Level int)


/*  Load Location data for @pLocationID's Relatives  */	
Insert into @Location(
	LocationID,
	ParentLocationID,
	InheritProfileFrom,
	HQLocationID,
	OfficeTypeID)

Select
	l2.LocationID,
	l2.ParentLocationID,
	l2.InheritProfileFrom,
	l2.HQLocationID,
	l2.OfficeTypeID
From	dbo.Location l (nolock)
Inner	Join dbo.Location l2 (nolock) on l2.HQLocationID = l.HQLocationID
Where	l.LocationID = @pLocationID


Select
	@SearchLocationID = @pLocationID

/*  Determine Ancestry Hierarchy  */	
While @SearchLocationID is not null
Begin
	Insert into @Ancestry(
		LocationID,
		AncestorLocationID,
		AncestorOfficeTypeID,
		Level)

	Select
		@pLocationID,
		l.LocationID,
		l.OfficeTypeID,
		@Level
	From	@Location l
	Where	LocationID = @SearchLocationID
	

	Select
		@Level = @Level + 1,
		@SearchLocationID = l.ParentLocationID
	From	@Location l
	Where	l.LocationID = @SearchLocationID
End

/*  Populate final result table  */
Insert into @AncestryResults(
	TempID,
	LocationID,
	AncestorLocationID,
	AncestorOfficeTypeID,
	Level)

Select
	TempID,
	LocationID,
	AncestorLocationID,
	AncestorOfficeTypeID,
	Level
From	@Ancestry
Order	by 
	TempID asc


Return	
End

-- Done

GO
/****** Object:  UserDefinedFunction [dbo].[fnDetermineLocationHierarchyIDScheme]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnDetermineLocationHierarchyIDScheme]
(
@pKeepLocationID int = null,
@pDiscardLocationID int = null,
@pKeepOfficeTypeIDOverride int = null
)

Returns @Location Table (
		LocationID int primary key nonclustered,
		Level int,
		ParentLocationID int,
		InheritProfileFrom int,
		HQLocationID int,
		OfficeTypeID int)

AS

/******************************************************************************************
**  FunctionName:  fnDetermineLocationHierarchyIDScheme
**
**  Purpose:  Function to return the following Location table ID structure for 
**			Location records in the hierarchy of the 'surviving' 
**			merge LocationID
**  		
**  			HQLocationID
**  			ParentLocationID
**  			InheritProfileFrom
**  			OfficeTypeID
**  
**  03/09/2005  DBZ  Creation
**
********************************************************************************************/

Begin

/*  Store Location Hierarchy Structure  */
Declare	@Hierarchy Table (
	TempID int not null identity(1,1),
	LocationType varchar(12),
	Level int,
	LocationID int,
	ParentLocationID int,
	InheritProfileFrom int,
	HQLocationID int,
	OfficeTypeID int)

/*  Start Hierarchy with KeepLocationID and DiscardLocationID
	and DiscardLocationID first level Children  */
Insert into @Hierarchy(
	Level,
	LocationID,
	ParentLocationID,
	InheritProfileFrom,
	HQLocationID,
	OfficeTypeID)

Select
	-1,
	l.LocationID,
	l.ParentLocationID,
	l.InheritProfileFrom,
	l.HQLocationID,
	l.OfficeTypeID
From	dbo.Location l (nolock)
Where	l.LocationID = @pDiscardLocationID

Union

Select
	0,
	l.LocationID,
	l.ParentLocationID,
	l.InheritProfileFrom,
	l.HQLocationID,
	l.OfficeTypeID
From	dbo.Location l (nolock)
Where	l.LocationID = @pKeepLocationID

Union

Select
	1,
	l.LocationID,		-- Child
	l.ParentLocationID,
	l.InheritProfileFrom,
	l.HQLocationID,
	l.OfficeTypeID
From	dbo.Location l (nolock)
Where	l.ParentLocationID = @pDiscardLocationID


/*  Populate remaining Hierarchy with DiscardLocationID Children at all levels  */
While (@@RowCount > 0)
Begin
	Insert into @Hierarchy(
		Level,
		LocationID,
		ParentLocationID,
		InheritProfileFrom,
		HQLocationID,
		OfficeTypeID)

	Select
		Distinct
		h.Level + 1,
		l.LocationID,
		l.ParentLocationID,
		l.InheritProfileFrom,
		l.HQLocationID,
		l.OfficeTypeID
	From	@Hierarchy h 
	Inner	Join dbo.Location l on l.ParentLocationID = h.LocationID
	Where	h.Level = (
				Select 
					max(Level) 
				From 	@Hierarchy 
				Where Level >= 1
				)
	AND 	l.ParentLocationID <> l.LocationID
End


/*  Override:  Set Keep OfficeTypeID to @pKeepOfficeTypeIDOverride if provided  */
Update	h
Set	OfficeTypeID = isnull(@pKeepOfficetypeIDOverride, h.OfficeTypeID)
From	@Hierarchy h
Where	Level = 0 					-- Keep


/*  Rule 1:  Set Keep Location to Discard Location ID structure if Keep OfficeType 
		is Unknown, Franchise, or Single and Discard Location 
		OfficeType is HQ, DivHQ, or Branch  */
Update	h
Set	HQLocationID = h2.HQLocationID,
	ParentLocationID = h2.ParentLocationID,
	InheritProfileFrom = h2.InheritProfileFrom,
	OfficeTypeID = h2.OfficeTypeID
From	@Hierarchy h
Inner	Join @Hierarchy h2 on h2.Level = -1		-- Discard
		and h2.OfficeTypeID in (1, 2, 3)  	-- HQ, DivHQ, Branch
Where	h.Level = 0					-- Keep
AND	h.OfficeTypeID in (null, 4, 5)  		-- Unknown, Franchise, Single


/*  Rule 2:  Set Children OfficeType to Branch if Keep Location OfficeType is DivHQ or Branch
		and set Children HQLocationID to Keep Location HQLocationID  */
Update	h2
Set	HQLocationID = h.HQLocationID,
	OfficeTypeID = (case 	when h.OfficeTypeID in (2,3) and h2.OfficeTypeID <> 3 then 3 	-- Branch
				else h2.OfficeTypeID 
				end)
From	@Hierarchy h
Inner	Join @Hierarchy h2 on h2.Level >= 1		-- Child
Where	h.Level = 0					-- Keep


/*  Rule 3:  Set Children InheritProfileFrom to Keep InheritProfileFrom if InheritProfileFrom = Discard InheritProfileFrom
		Otherwise, set to Parent InheritProfileFrom  */
Update	h
Set	InheritProfileFrom = (case 
				when h.InheritProfileFrom = d2.InheritProfileFrom then d1.InheritProfileFrom
				else h2.InheritProfileFrom
				end)
From	@Hierarchy h
Inner	Join @Hierarchy h2 on h2.LocationID = h.ParentLocationID
Inner	Join (
		Select
			h.LocationID,
			h.InheritProfileFrom
		From	@Hierarchy h
		Where	h.Level = 0	-- Keep
	) d1 on 1 = 1
Inner	Join (
		Select
			h.LocationID,
			h.InheritProfileFrom
		From	@Hierarchy h
		Where	h.Level = -1	-- Discard 
	) d2 on 1 = 1
Where	h.Level >= 1


/*  Rule 4:  Set Children at Level 1 ParentLocationID = Keep LocationID  */
Update	h2
Set	ParentLocationID = h.LocationID
From	@Hierarchy h
Inner	Join @Hierarchy h2 on h2.Level = 1	-- Level 1 Child
Where	h.Level = 0				-- Keep


/*  Populate function result set @Location  */
Insert into @Location(
 	LocationID,
	Level,
	ParentLocationID,
	InheritProfileFrom,
	HQLocationID,
	OfficeTypeID)

Select
	LocationID,
	Level,
	ParentLocationID,
	InheritProfileFrom,
	HQLocationID,
	OfficeTypeID
From	@Hierarchy 
Where	Level >= 0
Order	by
	Level,
	TempID


Return
End

-- Done

GO
/****** Object:  UserDefinedFunction [dbo].[fnDistanceBetweenLocations]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnDistanceBetweenLocations] (@loc1 int, @loc2 int) Returns int
as
Begin
	Declare
	@lat1	float
	,@lat2	float
	,@long1	float
	,@long2	float
	,@miles int

	Select 
		@lat1 = latitude
		,@long1 = longitude
	From
		dbo.location l with (nolock)
	JOIN	dbo.Address a ON a.addressID = l.addressID
	Where
		l.locationID = @loc1
	
	if ((@lat1 is null) or (@long1 is NULL))
		Return Null
		
	Select 
		@lat2 = latitude
		,@long2 = longitude
	From
		dbo.location l with (nolock)
	JOIN	dbo.Address a  with (nolock) ON a.addressID = l.addressID
	Where
		l.locationID = @loc2
	
	if ((@lat2 is null) or (@long2 is NULL))
		Return Null

	Set @miles =  degrees(acos(sin(radians(@lat1))* sin(radians(@lat2))+ ( cos(radians(@lat1)) * cos(radians(@lat2)) * cos(radians(@long1)-radians(@long2)))))*69

	Return @miles
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnDistanceBetweenLocationsNumeric]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select l.locationID, a.latitude, a.longitude from location l JOIN address a ON a.addressID = l.addressID where locationName like 'Costar%'
--Select dbo.fnDistanceBetweenLocations(3808, 3807)

CREATE FUNCTION [dbo].[fnDistanceBetweenLocationsNumeric] (@loc1 int, @loc2 int) Returns Numeric(7,2)
as
Begin
	Declare
	@lat1	float
	,@lat2	float
	,@long1	float
	,@long2	float
	,@miles float

	Select 
		@lat1 = latitude
		,@long1 = longitude
	From
		dbo.location l with (nolock)
	JOIN	dbo.Address a ON a.addressID = l.addressID
	Where
		l.locationID = @loc1
	
	if ((@lat1 is null) or (@long1 is NULL))
		Return Null
		
	Select 
		@lat2 = latitude
		,@long2 = longitude
	From
		dbo.location l with (nolock)
	JOIN	dbo.Address a  with (nolock) ON a.addressID = l.addressID
	Where
		l.locationID = @loc2
	
	if ((@lat2 is null) or (@long2 is NULL))
		Return Null

	Set @miles =  degrees(acos(sin(radians(@lat1))* sin(radians(@lat2))+ ( cos(radians(@lat1)) * cos(radians(@lat2)) * cos(radians(@long1)-radians(@long2)))))*69
	
	set @miles = Round(@miles,2)
	Return CAST(@miles as numeric(7,2))
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnDoubleMetaphoneScalar]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnDoubleMetaphoneScalar]( @MetaphoneType int, @Word varchar(50) )
RETURNS char(4)
AS
BEGIN
	RETURN (SELECT CASE @MetaphoneType 
			WHEN 1 THEN Metaphone1 
			WHEN 2 THEN Metaphone2 
			END 
		FROM fnDoubleMetaphoneTable( @Word )
		)
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnDoubleMetaphoneTable]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnDoubleMetaphoneTable]( @Word varchar(50) )
RETURNS @DMP TABLE ( Metaphone1 char(4), Metaphone2 char(4) )
AS
BEGIN
	DECLARE @MP1 varchar(4), @MP2 varchar(4)
	SET @MP1 = ''
	SET @MP2 = ''
	DECLARE @CurrentPosition int, @WordLength int, @CurrentChar char(1)
	SET @CurrentPosition = 1
	SET @WordLength = LEN(@Word)

	IF @WordLength < 1 
	BEGIN
		RETURN
	END
	
	--ensure case insensitivity
	SET @Word = UPPER(@Word)
	
	IF dbo.fnStringAt(1, @Word, 'GN,KN,PN,WR,PS') = 1 
	BEGIN
		SET @CurrentPosition = @CurrentPosition + 1
	END
	
	IF 'X' = LEFT(@Word,1)
	BEGIN
		SET @MP1 = @MP1 + 'S'
		SET @MP2 = @MP2 + 'S'
		SET @CurrentPosition = @CurrentPosition + 1
	END

	WHILE (4 > LEN(RTRIM(@MP1))) OR (4 > LEN(RTRIM(@MP2)))
	BEGIN
		IF @CurrentPosition > @WordLength 
		BEGIN
			BREAK
		END

		SET @CurrentChar = SUBSTRING(@Word,@CurrentPosition,1)

		IF @CurrentChar IN('A','E','I','O','U','Y')
		BEGIN
			IF @CurrentPosition = 1 
			BEGIN
				SET @MP1 = @MP1 + 'A'
				SET @MP2 = @MP2 + 'A'
			END
			SET @CurrentPosition = @CurrentPosition + 1
		END
		ELSE IF @CurrentChar = 'B'
		BEGIN
			SET @MP1 = @MP1 + 'P'
			SET @MP2 = @MP2 + 'P'
			IF 'B' = SUBSTRING(@Word,@CurrentPosition + 1,1) 
			BEGIN
				SET @CurrentPosition = @CurrentPosition + 2
			END
			ELSE 
			BEGIN
				SET @CurrentPosition = @CurrentPosition + 1
			END
		END
		ELSE IF @CurrentChar = '�'
		BEGIN
			SET @MP1 = @MP1 + 'S'
			SET @MP2 = @MP2 + 'S'
			SET @CurrentPosition = @CurrentPosition + 1
		END
		ELSE IF @CurrentChar = 'C'
		BEGIN
			--various germanic
			IF (@CurrentPosition > 2) 
			   AND (dbo.fnIsVowel(SUBSTRING(@Word,@CurrentPosition-2,1))=0) 
			   AND (dbo.fnStringAt(@CurrentPosition-1,@Word,'ACH') = 1) 
			   AND ((SUBSTRING(@Word,@CurrentPosition+2,1) <> 'I') 
			   	AND ((SUBSTRING(@Word,@CurrentPosition+2,1) <> 'E') OR (dbo.fnStringAt(@CurrentPosition-2,@Word,'BACHER,MACHER')=1)))
			BEGIN
				SET @MP1 = @MP1 + 'K'
				SET @MP2 = @MP2 + 'K'
				SET @CurrentPosition = @CurrentPosition + 2
			END
			-- 'caesar'
			ELSE IF (@CurrentPosition = 1) AND (dbo.fnStringAt(@CurrentPosition,@Word,'CAESAR') = 1)
			BEGIN
				SET @MP1 = @MP1 + 'S'
				SET @MP2 = @MP2 + 'S'
				SET @CurrentPosition = @CurrentPosition + 2
			END
			-- 'chianti'
			ELSE IF dbo.fnStringAt(@CurrentPosition,@Word,'CHIA') = 1
			BEGIN
				SET @MP1 = @MP1 + 'K'
				SET @MP2 = @MP2 + 'K'
				SET @CurrentPosition = @CurrentPosition + 2
			END
			ELSE IF dbo.fnStringAt(@CurrentPosition,@Word,'CH') = 1
			BEGIN
				-- Find 'michael'
				IF (@CurrentPosition > 1) AND (dbo.fnStringAt(@CurrentPosition,@Word,'CHAE') = 1)
				BEGIN
					--First instance of alternate encoding
					SET @MP1 = @MP1 + 'K'
					SET @MP2 = @MP2 + 'X'
					SET @CurrentPosition = @CurrentPosition + 2
				END
				--greek roots e.g. 'chemistry', 'chorus'
				ELSE IF (@CurrentPosition = 1) AND (dbo.fnStringAt(2, @Word, 'HARAC,HARIS,HOR,HYM,HIA,HEM') = 1) AND (dbo.fnStringAt(1,@Word,'CHORE') = 0)
				BEGIN
					SET @MP1 = @MP1 + 'K'
					SET @MP2 = @MP2 + 'K'
					SET @CurrentPosition = @CurrentPosition + 2
				END
				--germanic, greek, or otherwise 'ch' for 'kh' sound
				ELSE IF ((dbo.fnStringAt(1,@Word,'VAN ,VON ,SCH')=1) OR 
				   (dbo.fnStringAt(@CurrentPosition-2,@Word,'ORCHES,ARCHIT,ORCHID')=1) OR 
				   (dbo.fnStringAt(@CurrentPosition+2,@Word,'T,S')=1) OR 
				   (((dbo.fnStringAt(@CurrentPosition-1,@Word,'A,O,U,E')=1) OR 
				   (@CurrentPosition = 1))  
				   AND (dbo.fnStringAt(@CurrentPosition+2,@Word,'L,R,N,M,B,H,F,V,W, ')=1)))
				BEGIN
					SET @MP1 = @MP1 + 'K'
					SET @MP2 = @MP2 + 'K'
					SET @CurrentPosition = @CurrentPosition + 2
				END
				ELSE
				BEGIN
					IF (@CurrentPosition > 1)	--is this a given?
					BEGIN
						IF (dbo.fnStringAt(1,@Word,'MC') = 1)
						BEGIN
							SET @MP1 = @MP1 + 'K' --eg McHugh
							SET @MP2 = @MP2 + 'K'
						END
						ELSE
						BEGIN
							--Alternate encoding
							SET @MP1 = @MP1 + 'X'
							SET @MP2 = @MP2 + 'K'
						END
					END
					ELSE
					BEGIN
						SET @MP1 = @MP1 + 'X'
						SET @MP2 = @MP2 + 'X'
					END
					SET @CurrentPosition = @CurrentPosition + 2
				END
			END
	                --e.g, 'czerny'
	                ELSE IF (dbo.fnStringAt(@CurrentPosition,@Word,'CZ')=1) AND (dbo.fnStringAt((@CurrentPosition - 2),@Word,'WICZ')=0)
	                BEGIN
				SET @MP1 = @MP1 + 'S'
				SET @MP2 = @MP2 + 'X'
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	
	                --e.g., 'focaccia'
	                ELSE IF(dbo.fnStringAt((@CurrentPosition + 1),@Word,'CIA')=1)
	                BEGIN
				SET @MP1 = @MP1 + 'X'
				SET @MP2 = @MP2 + 'X'
	                        SET @CurrentPosition = @CurrentPosition + 3
	                END
	
	                --double 'C', but not if e.g. 'McClellan'
	                ELSE IF(dbo.fnStringAt(@CurrentPosition,@Word,'CC')=1) AND NOT ((@CurrentPosition = 2) AND (LEFT(@Word,1) = 'M'))
	                        --'bellocchio' but not 'bacchus'
	                        IF (dbo.fnStringAt((@CurrentPosition + 2),@Word,'I,E,H')=1) AND (dbo.fnStringAt((@CurrentPosition + 2),@Word,'HU')=0)
	                        BEGIN
	                                --'accident', 'accede' 'succeed'
	                                IF (((@CurrentPosition = 2) AND (SUBSTRING(@Word,@CurrentPosition - 1,1) = 'A')) 
	                                                OR (dbo.fnStringAt((@CurrentPosition - 1),@Word,'UCCEE,UCCES')=1))
					BEGIN
						SET @MP1 = @MP1 + 'KS'
						SET @MP2 = @MP2 + 'KS'
					END
	                                --'bacci', 'bertucci', other italian
	                                ELSE
					BEGIN
						SET @MP1 = @MP1 + 'X'
						SET @MP2 = @MP2 + 'X'
					END
		                        SET @CurrentPosition = @CurrentPosition + 3
				END
	                        ELSE --Pierce's rule
				BEGIN
					SET @MP1 = @MP1 + 'K'
					SET @MP2 = @MP2 + 'K'
		                        SET @CurrentPosition = @CurrentPosition + 2
	                        END
	
	                ELSE IF (dbo.fnStringAt(@CurrentPosition,@Word,'CK,CG,CQ')=1)
	                BEGIN
				SET @MP1 = @MP1 + 'K'
				SET @MP2 = @MP2 + 'K'
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	
	                ELSE IF (dbo.fnStringAt(@CurrentPosition,@Word,'CI,CE,CY')=1)
	                BEGIN
	                        --italian vs. english
	                        IF (dbo.fnStringAt(@CurrentPosition,@Word,'CIO,CIE,CIA')=1)
				BEGIN
					SET @MP1 = @MP1 + 'S'
					SET @MP2 = @MP2 + 'X'
				END
	                        ELSE
				BEGIN
					SET @MP1 = @MP1 + 'S'
					SET @MP2 = @MP2 + 'S'
				END
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	
	                ELSE
			BEGIN
				SET @MP1 = @MP1 + 'K'
				SET @MP2 = @MP2 + 'K'
	                
		                --name sent in 'mac caffrey', 'mac gregor
		                IF (dbo.fnStringAt((@CurrentPosition + 1),@Word,' C, Q, G')=1)
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 3
				END
		                ELSE
				BEGIN
		                        IF (dbo.fnStringAt((@CurrentPosition + 1),@Word,'C,K,Q')=1)
		                                AND (dbo.fnStringAt((@CurrentPosition + 1), 2, 'CE,CI')=0)
					BEGIN
			                        SET @CurrentPosition = @CurrentPosition + 2
					END
		                        ELSE
					BEGIN
			                        SET @CurrentPosition = @CurrentPosition + 1
					END
		                END
			END
	
		END
		ELSE IF @CurrentChar = 'D'
		BEGIN
	                IF (dbo.fnStringAt(@CurrentPosition, @Word, 'DG')=1)
			BEGIN
	                        IF (dbo.fnStringAt((@CurrentPosition + 2),@Word,'I,E,Y')=1)
	                        BEGIN
	                                --e.g. 'edge'
					SET @MP1 = @MP1 + 'J'
					SET @MP2 = @MP2 + 'J'
		                        SET @CurrentPosition = @CurrentPosition + 3
	                        END
	                        ELSE
				BEGIN
	                                --e.g. 'edgar'
					SET @MP1 = @MP1 + 'TK'
					SET @MP2 = @MP2 + 'TK'
		                        SET @CurrentPosition = @CurrentPosition + 2
	                        END
			END
	                ELSE IF (dbo.fnStringAt(@CurrentPosition,@Word,'DT,DD')=1)
	                BEGIN
				SET @MP1 = @MP1 + 'T'
				SET @MP2 = @MP2 + 'T'
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	                ELSE
			BEGIN
				SET @MP1 = @MP1 + 'T'
				SET @MP2 = @MP2 + 'T'
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
		END
	
		ELSE IF @CurrentChar = 'F'
		BEGIN
	                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'F')
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 2
			END
	                ELSE
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
			SET @MP1 = @MP1 + 'F'
			SET @MP2 = @MP2 + 'F'
		END
	
		ELSE IF @CurrentChar = 'G'
		BEGIN
	                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'H')
	                BEGIN
	                        IF (@CurrentPosition > 1) AND (dbo.fnIsVowel(SUBSTRING(@Word,@CurrentPosition - 1,1)) = 0)
	                        BEGIN
					SET @MP1 = @MP1 + 'K'
					SET @MP2 = @MP2 + 'K'
		                        SET @CurrentPosition = @CurrentPosition + 2
	                        END
                                --'ghislane', ghiradelli
                                ELSE IF (@CurrentPosition = 1)
                                BEGIN 
                                        IF (SUBSTRING(@Word,@CurrentPosition + 2,1) = 'I')
					BEGIN
						SET @MP1 = @MP1 + 'J'
						SET @MP2 = @MP2 + 'J'
					END
                                        ELSE
					BEGIN
						SET @MP1 = @MP1 + 'K'
						SET @MP2 = @MP2 + 'K'
					END
		                        SET @CurrentPosition = @CurrentPosition + 2
	                        END
	                        --Parker's rule (with some further refinements) - e.g., 'hugh'
	                        ELSE IF (((@CurrentPosition > 2) AND (dbo.fnStringAt((@CurrentPosition - 2),@Word,'B,H,D')=1) )
	                                --e.g., 'bough'
	                                OR ((@CurrentPosition > 3) AND (dbo.fnStringAt((@CurrentPosition - 3),@Word,'B,H,D')=1) )
	                                --e.g., 'broughton'
	                                OR ((@CurrentPosition > 4) AND (dbo.fnStringAt((@CurrentPosition - 4),@Word,'B,H')=1) ) )
	                        BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 2
				END
	                        ELSE
				BEGIN
	                                --e.g., 'laugh', 'McLaughlin', 'cough', 'gough', 'rough', 'tough'
	                                IF ((@CurrentPosition > 3) 
	                                        AND (SUBSTRING(@Word,@CurrentPosition - 1,1) = 'U') 
	                                        AND (dbo.fnStringAt((@CurrentPosition - 3),@Word,'C,G,L,R,T')=1) )
	                                BEGIN
						SET @MP1 = @MP1 + 'F'
						SET @MP2 = @MP2 + 'F'
					END
	                                ELSE
					BEGIN
	                                        IF ((@CurrentPosition > 1) AND SUBSTRING(@Word,@CurrentPosition - 1,1) <> 'I')
						BEGIN
							SET @MP1 = @MP1 + 'K'
							SET @MP2 = @MP2 + 'K'
						END
					END
	
		                        SET @CurrentPosition = @CurrentPosition + 2
	                        END
	                END
	
	                ELSE IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'N')
	                BEGIN
	                        IF ((@CurrentPosition = 2) AND (dbo.fnIsVowel(LEFT(@Word,1))=1) AND (dbo.fnSlavoGermanic(@Word)=0))
	                        BEGIN
					SET @MP1 = @MP1 + 'KN'
					SET @MP2 = @MP2 + 'N'
				END
	                        ELSE
				BEGIN
	                                --not e.g. 'cagney'
	                                IF ((dbo.fnStringAt((@CurrentPosition + 2),@Word,'EY')=0) 
	                                                AND (SUBSTRING(@Word,@CurrentPosition + 1,1) <> 'Y') AND (dbo.fnSlavoGermanic(@Word)=0))
	                                BEGIN
						SET @MP1 = @MP1 + 'N'
						SET @MP2 = @MP2 + 'KN'
					END
	                                ELSE
					BEGIN
						SET @MP1 = @MP1 + 'KN'
						SET @MP2 = @MP2 + 'KN'
					END
				END
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	
	                --'tagliaro'
	                ELSE IF (dbo.fnStringAt((@CurrentPosition + 1),@Word,'LI')=1) AND (dbo.fnSlavoGermanic(@Word)=0)
	                BEGIN
				SET @MP1 = @MP1 + 'KL'
				SET @MP2 = @MP2 + 'L'
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	
	                -- -ges-,-gep-,-gel-, -gie- at beginning
			-- This call to fnStringAt() is the 'worst case' in number of values passed. A UDF that used DEFAULT values instead of
                        -- a multi-valued argument would require ten DEFAULT arguments for EP, EB, EL, etc. (assuming the first was not defined with a DEFAULT).
	                ELSE IF ((@CurrentPosition = 1)
	                        AND ((SUBSTRING(@Word,@CurrentPosition + 1,1) = 'Y') 
	                                OR (dbo.fnStringAt((@CurrentPosition + 1),@Word,'ES,EP,EB,EL,EY,IB,IL,IN,IE,EI,ER')=1)) )
	                BEGIN
				SET @MP1 = @MP1 + 'K'
				SET @MP2 = @MP2 + 'J'
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	
	                -- -ger-,  -gy-
	                ELSE IF (((dbo.fnStringAt((@CurrentPosition + 1), @Word, 'ER')=1) OR (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'Y'))
	                                AND (dbo.fnStringAt(1, @Word, 'DANGER,RANGER,MANGER')=0)
	                                        AND (dbo.fnStringAt((@CurrentPosition - 1), @Word, 'E,I,RGY,OGY')=0) )
	                BEGIN
				SET @MP1 = @MP1 + 'K'
				SET @MP2 = @MP2 + 'J'
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	
	                -- italian e.g, 'biaggi'
	                ELSE IF (dbo.fnStringAt((@CurrentPosition + 1),@Word,'E,I,Y')=1) OR (dbo.fnStringAt((@CurrentPosition - 1),@Word,'AGGI,OGGI')=1)
	                BEGIN
	                        --obvious germanic
	                        IF ((dbo.fnStringAt(1,@Word,'VAN ,VON ,SCH')=1)
	                                OR (dbo.fnStringAt((@CurrentPosition + 1),@Word,'ET')=1))
				BEGIN
					SET @MP1 = @MP1 + 'K'
					SET @MP2 = @MP2 + 'K'
				END
	                        ELSE
				BEGIN
	                                --always soft if french ending
	                                IF (dbo.fnStringAt((@CurrentPosition + 1),@Word,'IER ')=1)
					BEGIN
						SET @MP1 = @MP1 + 'J'
						SET @MP2 = @MP2 + 'J'
					END
	                                ELSE
					BEGIN
						SET @MP1 = @MP1 + 'J'
						SET @MP2 = @MP2 + 'K'
					END
				END
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END

			ELSE
			BEGIN
		                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'G')
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 2
				END
		                ELSE
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 1
				END
				SET @MP1 = @MP1 + 'K'
				SET @MP2 = @MP2 + 'K'
			END
		END
	
		ELSE IF @CurrentChar = 'H'
		BEGIN
	                --only keep if first & before vowel or btw. 2 vowels
	                IF (((@CurrentPosition = 1) OR (dbo.fnIsVowel(SUBSTRING(@Word,@CurrentPosition - 1,1))=1)) 
	                        AND (dbo.fnIsVowel(SUBSTRING(@Word,@CurrentPosition + 1,1))=1))
	                BEGIN
				SET @MP1 = @MP1 + 'H'
				SET @MP2 = @MP2 + 'H'
	                        SET @CurrentPosition = @CurrentPosition + 2
			END
	                ELSE --also takes care of 'HH'
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
		END
	
		ELSE IF @CurrentChar = 'J'
		BEGIN
	                --obvious spanish, 'jose', 'san jacinto'
	                IF (dbo.fnStringAt(@CurrentPosition,@Word,'JOSE')=1) OR (dbo.fnStringAt(1,@Word,'SAN ')=1)
	                BEGIN
	                        IF (((@CurrentPosition = 1) AND (SUBSTRING(@Word,@CurrentPosition + 4,1) = ' ')) OR (dbo.fnStringAt(1,@Word,'SAN ')=1) )
				BEGIN
					SET @MP1 = @MP1 + 'H'
					SET @MP2 = @MP2 + 'H'
				END
	                        ELSE
	                        BEGIN
					SET @MP1 = @MP1 + 'J'
					SET @MP2 = @MP2 + 'H'
	                        END
	                        SET @CurrentPosition = @CurrentPosition + 1
	                END
	
	                ELSE IF ((@CurrentPosition = 1) AND (dbo.fnStringAt(@CurrentPosition,@Word,'JOSE')=0))
			BEGIN
				SET @MP1 = @MP1 + 'J'
				SET @MP2 = @MP2 + 'A' --Yankelovich/Jankelowicz
		                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'J') --it could happen!
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 2
				END
		                ELSE
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 1
				END
			END
	                ELSE
			BEGIN
	                        --spanish pron. of e.g. 'bajador'
	                        IF( (dbo.fnIsVowel(SUBSTRING(@Word,@CurrentPosition - 1,1))=1)
	                                AND (dbo.fnSlavoGermanic(@Word)=0)
	                                        AND ((SUBSTRING(@Word,@CurrentPosition + 1,1) = 'A') OR (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'O')))
				BEGIN
					SET @MP1 = @MP1 + 'J'
					SET @MP2 = @MP2 + 'H'
				END
	                        ELSE
				BEGIN
	                                IF (@CurrentPosition = @WordLength)
					BEGIN
						SET @MP1 = @MP1 + 'J'
						SET @MP2 = @MP2 + ''
					END
	                                ELSE
					BEGIN
	                                        IF ((dbo.fnStringAt((@CurrentPosition + 1), @Word, 'L,T,K,S,N,M,B,Z')=0) 
	                                                        AND (dbo.fnStringAt((@CurrentPosition - 1), @Word, 'S,K,L')=0))
						BEGIN
							SET @MP1 = @MP1 + 'J'
							SET @MP2 = @MP2 + 'J'
						END
					END
				END
	
		                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'J') --it could happen!
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 2
				END
		                ELSE
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 1
				END
			END
		END
	
		ELSE IF @CurrentChar = 'K'
		BEGIN
	                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'K')
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 2
			END
	                ELSE
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
			SET @MP1 = @MP1 + 'K'
			SET @MP2 = @MP2 + 'K'
		END
	
		ELSE IF @CurrentChar = 'L'
		BEGIN
	                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'L')
	                BEGIN
	                        --spanish e.g. 'cabrillo', 'gallegos'
	                        IF (((@CurrentPosition = (@WordLength - 3)) 
	                                AND (dbo.fnStringAt((@CurrentPosition - 1),@Word,'ILLO,ILLA,ALLE')=1))
	                                         OR (((dbo.fnStringAt((@WordLength - 1),@Word,'AS,OS')=1) OR (dbo.fnStringAt(@WordLength,@Word,'A,O')=1)) 
	                                                AND (dbo.fnStringAt((@CurrentPosition - 1),@Word,'ALLE')=1)) )
	                        BEGIN
					SET @MP1 = @MP1 + 'L'
					SET @MP2 = @MP2 + ''
		                        SET @CurrentPosition = @CurrentPosition + 2
	                        END
				ELSE
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 2
					SET @MP1 = @MP1 + 'L'
					SET @MP2 = @MP2 + 'L'
				END
			END
	                ELSE
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
				SET @MP1 = @MP1 + 'L'
				SET @MP2 = @MP2 + 'L'
			END
		END
	
		ELSE IF @CurrentChar = 'M'
		BEGIN
	                IF (((dbo.fnStringAt((@CurrentPosition - 1), @Word,'UMB')=1)
	                        AND (((@CurrentPosition + 1) = @WordLength) OR (dbo.fnStringAt((@CurrentPosition + 2),@Word,'ER')=1)))
	                                --'dumb','thumb'
	                                OR (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'M') )
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 2
			END
	                ELSE
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
			SET @MP1 = @MP1 + 'M'
			SET @MP2 = @MP2 + 'M'
		END
	
		ELSE IF @CurrentChar = 'N'
		BEGIN
	                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'N')
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 2
			END
	                ELSE
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
			SET @MP1 = @MP1 + 'N'
			SET @MP2 = @MP2 + 'N'
		END
	
		ELSE IF @CurrentChar = '�'
		BEGIN
                        SET @CurrentPosition = @CurrentPosition + 1
			SET @MP1 = @MP1 + 'N'
			SET @MP2 = @MP2 + 'N'
		END
	
		ELSE IF @CurrentChar = 'P'
		BEGIN
	                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'H')
				--What about Michelle Pfeiffer, star of Grease 2? Price-Pfister?, Pfizer?
				--Don't just look for an 'F' next, what about 'topflight', helpful, campfire, leapfrog, stepfather
				--Sorry, Mark Knopfler, I don't know how to help you
				OR ((@CurrentPosition = 1) AND (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'F') AND (dbo.fnIsVowel(SUBSTRING(@Word,@CurrentPosition+2,1))=1))
	                BEGIN
				SET @MP1 = @MP1 + 'F'
				SET @MP2 = @MP2 + 'F'
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	
	                --also account for "campbell", "raspberry"
	                ELSE 
			BEGIN
				IF (dbo.fnStringAt((@CurrentPosition + 1),@Word, 'P,B')=1)
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 2
				END
		                ELSE
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 1
				END
				SET @MP1 = @MP1 + 'P'
				SET @MP2 = @MP2 + 'P'
			END
		END
	
		ELSE IF @CurrentChar = 'Q'
		BEGIN
	                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'Q')
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 2
			END
	                ELSE
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
			SET @MP1 = @MP1 + 'K'
			SET @MP2 = @MP2 + 'K'
		END
	
		ELSE IF @CurrentChar = 'R'
		BEGIN
			--QQ: Will SQL short circuit eval? Otherwise, I could try to read before string begins here...
	                --french e.g. 'rogier', but exclude 'hochmeier'
	                IF ((@CurrentPosition = @WordLength)
	                        AND (dbo.fnSlavoGermanic(@Word)=0)
	                                AND (dbo.fnStringAt((@CurrentPosition - 2), @Word, 'IE')=1) 
	                                        AND (dbo.fnStringAt((@CurrentPosition - 4), @Word, 'ME,MA')=0))
			BEGIN
				SET @MP1 = @MP1 + ''
				SET @MP2 = @MP2 + 'R'
			END
	                ELSE
			BEGIN
				SET @MP1 = @MP1 + 'R'
				SET @MP2 = @MP2 + 'R'
			END
	
	                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'R')
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 2
			END
	                ELSE
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
		END
	
		ELSE IF @CurrentChar = 'S'
		BEGIN
	                --special cases 'island', 'isle', 'carlisle', 'carlysle'
	                IF (dbo.fnStringAt((@CurrentPosition - 1), @Word, 'ISL,YSL')=1)
	                BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
	                END
	
	                --special case 'sugar-'
	                ELSE IF ((@CurrentPosition = 1) AND (dbo.fnStringAt(@CurrentPosition, @Word, 'SUGAR')=1))
	                BEGIN
				SET @MP1 = @MP1 + 'X'
				SET @MP2 = @MP2 + 'S'
	                        SET @CurrentPosition = @CurrentPosition + 1
	                END
	
	                ELSE IF (dbo.fnStringAt(@CurrentPosition, @Word, 'SH')=1)
	                BEGIN
	                        --germanic
	                        IF (dbo.fnStringAt((@CurrentPosition + 1), @Word, 'HEIM,HOEK,HOLM,HOLZ')=1)
				BEGIN
					SET @MP1 = @MP1 + 'S'
					SET @MP2 = @MP2 + 'S'
				END
	                        ELSE
				BEGIN
					SET @MP1 = @MP1 + 'X'
					SET @MP2 = @MP2 + 'X'
				END
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	
	                --italian & armenian
	                ELSE IF (dbo.fnStringAt(@CurrentPosition, @Word, 'SIO,SIA')=1) OR (dbo.fnStringAt(@CurrentPosition, @Word, 'SIAN')=1)
	                BEGIN
	                        IF (dbo.fnSlavoGermanic(@Word)=0)
				BEGIN
					SET @MP1 = @MP1 + 'S'
					SET @MP2 = @MP2 + 'X'
				END
	                        ELSE
				BEGIN
					SET @MP1 = @MP1 + 'S'
					SET @MP2 = @MP2 + 'S'
				END
	                        SET @CurrentPosition = @CurrentPosition + 3
	                END
	
	                --german & anglicisations, e.g. 'smith' match 'schmidt', 'snider' match 'schneider'
	                --also, -sz- in slavic language altho in hungarian it is pronounced 's'
	                ELSE IF (((@CurrentPosition = 1) 
	                                AND (dbo.fnStringAt((@CurrentPosition + 1), @Word, 'M,N,L,W')=1))
	                                        OR (dbo.fnStringAt((@CurrentPosition + 1), @Word, 'Z')=1))
	                BEGIN
				SET @MP1 = @MP1 + 'S'
				SET @MP2 = @MP2 + 'X'
	                        IF (dbo.fnStringAt((@CurrentPosition + 1), @Word, 'Z')=1)
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 2
				END
	                        ELSE
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 1
	                        END
	                END
	
	                ELSE IF (dbo.fnStringAt(@CurrentPosition, @Word, 'SC')=1)
	                BEGIN
	                        --Schlesinger's rule
	                        IF (SUBSTRING(@Word,@CurrentPosition + 2,1) = 'H')
				BEGIN
	                                --dutch origin, e.g. 'school', 'schooner'
	                                IF (dbo.fnStringAt((@CurrentPosition + 3), @Word, 'OO,ER,EN,UY,ED,EM')=1)
	                                BEGIN
	                                        --'schermerhorn', 'schenker'
	                                        IF (dbo.fnStringAt((@CurrentPosition + 3), @Word, 'ER,EN')=1)
	                                        BEGIN
							SET @MP1 = @MP1 + 'X'
							SET @MP2 = @MP2 + 'SK'
						END
	                                        ELSE
						BEGIN
							SET @MP1 = @MP1 + 'SK'
							SET @MP2 = @MP2 + 'SK'
						END
			                        SET @CurrentPosition = @CurrentPosition + 3
					END
	                                ELSE
					BEGIN
	                                        IF ((@CurrentPosition = 1) AND (dbo.fnIsVowel(SUBSTRING(@Word,3,1))=0) AND (SUBSTRING(@Word,3,1) <> 'W'))
						BEGIN
							SET @MP1 = @MP1 + 'X'
							SET @MP2 = @MP2 + 'S'
						END
	                                        ELSE
						BEGIN
							SET @MP1 = @MP1 + 'X'
							SET @MP2 = @MP2 + 'X'
						END
			                        SET @CurrentPosition = @CurrentPosition + 3
	                                END
				END
	
	                        ELSE IF (dbo.fnStringAt((@CurrentPosition + 2), @Word, 'I,E,Y')=1)
	                        BEGIN
					SET @MP1 = @MP1 + 'S'
					SET @MP2 = @MP2 + 'S'
		                        SET @CurrentPosition = @CurrentPosition + 3
	                        END
	                        ELSE
				BEGIN
					SET @MP1 = @MP1 + 'SK'
					SET @MP2 = @MP2 + 'SK'
		                        SET @CurrentPosition = @CurrentPosition + 3
	                        END
	                END
	
	                ELSE 
			BEGIN
		                --french e.g. 'resnais', 'artois'
				IF ((@CurrentPosition = @WordLength) AND (dbo.fnStringAt((@CurrentPosition - 2), @Word, 'AI,OI')=1))
				BEGIN
					SET @MP1 = @MP1 + ''
					SET @MP2 = @MP2 + 'S'
				END
		                ELSE
				BEGIN
					SET @MP1 = @MP1 + 'S'
					SET @MP2 = @MP2 + 'S'
				END
		
		                IF (dbo.fnStringAt((@CurrentPosition + 1), @Word, 'S,Z')=1)
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 2
				END
		                ELSE
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 1
				END
			END
		END
	
		ELSE IF @CurrentChar = 'T'
		BEGIN
	                IF (dbo.fnStringAt(@CurrentPosition, @Word, 'TION,TIA,TCH')=1)
	                BEGIN
				SET @MP1 = @MP1 + 'X'
				SET @MP2 = @MP2 + 'X'
	                        SET @CurrentPosition = @CurrentPosition + 3
			END
	
	                ELSE IF (dbo.fnStringAt(@CurrentPosition, @Word, 'TH,TTH')=1) 
	                BEGIN
	                        --special case 'thomas', 'thames' or germanic
	                        IF (dbo.fnStringAt((@CurrentPosition + 2), @Word, 'OM,AM')=1) 
	                                OR (dbo.fnStringAt(1, @Word, 'VAN ,VON ,SCH')=1) 
	                        BEGIN
					SET @MP1 = @MP1 + 'T'
					SET @MP2 = @MP2 + 'T'
				END
	                        ELSE	
				BEGIN
					SET @MP1 = @MP1 + '0'
					SET @MP2 = @MP2 + 'T'
	                        END
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	
			ELSE
			BEGIN
		                IF (dbo.fnStringAt((@CurrentPosition + 1), @Word, 'T,D')=1)
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 2
				END
		                ELSE
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 1
				END
				SET @MP1 = @MP1 + 'T'
				SET @MP2 = @MP2 + 'T'
			END
		END
	
		ELSE IF @CurrentChar = 'V'
		BEGIN
	                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'V')
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 2
			END
	                ELSE
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
			SET @MP1 = @MP1 + 'F'
			SET @MP2 = @MP2 + 'F'
		END
	
		ELSE IF @CurrentChar = 'W'
		BEGIN
	                --can also be in middle of word
	                IF (dbo.fnStringAt(@CurrentPosition, @Word, 'WR')=1)
	                BEGIN
				SET @MP1 = @MP1 + 'R'
				SET @MP2 = @MP2 + 'R'
	                        SET @CurrentPosition = @CurrentPosition + 2
	                END
	
	                ELSE IF ((@CurrentPosition = 1) 
	                        AND ((dbo.fnIsVowel(SUBSTRING(@Word,@CurrentPosition + 1,1))=1) OR (dbo.fnStringAt(@CurrentPosition, @Word, 'WH')=1)))
	                BEGIN
	                        --Wasserman should match Vasserman
	                        IF (dbo.fnIsVowel(SUBSTRING(@Word,@CurrentPosition + 1,1))=1)
				BEGIN
					SET @MP1 = @MP1 + 'A'
					SET @MP2 = @MP2 + 'F'
				END
	                        ELSE
				BEGIN
	                                --need Uomo to match Womo
					SET @MP1 = @MP1 + 'A'
					SET @MP2 = @MP2 + 'A'
				END
	                        SET @CurrentPosition = @CurrentPosition + 1
	                END
	
	                --Arnow should match Arnoff
	                ELSE IF (((@CurrentPosition = @WordLength) AND (dbo.fnIsVowel(SUBSTRING(@Word,@CurrentPosition - 1,1))=1)) 
	                        OR (dbo.fnStringAt((@CurrentPosition - 1), @Word, 'EWSKI,EWSKY,OWSKI,OWSKY')=1) 
	                                        OR (dbo.fnStringAt(1, @Word, 'SCH')=1))
	                BEGIN
				SET @MP1 = @MP1 + ''
				SET @MP2 = @MP2 + 'F'
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
	
	                --polish e.g. 'filipowicz'
	                ELSE IF (dbo.fnStringAt(@CurrentPosition, @Word, 'WICZ,WITZ')=1)
	                BEGIN
				SET @MP1 = @MP1 + 'TS'
				SET @MP2 = @MP2 + 'FX'
	                        SET @CurrentPosition = @CurrentPosition + 4
			END
	
	                ELSE -- skip it
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
		END
	
		ELSE IF @CurrentChar = 'X'
		BEGIN
	                --french e.g. breaux
	                IF (NOT((@CurrentPosition = @WordLength) 
	                        AND ((dbo.fnStringAt((@CurrentPosition - 3), @Word, 'IAU,EAU')=1) 
	                                        OR (dbo.fnStringAt((@CurrentPosition - 2), @Word, 'AU,OU')=1))) )
			BEGIN
				SET @MP1 = @MP1 + 'KS'
				SET @MP2 = @MP2 + 'KS'
			END
	
	                IF (dbo.fnStringAt((@CurrentPosition + 1), @Word, 'C,X')=1)
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 2
			END
	                ELSE
			BEGIN
	                        SET @CurrentPosition = @CurrentPosition + 1
			END
		END
	
		ELSE IF @CurrentChar = 'Z'
		BEGIN
	                --chinese pinyin e.g. 'zhao'
	                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'H')
	                BEGIN
				SET @MP1 = @MP1 + 'J'
				SET @MP2 = @MP2 + 'J'
	                        SET @CurrentPosition = @CurrentPosition + 2
			END
	                ELSE
			BEGIN
	                        IF ((dbo.fnStringAt((@CurrentPosition + 1), @Word, 'ZO,ZI,ZA')=1) 
	                                OR ((dbo.fnSlavoGermanic(@Word)=1) AND ((@CurrentPosition > 1) AND SUBSTRING(@Word,@CurrentPosition - 1,1) <> 'T')))
	                        BEGIN
					SET @MP1 = @MP1 + 'S'
					SET @MP2 = @MP2 + 'TS'
	                        END
	                        ELSE
				BEGIN
					SET @MP1 = @MP1 + 'S'
					SET @MP2 = @MP2 + 'S'
				END
		                IF (SUBSTRING(@Word,@CurrentPosition + 1,1) = 'Z')
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 2
				END
		                ELSE
				BEGIN
		                        SET @CurrentPosition = @CurrentPosition + 1
		                END
			END
		END
	
	        ELSE
		BEGIN
                        SET @CurrentPosition = @CurrentPosition + 1
		END
	END
	
        --only give back 4 char metaphone
        IF (LEN(@MP1) > 4)
	BEGIN
		SET @MP1 = LEFT(@MP1, 4)
	END
        IF (LEN(@MP2) > 4)
	BEGIN
		SET @MP2 = LEFT(@MP2, 4)
	END
	IF @MP2 = @MP1
	BEGIN
		SET @MP2 = ''
	END

	INSERT @DMP(Metaphone1,Metaphone2) VALUES( @MP1, @MP2 )
	RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFieldLeadBrokerContactFieldsParse]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnFieldLeadBrokerContactFieldsParse] (@ListingScrapeID int)
RETURNS @BrokerContact TABLE
(ListingScrapeID int	NOT NULL,
 BrokerContactFirstName varchar(100),
 BrokerContactLastName varchar(100),
 BrokerContactPhone varchar(20),
 BrokerContactEmail varchar(100),
 BrokerLocationID int,
 PropertyID int,
 ContactSourceField varchar(50),
 SortOrder tinyint
)
AS
BEGIN

	/********************************** Parsing LeadNote to get Phone *******************************
		The Phone number is stored after the second occurence of the ~! pattern in the LeadNote field
	**************************************************************************************************/
		DECLARE 
			  @LeadNote varchar(1000)
			, @Delimiter char(2)
			, @SecondDelimiterPosition int=0
			, @NumChars int=0
			, @Phone varchar(20)
			, @IsUKLead bit=0 --This indicates that this is a UK lead - this is used to truncated the first 0 from the Phone number (if found)

		SELECT 
			  @LeadNote=LTRIM(RTRIM(LeadNote))
			, @IsUKLead=(CASE WHEN fl.CountryCode='GBR' THEN 1 ELSE 0 END)
						FROM dbo.ListingScrape lsc (NOLOCK)
						JOIN dbo.FieldLead fl (NOLOCK) ON lsc.ScrapeID=fl.FieldLeadID
						WHERE	
							ListingScrapeID=@ListingScrapeID
							AND lsc.ListingScrapeSourceTypeID=2 --FieldLead
					  
		SET @Delimiter = '~!'

		IF ISNULL(@LeadNote,'')<>''
		BEGIN
			set @SecondDelimiterPosition = CHARINDEX(@Delimiter, @LeadNote, (CHARINDEX(@Delimiter, @LeadNote, 1))+1)
			if LEN(@LeadNote) > @SecondDelimiterPosition 
				set @NumChars=LEN(@LeadNote)-(@SecondDelimiterPosition+2) --Why +2? because we want the delimter is '~!' which is 2 characters
			else
				set @NumChars=0
			if @SecondDelimiterPosition > 0 
			begin
				SET @Phone=dbo.fnCleanString(SUBSTRING(@LeadNote,@SecondDelimiterPosition+2,@NumChars)) --remove any special characters from the phone number so that the PatIndex function works as expected
				IF PATINDEX('%[^0-9]%',@Phone) > 0
					SET @Phone=LEFT(@Phone,(PATINDEX('%[^0-9]%',@Phone)-1))  --get all the characters BEFORE the first occurence of any non-numeric character
				IF @IsUKLead=1 AND @Phone LIKE '0%'
					SET @Phone=RIGHT(@Phone,LEN(@Phone)-1) --truncate the leading 0 for UK leads
			end
			SET @Phone=LTRIM(RTRIM(@Phone))
		END

	;WITH CTE
	AS
	(
		SELECT --Parse NOTES to get Email
			  lsc.ListingScrapeID
			, BrokerContactFirstName=NULL
			, BrokerContactLastName=NULL
			, BrokerContactPhone=NULL
			, BrokerContactEmail=LTRIM(RTRIM(note.Value)) --get the email from the function
			, BrokerLocationID=fl.AgentLocationID
			, PropertyID=fl.PropertyID
			, ContactSourceField='LeadNote'
			, SortOrder=1
		FROM dbo.ListingScrape lsc (NOLOCK)
		JOIN dbo.FieldLead fl (NOLOCK) ON lsc.ScrapeID=fl.FieldLeadID
		CROSS APPLY dbo.fnStringToTable(fl.LeadNote,' ') note --this will split the words of the note field into rows
		WHERE	
			ListingScrapeID=@ListingScrapeID
			AND lsc.ListingScrapeSourceTypeID=2 --FieldLead
			AND note.Value like '%@%' 
			AND note.Value not like '%@costar.com%' --make sure the email does not belong to a researcher
		
		UNION --LeasingContact1  
		SELECT 
			  lsc.ListingScrapeID
			, BrokerContactFirstName=LTRIM(RTRIM(fn.FirstName))
			, BrokerContactLastName=LTRIM(RTRIM(fn.LastName))
			, BrokerContactPhone = dbo.fnCleanString(fl.LeasingContact1Phone)
			, BrokerContactEmail=NULL
			, BrokerLocationID=fl.AgentLocationID
			, PropertyID=fl.PropertyID
			, ContactSourceField='LeasingContact1'
			, SortOrder=2
		FROM dbo.ListingScrape lsc (NOLOCK)
		JOIN dbo.FieldLead fl (NOLOCK) ON lsc.ScrapeID=fl.FieldLeadID
		CROSS APPLY dbo.fnSplitName(fl.LeasingContact1) fn 
		WHERE	
			ListingScrapeID=@ListingScrapeID
			AND lsc.ListingScrapeSourceTypeID=2 --FieldLead
		UNION --LeasingContact2
		SELECT 
			  lsc.ListingScrapeID
			, BrokerContactFirstName=LTRIM(RTRIM(fn.FirstName))
			, BrokerContactLastName=LTRIM(RTRIM(fn.LastName))
			, BrokerContactPhone = dbo.fnCleanString(fl.LeasingContact2Phone)
			, BrokerContactEmail=NULL
			, BrokerLocationID=fl.AgentLocationID
			, PropertyID=fl.PropertyID
			, ContactSourceField='LeasingContact2'
			, SortOrder=3
		 FROM dbo.ListingScrape lsc (NOLOCK)
		JOIN dbo.FieldLead fl (NOLOCK) ON lsc.ScrapeID=fl.FieldLeadID
		CROSS APPLY dbo.fnSplitName(fl.LeasingContact2) fn 
		WHERE	
			ListingScrapeID=@ListingScrapeID
			AND lsc.ListingScrapeSourceTypeID=2 --FieldLead
		UNION --LeasingContact3
		SELECT 
			  lsc.ListingScrapeID
			, BrokerContactFirstName=LTRIM(RTRIM(fn.FirstName))
			, BrokerContactLastName=LTRIM(RTRIM(fn.LastName))
			, BrokerContactPhone = dbo.fnCleanString(fl.LeasingContact3Phone)
			, BrokerContactEmail=NULL
			, BrokerLocationID=fl.AgentLocationID
			, PropertyID=fl.PropertyID
			, ContactSourceField='LeasingContact3'
			, SortOrder=4
		FROM dbo.ListingScrape lsc (NOLOCK)
		JOIN dbo.FieldLead fl (NOLOCK) ON lsc.ScrapeID=fl.FieldLeadID
		CROSS APPLY dbo.fnSplitName(fl.LeasingContact3) fn 
		WHERE	
			ListingScrapeID=@ListingScrapeID
			AND lsc.ListingScrapeSourceTypeID=2 --FieldLead
		UNION --SaleContact1
		SELECT 
			  lsc.ListingScrapeID
			, BrokerContactFirstName=LTRIM(RTRIM(fn.FirstName))
			, BrokerContactLastName=LTRIM(RTRIM(fn.LastName))
			, BrokerContactPhone = dbo.fnCleanString(fl.SaleContact1Phone)
			, BrokerContactEmail=NULL
			, BrokerLocationID=fl.AgentLocationID
			, PropertyID=fl.PropertyID
			, ContactSourceField='SaleContact1'
			, SortOrder=5
		 FROM dbo.ListingScrape lsc (NOLOCK)
		JOIN dbo.FieldLead fl (NOLOCK) ON lsc.ScrapeID=fl.FieldLeadID
		CROSS APPLY dbo.fnSplitName(fl.SaleContact1) fn 
		WHERE	
			ListingScrapeID=@ListingScrapeID
			AND lsc.ListingScrapeSourceTypeID=2 --FieldLead
		UNION --SaleContact2
		SELECT 
			  lsc.ListingScrapeID
			, BrokerContactFirstName=LTRIM(RTRIM(fn.FirstName))
			, BrokerContactLastName=LTRIM(RTRIM(fn.LastName))
			, BrokerContactPhone = dbo.fnCleanString(fl.SaleContact2Phone)
			, BrokerContactEmail=NULL
			, BrokerLocationID=fl.AgentLocationID
			, PropertyID=fl.PropertyID
			, ContactSourceField='SaleContact2'
			, SortOrder=6
		FROM dbo.ListingScrape lsc (NOLOCK)
		JOIN dbo.FieldLead fl (NOLOCK) ON lsc.ScrapeID=fl.FieldLeadID
		CROSS APPLY dbo.fnSplitName(fl.SaleContact2) fn 
		WHERE	
			ListingScrapeID=@ListingScrapeID
			AND lsc.ListingScrapeSourceTypeID=2 --FieldLead
		 UNION --SaleContact3
		SELECT 
			  lsc.ListingScrapeID
			, BrokerContactFirstName=LTRIM(RTRIM(fn.FirstName))
			, BrokerContactLastName=LTRIM(RTRIM(fn.LastName))
			, BrokerContactPhone =  dbo.fnCleanString(fl.SaleContact3Phone)
			, BrokerContactEmail=NULL
			, BrokerLocationID=fl.AgentLocationID
			, PropertyID=fl.PropertyID
			, ContactSourceField='SaleContact3'
			, SortOrder=7
		FROM dbo.ListingScrape lsc (NOLOCK)
		JOIN dbo.FieldLead fl (NOLOCK) ON lsc.ScrapeID=fl.FieldLeadID
		CROSS APPLY dbo.fnSplitName(fl.SaleContact3) fn 
		WHERE	
			ListingScrapeID=@ListingScrapeID
			AND lsc.ListingScrapeSourceTypeID=2 --FieldLead
		
		)
	INSERT INTO @BrokerContact
	(ListingScrapeID, BrokerContactFirstName, BrokerContactLastName, BrokerContactPhone, BrokerContactEmail, BrokerLocationID, PropertyID, ContactSourceField, SortOrder)
	(SELECT
		  ListingScrapeID
		  --Update the LastName and FirstName fields to take only the characters to the left of any commas because of cases like this : John Adams, SIOR
		, BrokerContactFirstName=NULLIF
								(
									(CASE WHEN CHARINDEX(',',BrokerContactFirstName)>0 THEN dbo.fnCleanString(LEFT(BrokerContactFirstName,CHARINDEX(',',BrokerContactFirstName)-1))
											ELSE dbo.fnCleanString(BrokerContactFirstName)
									END)
								,'')
		, BrokerContactLastName=NULLIF
								(
									(CASE WHEN CHARINDEX(',',BrokerContactLastName)>0 THEN dbo.fnCleanString(LEFT(BrokerContactLastName,CHARINDEX(',',BrokerContactLastName)-1))
										ELSE dbo.fnCleanString(BrokerContactLastName)
									END)
								,'')
		, BrokerContactPhone=NULLIF(BrokerContactPhone,'')
		, BrokerContactEmail=NULLIF(BrokerContactEmail,'')
		, BrokerLocationID
		, PropertyID
		, ContactSourceField
		, SortOrder
	FROM CTE
	WHERE DATALENGTH(ISNULL(BrokerContactEmail,''))>0 OR DATALENGTH(ISNULL(BrokerContactPhone,''))>0 --must at least have a Phone or Email to include as a Contact
	UNION
		SELECT --Get Phone in LeadNote only if the Phone number is unique and does not exist in any of the other Contact fields
			  lsc.ListingScrapeID
			, BrokerContactFirstName=NULL
			, BrokerContactLastName=NULL
			--, BrokerContactPhone=LTRIM(RTRIM(substring(replace(leadNote,'-',''),charindex('~!',replace(leadnote,'-',''),charindex('~!',replace(leadnote,'-','')) + 1) + 2,10)))
			, BrokerContactPhone = @Phone
			, BrokerContactEmail=NULL
			, BrokerLocationID=fl.AgentLocationID
			, PropertyID=fl.PropertyID
			, ContactSourceField='LeadNote'
			, SortOrder=8
		FROM dbo.ListingScrape lsc (NOLOCK)
		JOIN dbo.FieldLead fl (NOLOCK) ON lsc.ScrapeID=fl.FieldLeadID
		WHERE	
			lsc.ListingScrapeID=@ListingScrapeID
			AND lsc.ListingScrapeSourceTypeID=2 --FieldLead
			AND ISNULL(@Phone,'')<>''
			AND NOT EXISTS (SELECT 1 FROM CTE WHERE BrokerContactPhone=@Phone) --don't return a note that has the same Phone as an existing Phone
	)
	
	RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFindNextWhiteSpaceChar]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- File: C:\COSTARPROJECTS\COSTARINTERNALAPPS\MAIN\ENTERPRISE\SOURCE\Database\CRM.Nightly Processes\Functions\fnFindNextWhiteSpaceChar.sql
CREATE FUNCTION [dbo].[fnFindNextWhiteSpaceChar]
(	
	@InputString varchar(max),
	@StartIndex int
)
RETURNS int
/*

Author:	Ed Hellyer
Date:	2012/02/03

A function to support some hacky code (not written by me) on 
the inbox processing of the FieldLead table.

Purpose:
Starting from the start index, this function will return the next occurrence of a white space character (defined in the code below).
If a white space character is not found then it will return an index pointing to the end of the string.

*/

AS
BEGIN
	--ASCII control character definitions.  (Only including a few of the 32 possible chars)
	declare @nullc char(1)
	declare @htab char(1)
	declare @lf char(1)
	declare @ff char(1)
	declare @cr char(1)
	declare @esc char(1)
	declare @spc char(1)  
	
	set @nullc = CHAR(0)
	set @htab = CHAR(9)
	set @lf = CHAR(10)
	set @ff = CHAR(12)
	set @cr = CHAR(13)
	set @esc = CHAR(27)
	set @spc = CHAR(32)		-- <-- Technically this is not a control char, but we want to look for commonly known as "White Space Chars".

	declare @MinValue int
	
	set @MinValue = (
		select MIN(d.StartIndex)
		from (
			select NullIf(CHARINDEX(@nullc, @InputString, @StartIndex), 0) as 'StartIndex'
			union
			select NullIf(CHARINDEX(@htab, @InputString, @StartIndex), 0)
			union
			select NullIf(CHARINDEX(@lf, @InputString, @StartIndex), 0)
			union
			select NullIf(CHARINDEX(@ff, @InputString, @StartIndex), 0)
			union
			select NullIf(CHARINDEX(@cr, @InputString, @StartIndex), 0)
			union
			select NullIf(CHARINDEX(@esc, @InputString, @StartIndex), 0)
			union
			select NullIf(CHARINDEX(@spc, @InputString, @StartIndex), 0)
			union
			select LEN(@InputString) + 1 --If no whitespace char found return the index pointing to the end of the string.
		) as d
	)
	
	RETURN abs(@StartIndex - @MinValue)

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatAltBillingStreet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatAltBillingStreet] (
	@pStreetAddress		varchar(50) = NULL,
	@pPOBox				varchar(20) = NULL
)   RETURNS				varchar(50)  
AS  


/******************************************************************************
**		File: 
**		Name: fnFormatAltBillingStreet
**		Desc: Returns formatted street information
*******************************************************************************/

BEGIN 	
	DECLARE	@StreetFull varchar(50)	
	SET @StreetFull = '';
	SET @pStreetAddress = ltrim(rtrim(isnull(@pStreetAddress,'')))
	SET @pPOBox = ltrim(rtrim(isnull(@pPOBox, '')))
	-- Use the PO Box if the street is empty
	IF len(@pStreetAddress) = 0 
	BEGIN
		IF CharIndex('PO BOX', @pPOBox) = 0 
		AND CharIndex('P.O. BOX', @pPOBox) = 0
		AND len(@pPOBox) > 0
			SET @StreetFull = 'PO Box '
		SET @StreetFull = @StreetFull + @pPOBox
	END
	ELSE
	BEGIN
		SET @StreetFull = @pStreetAddress
	END;
	RETURN @StreetFull
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatBigInt]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE FUNCTION [dbo].[fnFormatBigInt](@pVal Bigint)        

/* CRM Version 5.4.14.1023 
   NGK  2/4/2008  TFS 13901
   Created Function to handle BigInt datatype */  


Returns Varchar(50)  
AS  
BEGIN  
 declare @sstr varchar(50)  -- Must convert to money so that we can insert ","'s  
 declare @pos int  
 set @sstr = Convert (Varchar(50), Convert(money, @pVal), 1)  
 set @pos =  charIndex ('.', @sstr)   
 IF @pos > 0  
  SET @sstr = SUBSTRING (@sstr, 1, @pos-1)  
 Return @sstr  
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatCityStateZip]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatCityStateZip] (
@pCity		varchar(30) = NULL,
@pState		varchar(3) = NULL,
@pZip		char(7) = NULL,
@pZip4		char(4) = NULL
)  
RETURNS		varchar(50)  AS  

/******************************************************************************
**		File: 
**		Name: fnFormatCityStateZip
**		Desc: 
** 10/27/2009 Sean Roussy. Enterprise UK. State Codes go from 2 to 3.
*******************************************************************************/

BEGIN 	
DECLARE	@CityStateZip varchar(50)	
	SELECT @CityStateZip = '';	
	IF @pCity is not NULL and len(rTrim(@pCity)) > 0
		SELECT @CityStateZip = rTrim(@pCity) + ', ';
	IF @pState is not NULL and len(rTrim(@pState)) > 0
		SELECT @CityStateZip = @CityStateZip + rTrim(@pState) + ' ';
	IF @pZip is not NULL and len(rTrim(@pZip)) > 0
		SELECT @CityStateZip = @CityStateZip + rTrim(@pZip);
	IF @pZip4 is not NULL and len(rTrim(@pZip4)) > 0
		SELECT @CityStateZip = @CityStateZip + '-' + rTrim(@pZip4);	
	RETURN (rTrim(@CityStateZip))
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatCurrency]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--------------------------------------------------------------------------------------------------
-- File: E:\COSTARPROJECTS\COSTARINTERNALAPPS\MAIN\ENTERPRISE\SOURCE\CRM.WS.Database\CRM.WS.DB.Lookups\Functions\fnFormatMoney.sql
CREATE FUNCTION [dbo].[fnFormatCurrency](        /* CRM Version 7.0.3.1121 */
	@pVal Numeric (38,20)
	, @pDecimalPlaces tinyint
	, @pMonetarySymbol nvarchar(1) ) 
Returns Varchar(50)
AS
BEGIN
	declare @smoney varchar(50)
	declare @style int
	declare @pos int
	
	IF @pDecimalPlaces = 4
		set @style = 2
	ELSE
		set @style = 1
	
	set @smoney = Convert (Varchar(50), Convert(money, @pVal), @style)
	IF @pDecimalPlaces = 0 OR @pDecimalPlaces = 1
	BEGIN
		set @pos = 	charIndex ('.', @smoney) 
		IF @pos > 0
			IF @pDecimalPlaces = 0
				SET @smoney = SUBSTRING (@smoney, 1, @pos-1)
			ELSE IF @pos < LEN(@smoney)
				SET @smoney = SUBSTRING (@smoney, 1, @pos+1) 
	END
	
		
		set @smoney = isnull(@pMonetarySymbol,'$') + @smoney
	
	Return @smoney
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatDateTime]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Returns DateTime as dd/mm/yyyy hh:mm:ss
CREATE FUNCTION [dbo].[fnFormatDateTime] (@pDateTime DateTime) Returns Varchar(20)
AS
BEGIN
	declare @rtn varchar(20)
	SET @rtn = CONVERT (Varchar(10), @pDateTime, 101) + ' ' + CONVERT (Varchar(8), @pDateTime, 8)
	Return @rtn
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatDateTime2]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatDateTime2] (@pDateTime DATETIME)
RETURNS VARCHAR(20) -- Returns DateTime as MM/DD/YYYY HH:MM[AM/PM]
AS
BEGIN

	DECLARE @Rtn VARCHAR(20)

	-- Date + Time (in this format):  MM/DD/YYYY HH:MM[AM/PM]
	SELECT @Rtn = 
		CONVERT(VARCHAR(10), @pDateTime, 101) + ' ' + -- Pull date component in the desired format.
		CAST(REVERSE(LEFT(REVERSE(tc.TimeComponent), CHARINDEX(' ', REVERSE(tc.TimeComponent))-1)) as VARCHAR(7)) --> Pull the time component starting from the space character after the date component.
	FROM (

		-- Pull a date string containing a time component that most closely matches a the targeted format (HH:MMAM or HH:MMPM).
		SELECT CONVERT(VARCHAR(30), @pDateTime, 100) as TimeComponent

		) AS tc -- Time Component

	RETURN @Rtn
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatGlobalPhoneNumber]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[fnFormatGlobalPhoneNumber] (@pPhoneNum varchar(30), @pExt varchar(10), @pCountryCD varchar(3) ) Returns varchar(30)
AS
Begin
	declare @ph varchar(30)
	if @pCountryCD = 'UK'
		set @ph = dbo.fnFormatUKPhoneNumber2(@pPhoneNum, @pExt)
	else
		set @ph = dbo.fnFormatPhoneNumber2(@pPhoneNum, @pExt)
		
	return @ph
End


GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatInt]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatInt](@pVal int) 
Returns Varchar(50)
AS
BEGIN
	declare @sstr varchar(50)		-- Must convert to money so that we can insert ","'s
	declare @pos int
	set @sstr = Convert (Varchar(50), Convert(money, @pVal), 1)
	set @pos = 	charIndex ('.', @sstr) 
	IF @pos > 0
		SET @sstr = SUBSTRING (@sstr, 1, @pos-1)
	Return @sstr
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatMoney]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatMoney]( 
	@pVal Numeric (38,20)
	, @pDecimalPlaces tinyint
	, @pDollarSign bit ) 
Returns Varchar(50)
AS
BEGIN
	declare @smoney varchar(50)
	declare @style int
	declare @pos int
	
	IF @pDecimalPlaces = 4
		set @style = 2
	ELSE
		set @style = 1
	
	set @smoney = Convert (Varchar(50), Convert(money, @pVal), @style)
	IF @pDecimalPlaces = 0 OR @pDecimalPlaces = 1
	BEGIN
		set @pos = 	charIndex ('.', @smoney) 
		IF @pos > 0
			IF @pDecimalPlaces = 0
				SET @smoney = SUBSTRING (@smoney, 1, @pos-1)
			ELSE IF @pos < LEN(@smoney)
				SET @smoney = SUBSTRING (@smoney, 1, @pos+1) 
	END
	if @pDollarSign = 1
		set @smoney = '$' + @smoney
	Return @smoney
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatName]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatName] (
@pNamePrefix		varchar(10)	=Null,
@pFirstName			varChar(25)	=Null,
@pMiddleInitial		Char(1)		=Null,
@pLastName			varChar(35)	=Null
) RETURNS			varchar(80)
AS

/******************************************************************************
**		File: 
**		Name: fnFormatName
**		Desc: 
*******************************************************************************/

BEGIN
DECLARE @FullName varChar(80)
	SELECT @FullName = '';
	IF @pNamePrefix is Not Null and len(rtrim(@pNamePrefix)) > 0
		SELECT @FullName = rTrim(@pNamePrefix) + ' ';
	IF @pFirstName is Not Null AND len(rTrim(@pFirstName)) > 0
		SELECT @FullName = @FullName + rTrim(@pFirstName) + ' ';
	IF @pMiddleInitial is Not Null AND len(rTrim(@pMiddleInitial)) > 0
		SELECT @FullName = @FullName + rTrim(@pMiddleInitial) + ' ';
	IF @pLastName is Not Null And len(rTrim(@pLastName)) > 0
		SELECT @FullName = @FullName + rTrim(@pLastName) + ' ';
	RETURN (rTrim(@FullName));
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatPhoneNumber]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatPhoneNumber] (@phoneNumber varchar(30)) Returns varchar(30)
AS
Begin
	return dbo.fnFormatPhoneNumber2 (@phoneNumber, '')
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatPhoneNumber2]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatPhoneNumber2] (@pPhoneNum varchar(30), @pExt varchar(10)) Returns varchar(30)
AS
Begin
	Declare @ph varChar(30)
	set @ph = replace(replace(replace(replace(replace(@pPhoneNum, ' ', ''),')',''),'(',''),'-',''),'X','')
	set @pExt = rtrim(ltrim(isNull(@pExt, '')))
	if len(@pExt) = 0  and len(@ph) > 10
		set @pExt = substring (@ph, 11, len(@ph) - 10)		
	if len( ltrim( rtrim( @ph )) ) > 0
		Set @ph = '(' + subString(@ph,1,3) + ') ' + subString(@ph,4,3) + '-' + subString(@ph,7,4) 
	if len(@pExt) > 0 
		set @ph = @ph + ' ' + @pExt
	Return @ph
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatPostalInfo]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
**		File: 
**		Name: fnFormatPostalInfo
**		Desc: This is a "country independent" formatter that formats the city, state, postal code info
**
**		Updates:
**		DATE				WHO		NOTES
**		2009/11/13	ADG		removed deprecated parameters TFS # 17490.
*******************************************************************************/
CREATE FUNCTION [dbo].[fnFormatPostalInfo] (@pCountryCD varchar(3) = null
	-- US Address Fields
	,@pCity			varchar(30) = NULL
	,@pState		varchar(3) = NULL
	,@pZip			varchar(5) = NULL
	,@pZip4			varchar(4) = NULL
	-- Canadian Address Fields
	,@pPostCode		varchar(9) = null					-- the postal code of the  address
	--,@pLocalityName varchar(50)	= null					-- DEPRECATED   locality name
	--,@pMunicipality varchar(50) = null					-- DEPRECATED   the municipality of the (Canada) address
	--,@pProvinceName varchar(35) = null					-- DEPRECATED   the province of the (Canada) address
	---- UK address fields
	--,@pTownUKName	varchar(50) = null					-- DEPRECATED   UK town name. 
	--,@pCountyUKName varchar(50) = null					-- DEPRECATED   UK county name
	--,@pPostCodeOuter varchar(4) = null					-- DEPRECATED   the first (3 or 4) characters of the postal code of the UK address
	--,@pPostCodeInner varchar(3) = null					-- DEPRECATED   the last 3 characters of the postal code of the UK address
)  
RETURNS		varchar(100)  
BEGIN
	DECLARE @rtn Varchar(100)
	
	-- Clean params
	SELECT @pCountryCD = ltrim(rtrim(isNull(@pCountryCD,'')))
		, @pCity = ltrim(rtrim(isNull(@pCity,'')))
		, @pState = ltrim(rtrim(isNull(@pState,'')))
		, @pZip = ltrim(rtrim(isNull(@pZip,'')))
		, @pZip4 = ltrim(rtrim(isNull(@pZip4,'')))
		, @pPostCode = ltrim(rtrim(isNull(@pPostCode,'')))
	
	SELECT @rtn = @pCity 
			+ CASE WHEN @pCity <> '' THEN ', ' ELSE ' ' END 
			+ @pState + ' '  
			+ CASE	WHEN @pPostCode <> '' THEN  
						CASE	WHEN @pCountryCD = 'USA' OR @pCountryCD = '' THEN
									CASE WHEN LEN(@pPostCode) > 5 THEN SUBSTRING (@pPostCode, 1, 5) + '-' + SUBSTRING (@pPostCode, 6, LEN(@pPostCode) - 5)
										 ELSE @pPostCode END
								ELSE @pPostCode END
					ELSE 
						CASE WHEN @pZip4 <> '' THEN @pZip + '-' + @pZip4 ELSE @pZip END
			  END
	SET @rtn = ltrim(rtrim(@rtn))
	return @rtn
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatSQLStr]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create scalar function (FN)
CREATE FUNCTION [dbo].[fnFormatSQLStr] (@StrIn varchar(8000))
--CREATE FUNCTION dbo.fnFormatSQLStr (@StrIn varchar(8000))
RETURNS varchar(8000)
/*
	Function: fnFormatSQLStr
	Desc: Format SQL Strings line break by keyword & upper case keyword

	e.g.
	SELECT dbo.fnFormatSQLStr ('select p.PropertyID, pa.AddressID from dbo.Property p (nolock) left join dbo.PropertyAddress pa (nolock) on p.PropertyID = pa.PropertyID left join dbo.Address a (nolock) on a.AddressID = pa.AddressID inner join dbo.PropertyType pt on pt.PropertyTypeID = p.PropertyTypeID where p.PropertyID = 130713')

	10.01.04  rl  Created
*/
AS
BEGIN
	DECLARE @StrOut varchar(8000)
	SELECT @StrOut = replace( replace ( replace ( replace ( replace ( replace ( replace ( replace ( replace ( replace (
		replace (@StrIn , 'SELECT ', 'SELECT ') 
					, ' LEFT JOIN ', char(10)+ ' LEFT JOIN ') 
					, ' INNER JOIN ', char(10)+ ' INNER JOIN ')
					, ' FROM ', char(10)+ ' FROM ')
					, ' WHERE ', char(10)+ ' WHERE ')
					, ' AND ', char(10)+ ' AND ')
					, ' OR ', char(10)+ ' OR ')
					, ' ON ', char(10) + '      ON ')
					, ' UNION ', char(10)+ ' UNION ')
					, ' SELECT ', char(10)+ ' SELECT ')
					, ' ORDER BY ', char(10)+ ' ORDER BY ')

	RETURN @StrOut

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatStreet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatStreet] (
	@pStreetNum			varchar(30) = NULL,
	@pStreetDirection	varchar(2) = NULL,
	@pStreetName		varchar(25) = NULL,
	@pStreetType		varchar(4) = NULL,
	@pSuffix			varchar(5) = NULL,
	@pSuite				varchar(20) = NULL,
	@pPOBox				varchar(15) = NULL
)   RETURNS				varchar(50)  
AS  


/******************************************************************************
**		File: 
**		Name: fnFormatStreet
**		Desc: Returns formatted street information
*******************************************************************************/

BEGIN 	
	DECLARE	@StreetFull varchar(50)	
	
	SET @StreetFull = '';
	SET @pStreetNum = ltrim(rtrim(isnull(@pStreetNum,'')))
	SET @pStreetDirection = ltrim(rtrim(isnull(@pStreetDirection,'')))
	SET @pStreetName = ltrim(rtrim(isnull(@pStreetName,'')))
	SET @pStreetType = ltrim(rtrim(isnull(@pStreetType,'')))
	SET @pSuffix = ltrim(rtrim(isnull(@pSuffix,'')))
	SET @pSuite = ltrim(rtrim(isnull(@pSuite,'')))
	SET @pPOBox = ltrim(rtrim(isnull(@pPOBox,'')))

	-- Use the PO Box if the street is empty
	IF len(@pStreetName) = 0 
	BEGIN
		IF CharIndex('PO BOX', @pPOBox) = 0 
		AND CharIndex('P.O. BOX', @pPOBox) = 0 
		AND len (@pPOBox) > 0 
			SET @StreetFull = 'PO Box '
		SET @StreetFull = @StreetFull + @pPOBox
		RETURN (@StreetFull);
	END
	IF len(@pStreetNum) > 0
		SET @StreetFull = @pStreetNum;
	IF len(@pStreetDirection) > 0
		SET @StreetFull = @StreetFull +  ' ' + @pStreetDirection;
	IF len(@pStreetName) > 0
		SET @StreetFull = @StreetFull + ' ' + @pStreetName;
	IF len(@pStreetType) > 0
		SET @StreetFull = @StreetFull + ' ' + @pStreetType;
	IF len(@pSuffix) > 0
		SET @StreetFull = @StreetFull + ' ' + @pSuffix;
	IF len(@pSuite) > 0
	BEGIN
		--SET @StreetFull = @StreetFull + ', '
		IF CharIndex('Suite', @pSuite ) = 0 AND CharIndex('Floor', @pSuite ) = 0
			SET @StreetFull = @StreetFull + ', Suite';
		SET @StreetFull = @StreetFull + ' ' + @pSuite;
	END;
	/*
	-- Use the PO Box if the street is empty
	IF len(@pStreetName) = 0 
	BEGIN
		IF CharIndex('PO BOX', @pPOBox) = 0 AND CharIndex('P.O. BOX', @pPOBox) = 0
			SET @StreetFull = 'PO Box '
		SET @StreetFull = @StreetFull + @pPOBox
		RETURN (@StreetFull);
	END
	IF len(@pStreetNum) > 0
		SET @StreetFull = @pStreetNum + ' ';
	IF len(@pStreetDirection) > 0
		SET @StreetFull = @StreetFull +  @pStreetDirection + ' ';
	IF len(@pStreetName) > 0
		SET @StreetFull = @StreetFull + @pStreetName + ' ';
	IF len(@pStreetType) > 0
		SET @StreetFull = @StreetFull+ @pStreetType + ' ';	
	IF len(@pSuffix) > 0
		SET @StreetFull = @StreetFull + @pSuffix + ' ';
	IF len(@pSuite) > 0
	BEGIN
		SET @StreetFull = @StreetFull + ', '
		IF CharIndex('Suite', @pSuite ) = 0 AND CharIndex('Floor', @pSuite ) = 0
			SET @StreetFull = @StreetFull + 'Suite ';
		SET @StreetFull = @StreetFull + @pSuite;
	END;
	*/
	
	
	RETURN @StreetFull
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatStreetInternational]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatStreetInternational] (
	@pStreetNum			varchar(30) = NULL,
	@pStreetDirection	varchar(2) = NULL,
	@pStreetName		varchar(25) = NULL,
	@pStreetType		varchar(4) = NULL,
	@pSuffix			varchar(5) = NULL,
	@pSuite				varchar(20) = NULL,
	@pPOBox				varchar(15) = NULL,
	@pStreetNumEndRange varchar(15) = NULL,
	@pCountryCode		varchar(3) = NULL
)   RETURNS				varchar(100)  
AS  


/******************************************************************************
**		File: 
**		Name: fnFormatStreet
**		Desc: Returns formatted street information
*******************************************************************************/

BEGIN 	
	DECLARE	@StreetFull varchar(100)	
	
	SET @StreetFull = '';
	SET @pStreetNum = ltrim(rtrim(isnull(@pStreetNum,'')))
	SET @pStreetDirection = ltrim(rtrim(isnull(@pStreetDirection,'')))
	SET @pStreetName = ltrim(rtrim(isnull(@pStreetName,'')))
	SET @pStreetType = ltrim(rtrim(isnull(@pStreetType,'')))
	SET @pSuffix = ltrim(rtrim(isnull(@pSuffix,'')))
	SET @pSuite = ltrim(rtrim(isnull(@pSuite,'')))
	SET @pPOBox = ltrim(rtrim(isnull(@pPOBox,'')))
	SET @pStreetNumEndRange = ltrim(rtrim(isNull(@pStreetNumEndRange,'')))
	SET @pCountryCode = ltrim(rtrim(isNull(@pCountryCode,'')))


	-- Use the PO Box if the street is empty
	IF len(@pStreetName) = 0 
	BEGIN
		IF CharIndex('PO BOX', @pPOBox) = 0 
		AND CharIndex('P.O. BOX', @pPOBox) = 0 
		AND len (@pPOBox) > 0 
			SET @StreetFull = 'PO Box '
		SET @StreetFull = @StreetFull + @pPOBox
		RETURN (@StreetFull);
	END
	IF len(@pStreetNum) > 0
		SET @StreetFull = @pStreetNum;
	IF len(@pStreetNumEndRange) > 0 AND @pCountryCode = 'GBR'
	BEGIN
		if len(@pStreetNum) > 0
			SET @StreetFull = @StreetFull + ' - '
		SET @StreetFull = @StreetFull + @pStreetNumEndRange
	END
	IF len(@pStreetDirection) > 0
		SET @StreetFull = @StreetFull +  ' ' + @pStreetDirection;
	IF len(@pStreetName) > 0
		SET @StreetFull = @StreetFull + ' ' + @pStreetName;
	IF len(@pStreetType) > 0
		SET @StreetFull = @StreetFull + ' ' + @pStreetType;
	IF len(@pSuffix) > 0
		SET @StreetFull = @StreetFull + ' ' + @pSuffix;
	IF len(@pSuite) > 0
	BEGIN
		--SET @StreetFull = @StreetFull + ', '
		IF CharIndex('Suite', @pSuite ) = 0 AND CharIndex('Floor', @pSuite ) = 0
			SET @StreetFull = @StreetFull + ', Suite';
		SET @StreetFull = @StreetFull + ' ' + @pSuite;
	END;
	
	RETURN @StreetFull
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatStreetNumSort]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[fnFormatStreetNumSort](@StreetNum varchar(15)) Returns varChar(30)
as

Begin

	/*
	This function returns a StreetNum value formatted for SORTING purposes only (NOT FOR DISPLAY)
	Input parameter is a varChar(15) field (ie: StreetNum from address).  Output is a varchar(30) field
	with the main number right justified at character 15.  Any subsequent characters are tacked on the end.
	any non-numeric characters at the front of the string are omitted for sorting purposes.
	
	sample return result values (in order):
	           #C
	          1 1/2
              1 Mkt
              1(a)
              1-10
             16
             41
            101-24
            101-26
          10133 1/2
          10359A

	*/

	Declare @len			tinyInt
		,@currPlace		tinyInt
		,@currChar		char(1)
		,@mainNumber		varchar(15)
		,@suffix		varChar(15)
		,@buildingMainNumber	bit
		,@StreetNumSort		varchar(30)

	Set @currPlace = 1
	Set @len = cast(len(@StreetNum) as TinyInt)
	Set @buildingMainNumber = 1
	Set @MainNumber = ''
	Set @suffix = ''

	--Loop through each character
	While @currPlace <= @len
	Begin
		--get current character
		Set @currChar = subString(@StreetNum, @currPlace, 1)

		--If current character is a number and we haven't encountered any
		--non-numeric characters yet, add it to the MainNumber section
		If @currChar like '[0-9]' AND @buildingMainNumber = 1
			Set @mainNumber = @mainNumber + @currChar
			
		--if we haven't encountered any non-numeric characters yet
		--but the current character is, stop building the main number and start on the suffix
		Else If @currChar NOT like '[0-9]' AND @buildingMainNumber = 1
		Begin
			If len(@mainNumber) > 0
			Begin
				Set @buildingMainNumber = 0
				Set @suffix = @suffix + @currChar
			End
			
			--If this non-numeric character precedes any numbers, discard it.
			Else
				goto getNextChar
		End
		Else
			--This is non part of the main number so just tack it on the suffix
			Set @suffix = @suffix + @currChar
			
		getNextChar:	
		Set @CurrPlace = @CurrPlace+1
	End

	--Right justify the main number to the 15th character of our string
	--then concatenate the suffix to it.
	Set @StreetNumSort = replicate(' ', 15 - len(@mainNumber)) + @mainNumber + @suffix
	
	--if we never encountered any numbers just return the original input value
	If len(@StreetNumSort) = 0 Set @StreetNumSort = replicate(' ', 15) + @StreetNum

	Return @StreetNumSort

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatUKPhoneNumber2]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[fnFormatUKPhoneNumber2] (@pPhoneNum varchar(30), @pExt varchar(10)) Returns varchar(30)
AS
Begin
	Declare @ph varChar(30)
	set @ph = replace(replace(replace(replace(replace(@pPhoneNum, ' ', ''),')',''),'(',''),'-',''),'X','')
	set @pExt = rtrim(ltrim(isNull(@pExt, '')))
	
	if len( ltrim( rtrim( @ph )) ) > 0
	begin
	    if subString(@ph,1,1) = '0' 
			Set @ph = '0' + @ph
		Set @ph = subString(@ph,1,3) + ' ' + subString(@ph,4,4) + '-' + subString(@ph,8,len(@ph)-8)
	end
	if len(@pExt) > 0 
		set @ph = @ph + ' ' + @pExt
	Return @ph
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnFTSCriteriaEx]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFTSCriteriaEx]       
--CREATE FUNCTION dbo.fnFTSCriteriaEx               
				( @Str AS varchar(1000) 
				  ,@Mode AS tinyint = 1
				) RETURNS varchar(max)
/******************************************************************************
**	Name: dbo.fnFTSCriteriaEx
**	
**  Function to filter @STR for embedded cardinal generational terms 
**  and calls dbo.fnNum2Words for Prefix and Suffix embedded numbers
**  for use with full text search (FTS).
**
**  rl  08/04/04 Created
**  rl  08/31/04 Modified Criteria to word break each phrase
**			Filter punctuation
**			Filter noise words
**			Expand @PhraseWord via USPS Abbreviations 
**				(Business, Street Alias, Street Type, States)
**			Remove duplicate search terms 
**			from SearchNumPhrase and SearchAuxPhrase
**  rl  10/13/04 Modified - Fixed Bug w/Noise Word. Skipped adding blank criteria '() AND'.
**  rl  10/13/04 Modified - Fixed TD#3883. Skipped adding blank criteria 'AND ()'.
**  rl  12/07/04 Modified - Filter noise words from abbreviation expansion
**			Handle embedded apostrophe(') and hyphen(-)
**			Handle long criteria 
**			Handle punctuation
**  rl  12/8/04   Consolidated 2-Pass Full Text Matching fnFTSCriteriaEx using @Mode (1=Contains Search, 2=Prefix Term Search)
**  rl  3/29/05   Modified for decimals in numeric, treat as literal (eg '92.5') 
**			and search numeric and decimal parts
**  rl  3/29/05   Modified ordinal number parsing for words with numeric strings
**  rl  4/11/05   Modified to parse numbers w/decimal 
**  rl 05/31/05   Fixed wildcard prefix term search to limit >2 char words
**	Sean Roussy 6/7/2010 When this function was adding arguements from the Abbreviation table,
**						it was reteieing some 1 character strings to pass to the Full Text 
**						catalogues. The catalogues were then complaining about the "Noise Words"
**						being passed in and returning an incorrect result.		
**  08Nov2010 DMM TFS 22627 - Peformance improvements for resPropertyGet.  Replaced the body of this function with a call
**		to fnFTSCriteriaEX2 (a more efficient version written by Ed Hellyer)
**		
********************************************************************************/
AS BEGIN

	return dbo.fnFTSCriteriaEx2 (@Str, @Mode, null)

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFTSCriteriaEx2]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFTSCriteriaEx2] (  
	@pSearchStr varchar(1000),  
	@pMode tinyint = 1,  
	@pColumnName varchar(255) = null  
) RETURNS varchar(max)  
      
/*  
Author: Ed Hellyer    TFS 22627 - Performance improvements for resPropertyGet  
Date: 24th Sept 2010  
  
This is a rewrite of the function fnFTSCriteriaEx by Robert Lardizabal.   
If you have any questions on this function please contact Ed Hellyer x5283.  
  
The main purpose of the rewrite is address some performance issues of resPropertyGet when it uses the function [fnFTSCriteriaEx] to   
generate the FTC queries.  
  
The rewrite covers the following reasons.  
o) Eliminate the static noise word list.  
o) Process words in search string into a table variable so that set based logic can be used.  
o) Easier to debug when having a table of all words including attributes, prior to FTC query generation.  
o) Change the output of this function (when passing column name) to generate the actual CONTAINS clause due to some permutations  
 performing 1000x better when the query is formed this way.  Unfortunately this makes parameter based CONTAINS criteria impossible,   
 but for FTC queries this should not have too much impact.  
o) Eliminate verbose alpha and numeric parsing code.  
o) Take advantage of some SQL 2008 features.  


History:
Date		Initials	Comments
2010-12-16	DMM			TFS 22555 - During testing of this defect, discovered that "Grubb and Ellis" only returned a few rows
						because the @#!)&*$% sys.fulltext_stopwords system view has an "are you a DBO" check built into code for the view.
						So, instead of getting a permissions violation, you get no rows and the " and " in "Grubb and Ellis" is not
						recognized as a noise word.

2010-12-21	DMM			TFS 23543 - Searches with " - " (dash surrounded by spaces) produce an arithmetic overflow error

2012-04-11	EJH			TFS 29596 - User entered "-15 Londonderry Rd" and this function determined it was a number but then the abbreviation logic 
						failed to expand the number because we have no number abbreviations for negative values.
						Added an update statement that will convert any numeric values to be positive using ABS().

*/  
  
begin  
  
DECLARE @WordList TABLE (  
 WordID int not null identity(1,1) primary key clustered,  --It is important to order the table on this column, hence the clustered key.  
 Word varchar(150)  not null ,  
 SearchPhrase varchar(1000) null,  
 AbbreviationID int null,  
 HasAbbreviation bit null default(0),  
 HasAlias bit null default(0),  
 IsNumber bit null default(0),  
 IsNoiseWord bit null default(0)  
)  
  
DECLARE @WordID int  
DECLARE @AbbreviationID int  
DECLARE @Start int  
DECLARE @Delim char(1)  
DECLARE @Debug TINYINT  
DECLARE @FilteredSearchStr varchar(8000)   
DECLARE @TmpStr varchar(500)  
DECLARE @WildCardChar varchar(1)  
DECLARE @HasAlias bit  
DECLARE @IsNumber bit  
DECLARE @SelectedWord VARCHAR(50)  
DECLARE @CrLf varchar(4)  
DECLARE @NumWord VARCHAR(50)  
DECLARE @SearchPhrase varchar(8000)  
DECLARE @NumberSearchPhrase varchar(8000)  
DECLARE @SearchAuxPhrase varchar(8000)  
DECLARE @SearchPhraseEX varchar(8000)  
DECLARE @exCriteria VARCHAR (8000)  
  
SET @Delim = char(32)  
SET @Start = 1  
SET @Debug = 1  --Used for development debug output only.  Can't be used in the function.  
SET @CrLf = char(13) + char(10)  
SET @TmpStr = NULL  
  
set @pColumnName = isNull(ltrim(rtrim(@pColumnName)),'')  
  
--Determine Mode.  
IF (ISNULL(@pMode, 255) not in (1, 2)) SET @pMode = 1  --Default to mode 1 if @pMode not in allowed mode range or null.  
IF (@pMode = 1) SET @WildCardChar = ''  
IF (@pMode = 2) SET @WildCardChar = '*'  
--if (@Debug = 1) print 'Mode is ' + cast(@pMode as varchar) + @CrLf + @CrLf  
  
--Filter out punctuation  
SET @FilteredSearchStr = RTRIM(     
 REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(    
 REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(    
 REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(    
 REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(    
 REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(@pSearchStr    
 , '!', ''), '"', ''), '#', ''), '$', ''), '%', ''), '&', '')    
 , '(', ''), ')', ''), '+', ''), ',', ''), ':', ''), ';', '')    
 , '<', ''), '=', ''), '>', ''), '?', ''), '@', ''), '[', '')    
 , '\', ''), ']', ''), '^', ''), '_', ''), '`', ''), '{', '')    
 , '|', ''), '}', ''), '~', ''), '@', ''), ' - ', ' ' ), '' , '')    
 )    
   
--Replace double spaces found within the string with single space  
while (PATINDEX('%  %', @FilteredSearchStr) > 0)  
  begin  
	SET @FilteredSearchStr = REPLACE(@FilteredSearchStr, '  ', ' ')  
  end  
  
--Load words from input string into a table variable.  (This loop trims whitespace on either end of the word.  Make each word lower case.)  
while @Start is not null and @FilteredSearchStr != ''
  begin  
	insert into @WordList(Word) select lower(LTrim(RTrim(SubString(@FilteredSearchStr, @Start, abs(@Start - IsNull(NullIf(CharIndex(@Delim, @FilteredSearchStr, @Start + 1), 0), Len(@FilteredSearchStr) + 1))))))  
	set @Start = NullIf(CharIndex(@Delim, @FilteredSearchStr, @Start + 1), 0) + 1  
  end

--Update words that are numeric to always be positive in value.  (TFS 29596 - User entered "-15 Londonderry Rd" and this function determined it was a number but then the abbreviation logic 
-- failed to expand the number because we have no number abbreviations for negative values)
update wl
set Word = ABS(cast(wl.word as decimal(38,19)))
from @WordList as wl
where IsNumeric(wl.Word) = 1
  
--Determine which words have an abbreviation... have an alias... are a number... are a noise word.  Add the WildChar if criteria is met.  
update wl  
set HasAlias = IsNull(abv2.AbbreviationID, 0),  
	AbbreviationID = abv.AbbreviationID,  
	HasAbbreviation = IsNull(abv.AbbreviationID, 0),  
	IsNumber = tmp.IsNumber,  
	IsNoiseWord = tmp.IsNoiseWord,  
	Word = case when (len(wl.Word) > 2 and @pMode = 2 and tmp.IsNumber = 0 and tmp.IsNoiseWord = 0) then wl.Word + @WildCardChar else wl.Word end  
from (  
	select a.WordID  
		, a.Word  
		, case when (  
		(  
		PATINDEX('%[0-9]nd', a.Word) > 0 or  
		PATINDEX('%[0-9]rd', a.Word) > 0 or  
		PATINDEX('%[0-9]th', a.Word) > 0 or  
		PATINDEX('%[0-9]st', a.Word) > 0  
		)   
		and ISNUMERIC(REPLACE(REPLACE(REPLACE(REPLACE(a.Word, 'st', ''), 'nd', ''), 'rd', ''), 'th', '')  
		) = 1)   
		or (ISNUMERIC(a.Word) = 1) then 1 else 0 end as 'IsNumber'  
		, IsNull(b.stoplist_id, 0) as 'IsNoiseWord'  
	from @WordList as a  
	left join dbo.CostarFullTextStopWords as b on b.stopword = a.Word  
) as tmp  
join @WordList as wl on wl.WordID = tmp.WordID  
left join dbo.Abbreviation as abv with (nolock) on abv.Alias = wl.Word  
left join dbo.Abbreviation as abv2 with (nolock) on abv2.Abbreviation = abv.Abbreviation and abv2.Alias != abv.Alias  
  
--Initialize @WordID for loop  
set @WordID = (Select top 1 WordID from @WordList where WordID > 0 and IsNoiseWord = 0 order by WordID)  
  
--Sanity check.  
if @WordID is null GOTO EndOfFunction  
  
--Main query generation loop.  
While @WordID is not null  BEGIN   
  
 --Set the Selected Word to process  
 Select @SelectedWord = Word, @AbbreviationID = AbbreviationID, @HasAlias = HasAlias, @IsNumber = IsNumber from @WordList where WordID = @WordID  
  
 --IF (@Debug = 1) print 'Currently Selected Word: [' + @SelectedWord + ']' + char(9) + 'Has Alias: ' + cast(@HasAlias as varchar) + char(9) + 'IsNumber: ' + cast(@IsNumber as varchar)   
  
 --'TH' by itself was\is considered a noise word.  The original code would effectively filter this out as a noise word, so not to change the behaviour this code shall do the same.  
 if (@SelectedWord = 'th') goto SkipNoiseWord  
   
 --If number... expand number  
 IF (@IsNumber = 1)
   BEGIN

	Set @NumWord = REPLACE(REPLACE(REPLACE(REPLACE(@SelectedWord, 'st', ''), 'nd', ''), 'rd', ''), 'th', '')  
	SET @HasAlias = 1  --HasAlias because it is a number and is being expanded by fnNum2FTSSearch.  
    
	declare @PTIndex int, @IsDecimal bit  
	set @PTIndex = abs(1 - IsNull(NullIf(CharIndex('.', @NumWord, 2), 0), Len(@NumWord) + 1))  
	set @IsDecimal = cast(cast(@NumWord as decimal(38, 19)) % 1 as bit)  
  
	if (@IsDecimal = 0)
	  begin
		SET @NumberSearchPhrase = UPPER(IsNull('(' + dbo.fnNum2FTSSearch(SubString(@NumWord, 1, @PTIndex)) + ')', ''))
	  end
	else
	  begin
		SET @NumberSearchPhrase = UPPER('("' + @NumWord + '") OR (' +  
		IsNull(ltrim(rtrim('(' + dbo.fnNum2FTSSearch(replace(SubString(@NumWord, 1, @PTIndex), '.', '')))) + ')', '') +  
		IsNull(' AND (' + ltrim(rtrim(dbo.fnNum2FTSSearch(SubString(@NumWord, @PTIndex + 2, NullIf(CharIndex('.', @NumWord, @PTIndex + 1), 0) + 1)))) + ')', '') + ')'  
		)  
	  end
	        
	update @WordList  
	set SearchPhrase = rtrim(@NumberSearchPhrase)  
	where WordID = @WordID  

  END
  
 --Search for aliases  
 if (@HasAlias = 1)
   BEGIN

	select @TmpStr = isnull(@TmpStr + ' OR ', '') + ISNULL('"' + UPPER(Alt.Alias) + '"', '')    
	from dbo.Abbreviation as SelWrd with (nolock)  
	inner join dbo.Abbreviation as Alt with (nolock) on SelWrd.Abbreviation = Alt.Abbreviation  
	where SelWrd.AbbreviationID = @AbbreviationID  
		and Alt.Alias != replace(@SelectedWord, '*', '')  
		and CHARINDEX('"' + Alt.Alias + '"', ISNULL(@NumberSearchPhrase, '')) = 0   
		and CHARINDEX('"' + Alt.Alias + '"', ISNULL(@SearchPhraseEX, '')) = 0   
  
	SET @SearchAuxPhrase = @TmpStr + ' OR "' + @SelectedWord + '"'  
    
	SET @SearchPhraseEX = ISNULL(@SearchPhraseEX + ' AND ', '' )   
		+ '('   
		+ ISNULL(@NumberSearchPhrase + ' OR ', '')    
		+ ISNULL(@SearchAuxPhrase + ' OR ', '')   
		+ ')'  
  
	----Cleanup unnecessary concatination.  
	SET @SearchPhraseEX = replace(@SearchPhraseEX , '( OR', '(') -- Remove orphaned preceding OR  
	SET @SearchPhraseEX = replace(@SearchPhraseEX , ' OR )', ')') -- Remove orphaned trailing OR   
  
  END  
  
	IF (@HasAlias = 0)
	  BEGIN
		SET @SearchPhrase = ISNULL(@SearchPhrase + ' AND ', '') + '(' + '"' +  @SelectedWord + '"' + ')'
	  END  
  
	SkipNoiseWord:

	SET @NumWord = NULL  
	SET @NumberSearchPhrase = NULL  
	SET @SearchAuxPhrase = NULL  
	SET @TmpStr = NULL  
  
	--Get the word index.  
	set @WordID = (Select top 1 WordID from @WordList where WordID > @WordID and IsNoiseWord = 0 order by WordID)  
   
  END  
   
--Build the final FTC statement.  
SET @exCriteria = RTRIM(ISNULL(@SearchPhrase + ' AND ', '') + ISNULL(@SearchPhraseEx, ''))  
SET @exCriteria = RTRIM(REPLACE(@exCriteria, '() AND ', ''))  
SET @exCriteria = RTRIM(REPLACE(@exCriteria, ' AND ()', ''))  
SET @exCriteria = RTRIM(REPLACE(@exCriteria, '()', ''))  
  
  
--If we can convert to the multiple CONTAINS clause then @SrchStr will not be null and this is the generated FTC query criteria that   
--will be used.  Otherwise we will work as the original function did and the current contents of @exCriteria will be used.  
declare @SubSrchStr varchar(8000)  
declare @NumSrchStr varchar(8000)  
declare @SrchStr varchar(8000)  
  
select @SubSrchStr = IsNull(@SubSrchStr + ' and ("' + word + '")',  '("' + word + '")')  
from @WordList  
where HasAlias = 0 
	and IsNumber = 0
	and IsNoiseWord = 0  
  
select @NumSrchStr = IsNull(' AND ' + @NumSrchStr + SearchPhrase, SearchPhrase)  
from @WordList  
where IsNumber = 1 
	and IsNoiseWord = 0  
  
set @SubSrchStr = ISNULL(@SubSrchStr + ' AND ' + @NumSrchStr, @SubSrchStr)  
  
if @pColumnName <> ''
  begin  -- @pColumnName is an optional parameter

	select @SrchStr = IsNull(@SrchStr + ' or CONTAINS(' + @pColumnName + ', ''' + @SubSrchStr + IsNull(' and ("' + alt.Alias + '")'')', '')  
		, 'CONTAINS(' + @pColumnName + ', ''' + @SubSrchStr + IsNull(' and ("' + alt.Alias + '")'')', '')) + @CrLf  
	from dbo.Abbreviation as wrd with (nolock)  
	join dbo.Abbreviation as alt with (nolock) on alt.Abbreviation = wrd.Abbreviation  
	join @WordList as t on replace(t.Word, '*', '') = wrd.Alias  
	where t.HasAlias = 1 and t.IsNumber = 0 and t.IsNoiseWord = 0

  end  
  
if (@SrchStr is not null)  
	set @exCriteria = '('+@CrLf+@SrchStr+')'  
else if @pColumnName <> ''  
	set @exCriteria = '(CONTAINS(' + @pColumnName + ', ''' + rtrim(@exCriteria) + '''))'  
  
if RIGHT(@exCriteria,3) = 'AND'  
	SET @exCriteria =  substring( @exCriteria, 1, datalength( @exCriteria) -3)  
ELSE IF RIGHT (@exCriteria, 6) = 'AND''))'  
	SET @exCriteria =  substring( @exCriteria, 1, datalength( @exCriteria) -6) + '''))'  
  
EndOfFunction:  
  
--DEBUG Output results  
--IF (@Debug = 1) print 'Original Input String: [' + @FilteredSearchStr + ']' + @CrLf + @CrLf  
--IF (@Debug = 1) select * from @WordList  
--if (@Debug = 1) print @CrLf + 'Generated FTC query: ' + @CrLf + @exCriteria  + @CrLf + @CrLf + 'Original:' + @CrLf + dbo.fnFTSCriteriaEx(@pSearchStr, 2)   
  
return @exCriteria  
  
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFTSTenantGeneralAddrCriteriaEx]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFTSTenantGeneralAddrCriteriaEx]
--Create Function dbo.fnFTSTenantGeneralAddrCriteriaEx
(
  @ResearchMarketID Varchar(8)
, @City             Varchar(30)
, @State            varChar(3)
, @Zip              Varchar(5)
, @PropertyID       Int
, @Mode             TinyInt  --1 Indicates that we need to build a "contains" string that searches on the full text index
                             --2 Indicates taht we need to build a string that will be used to search on LocationFTS.ndxLocationName
)
  Returns Varchar(128)
As
/*
===================================================================================================
Purpose:  The aim of this function is to return a string that utilizes the indexes on 
          dbo.LocationFTS.  Depending on the value of @Mode a string will be generated to utilize
          the full text index or the regular index on LocationFTS.
          ------
          Sample Call (Mode 1):
            Select dbo.fnFTSTenantGeneralAddrCriteriaEx('23','Englewood','NJ','07631',123,1,3)
            Returns (("xRM23" OR "xRMf23") AND "xCTEnglewood" AND "xSTNJ" AND "xZP07631" AND "xPI123")

          Sample Call (Mode 2)"
            Select dbo.fnFTSTenantGeneralAddrCriteriaEx('23','Englewood','NJ','07631',123,2,3)
            Returns xRM%23%xCTEnglewood%xSTNJ%xZP07631%xPI123%

RBM 20060616 Creation
RBM 20060627 Modification to else condition for mode 2.  Do not assume the locationfts.locationame 
             field has xRM, xCT... tokens.  Else condition set to match that of mode 1.
JPC 20080229 Fixed TFS #9905 - search expression for research market was not correct.
10/27/2009 Sean Roussy. Enterprise UK. State Codes go from 2 to 3.
19Oct2010 DMM TFS 22555 - Performance improvements for resCompanyGet.  There was a bug in this 
						  function:  during a non-full text search, a blank should have been inserted
						  between the marketID and the "%", otherwise MarketID 1 will match markets 1, 12, 13, 123, etc.
===================================================================================================
*/
Begin
  Declare @TemplateRet Varchar(128)

  Set @City             = IsNull(Replace(@City,' ','0'),'')
  Set @State            = IsNull(@State,'')
  Set @ResearchMarketID = IsNull(@ResearchMarketID,'')
  Set @PropertyID       = IsNull(@PropertyID,'')

  If @Mode = 1
    Set @TemplateRet = 
       '('
      +Case When @ResearchMarketID > '' Then '"xRM<RESEARCHMARKETID>"' Else '' End
      +Case When @City             > '' Then '"xCT<CITY>"'             Else '' End
      +Case When @State            > '' Then '"xST<STATE>"'            Else '' End
      +Case When @Zip              > '' Then '"xZP<ZIP>"'              Else '' End
      +Case When @PropertyID       > '' Then '"xPI<PROPERTYID>"'       Else '' End
      +')'
  Else
    Set @TemplateRet =
      +Case When @ResearchMarketID > '' Then 'xRM<RESEARCHMARKETID> %' Else '' End
      +Case When @City             > '' Then 'xCT<CITY>%'              Else '' End
      +Case When @State            > '' Then 'xST<STATE>%'             Else '' End
      +Case When @Zip              > '' Then 'xZP<ZIP>%'               Else '' End
      +Case When @PropertyID       > '' Then 'xPI<PROPERTYID>%'        Else '' End

  Return IsNull((
    Replace(
    Replace(
    Replace(
    Replace(
    Replace(
    Replace(
    Replace(
    Replace(
    (
      @TemplateRet
    )
    ,'<RESEARCHMARKETID>',@ResearchMarketID)
    ,'<CITY>'            ,@City)
    ,'<STATE>'           ,@State)
    ,'<ZIP>'             ,@Zip)
    ,'<PROPERTYID>'      ,@PropertyID)
    ,'""','" AND "')
    ,')"',') AND "')
    ,'()','')
  ),'')

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetAKAList]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create Function dbo.fnGetAKAList(@pLocationID Int, @pDelimiter Char(1))
CREATE FUNCTION [dbo].[fnGetAKAList](@pLocationID Int, @pDelimiter Char(1))
  Returns Varchar(512)
As
/*
===================================================================================================
Purpose:  This function strings together a list of AKA values for a particular location.
          Called by fnGetLocationNameFTS..

History:  RBM 20060616 Creation
===================================================================================================
*/
Begin
  Declare @AKA Varchar(512)

  Select @AKA = IsNull(@AKA+@pDelimiter,'') +  IsNull(RTrim(LTrim(AKA)),'')
  From AKA 
  Where LocationID = @pLocationID

  Return @AKA

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetBATCHLISTStructure]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------
-- File: C:\COSTARPROJECTS\COSTARINTERNALAPPS\MAIN\ENTERPRISE\SOURCE\Database\CRM.Nightly Processes\Functions\fnGetBATCHLISTStructure.sql
CREATE FUNCTION [dbo].[fnGetBATCHLISTStructure] ()
RETURNS @BATCHLISTTab TABLE
   (
      ORDERBYID 	INT,
      LOCATIONID 	INT,
      BATCHNAME		VARCHAR(25),
      REFCODE		VARCHAR(3000)
   )
AS
BEGIN

   RETURN

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCompAPNString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE FUNCTION dbo.fnGetCompAPNString(@pCompID Int)
CREATE FUNCTION [dbo].[fnGetCompAPNString](@pCompID Int)
Returns Varchar(8000)
As 

/***************************************************************************************************
**	Name: fnGetCompAPNString
**
**  Goal:
**  Return a string of comma separated values that contain the APNs for a given CompId
**
**  20060314  RBM  Creation.
**  20060505  DJR  Changed to look at CompAPNAssessment instead of CompAPN (deprecated)
**  20060510  DJR  Widened return value of APN String to 8000; this may be too big, but one comp
*                  already returns an APN String of ~2400.
*   20090721  MCA  TFS 14032 - Only return 20 APN numbers
***************************************************************************************************/

Begin
  Declare @APNString Varchar(8000)

  Select @APNString = IsNull(@APNString+',','') + t.APN
  FROM (SELECT DISTINCT TOP 20 CA.APN as APN
		  From   dbo.CompDocument      CD (NoLock)
		  Join   dbo.CompAPNAssessment CA (NoLock) on CD.CompDocumentID = CA.CompDocumentID
		  Where  CD.CompID = @pCompID
		   And  CA.APN > '') as t

  Return NullIf(@APNString,'')

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCompAssignmentPriority]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create function dbo.fnGetCompAssignmentPriority(@SortOrder SmallInt, @Price BigInt, @Date DateTime)
CREATE FUNCTION [dbo].[fnGetCompAssignmentPriority](@SortOrder SmallInt, @Price BigInt, @Date DateTime)
Returns Varchar(32)
As 
/*
***************************************************************************************************
**  Goal: 
**  This function returns a 24Byte encoded comp priority value.
**
**    |<---------------------24 Bytes---------------------->|
**    |<--4 Bytes--><-------12 Bytes---------><--8 Bytes--->|
**    (9999-SRCSort)        (Price)              (Date)
**
**    Example:  
**      CompID 5
**      SRC SortOrder = 70
**     *Price = $450,000
**      Date = 1/1/2006
**
**    AssignmentPriority
**      (9999-SRC Sort)= 9929
**      (Price)        = 000000450000
**      (Date)         = 20060101
**  
**    "992900000045000020060101"
**
** 20060331 RBM Creation
***************************************************************************************************
*/
Begin

  Return (
       --First 4 bytes, 9999 - source sort order..
       Replicate('0', 4-Len(Cast(9999-@SortOrder As Varchar(4))) ) 
     + Cast(9999-@SortOrder As Varchar(4)) 
       --Next 12 Bytes, SoldForPrice
     + Replicate('0', 12-Len(Cast(/*@BASE_PRICE-*/IsNull(@Price,0) As Varchar(12))) ) 
     + Cast(/*@BASE_PRICE-*/IsNull(@Price,0) As Varchar(12))
       --Next 8 Bytes, Date.
     + Convert(varchar(8),@Date,112)
  )

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCompDocNumString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetCompDocNumString](@pCompID Int)
--Create function dbo.fnGetCompDocNumString(@pCompID Int)
Returns Varchar(256)
As 
Begin
  Declare @DocNumString Varchar(256)

  Select @DocNumString = IsNull(@DocNumString+',','') + DocNum
  From dbo.CompDocument (nolock) 
  Where CompID = @pCompID
    And DocNum > ''

  Return NullIf(@DocNumString,'')

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCompGeneralPriority]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create function dbo.fnGetCompGeneralPriority(@SortOrder SmallInt, @Price BigInt, @Date DateTime)
CREATE FUNCTION [dbo].[fnGetCompGeneralPriority](@Date DateTime,@Price BigInt)
Returns Varchar(256)
As 
/*
***************************************************************************************************
**  Goal: 
**  This function returns a 24Byte encoded comp priority value based on date and price.
**
**    |<---------------------24 Bytes---------------------->|
**    |<--8 Bytes---><-------12 Bytes---------><--4 Bytes-->|
**        (Date)             (Price)             (Unused)
**
**    Example:  
**      CompID 5
**      Price = $450,000
**      Date = 1/1/2006
**
**    GeneralPriority
**      (Date)       = 20060101
**      (Price)      = 000000450000
**      (Unused)     = 0000
**
**    "200601010000004500000000"
**
** 20060331 RBM Creation
***************************************************************************************************
*/
Begin


  Return (
       --First 8 bytes, Date..
       Convert(varchar(8),@Date,112)
       --Next 12 Bytes Padded Price
     + Replicate('0', 12-Len(Cast(IsNull(@Price,0) As Varchar(12))) ) 
     + Cast(IsNull(@Price,0) As Varchar(12))
       --Next 4 Bytes Unused
     + '0000'

  )

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCountyAPNMaskString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE function dbo.fnGetCountyAPNMaskString (@pCountyID Int)
CREATE FUNCTION [dbo].[fnGetCountyAPNMaskString] (@pCountyID Int)
Returns Varchar(1024)
As
/***************************************************************************************************
**	Name: fnGetCountyAPNMaskString
**
**  Goal:
**  Return a string of comma separated values that contain the APN Maskss for a given CountyID
**
**  20060505  DJR  Creation.
***************************************************************************************************/
Begin
  Declare @CountyAPNMaskString Varchar(1024)

  Select @CountyAPNMaskString = IsNull(@CountyAPNMaskString+',','') + APNMask
  From dbo.CountyAPNMask (nolock)
  Where CountyId = @pCountyId
    And APNMask > ''
  Order by CountyAPNMaskID  -- necessary so that results will correlate with fnGetCountyAPNRegExString

  Return NullIf(@CountyAPNMaskString,'')

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCountyAPNRegExString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE function dbo.fnGetCountyAPNRegExString (@pCountyID Int)
CREATE FUNCTION [dbo].[fnGetCountyAPNRegExString] (@pCountyID Int)
Returns Varchar(8000)
As

/***************************************************************************************************
**	Name: fnGetCountyAPNRegExString
**
**  Goal:
**  Return a string of comma separated values that contain the APN RegExes for a given CountyID
**
**  20060505  DJR  Creation.
**  20060505  DJR  Fixed bug - should return from CountyAPNMask instead of CountyAPNRegEx (Which doesn't exist.)
**  20060509  DJR  Returns | delimited regular expression, based on APNMask
***************************************************************************************************/

Begin
  Declare @CountyAPNRegExString Varchar(8000)

  Select @CountyAPNRegExString = IsNull(@CountyAPNRegExString+'|','') + APNRegEx
  From   dbo.CountyAPNMask (nolock)
  Where  CountyId = @pCountyID
    And  APNRegEx > ''
  Order by CountyAPNMaskID  -- necessary so that results will correlate with fnGetCountyAPNMaskString

  Return NullIf(@CountyAPNRegExString,'')

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCountyDocNumMaskString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE function dbo.fnGetCountyDocNumMaskString (@pCountyID Int)
CREATE FUNCTION [dbo].[fnGetCountyDocNumMaskString] (@pCountyID Int)
Returns Varchar(1024)
As
/***************************************************************************************************
**	Name: fnGetCountyDocNumMaskString
**
**  Goal:
**  Return a string of comma separated values that contain the DocNum Maskss for a given CountyID
**
**  20060505  DJR  Creation.
***************************************************************************************************/
Begin
  Declare @CountyDocNumMaskString Varchar(1024)

  Select @CountyDocNumMaskString = IsNull(@CountyDocNumMaskString+',','') + DocNumMask
  From   dbo.CountyDocNumMask (nolock)
  Where  CountyId = @pCountyId
    And  DocNumMask > ''
  Order by CountyDocNumMaskID  -- necessary so that results will correlate with fnGetCountyDocNumRegExString

  Return NullIf(@CountyDocNumMaskString,'')

End

/*TESTING...

select CountyId, Count(*), sum(Len(docnummask))
from CountyDocNumMask
group by CountyId
order by 3 desc

select *
from CountyDocNumMask

select dbo.fnGetCountyDocNumMaskString(1204)

*/

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCountyDocNumRegExString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE function dbo.fnGetCountyDocNumRegExString (@pCountyID Int)
CREATE FUNCTION [dbo].[fnGetCountyDocNumRegExString] (@pCountyID Int)
Returns Varchar(8000)
As

/***************************************************************************************************
**	Name: fnGetCountyDocNumRegExString
**
**  Goal:
**  Return a string of comma separated values that contain the DocNum RegExes for a given CountyID
**
**  20060508  DJR  Creation.
***************************************************************************************************/

Begin
  Declare @CountyDocNumRegExString Varchar(8000)

  Select @CountyDocNumRegExString = IsNull(@CountyDocNumRegExString+'|','') + DocNumRegEx
  From   dbo.CountyDocNumMask (nolock)
  Where  CountyId = @pCountyID
    And  DocNumRegEx > ''
  Order by CountyDocNumMaskID  -- necessary so that results will correlate with fnGetCountyDocNumMaskString

  Return NullIf(@CountyDocNumRegExString,'')

End

/*TESTING...

select CountyId, Count(*), sum(Len(docnumregex))
from CountyDocNumMask
group by CountyId
order by 3 desc


select dbo.fnGetCountyDocNumRegExString(1204)

*/

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetHomepageContacts]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------
-- File: C:\COSTARPROJECTS\COSTARINTERNALAPPS\MAIN\ENTERPRISE\SOURCE\Database\CRM.Nightly Processes\Functions\fnGetHomepageContacts.sql
/*
drop function dbo.fnGetHomepageContacts

select * from dbo.fnGetHomepageContacts('')
*/

CREATE FUNCTION [dbo].[fnGetHomepageContacts](@contactId varchar(200))
RETURNS @possibleContacts TABLE
   (
      contactId		INT,
      NamePrefix	VARCHAR(10),
      FirstName		VARCHAR(16),
      MiddleInitial	CHAR(1),
      LastName		VARCHAR(25),
      DEPTID		INT,
      ROLEID		INT
   )
AS

BEGIN

  if @contactId is not null and @contactId <> ''
     begin
	   INSERT @possibleContacts
      		SELECT A.CONTACTID, c.NamePrefix, c.FirstName, c.MiddleInitial,
       			c.LastName, CASE WHEN a.ROLEID = 16 AND a.deptId IS NULL THEN 20 ELSE a.deptId END as DEPTID, A.ROLEID
  		FROM DBO.COSTARCONTACT A
  		JOIN DBO.CONTACT C ON A.CONTACTID = C.CONTACTID
		WHERE (A.DEPTID = 21 OR A.ROLEID = 16)
		  and c.contactId = cast(@contactId as int)
     end
	else
    begin
   	
	   INSERT @possibleContacts
      		SELECT A.CONTACTID, c.NamePrefix, c.FirstName, c.MiddleInitial,
       			c.LastName, CASE WHEN a.ROLEID = 16 AND a.deptId IS NULL THEN 20 ELSE a.deptId END as DEPTID, A.ROLEID
  		FROM DBO.COSTARCONTACT A
  		JOIN DBO.CONTACT C ON A.CONTACTID = C.CONTACTID
		WHERE (A.DEPTID = 21 OR A.ROLEID = 16)
		

    end
     

   RETURN

END


GO
/****** Object:  UserDefinedFunction [dbo].[fnGetLeadResearchPortfolioIDCountyString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE function [dbo].[fnGetLeadResearchPortfolioIDCountyString](@pLeadResearchPortfolioID Int)        /* CRM Version 7.0.6.1005 */
Returns Varchar(8000)
As 

/***************************************************************************************************
**	Name: fnGetLeadResearchPortfolioIDCountyString
**
**  Goal:
**  Return a string of comma separated values that contain the Counites for a given
**  PortfolioID.
**
**  20131003 HHH  Creation.
***************************************************************************************************/

Begin
  Declare @CountyString Varchar(8000)

  Select @CountyString = IsNull(@CountyString+',','') + CountyName + ' ' + State
  From   dbo.County C (NoLock)
  Join   dbo.LeadResearchPortfolioCounty rpcty (NoLock) 
	on C.CountyID = rpcty.CountyID
  Where  rpcty.LeadResearchPortfolioID = @pLeadResearchPortfolioID

  Return isnull(@CountyString ,'')

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnGETListOfSitesStructure]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------
-- File: C:\COSTARPROJECTS\COSTARINTERNALAPPS\MAIN\ENTERPRISE\SOURCE\Database\CRM.Nightly Processes\Functions\fnGETListOfSitesStructure.sql
CREATE FUNCTION [dbo].[fnGETListOfSitesStructure] ()
RETURNS @ListOfSitesTab TABLE
   (
      SiteLocationID	INT,
      LocationName	VARCHAR(50),
      LineItemID	INT,
      SalesUnitID	INT,
      DatasetID		INT,
      SalesUnitDesc	VARCHAR(100),
      DatasetCD		VARCHAR(10),
      Copies		SMALLINT,
      ProdCD		VARCHAR(5),
      VolCount		INT
   )
AS
BEGIN

   RETURN

END


GO
/****** Object:  UserDefinedFunction [dbo].[fnGetPropertyTypeDesc]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--------------------------------------------------------------------------------------------------
-- File: c:\CoStarProjects\CRM.WS.Database\CRM.WS.DB.Property\Functions\fnGetPropertyTypeDesc.sql
CREATE function [dbo].[fnGetPropertyTypeDesc]        /* CRM Version 4.0.0.0 */
-- create function dbo.fnGetPropertyTypeDesc   
(                
  @pPropertyTypeID int 
)
  returns varchar(25)
as

/******************************************************************************
**	Name: fnGetPropertyTypeDesc
**	
**  This UDF returns the description associated with a PropertyTypeID.  It's
**  used in the check constraints that enforce RBA/GBA as required or invalid,
**  depending on property type.  
**
**  PM, 6/3/4.
**
*******************************************************************************/
begin

  declare @PropertyTypeDesc varchar(25)

  select @PropertyTypeDesc = PropertyTypeDesc
  from dbo.PropertyType
  where PropertyTypeID = @pPropertyTypeID

  return @PropertyTypeDesc

end

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetResearchPortfolioIDCountyString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--------------------------------------------------------------------------------------------------
-- File: C:\CoStarProjects\Enterprise\CRM.WS.Database\CRM.WS.DB.Comp\Functions\fnGetCompAPNString.sql
CREATE FUNCTION [dbo].[fnGetResearchPortfolioIDCountyString](@pResearchPortfolioID Int)
Returns Varchar(8000)
As 

/***************************************************************************************************
**	Name: fnGetResearchPortfolioIDCountyString
**
**  Goal:
**  Return a string of comma separated values that contain the Counites for a given
**  PortfolioID.
**
**  200707126 BPM  Creation.
***************************************************************************************************/

Begin
  Declare @CountyString Varchar(8000)

  Select @CountyString = IsNull(@CountyString+',','') + CountyName + ' ' + State
  From   dbo.County C (NoLock)
  Join   dbo.ResearchPortfolioCounty rpcty (NoLock) 
	on C.CountyID = rpcty.CountyID
  Where  rpcty.ResearchPortfolioID = @pResearchPortfolioID

  Return isnull(@CountyString ,'')

End

GO
/****** Object:  UserDefinedFunction [dbo].[FNGetTimeDimID]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[FNGetTimeDimID] ( @PDate datetime, @NumberQtrBack int) Returns int
AS
--03/17/2005 Kevin Mikailov
BEGIN
declare 
        @TimeDimDate smalldatetime,
        @TimeDimID int

set @Pdate = DATEADD(QQ, -@NumberQtrBack, @PDate) --Get the Date we are looking for.
SET @TimeDimDate = CONVERT( smalldatetime,datediff(day, 0, dateadd(ms,-3,DATEADD(QQ, DATEDIFF(QQ,0,@Pdate )+1, 0))))  --Last date of the Quater
SET @TimeDimID =(SELECT TimeDimID FROM EnterpriseAnalytic.DBO.TimeDim(nolock) WHERE TimeDimDate = @TimeDimDate)
  RETURN @TimeDimID
END


GO
/****** Object:  UserDefinedFunction [dbo].[fnGoSellLoopnetHQProducts]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGoSellLoopnetHQProducts]()
RETURNS @LoopnetHQProducts TABLE
(
	 ProductID		INT
)
AS
BEGIN


	INSERT INTO @LoopnetHQProducts
	(
		ProductID
	)
	SELECT
		P.ProductID
	FROM
		dbo.Product P WITH (NOLOCK)
	WHERE
		P.CoStarBrandID = 11

	RETURN

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnGoSellLoopnetTieredListingProducts]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGoSellLoopnetTieredListingProducts]()
RETURNS @LoopnetTieredListingProducts TABLE
(
	 ProductID		INT
)
AS
BEGIN


	INSERT INTO @LoopnetTieredListingProducts
	(
		ProductID
	)
	VALUES
	    (342),
	    (343),
	    (344),
	    (345)

	RETURN

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnGoSellSupportedProducts]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGoSellSupportedProducts]()
RETURNS @GoSellProducts TABLE
(
     ProductID					INT
    ,IsABundle					BIT
    ,BundleID					INT
    ,BundleTypeID				INT
    ,CompatibilityID			INT
	,LoopnetCompatibilityID		INT
)
AS
BEGIN
        /* PROPOSAL COMBINATIONS RULES

            1.	Apartments Only
				OR
            2.	CMA Only
				OR
            3.	CoStar Suite Only
				OR
            4.	Apartments + CMA  ( 1 + 2 )

			AND

			LoopNetHQCompatibility


        */
		


    -- Insert Costar and CMA Products
    INSERT INTO @GoSellProducts
    (
         ProductID
        ,IsABundle
        ,BundleID
        ,BundleTypeID
        ,CompatibilityID
		,LoopnetCompatibilityID
    )
    VALUES
        (1      ,0  , NULL, NULL, 2,	1),     -- CoStar Property Web
        (2      ,0  , NULL, NULL, 2,	0),     -- CoStar Tenant Web
        (5      ,0  , NULL, NULL, 2,	0),     -- CoStar Comps
		(338	,0	, NULL, NULL, 2,	1),     -- CoStar Property US (new)

        (10002  ,1  , NULL, 2   , 2,	1),     -- CoStar Suite w/o Connect
        (10006  ,1  , NULL, 6   , 1,	1),     -- CMA

        (246    ,0  , 4   , NULL, 1,	0),     -- Apts.com Silver
        (267    ,0  , 4   , NULL, 1,	0),     -- Apt Finder Finder Pak

        (245    ,0  , 3   , NULL, 1,	0),     -- Apts.com Gold
        (268    ,0  , 3   , NULL, 1,	0),     -- Apt Finder Finder Plus

        (247    ,0  , 2   , NULL, 1,	0),     -- Apts.com Platinum 
        (269    ,0  , 2   , NULL, 1,	0),     -- Apt Finder Finder Pro

        (248    ,0  , 1   , NULL, 1,	0),     -- Apts.com Diamond
        (270    ,0  , 1   , NULL, 1,	0),     -- Apt Finder Pro + ODD

		(283    ,0  , NULL, NULL, 3,	0),      -- LN-Gold Listing
		(260    ,0  , NULL, NULL, 3,	0),      -- LN-Diamond Listing
		(259    ,0  , NULL, NULL, 3,	0),      -- LN-Platinum Listing
		(222    ,0  , NULL, NULL, 3,	0),      -- LN-Company PL Plan
		(223    ,0  , NULL, NULL, 3,	0),      -- LN-PL Plan Admin		
		(224    ,0  , NULL, NULL, 3,	0),      -- LN-Company PL Plan+ND
	    (262    ,0  , NULL, NULL, 3,	0),      -- LN-Individual PL 
	    (264    ,0  , NULL, NULL, 3,	0),       -- LN-Individual PL Plan+ND
		-- Loopnet Tiered Listing Products
    	(342    ,0  , NULL, NULL, 3, 	0),       -- Silver
    	(343    ,0  , NULL, NULL, 3, 	0),       -- Gold
    	(344    ,0  , NULL, NULL, 3, 	0),       -- Platinum
    	(345    ,0  , NULL, NULL, 3, 	0),       -- Diamond

		(346    ,0  , NULL, NULL, 2,	1),       -- LoopNet Premium Plan
	    (347    ,0  , NULL, NULL, 2,	1),       -- LoopNet Gold Package
	    (348    ,0  , NULL, NULL, 2,	1),       -- LoopNet Platinum Package
	    (349    ,0  , NULL, NULL, 2,	1),       -- LoopNet Diamond Package
	    (350    ,0  , NULL, NULL, 2,	1),       -- LoopNet Admin

		(367    ,0  , NULL, NULL, 2,	1),       -- LoopNet Individual Member
		(356    ,0  , NULL, NULL, 4,	0)        -- LoopNet Individual Member Plan


    RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnHasPermissionToChangeHierarchy]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnHasPermissionToChangeHierarchy] (@pContactID int)      
RETURNS bit
AS
BEGIN
	DECLARE @rtn bit
	
	IF EXISTS (
		Select 1
		From	dbo.Permission a with (nolock)
		JOIN	dbo.PermissionGroupMember b with (nolock)	ON a.permissionID = b.PermissionGroupID
		JOIN 	dbo.PermissionGroup pg with (nolock) ON b.PermissionGroupID = pg.PermissionGroupID
		JOIN	dbo.PermissionMap c with (nolock)	ON a.securityArea = c.securityArea
		Where	a.PermissionType = 'G' 
			AND (a.SecurityArea = 'Company.ChangeHierarchy')
			AND b.memberContactID = @pContactId 
			AND c.IsActiveFlag = 1 AND pg.IsActiveFlag = 1 
		)
			SET @rtn = 1
	ELSE IF EXISTS (
		Select 1
			From 	dbo.Permission a  with (nolock)
			JOIN	dbo.PermissionMap b with (nolock)	ON a.securityArea = b.securityArea
			Where	a.PermissionType = 'U' AND a.PermissionID = @pContactId	
					AND (a.SecurityArea = 'Company.ChangeHierarchy')
					AND b.IsActiveFlag = 1 
		)
			SET @rtn = 1
	ELSE
		SET @rtn = 0
		
	RETURN @rtn
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnHasPermissionToEditLockedHierarchy]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Returns true if the supplied user can edit a locked company hierarchy
CREATE FUNCTION [dbo].[fnHasPermissionToEditLockedHierarchy]  (@pContactID int)
RETURNS bit
AS
BEGIN
	DECLARE @rtn bit
	
	IF EXISTS (
		Select 1
		From	dbo.Permission a with (nolock)
		JOIN	dbo.PermissionGroupMember b with (nolock)	ON a.permissionID = b.PermissionGroupID
		JOIN 	dbo.PermissionGroup pg with (nolock) ON b.PermissionGroupID = pg.PermissionGroupID
		JOIN	dbo.PermissionMap c with (nolock)	ON a.securityArea = c.securityArea
		Where	a.PermissionType = 'G' 
			AND (a.SecurityArea = 'Companies.Hierarchy.EditWhenLocked')
			AND b.memberContactID = @pContactId 
			AND c.IsActiveFlag = 1 AND pg.IsActiveFlag = 1 
		)
			SET @rtn = 1
	ELSE IF EXISTS (
		Select 1
			From 	dbo.Permission a  with (nolock)
			JOIN	dbo.PermissionMap b with (nolock)	ON a.securityArea = b.securityArea
			Where	a.PermissionType = 'U' AND a.PermissionID = @pContactId	
					AND (a.SecurityArea = 'Companies.Hierarchy.EditWhenLocked')
					AND b.IsActiveFlag = 1 
		)
			SET @rtn = 1
	ELSE
		SET @rtn = 0
		
	RETURN @rtn
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnHasPRSReferences]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------
-- File: C:\COSTARPROJECTS\COSTARINTERNALAPPS\MAIN\ENTERPRISE\SOURCE\CRM.WS.Database\CRM.WS.DB.Contacts\Functions\fnHasPRSReferences.sql

/******************************************************************************
**		Name: fnHasPRSReferences
**		Desc: Checks the existance of PRS References for this contact...
**
*******************************************************************************/
CREATE Function [dbo].[fnHasPRSReferences](        /* CRM Version  */
	 @pContactID int = null						-- The contact of which the references will be removed.
	,@pOperationType char(1) = null )		-- Type of call.  "M" = Move, "D" = Delete
																-- When the call type = M, only the Absorb table will be checked
																-- When D, absorb and agentlook tables will be checked...
RETURNS bit
AS

BEGIN

	DECLARE	 @UniqAgnt varchar( 5 )
					,@Result bit
					,@OpType char(1)
	
	-- Get the Unique Agent Code...
	Select @UniqAgnt = UniqAgnt From dbo.Contact (nolock) Where ContactID = @pContactID
		
	IF ISNULL( @UniqAgnt,'') = '' RETURN 0;
	
	-- Set the operation type to "D" if nothing was passed...
	SET @OpType = ISNULL( @pOperationType , 'D' );
		
	SELECT @Result = 0;
	
	IF ( @OpType = 'M' )
	BEGIN
		IF EXISTS( SELECT Uniq_Agnt FROM PRSDATA.dbo.AgentLookup 
				   WHERE Uniq_Agnt = @UniqAgnt AND AgentType = 'L')
			SET @Result = 1
	END ELSE
	BEGIN
		IF EXISTS( SELECT Uniq_Agnt FROM PRSDATA.dbo.AgentLookup 
				   WHERE Uniq_Agnt = @UniqAgnt )
			SET @Result = 1
		ELSE IF EXISTS( SELECT Uniq_Agnt FROM PRSDATA.dbo.AbsorbLookup 
					    WHERE Uniq_Agnt = @UniqAgnt )
			SET @Result = 1
	END;	
	
	RETURN @Result

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnInactivePropertyPointCalc]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnInactivePropertyPointCalc](@pPropertyContactID int, @pPropertyID int, @pContactRoleID int) returns int    
as    
begin    
     
 if (@pPropertyContactID is null)    
  return 1     
 declare @retValue int, @maxPropertyContactID int    
 select @maxPropertyContactID = max(pc.PropertyContactID) from PropertyContact pc (nolock) where pc.PropertyID = @pPropertyID and pc.ContactRoleID = @pContactRoleID and pc.EndDate is null    
     
 if @maxPropertyContactID = @pPropertyContactID    
  set @retValue = 1    
 else    
  set @retValue = 0    
 return @retValue    
end

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsApartmentsCustomer]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnIsApartmentsCustomer] (@pPropertyContactID INT )      
RETURNS BIT  AS   

/******************************************************************************  

* Name: fnIsCompanyAClient  
* Desc: Returns a 1 if the specified PropertyContact is a current PropertyManager  
*       for a MF Property who has a ListingProduct record else return 0                     
*  

******************************************************************************/  
 
BEGIN  
 
 DECLARE @rtn BIT;  
 SET @rtn = 0  
 
 IF @pPropertyContactID  IS NOT NULL 
 BEGIN  
  IF EXISTS (
             SELECT DISTINCT le.ListingID,pa.PropertyApartmentID, pa.PropertyID  
			  FROM dbo.ListingEntity le WITH(NOLOCK)
				JOIN dbo.PropertyApartment pa WITH(NOLOCK)
			  	    ON le.EntityID = pa.PropertyApartmentID 
			    	AND le.ListingEntityTypeID = 1  --PropertyApartment
			    JOIN dbo.Property p WITH(NOLOCK)
					ON p.PropertyID = pa.PropertyID 
				INNER JOIN dbo.ListingSubscription ls WITH(NOLOCK)
					ON ls.PropertyID = pa.PropertyID  
				INNER JOIN dbo.LineItem li WITH(NOLOCK)
					ON li.LineItemId = ls.LineItemID
				INNER JOIN dbo.Product PRD WITH (NOLOCK)
					ON PRD.ProductID = LI.ProductID
				JOIN dbo.PropertyContact pc WITH(NOLOCK)
					ON pc.PropertyID = p.PropertyID 
	 			    AND pc.ContactRoleID = 4 	 -- PropertyManager 
				WHERE p.PropertyTypeID = 11 -- Multifamily     
				  AND pc.PropertyContactID =@pPropertyContactID 
				  AND li.LineItemStatusID in (1,2,3)
				  AND ls.ListingSubscriptionStatusID in (1,2,4)
				  AND PRD.FeatureProductId IN (245, 246, 247, 248, 267, 268, 269, 270)
				  AND 
					  ( 
						 ( 
						   (pc.StartDate IS NULL OR pc.StartDate <=GETDATE()) 
							AND 
						   (pc.EndDate IS NULL OR pc.EndDate > GETDATE())
						   ) 
						 OR
						( pc.StartDate IS NOT NULL 
						   AND pc.EndDate IS NOT NULL 
						   AND pc.StartDate < pc.EndDate 
						   AND pc.StartDate <=GETDATE() AND pc.EndDate > GETDATE()
						) 
					  )
				) --Exists 
	    SET @rtn = 1
    else if EXISTS(
				SELECT le.ListingID, pls.PropertyLivingSpaceID, p.PropertyID
				FROM Enterprise.. ForRent fr
					   INNER JOIN Enterprise..PropertyLivingSpace pls ON pls.PropertyLivingSpaceID = fr.EntityID and fr.ForRentEntityTypeID = 6
					   INNER JOIN Enterprise..Property p ON pls.PropertyID = p.PropertyID
					   INNER JOIN Enterprise..ListingEntity le ON le.EntityID = fr.ForRentID AND le.ListingEntityTypeID = 2 --ForRent
					   INNER JOIN dbo.ListingSubscription ls WITH(NOLOCK) ON ls.PropertyID = pls.PropertyID  
					   INNER JOIN dbo.LineItem li WITH(NOLOCK) ON li.LineItemId = ls.LineItemID
					   INNER JOIN dbo.Product PRD WITH (NOLOCK)	ON PRD.ProductID = LI.ProductID
					   INNER JOIN Enterprise..PropertyContact pc ON pc.PropertyID = p.PropertyID AND pc.ContactRoleID = 4 and pc.EndDate IS NULL
				where p.PropertyTypeID = 1
					  AND pc.PropertyContactID =@pPropertyContactID
					  AND li.LineItemStatusID in (1,2,3)
					  AND ls.ListingSubscriptionStatusID in (1,2,4)
					  AND PRD.FeatureProductId IN (245, 246, 247, 248, 267, 268, 269, 270)
					  AND 
					  ( 
						 ( 
						   (pc.StartDate IS NULL OR pc.StartDate <=GETDATE()) 
							AND 
						   (pc.EndDate IS NULL OR pc.EndDate > GETDATE())
						   ) 
						 OR
						( pc.StartDate IS NOT NULL 
						   AND pc.EndDate IS NOT NULL 
						   AND pc.StartDate < pc.EndDate 
						   AND pc.StartDate <=GETDATE() AND pc.EndDate > GETDATE()
						) 
					  )
					  )
		SET @rtn = 1

 END  

 

  RETURN @rtn  
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsBroker]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnIsBroker]( @pUniqAgentCode char(5) ) Returns Bit        
AS
/******************************************************************************
**		Name: fnIsBroker
**		Desc: Checks PRSData.Co_Avl tbl to determine if the user indicated by the Unique
**		Agent Code is a broker.
**
**   HHH   12/28/04
**   Can not use PRSDATA anymore.  Using existence SpaceForLeaseContact or 
**   LeaseDealContact to determine if the Agent Code is a broker.    
*******************************************************************************/
BEGIN
	DECLARE @Located bit;
        DECLARE @ContactID int;
        DECLARE @Cntr int;         	

	SET @Located = 0

        set @Cntr = (select Count(*) from contact c 
        join SpaceForLeaseContact splc with (nolock) on splc.contactID = c.Contactid
        where 
           c.UniqAgnt = @pUniqAgentCode and
           c.locationID = splc.locationid )
         
       
    
        if (@Cntr > 0)
            return 1

        set @Cntr = (Select Count(*) from dbo.LeaseDealContact where
           contactId = @ContactID) 
           
        If (@Cntr > 0) 
           return 1 
       
        
	/*
	IF EXISTS( SELECT rowid FROM PRSDATA.dbo.AgentLookup with( index= ndx_agentLookup_uniqagnt)
	  Where Uniq_Agnt = @pUniqAgentCode AND	AgentType IN( 'F','L','Q','R' ))
		SET @Located = 1;
	
	IF EXISTS( SELECT AgentU_1 From PrsData.dbo.Co_Avl Where AgentU_1 = @pUniqAgentCode )
		Set @Located = 1
	ELSE IF EXISTS( SELECT AgentU_2 From	PrsData.dbo.Co_Avl Where AgentU_2 = @pUniqAgentCode )
		Set @Located = 1
	ELSE IF EXISTS( SELECT AGentU_3 From PrsData.dbo.Co_Avl Where AgentU_3 = @pUniqAgentCode )
		Set @Located = 1
	ELSE IF EXISTS( SELECT AgentU_4 From PrsData.dbo.Co_Avl Where AgentU_4 = @pUniqAgentCode )
		Set @Located = 1
	ELSE IF EXISTS( SELECT AgentU_5 From PrsData.dbo.Co_Avl v Where AgentU_5 = @pUniqAgentCode )
		Set @Located = 1
	*/	
	Return 0
         
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsCompanyAClient]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnIsCompanyAClient]
(
	@pLocationId INT = NULL, -- Optional, but returns 0 if LocationID is NULL.
	@pAsOfDate DATETIME -- Required
)
RETURNS	BIT  AS  

/******************************************************************************
*	Name: fnIsCompanyAClient
*	Desc: Returns a 0 or 1 if the specified LocationID is or is not a CoStar client.
*
*       Note:  A company is considered to be a client if they contribute to
*              CoStar revenue.  There are certain products which don't
*              contribute to revenue such as Key Token, Installation Fee, and
*              NRB Shipping.  Therefore, just because a company is billed for
*              all or any of these products, does not make them a CoStar client.
* 
*	Currently, this function is referenced by the following SPs:
*
*		spContactLocationHistoryGet
*		spGrpCustAccountValue
*		spGrpCustNotContacted
*		spGrpCustNotQualityContacted
*		spGrpSalesAccountSummary
*
*
*	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*	C A R E F U L L Y   N O T E :
*
*       Changes made to this function should also be made in resCompanyGet.
*       Two code sets exist to determine whether or not Locations are clients,
*       based upon the need to use an in-line function (slower performance) or
*	set-oriented logic (faster performance).
*
*	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*
*
*
* UPDATES:
* DATE		AUTHOR	PURPOSE
* ----------	------	------------------------------------------------------
* 02/02/2002	SV	Creation.
* 04/26/2002	TGB	Inner Join to LineItemStatus table was removed.
* 05/30/2002	TGB	Added no lock table hint to LineItem table.
* 06/07/2002	DMM	Added "dbo" as prefix to LineItem table.
* 06/08/2005	EKO	Added logic to determine clients of NRB product.  This
*			was overlooked, but it should have been included in
*			the NRB data load and software release on 03/28/2005.
*			Added parameter @pAsOfDate since function must consider
*			datetime for NRB clients.  Refer to TD_CRM Defect 5729.
* 08/31/2005    EKO	Only customers receiving a deliverable product should
*			be returned.  NRB Shipping and Installation Fee are
*			not deliverable products.
* 10/20/2005    EKO	Added Key Tokens to the list of products which do not
*			contribute to revenue - they are considered to be a
*			one-time fee.  Also eliminated hard-coded ProductIDs.
******************************************************************************/

BEGIN
	DECLARE @ReturnValue BIT

	IF @pLocationId IS NULL 
		RETURN 0

	IF EXISTS (
		-- Determine Active, non-NRB Customers who purchased a receivable, non-NRB Product.
		SELECT 1
		FROM dbo.Lineitem AS li WITH (NOLOCK)

		-- The following join has been constructed to eliminate the hard-coding of ProductIDs and should return all ProductIDs EXCEPT:
		-- 25=Installation Fee; 33=Key Token; 49=NRB Reports; 50=NRB Shop Ctr Dir on CD; 51=NRB SCD/NRB Online Subscr; 52=NRB Retail Real Estate; 53=NRB Value Reseller DB; 54=NRB Shipping; 55=NRB SCD Print Dir; 56=NRB Data License
		INNER JOIN dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.IsReceivableProductFlag = 1 AND
			p.ProductName NOT LIKE 'NRB %'
		WHERE
			li.SiteLocationId = @pLocationId AND
			li.LineitemStatusId IN ( 1, 2, 3 ) AND -- 1=Active; 2=Fulfill Only; 3=Bill Only
			li.LineitemTypeID = 1 -- 1=Subscription

		-- Union All was chosen for performance reasons (no need for a distinct list),
		-- besides, the existence test will pull the first record meeting the specified criteria.
		UNION ALL

		-- Determine Active/Terminated NRB Customers who purchased an receivable, NRB product within the past year.
		SELECT 1
		FROM dbo.Lineitem AS li WITH (NOLOCK)

		-- The following join has been constructed to eliminate the hard-coding of ProductIDs and should return:
		-- 49=NRB Reports; 50=NRB Shop Ctr Dir on CD; 51=NRB SCD/NRB Online Subscr; 52=NRB Retail Real Estate; 53=NRB Value Reseller DB; 55=NRB SCD Print Dir; 56=NRB Data License
		INNER JOIN dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.IsReceivableProductFlag = 1 AND
			p.ProductName LIKE 'NRB %'
		WHERE
			li.SiteLocationId = @pLocationId AND
			li.LineitemStatusId IN ( 1, 2, 3, 5 ) AND -- 1=Active; 2=Fulfill Only; 3=Bill Only; 5=Terminate
			li.BillingStartDate >= DATEADD(YY, -1, CAST(CONVERT(VARCHAR(25), @pAsOfDate, 101) AS DATETIME)) -- NRB Product purchased within the past year.  BillingStartDate approved by S. Russell.

	)
	BEGIN
		SET @ReturnValue = 1
	END

	ELSE

	BEGIN
		SET @ReturnValue = 0
	END

	RETURN @ReturnValue
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsCompPropertyOnMarketFlag]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create Function dbo.fnIsCompPropertyOnMarketFlag
CREATE FUNCTION [dbo].[fnIsCompPropertyOnMarketFlag]
(
  @pCompID   Int
)
  Returns  Bit
As
/*
===================================================================================================
Purpose:      The aim of this function is to return "TRUE" if there is at least 1 property tied to 
              a specific comp that is currently on the market for sale.

History:      RBM 20060802 Creation
              RBM 20060817 Look for comps that are for sale as well..
              RBM 20060818 Take max since multiple records can come back, some entities on market and other not.
              RBM 20060829 Check to see if the condo or property is currently for sale (i.e. is not
                          off the market "fsp/c.DateOffMarket Is Null")
===================================================================================================
*/
Begin
  
  Declare @IsCompPropertyOnMarketFlag Bit

  Declare @CONDO_UNIT_ENTITY Int; Set @CONDO_UNIT_ENTITY = 2
  Declare @PROPERTY_ENTITY   Int; Set @PROPERTY_ENTITY   = 1


  Select @IsCompPropertyOnMarketFlag = Max(
            Case
              When fsp.DateOnMarket <= c.SoldDate And (fsp.DateOffMarket Is Null) Then 1
              When fsc.DateOnMarket <= c.SoldDate And (fsc.DateOffMarket Is Null) Then 1
              Else 0
            End
        )
  From dbo.CompEntity           ce  (NoLock)
  Join dbo.Comp                 c   (NoLock) on ce.CompID           = c.CompID
  Left Join dbo.PropertyForSale pfs (NoLock) on pfs.PropertyID      = ce.PropertyID
                                            And ce.SaleEntityTypeID = @PROPERTY_ENTITY
  Left Join dbo.ForSale         fsp (NoLock) on fsp.ForSaleID       = pfs.ForSaleID
  Left Join dbo.CondoForSale    cfs (NoLock) on cfs.CondoUnitID     = ce.EntityID
                                            And ce.SaleEntityTypeID = @CONDO_UNIT_ENTITY
  Left Join dbo.ForSale         fsc (NoLock) on fsc.ForSaleID       = cfs.ForSaleID

  Where ce.CompID = @pCompID                                                                     
  
  Return IsNull(@IsCompPropertyOnMarketFlag,0)

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsContactHQChanging]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Used when changing a contact's location.  Returns true if the contact is moving to a location which
-- has a different HQ.
CREATE FUNCTION [dbo].[fnIsContactHQChanging] ( @pLocationIDOld int, @pLocationIDNew int ) Returns Bit        
BEGIN
 
	DECLARE @HQLocationIDOld int
	DECLARE @HQLocationIDNew int
	DECLARE @rtn bit
		
	SELECT @HQLocationIDOld = l.HQLocationID 
		FROM dbo.Location l (nolock) WHERE l.LocationID = @pLocationIDOld
	IF @@ERROR <> 0 RETURN 0

	SELECT @HQLocationIDNew = HQLocationID FROM dbo.Location (nolock) WHERE LocationID = @pLocationIDNew
	IF @@ERROR <> 0 RETURN 0

	IF isNull(@HQLocationIDOld,-1) = isNull (@HQLocationIDNew,-1)
		SET @rtn = 0
	ELSE
		SET @rtn = 1
		
	RETURN @RTN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsCoStarEmail]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnIsCoStarEmail]( @pEmailAddress VARCHAR(100) ) RETURNS BIT

AS

/******************************************************************************
** Name: fnIsCoStarEmail
** Desc: Returns true if the supplied email address is a Costar email address
** DATE		WHO	WHAT
** ----------	-------	---------------------------------------------
** 04/12/2011	EKO	<MAJOR UPDATE>
**			Re-wrote function to reference new table called, CoStarEmailDomain, so as
**			avoid having to hardcode e-mail domains as new companies are acquired by CoStar.
**			Refer to TFS # 25246.
*******************************************************************************/

BEGIN
	DECLARE @IsCoStarEmailAddressFlag BIT


	-- Initialize and clean local variables.
	SELECT
		@pEmailAddress = ISNULL(LTRIM(RTRIM(@pEmailAddress)), ''), -- Intercept NULLs so they can be evaluated.
		@IsCoStarEmailAddressFlag = 0 -- Assume it's a non-CoStar Email Address


	-- Determine if email address falls under CoStar's various domains.
	IF EXISTS (
		SELECT 1
		FROM dbo.CoStarEmailDomain WITH (NOLOCK)
		WHERE
			@pEmailAddress LIKE '%@' + CoStarEmailDomainName )
	BEGIN
		SET @IsCoStarEmailAddressFlag = 1 -- A CoStar Email Address
	END

	RETURN @IsCoStarEmailAddressFlag
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsCountrySubjectToValidation]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnIsCountrySubjectToValidation] (@pCountryCode char(3) )
RETURNS bit
AS
/******************************************************************************
**  Name: fnIsCountrySubjectToValidation
**  
**  Desc: Returns whether the supplied country is subject to validation rules
**
**
**  Originally Created by DMM
**  02/04/2012 VS GBR should not enabled at this time. Rolling back this change. May need to be enabled later.
*******************************************************************************/
BEGIN
	DECLARE @rtn bit
	SET @rtn = 0
	IF @pCountryCode in ('USA')
		SET @rtn = 1
	return @rtn
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsDaylightSavingsTime]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************
 TFS 19411 
-- Determines whether the current date is in DayLights savings time (US Only) 

**************************************************************************/ 

CREATE Function [dbo].[fnIsDaylightSavingsTime](@currentdatetime DateTime) Returns Bit        
BEGIN
	DECLARE @rtn bit
	SET @rtn = 0
	--- GEt the Sunday of the scond week in March
	
	declare @DTSStartWeek smallDateTime 
	Declare @DTSEndWeek smalldateTime 
	
	
    declare @Year varChar(4) 
    set @year = Datepart(yyyy,@currentdatetime)

	/*******************************************************************
	*  daylights savings starts on the second Sunday in March at 2:00am 
	**********************************************************************/ 
	
    set @DTSStartWeek = '03/01/' + convert(varchar,@Year)
    select @dtsstartWeek = case datepart(dw,@DTSStartWeek)
                             when 1 then 
                             dateadd(hour,170,@DTSStartWeek)
                             when 2 then
                             dateadd(hour,314,@DTSStartWeek)
                             when 3 then 
                             dateadd(hour,290,@DTSStartWeek)
                             when 4 then 
                             dateadd(hour,266,@DTSStartWeek)
                             when 5 then 
                             dateadd(hour,242,@DTSStartWeek)
                             when 6 then 
                             dateadd(hour,218,@DTSStartWeek)
                             when 7 then
                             dateadd(hour,194,@DTSStartWeek)
                             end 
     
     /*******************************************************************
	*  daylights ends on the first Sunday in November 
	**********************************************************************/ 
     

     	set @DTSEndWeek = '11/01/' + convert(varchar,@Year)
	  select @dtsEndWeek = 	case datepart(dw,dateadd(week,1,@DTSEndWeek))	
							when 1 then
							dateadd(hour,2,@DTSEndWeek)
							when 2 then
							dateadd(hour,146,@DTSEndWeek)
							when 3 then
							dateadd(hour,122,@DTSEndWeek)
							when 4 then
							dateadd(hour,98,@DTSEndWeek)
							when 5 then 
							dateadd(hour,74,@DTSEndWeek)
							when 6 then 
							dateadd(hour,50,@DTSEndWeek)
							when 7 then 
							dateadd(hour,26,@DTSEndWeek)
							end
 
	    
	if @currentdatetime > @DTSStartWeek and 
	   @currentdatetime < @dtsEndweek 
	  Set @RTN =  1 
	else 
	  set @RTN = 0     
	   
	   
   Return @RTN 	   
	
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsFieldResearchUser]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Determines whether the supplied ContactID is in Field Research  
/*    
Here are the permission groups that return True  
5 ResearchManager   
29 ResearchDirector   
32 Field Research   
*/  
CREATE   Function [dbo].[fnIsFieldResearchUser] ( @pContactID int) Returns Bit          
BEGIN  
 DECLARE @rtn bit  
 SET @rtn = 0  
 -- VS 3/5/2010 This function returns 1 if the contact ID is part of Field Research, Field Research manager, Research director
 IF EXISTS (SELECT pm.MemberContactId FROM dbo.PermissionGroupMember pm with (nolock)  
  INNER JOIN dbo.PermissionGroup pg with (nolock) ON pm.PermissionGroupId = pg.PermissionGroupId  
  WHERE pm.MemberContactId = @pContactId AND pg.IsActiveFlag = 1  
  and  pg.PermissionGroupID in  (5,29,32))    
   SET @rtn = 1   
 RETURN @RTN  
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsManager]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	FUNCTION [dbo].[fnIsManager] (@pContactID INT) 
RETURNS BIT AS

/******************************************************************************            
          
* Name: fnIsManager           
* Desc: Determines whether the supplied ContactID is a manager    
*            
          
******************************************************************************/     

BEGIN
	DECLARE @rtn BIT

	SET @rtn = 0

	IF EXISTS 
		(
			SELECT pm.MemberContactId FROM dbo.PermissionGroupMember pm WITH(NOLOCK)
				INNER JOIN dbo.PermissionGroup pg WITH(NOLOCK) ON pm.PermissionGroupId = pg.PermissionGroupId
			WHERE	pm.MemberContactId = @pContactId
				AND	pg.Manager = 1 
				AND pg.IsActiveFlag = 1
		)	
	BEGIN	
		SET @rtn = 1	
	END

	RETURN @rtn

END

/*        
--test        
Select dbo.fnIsManager(2313605) as IsManager
Select dbo.fnIsManager(2073164) as IsManager    
*/

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsReallyInteger]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnIsReallyInteger]  
(  
    @num VARCHAR(64)  
)  
RETURNS BIT  
BEGIN  
    IF LEFT(@num, 1) = '-'  
        SET @num = SUBSTRING(@num, 2, LEN(@num))  
 
    RETURN CASE  
    WHEN PATINDEX('%[^0-9-]%', @num) = 0  
        AND CHARINDEX('-', @num) <= 1  
        AND @num NOT IN ('.', '-', '+', '^') 
        AND LEN(@num)>0  
        AND @num NOT LIKE '%-%' 
    THEN  
        1  
    ELSE  
        0  
    END  
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsResearchDirector]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--------------------------------------------------------------------------------------------------
-- File: E:\COSTARPROJECTS\COSTARINTERNALAPPS\MAIN\ENTERPRISE\SOURCE\CRM.WS.Database\CRM.WS.DB.Contacts\Functions\fnIsResearchDirector.sql
-- Determines whether the supplied ContactID is a Research manager
/*  
Here are the permission groups that return True
16	SeniorExecutive	
29	ResearchDirector	
30	ResearchCenterDirector	
*/
CREATE function [dbo].[fnIsResearchDirector] ( @pContactID int) Returns Bit        /* CRM Version 7.0.0.1022 */
BEGIN
	DECLARE @rtn bit
	SET @rtn = 0
	IF EXISTS (SELECT pm.MemberContactId FROM dbo.PermissionGroupMember pm with (nolock)
		INNER JOIN dbo.PermissionGroup pg with (nolock) ON pm.PermissionGroupId = pg.PermissionGroupId
		WHERE	pm.MemberContactId = @pContactId AND pg.IsActiveFlag = 1
		
		and		pg.PermissionGroupID in  (16,29,30))		
			SET @rtn = 1	
	RETURN @RTN
END




GO
/****** Object:  UserDefinedFunction [dbo].[fnIsResearchManager]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Determines whether the supplied ContactID is a Research manager
/*  
Here are the permission groups that return True
5	ResearchManager	
16	SeniorExecutive	
29	ResearchDirector	
30	ResearchCenterDirector	

HH  11/07/2016   TFS #380284 -  Make sure Super Users always has Research Manager permissions 
*/
CREATE FUNCTION [dbo].[fnIsResearchManager] ( @pContactID int) Returns Bit        
BEGIN
	DECLARE @rtn bit
	SET @rtn = 0
	IF EXISTS (SELECT pm.MemberContactId FROM dbo.PermissionGroupMember pm with (nolock)
		INNER JOIN dbo.PermissionGroup pg with (nolock) ON pm.PermissionGroupId = pg.PermissionGroupId
		WHERE	pm.MemberContactId = @pContactId AND pg.IsActiveFlag = 1
		-- DMM 04Feb2010 we really should come up with a more data-driven approach than hard-coding the PermissionGroupID values.
		-- (for example:  Add an IsResearchFlag to the permission table)
		and		pg.PermissionGroupID in  (5,16,29,30))		
     
			SET @rtn = 1	
    IF EXISTS (Select 1 from dbo.Permission where 
	            permissionID = @pContactId and 
				PermissionType = 'U' and 
				SecurityArea = 'SuperUser' and 
				PermissionValue = 2) 
          SET @rtn= 1
	RETURN @RTN
END



GO
/****** Object:  UserDefinedFunction [dbo].[fnIsSubscriber]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Returns true if the supplied contact or user has an active subscription to the supplied product
CREATE FUNCTION [dbo].[fnIsSubscriber] (@pProductId int, @pContactId int = null, @pUserId int = null)
RETURNS	BIT  AS  
BEGIN
	DECLARE @rtn BIT;
	SET @rtn = 0
	IF @pUserId IS NOT NULL BEGIN
		IF EXISTS (SELECT li.LineItemId FROM dbo.WebSubscriptions ws with (Nolock)
						JOIN dbo.LineItem li with (nolock) ON ws.LineItemId = li.LineItemId
						WHERE ws.UserId = @pUserId AND ws.DisableSubscription = 0 
						AND li.LineItemStatusId IN (1,2,3) AND li.ProductId = @pProductId)
		SET @rtn = 1
	END
	ELSE IF @pContactId IS NOT NULL BEGIN
		IF EXISTS (SELECT li.LineItemId FROM dbo.WebUsers wu with (nolock)
						JOIN dbo.WebSubscriptions ws with (Nolock) ON wu.UserId = ws.UserId
						JOIN dbo.LineItem li with (nolock) ON ws.LineItemId = li.LineItemId
						WHERE wu.UserContactId = @pContactId AND ws.DisableSubscription = 0 
						AND li.LineItemStatusId IN (1,2,3) AND li.ProductId = @pProductId)
			SET @rtn = 1
	END
 	RETURN @rtn
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsTrueOwner]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnIsTrueOwner] (@pLocationID int)
Returns bit
As
/*******************************************************
Author: Rakhi Bhatia
Date: July 14, 2009
Description:
This function is used to check if a particular LocationID
is marked as TrueOwner (if LocationID is present in PropertyContact table)
or TrueBuyer/Seller (if LocationID is present in CompContact table)
It returns a value of True(1) if found to be a True Owner/Buyer/Seller
It returns a value of False(0) if NOT found to be a True Owner/Buyer/Seller
=====================================================
Date			WhoUpdated		Description	
=====================================================
14thh Jul 2009	Rakhi Bhatia	Created.  TFS# 16036
4th Aug 2009	EJH				Converted SQL to use Indexed views.

********************************************************/

Begin
	Declare @IsTrueOwner bit
	
	If Exists (
			Select top 1 1
			From dbo.vwCompContactContact 
			where LocationID = @pLocationID 
		union
			Select top 1 1
			from dbo.vwPropertyContactContact
			Where LocationID = @pLocationID
		union
			Select top 1 1
			from dbo.vwCompContactContactRole
			Where LocationID = @pLocationID
		union
			Select top 1 1
			from dbo.vwPropertyContactContactRole
			Where LocationID = @pLocationID
		)
		set @IsTrueOwner = 1
	Else
		set @IsTrueOwner = 0
							
	Return @IsTrueOwner
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsUserLockedOut]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnIsUserLockedOut] ( 
 @pLockOutStartDate DateTime = null 
,@pLockOutDurationMinutes int = null
,@pCurrentDateTime DateTime		-- Can't use getDate() within a function so must pass it in
)
RETURNS	BIT  AS  
BEGIN
	DECLARE @ReturnValue BIT;
 	SELECT @ReturnValue = 	
 		CASE	WHEN @pLockOutStartDate IS NULL OR @pLockOutDurationMinutes IS NULL THEN 0
				WHEN DateDiff (minute, @pLockOutStartDate, @pCurrentDateTime) < @pLockOutDurationMinutes
				AND	 DateDiff (minute, @pLockOutStartDate, @pCurrentDateTime) >= 0 THEN 1 ELSE 0 END
	RETURN @ReturnValue
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsValidEmail]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------------
-- File: c:\CoStarProjects\CRM.WS.Database\CRM.WS.DB.Newsletter\Functions\fnIsValidEmail.sql
CREATE FUNCTION [dbo].[fnIsValidEmail] (@address varchar(255))
RETURNS bit 

BEGIN 
	DECLARE @local varchar(500) 
	DECLARE @domain varchar(500)

	IF (CHARINDEX('@',@address) = 0 OR CHARINDEX('@',@address) = 1) 
	BEGIN 
		RETURN 0 
	END 

	SET @local = LEFT(@address, CHARINDEX('@',@address) - 1 ) 
	SET @domain = RIGHT(@address, LEN(@address) - CHARINDEX('@',@address)) 

	IF CHARINDEX('.',@domain) = 0 
	BEGIN 
		RETURN 0 
	END 

	IF LEFT(@local,1) <> '"' AND RIGHT(@local,1) <> '"' 
	BEGIN 
		IF PATINDEX('%[^a-z0-9!#{}&%`|+_/$=-?~''.^^\-]%',LOWER(@local)) <> 0 
		BEGIN 
			RETURN 0 
		END 
	END 
	ELSE 
	BEGIN 
		IF CHARINDEX('\',@local) <> 0 
		BEGIN 
			RETURN 0 
		END 
	END 

	IF LEN(@local) > 64 
	BEGIN 
		RETURN 0 
	END 

	IF PATINDEX('%[^a-z0-9-.]%', LOWER(@domain)) <> 0 
	BEGIN 
		RETURN 0 
	END 

	IF LEN(LEFT(REVERSE(@domain),CHARINDEX('.',REVERSE(@domain)))) NOT BETWEEN 2 AND 4 
	BEGIN 
		RETURN 0 
	END
 
	RETURN 1 
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsValidResearcher]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnIsValidResearcher](@ContactID int)
RETURNS bit
AS
BEGIN
	DECLARE @IsValidResearcher bit=0
	DECLARE @PropertyResRole int
		, @CompleteResRole int
		, @PropertyResDept int
	SELECT @PropertyResRole=4
		, @CompleteResRole=40
		, @PropertyResDept=19
		
	IF EXISTS (SELECT 1 FROM dbo.CostarContact cc (NOLOCK)
				WHERE
					cc.ContactId=@ContactID
					AND cc.Status=1 --active
					AND cc.IsApplyMetricsFlag=1
					AND isnull(cc.ResearcherExclusionEndDate,'1910-01-01') < GETDATE()
					AND cc.RoleID IN (@PropertyResRole,@CompleteResRole)
					AND cc.DeptID = @PropertyResDept
				)
		SET @IsValidResearcher=1
	RETURN @IsValidResearcher
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnIsVowel]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnIsVowel]( @c char(1) )
RETURNS bit
AS
BEGIN
	IF (@c = 'A') OR (@c = 'E') OR (@c = 'I') OR (@c = 'O') OR (@c = 'U') OR (@c = 'Y') 
	BEGIN
		RETURN 1
	END
	--'ELSE' would worry SQL Server, it wants RETURN last in a scalar function
	RETURN 0
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnLeadResultDetailGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fnLeadResultDetailGet]
	(
		  @pListingChangeID				int = null
		, @pPropertyID					int = null
		, @pResearcherContactID			int = null
		, @pIncludeChangedListings		bit = 0 --by default, only return Listings Added/Removed. Don't include Changed listings
		, @pIncludeMismatched			bit = 0 --by default, only return changes matched on matched PropertyID. Don't match on ResolvedPropertyID
		, @pResolvedDays				tinyint = 1 --1 day between resolved date
	)
	RETURNS @ResolvedItems TABLE
	(
	 ListingScrapeID int
	,ListingChangeID int
	,PropertyId int
	,ResolvedByContactID int
	,DateResolved datetime
	,EntityId int
	,EntityName varchar(255)
	,EntityType varchar(255)
	,EntityCreatedUpdatedDate datetime
	,ActionResult varchar(1000)
	,ActionType varchar(50)
	)
	AS 
	BEGIN
		--First get all the ResearcherContactIDs who resolved ActionItems,the Properties that were resolved, the ResolvedDates
		DECLARE @ActionItemsResolved TABLE
			( ActionItemsResolvedID int IDENTITY(1,1)
			, ListingScrapeID int
			, PropertyID int
			, ListingChangeID int
			, ResolvedByContactID int
			, DateResolved datetime
			)
			
			INSERT INTO @ActionItemsResolved 
			(ListingScrapeID, PropertyID, ListingChangeID, ResolvedByContactID, DateResolved)
			SELECT
				  lsc.ListingScrapeID
				, PropertyID=(CASE WHEN @pIncludeMismatched=1 THEN ISNULL(lc.ResolvedPropertyID,lsc.PropertyID)
										ELSE lsc.PropertyID
								END)
				, lc.ListingChangeID
				, lc.ResolvedByContactID
				, lc.ResolvedDate
			FROM
				dbo.ListingScrape lsc (nolock)
				JOIN dbo.ListingChange lc (nolock) ON lsc.ListingScrapeID=lc.ListingScrapeID
			WHERE
				lc.ResolvedDate is not null
				AND 
				(
					(@pListingChangeID>0 AND lc.ListingChangeID=@pListingChangeID)
					OR
					(@pPropertyID IS NOT NULL AND @pResearcherContactID IS NOT NULL AND
					 lsc.PropertyID IS NOT NULL AND lc.ResolvedByContactID IS NOT NULL AND
					 lc.ResolvedByContactID=@pResearcherContactID
					 AND lsc.PropertyID=@pPropertyID
					)
				)

		DECLARE @ActionItemsResolvedByProperty TABLE
		( ActionItemsResolvedByPropertyID int IDENTITY(1,1)
		, ActionItemsResolvedID int
		, PropertyID int
		, ResolvedByContactID int
		, DateResolved date
		, ResolvedLastDay date)

		--Now using the PropertyIDs, the DateResolved and the ResolvedByContactIDs above, find all the transactions/listings that were added/updated that day
		INSERT INTO @ActionItemsResolvedByProperty
		(PropertyID, ActionItemsResolvedID, ResolvedByContactID, DateResolved)
		SELECT DISTINCT PropertyID, ActionItemsResolvedID, ResolvedByContactID, CAST(DateResolved as date) as DateResolved
		FROM @ActionItemsResolved
		
		UPDATE @ActionItemsResolvedByProperty SET ResolvedLastDay=dateadd(dd,@pResolvedDays,DateResolved)
		
		DECLARE @ActionResult TABLE (
		  ActionResultID int IDENTITY(1,1)
		, EntityID int
		, EntityName varchar(255)
		, EntityType varchar(50)
		, EntityCreatedUpdatedDate datetime
		, ActionResult varchar(255)
		, ActionType varchar(50)
		, ActionItemsResolvedByPropertyID int)
		
		/************************************ LISTINGS ***************************/
			--SpaceForLease records created 
				INSERT INTO @ActionResult
				(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
				SELECT DISTINCT
					  sfl.SpaceForLeaseID
					, EntityName='SpaceForLease'
					, EntityType='Listing'
					, sfl.CreatedDate
					, ActionResult='New Space for Lease'
					, ActionType='Add'
					, ai.ActionItemsResolvedByPropertyID
				FROM 
					dbo.SpaceForLease sfl (nolock) 
					JOIN dbo.PropertyFloor pf (nolock) on sfl.PropertyFloorID=pf.PropertyFloorID
					JOIN @ActionItemsResolvedByProperty ai ON pf.PropertyID=ai.PropertyID
				WHERE
					sfl.CreatedByContactID=ai.ResolvedByContactID
					AND sfl.CreatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay

			--LandForLEase records created 
				INSERT INTO @ActionResult
				(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
				SELECT DISTINCT
					  lfl.LandForLeaseID
					, EntityName='LandForLease'
					, EntityType='Listing'
					, lfl.CreatedDate
					, ActionResult='New Land for Lease'
					, ActionType='Add'
					, ai.ActionItemsResolvedByPropertyID
				FROM 
					dbo.LandForLease lfl (nolock) 
					JOIN @ActionItemsResolvedByProperty ai ON lfl.PropertyID=ai.PropertyID
				WHERE
					lfl.CreatedByContactID=ai.ResolvedByContactID
					AND lfl.CreatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay

			--SpaceForLease records updated 
				INSERT INTO @ActionResult
				(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
				SELECT DISTINCT
					  sfl.SpaceForLeaseID
					, EntityName='SpaceForLease'
					, EntityType='Listing'
					, sfl.UpdatedDate
					, ActionResult='Updated Space for Lease'
					, ActionType='Update'
					, ai.ActionItemsResolvedByPropertyID
				FROM 
					dbo.SpaceForLease sfl (nolock) 
					JOIN dbo.PropertyFloor pf (nolock) on sfl.PropertyFloorID=pf.PropertyFloorID
					JOIN @ActionItemsResolvedByProperty ai ON pf.PropertyID=ai.PropertyID
					--if the same SpaceForLease record has been included for the CREATE ActionResult don't include it again as an update
					LEFT JOIN @ActionResult ar ON sfl.SpaceForLeaseID=ar.EntityID AND ar.EntityName='SpaceForLease'
				WHERE
					sfl.UpdatedByContactID=ai.ResolvedByContactID
					AND sfl.UpdatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay
					AND ar.ActionResultID IS NULL --make sure it is not already included in the CREATE Action result

			--LandForLease records updated
				INSERT INTO @ActionResult
				(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
				SELECT DISTINCT
					  lfl.LandForLeaseID
					, EntityName='LandForLease'
					, EntityType='Listing'
					, lfl.UpdatedDate
					, ActionResult='Updated Land for Lease'
					, ActionType='Update'
					, ai.ActionItemsResolvedByPropertyID
				FROM 
					dbo.LandForLease lfl (nolock) 
					JOIN @ActionItemsResolvedByProperty ai ON lfl.PropertyID=ai.PropertyID
					--if the same LandForLease record has been included for the CREATE ActionResult don't include it again as an update
					LEFT JOIN @ActionResult ar ON lfl.LandForLeaseID=ar.EntityID AND ar.EntityName='LandForLease'
				WHERE
					lfl.UpdatedByContactID=ai.ResolvedByContactID
					AND lfl.UpdatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay
					AND ar.ActionResultID IS NULL --make sure it is not already included in the CREATE Action result

			--Find ForSale records created
				--PropertyForSale
				INSERT INTO @ActionResult
				(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
				SELECT DISTINCT
					  EntityID=fs.ForSaleID 
					, EntityName='ForSale'
					, EntityType='Listing'
					, fs.CreatedDate
					, ActionResult='New For Sale'
					, ActionType='Add'
					, ai.ActionItemsResolvedByPropertyID
				FROM 
					dbo.ForSale fs (nolock)
					JOIN dbo.PropertyForSale pfs (nolock) ON fs.ForSaleID=pfs.ForSaleID
					JOIN @ActionItemsResolvedByProperty ai ON pfs.PropertyID=ai.PropertyID
					--if the same ForSale record has been included for the CREATE ActionResult don't include it again as an update
					LEFT JOIN @ActionResult ar ON fs.ForSaleID=ar.EntityID AND ar.EntityName='ForSale'
				WHERE
					fs.CreatedByContactID=ai.ResolvedByContactID
					AND fs.CreatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay
					AND ar.ActionResultID IS NULL --make sure it is not already included in the CREATE Action result
					
				--CondoForSale
				INSERT INTO @ActionResult
				(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
				SELECT DISTINCT
					  EntityID=fs.ForSaleID
					, EntityName='ForSale'
					, EntityType='Listing'
					, fs.CreatedDate
					, ActionResult='New For Sale'
					, ActionType='Add'
					, ai.ActionItemsResolvedByPropertyID
				FROM 
					dbo.ForSale fs (nolock)
					JOIN dbo.CondoForSale cfs (nolock) ON fs.ForSaleID=cfs.ForSaleID
					JOIN dbo.CondoUnit cu (nolock) ON cfs.CondoUnitID=cu.CondoUnitID
					JOIN @ActionItemsResolvedByProperty ai ON cu.PropertyID=ai.PropertyID
					--if the same ForSale record has been included for the CREATE ActionResult don't include it again as an update
					LEFT JOIN @ActionResult ar ON fs.ForSaleID=ar.EntityID AND ar.EntityName='ForSale'
				WHERE
					fs.CreatedByContactID=ai.ResolvedByContactID
					AND fs.CreatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay
					AND ar.ActionResultID IS NULL --make sure it is not already included in the CREATE Action result
				
			--Find ForSale records updated
				--PropertyForSale
				INSERT INTO @ActionResult
				(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
				SELECT DISTINCT
					  EntityID=fs.ForSaleID 
					, EntityName='ForSale'
					, EntityType='Listing'
					, fs.UpdatedDate
					, ActionResult='Updated For Sale'
					, ActionType='Update'
					, ai.ActionItemsResolvedByPropertyID
				FROM 
					dbo.ForSale fs (nolock)
					JOIN dbo.PropertyForSale pfs (nolock) ON fs.ForSaleID=pfs.ForSaleID
					JOIN @ActionItemsResolvedByProperty ai ON pfs.PropertyID=ai.PropertyID
					--if the same PropertyForSale record has been included for the CREATE ActionResult don't include it again as an update
					LEFT JOIN @ActionResult ar ON fs.ForSaleID=ar.EntityID AND ar.EntityName='ForSale'
				WHERE
					fs.UpdatedByContactID=ai.ResolvedByContactID
					AND fs.UpdatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay
					AND ar.ActionResultID IS NULL --make sure it is not already included in the CREATE Action result
				--CondoForSale
				INSERT INTO @ActionResult
				(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
				SELECT DISTINCT
					  EntityID=fs.ForSaleID
					, EntityName='ForSale'
					, EntityType='Listing'
					, fs.UpdatedDate
					, ActionResult='Updated For Sale'
					, ActionType='Update'
					, ai.ActionItemsResolvedByPropertyID
				FROM 
					dbo.ForSale fs (nolock)
					JOIN dbo.CondoForSale cfs (nolock) ON fs.ForSaleID=cfs.ForSaleID
					JOIN dbo.CondoUnit cu (nolock) ON cfs.CondoUnitID=cu.CondoUnitID
					JOIN @ActionItemsResolvedByProperty ai ON cu.PropertyID=ai.PropertyID
					--if the same CondoForSale record has been included for the CREATE ActionResult don't include it again as an update
					LEFT JOIN @ActionResult ar ON fs.ForSaleID=ar.EntityID AND ar.EntityName='ForSale'
				WHERE
					fs.UpdatedByContactID=ai.ResolvedByContactID
					AND fs.UpdatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay
					AND ar.ActionResultID IS NULL --make sure it is not already included in the CREATE Action result
				
		/****************************** TRANSACTIONS **************************/
		--Find Comp records created
			INSERT INTO @ActionResult
			(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
			SELECT
				  EntityID=c.CompID
				, EntityName='Comp'
				, EntityType='Transaction'
				, c.CreatedDate
				, ActionResult='New Sale Comp'
				, ActionType='Add'
				, ai.ActionItemsResolvedByPropertyID
			FROM 
				dbo.Comp c (NOLOCK)
				JOIN dbo.CompEntity ce (NOLOCK) ON c.CompID=ce.CompID		
				JOIN @ActionItemsResolvedByProperty ai ON ce.PropertyID=ai.PropertyID
			WHERE
				c.CreatedByContactID=ai.ResolvedByContactID
				AND c.CreatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay
				
		--Find Comp records updated
			INSERT INTO @ActionResult
			(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
			SELECT DISTINCT
				  EntityID=c.CompID
				, EntityName='Comp'
				, EntityType='Transaction'
				, c.UpdatedDate
				, ActionResult='Updated Sale Comp'
				, ActionType='Update'
				, ai.ActionItemsResolvedByPropertyID
			FROM 
				dbo.Comp c (NOLOCK)
				JOIN dbo.CompEntity ce (NOLOCK) ON c.CompID=ce.CompID		
				JOIN @ActionItemsResolvedByProperty ai ON ce.PropertyID=ai.PropertyID
				--if the same Comp record has been included for the CREATE ActionResult don't include it again as an update
				LEFT JOIN @ActionResult ar ON c.CompID=ar.EntityID AND ar.EntityName='Comp'
			WHERE
				c.UpdatedByContactID=ai.ResolvedByContactID
				AND c.UpdatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay
				AND ar.ActionResultID IS NULL --make sure it is not already included in the CREATE Action result
				
		--Find LeaseComp records created
			INSERT INTO @ActionResult
			(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
			SELECT
				  EntityID=ld.LeaseDealID
				, EntityName='LeaseDeal'
				, EntityType='Transaction'
				, ld.CreatedDate
				, ActionResult='New Lease Comp'
				, ActionType='Add'
				, ai.ActionItemsResolvedByPropertyID
			FROM 
				dbo.LeaseDeal ld (NOLOCK)
				JOIN dbo.LocationOccupancyLeaseDeal lold (NOLOCK) ON ld.LeaseDealID=lold.LeaseDealID	
				JOIN dbo.LocationOccupancy lo (NOLOCK) ON lold.LocationOccupancyID=lo.LocationOccupancyID
				JOIN @ActionItemsResolvedByProperty ai ON lo.PropertyID=ai.PropertyID
			WHERE
				ld.CreatedByContactID=ai.ResolvedByContactID
				AND ld.CreatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay
				
		--Find LeaseComp records updated
			INSERT INTO @ActionResult
			(EntityID,EntityName,EntityType,EntityCreatedUpdatedDate,ActionResult,ActionType,ActionItemsResolvedByPropertyID)
			SELECT DISTINCT
				  EntityID=ld.LeaseDealID
				, EntityName='LeaseDeal'
				, EntityType='Transaction'
				, ld.UpdatedDate
				, ActionResult='Updated Lease Comp'
				, ActionType='Update'
				, ai.ActionItemsResolvedByPropertyID
			FROM 
				dbo.LeaseDeal ld (NOLOCK)
				JOIN dbo.LocationOccupancyLeaseDeal lold (NOLOCK) ON ld.LeaseDealID=lold.LeaseDealID	
				JOIN dbo.LocationOccupancy lo (NOLOCK) ON lold.LocationOccupancyID=lo.LocationOccupancyID
				JOIN @ActionItemsResolvedByProperty ai ON lo.PropertyID=ai.PropertyID
				--if the same LeaseDeal record has been included for the CREATE ActionResult don't include it again as an update
				LEFT JOIN @ActionResult ar ON ld.LeaseDealID=ar.EntityID AND ar.EntityName='LeaseDeal'
			WHERE
				ld.UpdatedByContactID=ai.ResolvedByContactID
				AND ld.UpdatedDate BETWEEN ai.DateResolved and ai.ResolvedLastDay
				AND ar.ActionResultID IS NULL --make sure it is not already included in the CREATE Action result

			INSERT INTO @ResolvedItems
					(ListingScrapeID
					,ListingChangeID
					,PropertyId
					,ResolvedByContactID
					,DateResolved
					,EntityId
					,EntityName
					,EntityType
					,EntityCreatedUpdatedDate
					,ActionResult
					,ActionType
					)
			SELECT
					 ListingScrapeID
					,ListingChangeID
					,PropertyId
					,ResolvedByContactID
					,DateResolved
					,EntityId
					,EntityName
					,EntityType
					,EntityCreatedUpdatedDate
					,ActionResult
					,ActionType
				FROM
				(
				SELECT
					 arr.ListingScrapeID
					,arr.ListingChangeID
					,arr.PropertyID
					,arr.ResolvedByContactID
					,arr.DateResolved
					,ar.EntityID
					,ar.EntityName
					,ar.EntityType
					,ar.EntityCreatedUpdatedDate
					,ar.ActionResult
					,ar.ActionType
					,PrimarySortOrder=(CASE WHEN EntityType='Transaction' THEN 1 ELSE 2 END)
					,SecondarySortOrder=(CASE WHEN ActionType='Add' THEN 1 ELSE 2 END)
				FROM
					@ActionResult ar
					JOIN @ActionItemsResolvedByProperty arp ON ar.ActionItemsResolvedByPropertyID=arp.ActionItemsResolvedByPropertyID
					JOIN @ActionItemsResolved arr ON arp.ActionItemsResolvedID=arr.ActionItemsResolvedID
				WHERE 
					(@pIncludeChangedListings=0 AND ar.ActionType NOT IN ('Update')) --Exclude updates for now
					OR (@pIncludeChangedListings=1) --Include everything
				
				)x
				ORDER BY ListingChangeID,PrimarySortOrder,SecondarySortOrder
		RETURN
	END

--select top 10 * from vwLeadDetail
--SELECT top 10 * FROM dbo.vwLeadDetail ld 
--outer apply dbo.fnLeadResultSummaryGet(ld.LeadID,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT) air 
--WHERE LeadStatus='Approved'
--order by PropertyID
--SELECT top 10 * FROM dbo.vwLeadDetail ld 
--outer apply dbo.fnLeadResultDetailGet(ld.LeadID,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT) air 
--WHERE LeadStatus='Approved'
--order by ld.PropertyID

GO
/****** Object:  UserDefinedFunction [dbo].[fnLeadResultSummaryGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE FUNCTION [dbo].[fnLeadResultSummaryGet]
	(
		  @pListingChangeID				int = null
		, @pPropertyID					int = null
		, @pResearcherContactID			int = null
		, @pIncludeChangedListings		bit = 0 --by default, only return Listings Added/Removed. Don't include Changed listings
		, @pIncludeMismatched			bit = 0 --by default, only return changes matched on matched PropertyID. Don't match on ResolvedPropertyID
		, @pResolvedDays				tinyint = 1 --1 day between resolved date
	)
	RETURNS @ResolvedItemsSummary TABLE
	(
		ListingChangeID int,
		EntityType varchar(255),
		ActionType varchar(50),
		TotalEntities int
	)
	AS
	BEGIN
		IF @pListingChangeID>0
		BEGIN
			INSERT INTO @ResolvedItemsSummary
			(ListingChangeID, EntityType, ActionType, TotalEntities)
			(SELECT
				 ListingChangeID
				,EntityType
				,ActionType
				,COUNT(EntityID) as TotalEntities
			FROM
				[dbo].[fnLeadResultDetailGet] (@pListingChangeID,NULL,NULL,@pIncludeChangedListings,@pIncludeMismatched,@pResolvedDays)
			 GROUP BY ListingChangeID,EntityType,ActionType
			)		
		END
		ELSE If @pPropertyID>0 AND @pResearcherContactID>0
		BEGIN
			INSERT INTO @ResolvedItemsSummary
			(ListingChangeID, EntityType, ActionType, TotalEntities)
			(SELECT
				 ListingChangeID
				,EntityType
				,ActionType
				,COUNT(EntityID) as TotalEntities
			FROM
				[dbo].[fnLeadResultDetailGet] (NULL,@pPropertyID,@pResearcherContactID,@pIncludeChangedListings,@pIncludeMismatched,@pResolvedDays)
			GROUP BY ListingChangeID,EntityType,ActionType
			)		
		END
			
		RETURN
	END

GO
/****** Object:  UserDefinedFunction [dbo].[fnLeaseDealDidUpdateColumn]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ed Hellyer
-- Create date: 12/20/2011
-- Description:	Determines if the column was updated in the LeaseDeal audit record
-- =============================================
CREATE FUNCTION [dbo].[fnLeaseDealDidUpdateColumn]
(
	@pLeaseDealAuditID bigint,
	@pColumnName varchar(255)
)
RETURNS bit
AS
BEGIN
	DECLARE @Result bit
	
	declare @UpdatedColumns varchar(max)
	
	set @UpdatedColumns = (
							select UpdateMask
							from [EnterpriseAuditing].dbo.LeaseDealAudit
							where LeaseDealAuditID = @pLeaseDealAuditID
							)

	if exists (
				select top 1 1 
				from dbo.fnStringTotable(@UpdatedColumns, '!') 
				where Value = @pColumnName)
	  begin 
		set @Result = 1
	  end
	else
	  begin 
		set @Result = 0
	  end

	RETURN @Result

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnLineItemDupCheck]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnLineItemDupCheck] (
  @pContractId					int 
, @pLineItemId					int = null
, @pDataSetId					int = null
, @pProductId					int = null
, @pSalesUnitId					int = null
, @pSiteLocationId				int = null
, @pLineItemStatusId				int = null
, @pBundleId					int = null
, @pProductVersionId				smallint = null
)

RETURNS		varchar(400)  AS 

/***************************************************************************************
*  SPName:  	fnLineItemDupCheck
*
*  Purpose:  	To check to see if line item is a duplicate.
*
*
* 2002/07/17	DMM	Procedure created.
*			Added business rule for lineItem insert/update and Contract approval.
*			If inserting/updating lineitem or approving contract, do not allow
*			a contract to have 2 (or more) lineitems with the same DataSet,
*			Product and Sales Unit.  This only applies to lineItems with 
*			lineItemStatusId = 1, 2 or 3.
* 2002/07/22	DMM	Corrected defect #1003:
*			Select an approved Contract
*			Click the LineItem view
*			Select a lineitem with status other than "active", edit it and
*			change its status to active.
*			
*			The following error occurs:
*			This lineitem has the same product, dataset and salesunit as
*			lineitem xxx  (where xxx is the lineitemid that was just changed).
*
* 2002/08/05	DMM	Fixed defect #1085 (Lineitem duplicate check did not include
*			SiteLocationId).
* 2003/04/23	DMM	Fixed Defect 1490:  Function was using several correlated subqueries
*			to determine if there were dups.  The logic was bogus.  I changed
*			the function so that it used a derived table and inserted the dups
*			into a temp table.
* 2003/08/15	DMM	Corrected various problems with Bundle generation.
* 2003/09/10	DMM	More changes for the Bundle Boy - Dups are ok as long as they are
*			within the same bundle.
* 2005/03/29	EKO	Added capability to determine duplicate line item by checking
*			ProductVersionId if the product is NRB SCD Print Directories.
*			If the product is NRB SCD Print Directories, uniqueness should
*			include ProductVersionId because 1 Contract can have multiple
*			standing orders for the same product, different versions, such as
*			v.2006, v.2007, v.2008.  Accounting dept. wanted this grouped under
*			the same contract.
* 2005/04/06	EKO	Certain NRB ProductIDs were conflicting with another software
*			release.  Some NRB ProductIDs have been incremented so as to avoid
*			a conflict.
* 2008/07/11	EKO	Allow duplicates for the Additional Users "product".
*			Refer to TFS # 11195.
* 2009/05/20	SMR	TFS# 15012 while working on the Market Expansion effort Martine
*			noticed that you can add a lineitem for the same sitelocation
*			that had the original SalesunitID and the new "expanded" one.
*			To fix this everywhere this function checks on Salesunitid, 
*			I had to also add a check on the SalesunitCD and usually a join back to Salesunit. 
* 2009/06/29	SMR	TFS 16497 There was some misunderstanding when I instituted the fix for 15739 
*			which fixed an issue where New York City and New York Metro Salesunits were being
*			consiodered as dupes. I thought New York City Plus and New York Metro were still
*			dupes and that New York Metro Plus and New York City were dupes. I was wrong
*			and this corrects that.
* 2012/01/27	EKO	Exempt duplication restrictions for certain Virtual Premise products (see list below), per Trish Gray.
*			Note:  Not all Virtual Premise products are exempt.
*			Refer to TFS # 28847:
*				ProductID	ProductDesc
*				126		VP - Implementation - System Set-up
*				127		VP - Implementation - Configuration
*				128		VP - Implementation - Report Dev
*				129		VP - Implementation - Training
*				130		VP - Implementation - Custom Dev
*				131		VP - Implementation - Integration Dev
*				132		VP - Implementation - Data Migration
*				133		VP - Implementation - Single Sign On
*				134		VP - Implementation - Consulting
*				135		VP - Pro Services - Configuration
*				136		VP - Pro Services - Report Dev
*				137		VP - Pro Services - Integration Dev
*				138		VP - Pro Services - Data Migration
*				139		VP - Pro Services - Custom Dev
*				140		VP - Pro Services - Consulting
*				141		VP - Pro Services - Training/Onsite
*				142		VP - Pro Services - Training/Web-based
*				143		VP - Pro Services - Other
*				144		VP - Lease Services - Abstraction/Review
*				145		VP - Lease Services - Consulting
*				146		VP - Additional Bands of Storage
*				147		VP - Additional Block of Locations
* 2012/02/27	EKO	Exempt duplication restrictions for all UK products (see list below).
*			Refer to TFS # 29246.
*				ProductID	ProductDesc
*				59		Focus
*				64		CoStar Shopproperty
*				65		CoStar Focus Scotland-SPN
*				148		ShopProperty Listings
*				149		Intelligence Direct
*				150		CoStar PropEx
*				151		ShopProperty Marketing
*				152		CoStar FOCUS
*				153		Shopproperty Connect
*
* 2013/11/22	EKO	Replace hard-coded products that are exempt from LineItemDupCheck function with
*			soft-coded reference to new column, Product.LineItemDupCheckFlag.
*			Re-formatted sp to clearly identify nesting in WHERE clauses and JOINs.
*			Refer to TFS # 64991.
***************************************************************************************/

BEGIN

DECLARE	@err		varchar(400)
DECLARE	@liIdDup	int;
DECLARE	@liIdDup2	int;
DECLARE	@cnt		int;
DECLARE @prDesc varchar(50)
DECLARE @suDesc varchar(50)
DECLARE @dsDesc varchar(50)
DECLARE @loc	varchar(50)
DECLARE @SalesUnitCD	varchar(20)
DECLARE @SalesUnitDesc varchar(100)
DECLARE @ProductMarketTypeID int

SET @err = ''
SET @cnt = 0

SELECT
	@SalesUnitCD = COALESCE(SalesUnitCD,''),@ProductMarketTypeID = COALESCE(ProductMarketTypeID,-1),
	@SalesUnitDesc = COALESCE(SalesUnitDesc,'') 
FROM dbo.Salesunit WITH (NOLOCK)
WHERE SalesunitID = @pSalesUnitId 


IF @pDataSetId IS NOT NULL
OR @pProductId IS NOT NULL
OR @pSalesUnitId IS NOT NULL
OR @pSiteLocationId IS NOT NULL
OR @pLineItemStatusId IS NOT NULL
BEGIN	-- Inserting a new line item or updating an existing line item
	
	IF @pDataSetId IS  NULL				-- if any of these are null, dups are ok		
	OR @pProductId IS  NULL				
	OR @pSalesUnitId IS NULL
	OR @pSiteLocationId IS NULL
	OR @pLineItemStatusId IS NULL
		RETURN @err
		
	IF @pLineItemStatusId <> 1			-- new lineitem with lineitemstatus = something other 
	AND @pLineItemStatusId <> 2			--		than active, fullfill only or bill only,
	AND @pLineItemStatusId <> 3			--		therefore dups are ok
		RETURN @err	


	-- Is product exempt from the LineItem duplicate check validation?
	--
	-- For example:
	-- 1.  Duplicates are OK for "Additional Users" product.
	-- 2.  Duplicates are OK for a subset of Virtual Premise products, but not necessarily all of them.
	-- 3.  Duplicates are OK for certain UK legacy products.
	IF EXISTS (
		SELECT NULL
		FROM dbo.Product WITH (NOLOCK)
		WHERE
			ProductID = @pProductID AND
			LineItemDupCheckFlag = 0 -- 0=Exempt from LineItem Dupe Checker.
		)
	BEGIN

		-- Exempt from validation.
		RETURN @err
	END


	DECLARE	@AcctApprovedByContactId int	-- See if contract has been approved

	SELECT
		@AcctApprovedByContactId = c.AcctApprovedByContactId
	FROM dbo.Contract c WITH (NOLOCK)
	WHERE
		c.ContractId = @pContractId


	IF @AcctApprovedByContactId IS NULL AND @pBundleId IS NULL	
		RETURN @err;					-- contract is not approved and we're not adding a bundle, therefore dups are ok


	-- Check for dups by checking proposed values against existing records
	IF @pLineItemId IS NOT NULL		-- updating - must exclude the lineitem being updated
		IF @pBundleId IS NOT NULL

			SELECT @liIdDup = li.lineItemId
			FROM dbo.LineItem AS li WITH (NOLOCK)
			INNER JOIN dbo.SalesUnit AS su ON
				su.SalesUnitID = li.SalesunitID
			WHERE
				li.ContractId = @pContractId AND
				li.LineItemId <> @pLineItemId AND
				li.LineItemStatusId IN (1,2,3) AND				-- active, fullfill only, bill only
				li.DataSetId = @pDataSetId AND
				li.ProductId = @pProductId AND

				(
					li.SalesUnitId = @pSalesUnitId

					OR

					(
						su.SalesUnitCD = @SalesUnitCD AND
						( @ProductMarketTypeID = 6 OR su.ProductMarketTypeID = 6 ) AND
						NOT( su.SalesunitDesc LIKE 'New York City%' and @SalesUnitDesc LIKE 'New York Metro%' ) AND
						NOT( su.SalesunitDesc LIKE 'New York Metro%' and @SalesUnitDesc LIKE 'New York City%' )
					)

				) AND

				li.SiteLocationId = @pSiteLocationId AND

				-- dups are ok if they are part of a different bundle
				( li.BundleId IS NULL OR li.BundleID = @pBundleId )

		ELSE	-- bundleId is null

			-- If the product is NRB SCD Print Directories, uniqueness should include ProductVersionId
			-- because 1 Contract can have multiple standing orders for the same product, different
			-- versions, such as v.2006, v.2007, v.2008.  Accounting dept. wanted this grouped under
			-- the same contract.
			IF @pProductId = 55 -- 55=NRB SCD Print Directories

				SELECT @liIdDup = li.lineItemId
				FROM dbo.LineItem AS li WITH (NOLOCK)
				INNER JOIN dbo.SalesUnit AS su WITH (NOLOCK) ON
					su.SalesUnitID = li.SalesunitID
				WHERE
					li.ContractId = @pContractId AND
					li.LineItemId <> @pLineItemId AND
					li.LineItemStatusId IN (1,2,3) AND			-- active, fullfill only, bill only
					li.DataSetId = @pDataSetId AND
					li.ProductId = @pProductId AND
					li.ProductId = @pProductId AND

					(

						li.SalesUnitId = @pSalesUnitId

						OR

						(
							su.SalesUnitCD = @SalesUnitCD AND
							( @ProductMarketTypeID = 6 OR su.ProductMarketTypeID = 6 ) AND
							NOT( su.SalesunitDesc LIKE 'New York City%' and @SalesUnitDesc LIKE 'New York Metro%' ) AND
							NOT( su.SalesunitDesc LIKE 'New York Metro%' and @SalesUnitDesc LIKE 'New York City%' )
						)

					) AND

					li.SiteLocationId = @pSiteLocationId AND
					li.ProductVersionId = @pProductVersionId

			ELSE

				SELECT @liIdDup = li.lineItemId
				FROM dbo.LineItem AS li WITH (NOLOCK)
				INNER JOIN dbo.SalesUnit AS su WITH (NOLOCK) ON
					su.SalesUnitID = li.SalesunitID
				WHERE
					li.ContractId = @pContractId AND
					li.LineItemId <> @pLineItemId AND
					li.LineItemStatusId IN (1,2,3) AND				-- active, fullfill only, bill only
					li.DataSetId = @pDataSetId AND
					li.ProductId = @pProductId AND
					li.ProductId = @pProductId AND

					(
						li.SalesUnitId = @pSalesUnitId 

						OR

						(
							su.SalesUnitCD = @SalesUnitCD AND
							( @ProductMarketTypeID = 6 OR su.ProductMarketTypeID = 6 ) AND
							NOT( su.SalesunitDesc LIKE 'New York City%' and @SalesUnitDesc LIKE 'New York Metro%' ) AND
							NOT( su.SalesunitDesc LIKE 'New York Metro%' and @SalesUnitDesc LIKE 'New York City%' )
						)

					) AND

					li.SiteLocationId = @pSiteLocationId
					
	ELSE							-- inserting
		IF @pBundleId IS NOT NULL

			SELECT @liIdDup = li.lineItemId
			FROM dbo.LineItem AS li WITH (NOLOCK)
			INNER JOIN dbo.SalesUnit AS su WITH (NOLOCK) ON
				su.SalesUnitID = li.SalesunitID
			WHERE
				li.ContractId = @pContractId AND
				li.LineItemStatusId IN (1,2,3) AND				-- active, fullfill only, bill only
				li.DataSetId = @pDataSetId AND
				li.ProductId = @pProductId AND
				li.ProductId = @pProductId AND

				(
					li.SalesUnitId = @pSalesUnitId

					OR

					(
						su.SalesUnitCD = @SalesUnitCD AND
						( @ProductMarketTypeID = 6 OR su.ProductMarketTypeID = 6 ) AND
						NOT( su.SalesunitDesc LIKE 'New York City%' and @SalesUnitDesc LIKE 'New York Metro%' ) AND
						NOT( su.SalesunitDesc LIKE 'New York Metro%' and @SalesUnitDesc LIKE 'New York City%')
					)

				) AND

				li.SiteLocationId = @pSiteLocationId AND

				-- dups are ok if they are part of a different bundle
				( li.BundleId IS NULL OR li.BundleID = @pBundleId )

		ELSE	-- bundleId is null

			-- If the product is NRB SCD Print Directories, uniqueness should include ProductVersionId
			-- because 1 Contract can have multiple standing orders for the same product, different
			-- versions, such as v.2006, v.2007, v.2008.  Accounting dept. wanted this grouped under
			-- the same contract.
			IF @pProductId = 55 -- 55=NRB SCD Print Directories

				SELECT @liIdDup = li.lineItemId
				FROM dbo.LineItem AS li WITH (NOLOCK)
				INNER JOIN dbo.SalesUnit AS su WITH (NOLOCK) ON
					su.SalesUnitID = li.SalesunitID
				WHERE
					li.ContractId = @pContractId AND
					li.LineItemStatusId IN (1,2,3) AND				-- active, fullfill only, bill only
					li.DataSetId = @pDataSetId AND
					li.ProductId = @pProductId AND
					li.ProductId = @pProductId AND

					(
						li.SalesUnitId = @pSalesUnitId

						OR

						(
							su.SalesUnitCD = @SalesUnitCD AND
							( @ProductMarketTypeID = 6 OR su.ProductMarketTypeID = 6 ) AND
							NOT( su.SalesunitDesc LIKE 'New York City%' and @SalesUnitDesc LIKE 'New York Metro%' ) AND
							NOT( su.SalesunitDesc LIKE 'New York Metro%' and @SalesUnitDesc LIKE 'New York City%' )
						)

					) AND

					li.SiteLocationId = @pSiteLocationId AND
					li.ProductVersionId = @pProductVersionId

			ELSE

				SELECT @liIdDup = li.lineItemId
				FROM dbo.LineItem AS li WITH (NOLOCK)
				INNER JOIN dbo.SalesUnit AS su WITH (NOLOCK) ON
					su.SalesUnitID = li.SalesunitID
				WHERE
					li.ContractId = @pContractId AND
					li.LineItemStatusId IN (1,2,3) AND			-- active, fullfill only, bill only
					li.DataSetId = @pDataSetId AND
					li.ProductId = @pProductId AND
					li.ProductId = @pProductId AND

					(
						li.SalesUnitId = @pSalesUnitId

						OR

						(
							su.SalesUnitCD = @SalesUnitCD AND
							( @ProductMarketTypeID = 6 OR su.ProductMarketTypeID = 6 ) AND
							NOT( su.SalesunitDesc LIKE 'New York City%' and @SalesUnitDesc LIKE 'New York Metro%' ) AND
							NOT( su.SalesunitDesc LIKE 'New York Metro%' and @SalesUnitDesc LIKE 'New York City%' )
						)

					) AND

					li.SiteLocationId = @pSiteLocationId
				
	SET @cnt = @@ROWCOUNT
	IF @cnt > 0
	BEGIN

		SELECT @prDesc = ProductDesc
		FROM dbo.Product WITH (NOLOCK)
		WHERE
			ProductId = @pProductId

		SELECT @suDesc = SalesUnitDesc
		FROM dbo.SalesUnit WITH (NOLOCK)
		WHERE
			SalesUnitId = @pSalesUnitId OR
			SalesUnitCD = @SalesUnitCD

		SELECT @dsDesc = DataSetDesc
		FROM dbo.DataSet WITH (NOLOCK)
		WHERE
			DataSetId = @pDataSetId

		SELECT @loc = LocationName
		FROM dbo.Location WITH (NOLOCK)
		WHERE
			LocationId = @pSiteLocationId


		IF @pBundleId IS NOT NULL 
		BEGIN
			SELECT @err = 'Bundle contains lineitems which have the same product ' 
				+ CASE WHEN @prDesc IS NOT NULL THEN '(' + @prDesc + ')' ELSE '' END
				+ ', salesunit ' + CASE WHEN @suDesc IS NOT NULL THEN '(' + @suDesc + ')' ELSE '' END
				+ ', dataset ' + CASE WHEN @dsDesc IS NOT NULL THEN '(' + @dsDesc + ')' ELSE '' END
				+ ', and sitelocation ' + CASE WHEN @loc IS NOT NULL THEN '(' + @loc + ')' ELSE '' END
				+ '.  The duplicate lineitems may already exist or the bundle may contain duplicate lineitems.'	
		END
		ELSE 
		BEGIN
			SELECT @err = 'This lineitem has the same product '
				+ CASE WHEN @prDesc IS NOT NULL THEN '(' + @prDesc + ')' ELSE '' END
				+ ', salesunit ' + CASE WHEN @suDesc IS NOT NULL THEN '(' + @suDesc + ')' ELSE '' END
				+ ', dataset ' + CASE WHEN @dsDesc IS NOT NULL THEN '(' + @dsDesc + ')' ELSE '' END
				+ ', and sitelocation ' + CASE WHEN @loc IS NOT NULL THEN '(' + @loc + ')' ELSE '' END
				+ ' as lineitem ' + CONVERT (VARCHAR(12), @liIdDup) + '.'
			-- found multiple dups.  Note, its difficult to determine an accurate count because there could
			-- be instances where there is more than one set of duplicates.
			IF @cnt >= 2		
				SET @err = @err 
					+ '  There are also other lineitems which have the same product, dataset, salesunit, and site location.'
		END
	END
END
	
ELSE		-- approving a contract	
BEGIN		-- check for dups by comparing existing records against one another

	DECLARE @LineItemDup1 Table (LineitemId1 int, LineItemId2 int)

	-- 1. Compare "Not Bundled" against all other lineitems
	INSERT INTO @LineItemDup1 (LineItemId1, LineItemId2)
	SELECT a.LineItemId, b.LineItemId	-- put dups in a temp table
	FROM (
		SELECT li.LineItemId, li.SiteLocationId, li.ContractId, li.ProductId, li.DataSetId, li.SalesUnitID, su.SalesunitCD , su.ProductMarketTypeID, su.SalesunitDesc
		FROM dbo.LineItem AS li WITH (NOLOCK)
		INNER JOIN dbo.SalesUnit AS su WITH (NOLOCK) ON
			su.SalesUnitID = li.SalesunitID
		WHERE
			li.ContractId = @pContractId AND
			li.LineItemStatusID in (1,2,3) AND li.BundleId IS NOT NULL	-- comparing "Not Bundled" against everything else

		) a 
	INNER JOIN (
		SELECT li.LineItemId, li.SiteLocationId, li.ContractId, li.ProductId, li.DataSetId, li.SalesUnitID, su.SalesunitCD, su.ProductMarketTypeID, su.SalesunitDesc
		FROM dbo.LineItem AS li WITH (NOLOCK)
		INNER JOIN dbo.SalesUnit AS su WITH (NOLOCK) ON
			su.SalesUnitID = li.SalesunitID
		WHERE
			li.ContractId = @pContractId AND
			li.LineItemStatusID in (1,2,3) AND
			li.BundleId IS NULL	-- comparing "Not Bundled" against everything else		   

		) b ON

		b.SiteLocationId = a.SiteLocationId AND
		b.ProductId = a.ProductId AND

		(
			b.SalesUnitId = a.SalesUnitId

			OR

			(
				b.SalesUnitCD = a.SalesUnitCD AND
				( b.ProductMarketTypeID = 6 OR a.ProductMarketTypeID = 6 ) AND
				NOT( b.SalesUnitDesc LIKE 'New York Metro%' AND a.SalesunitDesc LIKE 'New York City%' ) AND
				NOT( b.SalesUnitDesc LIKE 'New York City%' AND a.SalesunitDesc LIKE 'New York Metro%' )
			)

		) AND

		ISNULL(b.DataSetId,-1) = ISNULL(a.DataSetId,-1)

	WHERE
		a.LineItemId <> b.LineItemId AND
		a.ProductID NOT IN (

			-- Identify products that are exempt from the LineItem duplicate check validation.
			--
			-- For example:
			-- 1.  Duplicates are OK for "Additional Users" product.
			-- 2.  Duplicates are OK for a subset of Virtual Premise products, but not necessarily all of them.
			-- 3.  Duplicates are OK for certain UK legacy products.

			SELECT ProductID
			FROM dbo.Product WITH (NOLOCK)
			WHERE
				LineItemDupCheckFlag = 0 -- 0=Exempt from LineItem Dupe Checker.

			)


	-- 2. Compare "Bundled" against "Bundled"
	INSERT INTO @LineItemDup1 (LineItemId1, LineItemId2)
	SELECT a.LineItemId, b.LineItemId	-- put dups in a temp table
	FROM (
		SELECT li.LineItemId, li.SiteLocationId, li.ContractId, li.ProductId, li.DataSetId, li.SalesUnitID, li.BundleId , su.SalesunitCD, su.ProductMarketTypeID, su.SalesunitDesc
		FROM dbo.LineItem AS li WITH (NOLOCK)
		INNER JOIN dbo.SalesUnit AS su WITH (NOLOCK) ON
			su.SalesUnitID = li.SalesunitID
		WHERE
			li.ContractId = @pContractId AND
			li.LineItemStatusID in (1,2,3)AND
			li.BundleId IS NOT NULL	-- comparing bundled against everything else		   
		) AS a
	INNER JOIN (
		SELECT li.LineItemId, li.SiteLocationId, li.ContractId, li.ProductId, li.DataSetId, li.SalesUnitID, li.BundleId , su.SalesunitCD, su.ProductMarketTypeID, su.SalesunitDesc
		FROM dbo.LineItem AS li WITH (NOLOCK)
		INNER JOIN dbo.SalesUnit AS su WITH (NOLOCK) ON
			su.SalesUnitID = li.SalesunitID
		WHERE
			li.ContractId = @pContractId AND
			li.LineItemStatusID in (1,2,3) AND
			li.BundleId IS NOT NULL	-- comparing bundled against bundled		   

		) AS b ON

			a.SiteLocationId = b.SiteLocationId AND
			a.ProductId = b.ProductId AND

			(
				a.SalesUnitId = b.SalesUnitId

				OR

				(
					a.SalesUnitCD = b.SalesUnitCD AND
					( a.ProductMarketTypeID = 6 OR b.ProductMarketTypeID = 6 ) AND
					NOT( a.SalesunitDesc LIKE 'New York City%' and b.SalesUnitDesc LIKE 'New York Metro%' ) AND
					NOT( a.SalesunitDesc LIKE 'New York Metro%' and b.SalesUnitDesc LIKE 'New York City%' )
				)

			) AND

			ISNULL(a.DataSetId,-1) = ISNULL(b.DataSetId,-1)

	WHERE
		a.LineItemId <> b.LineItemId AND
		a.ProductID NOT IN (

			-- Identify products that are exempt from the LineItem duplicate check validation.
			--
			-- For example:
			-- 1.  Duplicates are OK for "Additional Users" product.
			-- 2.  Duplicates are OK for a subset of Virtual Premise products, but not necessarily all of them.
			-- 3.  Duplicates are OK for certain UK legacy products.

			SELECT ProductID
			FROM dbo.Product WITH (NOLOCK)
			WHERE
				LineItemDupCheckFlag = 0 -- 0=Exempt from LineItem Dupe Checker.

			) AND

		a.BundleId = b.BundleId	-- dups must be within the same bundle.  Dups in different bundles are ok
	

	-- Create a single table containing all the distinct duplicates
	DECLARE @LineItemDup2 Table (LineItemId int primary key)
	INSERT INTO @LineItemDup2 (LineItemId)
	SELECT DISTINCT LineItemId1
	FROM @LineItemDup1


	INSERT INTO @LineItemDup2 (LineItemId)
	SELECT DISTINCT LineItemId2
	FROM @LineItemDup1 AS a
	LEFT OUTER JOIN @LineItemDup2 AS b ON
		b.LineItemId = a.LineItemId2 -- The lineitem may already be in the Dup2 table
	WHERE
		b.LineItemId IS NULL 		
	
	-- Sort the table so we can display the duplicates 
	DECLARE @LineItemDup Table (SortId int identity, LineItemId int)
	INSERT INTO @LineItemDup (LineItemId)
	SELECT a.LineItemId 
	FROM @LineItemDup2 AS a
	INNER JOIN dbo.LineItem AS li WITH (NOLOCK) ON
		li.LineItemId = a.LineItemId
	ORDER BY li.SiteLocationId, li.ProductId, li.SalesUnitId, li.DataSetId	

			
	SELECT @cnt = COUNT(*)
	FROM @LineItemDup


	IF @cnt >= 2	-- should always end up with an even # of rows  
	BEGIN
		SELECT @liIdDup = LineItemId FROM @LineItemDup WHERE SortId = 1
		SELECT @liIdDup2 = LineItemId FROM @LineItemDup WHERE SortId = 2


		SELECT
			@prDesc = ProductDesc,
			@suDesc = SalesUnitDesc,
			@dsDesc = DataSetDesc,
			@loc = LocationName
		FROM dbo.LineItem AS li WITH (NOLOCK)
		INNER JOIN dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID
		INNER JOIN dbo.SalesUnit AS su WITH (NOLOCK) ON
			su.SalesUnitID = li.SalesUnitID
		INNER JOIN dbo.Location AS sl WITH (NOLOCK) ON
			sl.LocationID = li.SiteLocationID
		LEFT OUTER JOIN dbo.Dataset AS d WITH (NOLOCK) ON
			d.DatasetID = li.DatasetID
		WHERE
			li.LineItemID = @liIdDup


		SELECT @err = 'Lineitems ' + CONVERT (VARCHAR(12), @liIdDup) + ' and ' + CONVERT (VARCHAR(12), @liIdDup2) 
			+ ' have the same product '
			+ CASE WHEN @prDesc IS NOT NULL THEN '(' + @prDesc + ')' ELSE '' END
			+ ', salesunit ' + CASE WHEN @suDesc IS NOT NULL THEN '(' + @suDesc + ')' ELSE '' END
			+ ', dataset ' + CASE WHEN @dsDesc IS NOT NULL THEN '(' + @dsDesc + ')' ELSE '' END
			+ ', and sitelocation ' + CASE WHEN @loc IS NOT NULL THEN '(' + @loc + ')' ELSE '' END + '.'
		-- found multiple dups.  Note, its difficult to determine an accurate count because there could
		-- be instances where there is more than one set of duplicates.
		IF @cnt > 2		
			SET @err = @err 
				+ '  There are also other lineitems which have the same product, dataset, salesunit, and site location.'
	END
END

RETURN @err

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnLineItemUsersGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fnLineItemUsersGet](@LineItemID int)
returns varchar(8000)
as
/*
Crated: 2/6/2008
Author: Roumen Raditchkov
Description: Used by spGenCoStarNotificationText
*/
begin
  declare @var varchar(8000)
  select @var = isnull(@var + ',','') + dbo.fnFormatName( c.NamePrefix, c.FirstName, c.MiddleInitial, c.LastName )
				FROM dbo.WebSubscriptions w with (nolock)
				JOIN dbo.WebUsers wu with (nolock) ON wu.UserId = w.UserId
				JOIN dbo.Contact c with (nolock) ON c.ContactId = wu.UserContactId
				WHERE W.LineItemId = @LineItemid
  return @var
end

GO
/****** Object:  UserDefinedFunction [dbo].[fnListingChangeStatementTextSampleGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnListingChangeStatementTextSampleGet] (@ListingChangeID int)
RETURNS nvarchar(4000)
AS
BEGIN
	--Return the full sample statement text with the substituted token values
	DECLARE @StatementTextSample nvarchar(4000)=''
	
	--Get the StatementText
	SELECT @StatementTextSample=StatementText FROM dbo.ChangeLogStatement cls (NOLOCK)
	JOIN dbo.ListingChange lc (NOLOCK) ON lc.ChangeLogStatementID=cls.ChangeLogStatementID
	WHERE lc.ListingChangeID=@ListingChangeID
	
	--Get all the Token data
	DECLARE @ChangeLogTokenData TABLE (TokenID int, TokenKey varchar(30), TokenName varchar(50), TokenEntityType varchar(100), TokenKeyType varchar(100), KeySymbol char(2), TokenValue nvarchar(4000))
	INSERT INTO @ChangeLogTokenData
	SELECT 
		lct.ChangeLogTokenID, clt.TokenKey, cltt.TokenName, clet.ChangeLogEntityTypeName, clkt.TokenKeyTypeName, clkt.KeySymbol, TokenValue=rtrim(KeySymbol)+rtrim(lct.TokenValue)+rtrim(KeySymbol)
		FROM 
		dbo.ListingChange lc (NOLOCK)
		JOIN dbo.ListingChangeToken lct (NOLOCK) ON lc.ListingChangeID=lct.ListingChangeID
		JOIN dbo.ChangeLogToken clt (NOLOCK) ON clt.ChangeLogTokenID=lct.ChangeLogTokenID
		JOIN dbo.ChangeLogTokenType cltt (NOLOCK) ON clt.ChangeLogTokenTypeID=cltt.ChangeLogTokenTypeID
		JOIN dbo.ChangeLogEntityType clet (NOLOCK) ON cltt.ChangeLogEntityTypeID=clet.ChangeLogEntityTypeID
		JOIN dbo.ChangeLogTokenKeyType clkt (NOLOCK) ON clt.ChangeLogTokenKeyTypeID=clkt.ChangeLogTokenKeyTypeID
	WHERE lc.ListingChangeID=@ListingChangeID
				
		--SELECT * FROM @ChangeLogTokenData
		
	SELECT @StatementTextSample=
		REPLACE(@StatementTextSample,TokenKey,TokenValue)
	FROM @ChangeLogTokenData
	
	--SELECT StatementTextSample=@StatementTextSample
	
	RETURN @StatementTextSample
	
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnLocationDescendantsGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- This function returns a table containing all the descendants of the supplied LocationID
-- The table has the following format:
--		LocationID			int			-- descendant locationID
--		ParentLocationID	int			-- parent of descendant
--		Level				smallint	-- level of the tree (ie. direct child is 1, grandchild is 2, etc)

CREATE FUNCTION [dbo].[fnLocationDescendantsGet] (@pLocationID int)
	Returns @Descendants Table (LocationID int,	ParentLocationID int, [Level] int)
AS BEGIN

	Declare @level int
	Declare @rowcount int
	SET @level = 1

	-- get the first level children
	INSERT @Descendants (LocationID, ParentLocationID, [Level])
		SELECT LocationID, ParentLocationID, @level 
			From dbo.Location  (nolock)
			where ParentLocationID = @pLocationID 
			AND LocationID <> @pLocationID   -- need this since we're now making HQ's their own parent's
	SET @rowcount = @@ROWCOUNT

	-- Iteratively get all other descendants
	-- Only get Children who aren't already in our TableVar because there could be circular references in the data
	WHILE @rowcount > 0 BEGIN		-- when we get no rows, we know we've hit the bottom of the tree
		INSERT @Descendants (LocationID, ParentLocationID, [Level])
			SELECT a.locationID, a.ParentLocationID, @level + 1
				FROM dbo.Location a with (nolock)
				JOIN @Descendants b ON a.ParentLocationID = b.LocationID
				LEFT JOIN @Descendants c ON a.LocationID = c.LocationID
				WHERE	c.LocationID is NULL -- Not already in the table
					AND b.[Level] = @level   -- Limit the search to the the children of the most recently populated level
					AND b.LocationID <> @pLocationID   -- need this since we're now making HQ's their own parent's
		SET @rowcount = @@ROWCOUNT
		SET @level = @level + 1
	END

	RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnLocationHQChildrenGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnLocationHQChildrenGet] ( @HQLocationID int, @FromMainParent bit)

Returns @tb Table 
	(
	LocationID int,
	ParentLocationID int,
	[Level] tinyint
	)
AS
Begin

	/*****************************************************************************
	*** OBJECT NAME:	fnLocationHQChildrenGet
	*** AUTHOR:		TG Braitman
	*** DATE:		1/22/2002
	
	*** OUTPUTS:		a Table which can be referred to as dbo.fnLocationHQChildrenGet(<HQLocationID>)
	
	*** DEPENDENCIES:	None
	
	*** DESCRIPTION:	Gets all the locations for an HQ (Recursively)
				Supply an int as a LocationID as the argument.  
				The function will return table data formatted like:
	
				@FromMainParent bit is an additional argument which when 1
				will first go up the uppermost main parent from @HQLocationID
	
				LocationID  ParentLocationID Level 
				----------- ---------------- ----- 
				45          45               0
				44          45               1
				46          45               1
	
				Level 0 Represents the HQ Level.
				LocationID will refer to all the children.
				ParentLocationID and Level are additional info
				your logic may want to use.
		
	*** EXAMPLE		Select 
					c.LocationName as [HQ Location], 
					b.LocationName [Child Location]
				From 
					dbo.fnLocationHQChildrenGet(4515, 1) a
				JOIN	Location b ON a.locationID = b.locationID
				JOIN	Location c ON a.parentLocationID = c.LocationID
	
	----------------------------------------
	*** MODIFICATION HISTORY
	*** Date: 		1/24/2002		
	*** Name:		TG
	*** Description:	Added Argument: @FromMainParent bit
				Added an argument to specify whether to first going up to the upper 
				most main parent from the entered parameter before getting all children
	
	*** Date: 		2/25/2002		
	*** Name:		TG
	*** Description:	If @HQLocationID had no parentLocationID then the function
				will return its own locationID as the parent.
	
	
	*****************************************************************************/

	Declare 
		@lev tinyint
		,@mainHQ int
		,@currHQ int

	Set @lev = 0
	Set @mainHQ = @HQLocationID
	Set @currHQ = -1


	--If @FromMainParent = 1, go all the way back to the uppermost parent first
	If @FromMainParent = 1
	   Begin

		--This table is to store all the parents we've found so far
		--so that if a circular reference exists we won't get trapped in a loop
		declare @parents Table (locationID int)

		While ( @mainHQ <> @currHQ )
		   Begin
			Set @currHQ = @mainHQ

			Select @mainHQ = isNull(parentLocationID, @currHQ)
			From dbo.Location a with (nolock)
			Left JOIN @parents b ON a.parentLocationID = b.locationID
			Where
				b.locationID is NULL
			AND	a.locationID = @currHQ
			
			insert @parents (locationID) values ( @mainHQ )

		   End
	   End

	--Add the Starting Point HQ to our TableVar
	insert @tb (LocationID, ParentLocationID, [Level])
	Select isNull(ParentLocationID, LocationID), LocationID, @lev 
	From dbo.Location with (nolock)
	where LocationID = @mainHQ

	--Recursively get all child Locations of HQ
		--Only get Children who aren't already in our TableVar
		--Because there could be circular references in the data
	While @Lev is NOT NULL
	   Begin
		insert @tb (LocationID, ParentLocationID, [Level])
		Select a.locationID, a.ParentLocationID, @lev + 1
		From dbo.Location a with (nolock)
		JOIN @tb b ON a.ParentLocationID = b.LocationID
		Left JOIN @tb c ON a.LocationID = c.LocationID
		Where c.LocationID is NULL
		AND b.[Level] = @lev
	
		Select @lev = max([Level]) from @tb where [Level] > @lev
	   End
	
	Return
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnLocationIdFromName]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnLocationIdFromName] ( 
	  @pLocationName varchar(52)			-- location name for which to search
	, @pSearchType int						-- 0 = begins with, 1 = contains
) RETURNS @tbLocId Table (LocationId int) AS
BEGIN

SET @pLocationName = LTRIM(RTRIM(ISNULL(@pLocationName, '')));
IF Len(@pLocationName) = 0
	RETURN;		

SET @pLocationName = @pLocationName + '%'
IF @pSearchType = 1
	SET @pLocationName = '%' + @pLocationName 
INSERT @tbLocId (LocationId) 
	SELECT	LocationId FROM dbo.Location with (nolock) WHERE LocationName like @pLocationName
RETURN	
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnLockOutRemaining]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnLockOutRemaining] ( 
 @pLockOutStartDate DateTime = null 
,@pLockOutDurationMinutes int = null
,@pCurrentDateTime DateTime		-- Can't use getDate() within a function so must pass it in
)
RETURNS	Varchar(30) AS  
BEGIN
	declare @ReturnValue	varchar(30);
	declare @num			int;
	declare @unit			varchar (10);
	
	SET @ReturnValue = ''
	SET @unit = 'min';
	SET @num = DateDiff (Minute, @pCurrentDateTime, DateAdd(Minute, @pLockOutDurationMinutes, @pLockOutStartDate))
	IF @num >= 60
	BEGIN
		SET @num = @num / 60	-- determine # of hours
		SET @unit = 'hr'
	END
	IF @num > 0
		SET @ReturnValue = Convert (Varchar(10), @num) + ' ' + @unit		
	RETURN @ReturnValue
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnLongDateFormat]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnLongDateFormat](@InputDate datetime)
RETURNS varchar(75)
AS
BEGIN
	/*

	Author:	Ed Hellyer
	Date:	Dec 1st 2011

	History:
	Editby	Date			TFS			Comment
	EJH		Dec 1st 2011	TFS# 28373	Create function to satisfy TFS 28373.


	*/

	-- Declare the return variable
	DECLARE @Result varchar(75)

	-- Build custom date format  mmmm dd, yyyy  e.g.  January 10, 2011
	set @Result = datename(m, @InputDate) + ' ' + datename(d, @InputDate) + ', ' + datename(year, @InputDate)

	-- Return the result of the function
	RETURN @Result

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnMaskCalculation]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnMaskCalculation] (@ip varchar(20)) 
RETURNS varchar(20)
AS 
---------------------------------------------------------------------------------------------------------------------------
-- This fuction returns the list of IP ranges for the supplied IP address.  Don't ask me (DMM) how it works.  Ace wrote it.
-- See http://www.subnetonline.com/pages/tutorials/step-3-subnet-masking.php for more info.
--
--	TFS 30956:  Modify for Glendora and San Francisco
--
---------------------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE @maskTemp varchar(3), @maskLength int, @maskPos int
	DECLARE @ipTemp   varchar(3), @ipLength   int, @ipPos int
	DECLARE @netTemp varchar(3)
	DECLARE @count int
	DECLARE @ipINT int
	DECLARE @maskINT int
	DECLARE @netINT int
	DECLARE @pre varchar(1)
	DECLARE @result varchar(20)	
	set @ipLength = LEN(@ip)
	set @count = 0
	set @ipPos = 1
	set @maskPos = 1
	set @result = ''
	set @pre = ''	

	-- Determine the Subnet Mask we should calculate against
	DECLARE @mask varchar(20)
	if (@ip like '172.16.2[23][0123456789].%')
		set @mask = '255.255.254.0'				-- DC subnet
	else if @ip like '172.16.85.%' or @ip like '172.16.20.%'
		set @mask = '255.255.255.0'				-- DC subnet
	else if @ip like '172.16.24[89].%'			-- DC subnet
		set @mask = '255.255.254.0'
	else if @ip like '172.16.[6789].%' or @ip like '172.16.10.%' or @ip like '172.16.11.%'
		set @mask = '255.255.255.0'				-- Glendora subnet
	else if @ip like '172.16.124.%'				-- SD subnet
		set @mask = '255.255.254.0'
	else if @ip like '172.16.126.%'				-- SD subnet
		set @mask = '255.255.255.0 '
	else if @ip like '10.4[01356].2.%'
		set @mask = '255.255.255.0'				-- SF subnet          
	else if (@ip like '172%')
		set @mask = '255.255.252.0'				-- Atlanta, Columbia, Phoenix
	else
		set @mask = '255.255.255.0'	

	set @maskLength = len(@mask)
	while (@count < 4)
	BEGIN

		set @maskTemp = ''
		set @ipTemp = ''
 		while (NOT(SUBSTRING(@mask,@maskPos,1) = '.'))
		BEGIN
			set @maskTemp = @maskTemp + SUBSTRING(@mask,@maskPos,1)
			set @maskPos = @maskPos + 1 
			if (@maskPos > @maskLength)
				break	
		END
	
		if (@ipPos <= @ipLength)
		BEGIN
			if (SUBSTRING(@mask,@maskPos,1) = '.')
			BEGIN
				set @maskPos = @maskPos + 1
			END
		END	

		while (NOT(SUBSTRING(@ip,@ipPos,1) = '.'))
		BEGIN
			set @ipTemp = @ipTemp+ SUBSTRING(@ip,@ipPos,1)
			set @ipPos = @ipPos + 1 
			if (@ipPos > @ipLength)
				break
		END

		if (@ipPos <= @ipLength)
		BEGIN
			if (SUBSTRING(@ip,@ipPos,1) = '.')
			BEGIN
				set @ipPos = @ipPos + 1
			END
		END
	
		set @ipINT = CONVERT(int,@ipTemp)
		set @maskINT = CONVERT(int,@maskTemp)
		set @netINT = @ipINT & @maskINT
		set @netTemp = CONVERT(varchar(3),@netInt)
		set @result = @result + @pre + @netTemp
		set @pre = '.'
		set @count = @count + 1
	END

	return @result
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnMaskToRegExpression]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- create function dbo.fnMaskToRegExpression (@Mask varchar(40))
CREATE FUNCTION [dbo].[fnMaskToRegExpression] (@Mask varchar(40))
returns varchar(1000)
as

/***************************************************************************************************
**	Name: fnMaskToRegExpression
**
**  Goal:
**  Return a string with a regular expression equivalent of the passed in mask.  With the exception
**  of ^, $, \s, and \. operators, these expressions should be compatible with SQL string comparisons.
**  For example, you could easily convert the regular expression to a sql string comparison with this:
**
**  Replace(Replace(Replace(Replace(APNRegEx, '^', ''), '$', ''), '\.', '.'), '\s', ' ')
**
**  20060509  DJR  Creation.
***************************************************************************************************/

BEGIN
    declare @CurrChar char(1)
           ,@Pos      int
           ,@Len      int
           ,@Result   varchar(1000)

    Select @Pos = 1
          ,@Len = datalength(@Mask)
          ,@CurrChar = Substring(@Mask, @Pos, 1)
          ,@Result = '^'

    While @Pos <= @Len
    Begin
        Set @Result = rtrim(@Result) -- why is this rtrim necessary?
                    + case when @CurrChar = '9' then '[0-9]'
                           when @CurrChar = 'A' then '[A-Z,a-z,0-9]'
                           when @CurrChar = '.' then '\.'
                           when @CurrChar = ' ' then '\s'
                           else @CurrChar
                      end

        Select @Pos = @Pos + 1
              ,@CurrChar = Substring(@Mask, @Pos, 1)
    End

    set @Result = rtrim(@Result) + '$'

    Return NullIf(@Result,'')

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnMonthlyPriceCalc3]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
**		Created By:	Lavanya Reddy
**		Created Date:	6/29/05 
**		File: 		$/CodeBase/CRM.WS.Database/CRM.WS.DB.Contracts/Functions/fnMonthlyPriceCalc3.sql
**		Name: 		fnMonthlyPriceCalc3
**		Desc: 		Returns monthly revenue based on LineItem, Contract, SiteLocation or BillingLocation	
**		Remarks:	Rules derived from fnMonthlyPriceCalc2 - only change was to convert some of the logic
**				to set based processing to optimize for use for large recordsets
**
**
** UPDATES:
** DATE		AUTHOR	PURPOSE
** 08/31/2005	EKO	The following Products are not considered to produce
**			revenue as they are one-time charges:  NRB Shipping;
**			Installation Fee.  Only products that produce recurring
**			charges are considered to produce revenue.  Explained by
**			T. Gray.
** 10/20/2005   EKO     The product, "Key Token," is another product which does
**                      not contribute revenue - it is a one-time fee.
**			Eliminated hard-coded ProductIDs by referencing
**			ProductName and IncludeInMonthlyRevenueFlag.
**			Re-wrote the queries which identifies LineItems to
**			process since the special NRB logic was omitted when
**			a ProductID was not provided.
** 03/17/2006   EKO     Added logic to allow ModuleType "Contract|SiteLocation".
**			This permits combination requests of providing Contract *AND*
**			SiteLocation to the function.  The only other alternative
**			to determine revenue for a contract and site location would
**			have been to call the original revenue function mentioned
**			above, passing in pre-identified LineItemIDs for a specific
**			Contract and SiteLocation.  Unfortunately, users would
**			experience dropped database connections (time-outs)
**			especially large contracts (with hundreds or thousands
**			of line items).  Refer to TD_CRM Defect # 6799.
** 6/23/2006 	Yu Shen TD_CRM 7193 
**			Added Void Concept to the lineitemdiscount table (YS)
** 5/14/2012	B Howe	TFS: 29839
**			Added fix to convert queries on product 158 (showcase UK) to Showcase US on Costarsubsidiaryid 61
** 4/25/2013	EKO	Local discount variables of DiscountMonth and RecurringMonths were declared using
**			the TINYINT datatype; however, the LineItemDiscount table allows INTEGER datatype.  Therefore,
**			these local variables must be defined as INTEGER in order to avoid potential arithmetic
**			overflow errors.
**			Refer to TFS # 37137.
*******************************************************************************/
CREATE FUNCTION [dbo].[fnMonthlyPriceCalc3]        /* CRM Version 4.0.1.0 */
	(@pModuleType varchar(25)	--'Lineitem', 'Contract', 'SiteLocation', 'BillingLocation', 'Contract|SiteLocation'
	,@pModuleID int
	,@pGetDate smalldatetime
	,@pProductID int		--<NULL> for All Products
	,@pLineitemTypeID int		--<NULL> for LineitemTypeID = 1: Default to 'Subscription' type
	,@pModuleID2 int )		--<NULL> for all requests, except combination requests, such as providing Contract AND SiteLocation.

Returns numeric (38,20)

AS

Begin

	declare @ReportDate datetime, @TotalPrice numeric (37, 20)
	declare @costarsubsidiaryid int
	
	--declare @pModuleType varchar(20), @pModuleID int, @pProductID int, @pLineItemTypeID int
	--select @pModuleID = 371365, @pModuleType = 'SiteLocation'
	Select @ReportDate = @pGetDate, @TotalPrice = 0
	
	/*
	drop table @LI
	drop table @Discount
	drop table @Additive
	*/
	
	--BGH  Showcase UK TFS 29839 - remove when Showcase is adaptwed to use Product 158 or featureproductid 61.
	if @pproductid = 61
	begin
	set @costarsubsidiaryid = 1
	end
	if @pproductid = 158
	begin
		set @costarsubsidiaryid = 3
		set @pproductid = 61
	end
	
	 
	
	--AJV - Intercept for Property Express & Comps Express
	If @pModuleType = 'SiteLocation' and @pProductID in (35, 42)
	begin
		Return @TotalPrice
	End
	
	Declare @LI table
		(LineItemID int, 
		CurrentMonthlyPrice numeric (38, 20), 
		BillingStartDate datetime, 
		ActualMonthlyPrice numeric (38, 20), 
		DiscountType char(10) )
	
	Declare @Discount table 
		(LineItemID int,
		DiscountMonth int, 
		DiscountPct numeric(38, 20), 
		DiscountAmount numeric (38, 20), 
		PermDiscountFlag bit, 
		RecurringMonths int)
	
	Declare @Additive table 
		( LineItemID int, 
		DiscountPct numeric (37, 20) , 
		DiscountAmount numeric (37, 20))
	
	
	
	/*	Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)
			Select distinct LineItemID, CurrentMonthlyPrice, isnull(BillingStartDate, getdate()), CurrentMonthlyPrice
			from dbo.LineItem  
			where LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
	*/
	
	/*****************************
	@pModuleType = 'SiteLocation'
	******************************/

	If @pModuleType = 'SiteLocation'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)

		-- Identify NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice 
		from dbo.LineItem AS li WITH (NOLOCK)
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.

		where
			li.SiteLocationID = @pModuleID
			and li.LineItemStatusID in (1, 2, 3, 5) -- 1=Active; 2=Fulfill Only; 3=Bill Only; 5=Terminate
			and li.BillingStartDate >= DateAdd(YYYY, -1, @pGetDate) -- NRB products are to be computed based upon the last 12 months.
			and li.BillingStartDate < DateAdd(DD, 1, cast(convert(varchar(25), @pGetDate, 101) as Datetime))
			and li.ProductID = isnull(@pProductID, li.ProductID)
			and c.CoStarSubsidiaryID = ISNULL(@costarsubsidiaryid, c.CoStarSubsidiaryID)

		union all -- Union All is used because the above dataset identifies NRB LineItems whereas the dataset below identifies non-NRB LineItems (there is no possibility of overlap).

		-- Identify non-NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice
		from dbo.LineItem AS li WITH (NOLOCK) 
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName NOT LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.
		where
			li.SiteLocationID = @pModuleID
			and li.LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
			and li.LineItemTypeID = isNull(@pLineitemTypeID, 1)
			and li.ProductID = isNull(@pProductID, li.ProductID)
			and c.CoStarSubsidiaryID = ISNULL(@costarsubsidiaryid, c.CoStarSubsidiaryID)
	
	End

	
	/*****************************
	@pModuleType = 'Contract'
	*****************************/

	If @pModuleType = 'Contract'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)

		-- Identify NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice 
		from dbo.LineItem AS li WITH (NOLOCK)
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.

		where
			li.ContractID = @pModuleID
			and li.LineItemStatusID in (1, 2, 3, 5) -- 1=Active; 2=Fulfill Only; 3=Bill Only; 5=Terminate
			and li.BillingStartDate >= DateAdd(YYYY, -1, @pGetDate) -- NRB products are to be computed based upon the last 12 months.
			and li.BillingStartDate < DateAdd(DD, 1, cast(convert(varchar(25), @pGetDate, 101) as Datetime))
			and li.ProductID = isnull(@pProductID, li.ProductID)
			and c.CoStarSubsidiaryID = ISNULL(@costarsubsidiaryid, c.CoStarSubsidiaryID)

		union all -- Union All is used because the above dataset identifies NRB LineItems whereas the dataset below identifies non-NRB LineItems (there is no possibility of overlap).

		-- Identify non-NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice
		from dbo.LineItem AS li WITH (NOLOCK) 
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName NOT LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.
		where
			li.ContractID = @pModuleID
			and li.LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
			and li.LineItemTypeID = isNull(@pLineitemTypeID, 1)
			and li.ProductID = isNull(@pProductID, li.ProductID)
			and c.CoStarSubsidiaryID = ISNULL(@costarsubsidiaryid, c.CoStarSubsidiaryID)
	
	End
	
	/*****************************
	@pModuleType = 'BillingLocation'
	*****************************/

	If @pModuleType = 'BillingLocation'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)
		Select distinct li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), CurrentMonthlyPrice
		from dbo.LineItem li WITH (NOLOCK) join dbo.Contract c WITH (NOLOCK) on li.ContractID = c.ContractID  
		where c.BillingLocationID = @pModuleID 
		and LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
		and LineItemTypeID = isNull(@pLineitemTypeID, 1)
		and ProductID = isNull(@pProductID, ProductID)	
		and c.CoStarSubsidiaryID = ISNULL(@costarsubsidiaryid, c.CoStarSubsidiaryID)
	
	End
	
	/*****************************
	@pModuleType = 'LineItem'
	*****************************/
	
	If @pModuleType = 'LineItem'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)
		Select distinct LineItemID, CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), CurrentMonthlyPrice
		from dbo.LineItem  li WITH (NOLOCK) join dbo.Contract c WITH (NOLOCK) on li.ContractID = c.ContractID  
		where LineItemID = @pModuleID 
		and LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
		and LineItemTypeID = isNull(@pLineitemTypeID, 1)
		and ProductID = isNull(@pProductID, ProductID)	
		and c.CoStarSubsidiaryID = ISNULL(@costarsubsidiaryid, c.CoStarSubsidiaryID)
	
	End

	/*****************************
	@pModuleType = 'Contract|SiteLocation'
	*****************************/
	If @pModuleType = 'Contract|SiteLocation'
	Begin

		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)
	
		-- Identify NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice 
		from dbo.LineItem AS li WITH (NOLOCK)
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.
	
		where
			li.ContractID = @pModuleID
			and li.SiteLocationID = @pModuleID2
			and li.LineItemStatusID in (1, 2, 3, 5) -- 1=Active; 2=Fulfill Only; 3=Bill Only; 5=Terminate
			and li.BillingStartDate >= DateAdd(YYYY, -1, @pGetDate) -- NRB products are to be computed based upon the last 12 months.
			and li.BillingStartDate < DateAdd(DD, 1, cast(convert(varchar(25), @pGetDate, 101) as Datetime))
			and li.ProductID = isnull(@pProductID, li.ProductID)
			and c.CoStarSubsidiaryID = ISNULL(@costarsubsidiaryid, c.CoStarSubsidiaryID)
	
		union all -- Union All is used because the above dataset identifies NRB LineItems whereas the dataset below identifies non-NRB LineItems (there is no possibility of overlap).
	
		-- Identify non-NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice
		from dbo.LineItem AS li WITH (NOLOCK) 
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName NOT LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.
		where
			li.ContractID = @pModuleID
			and li.SiteLocationID = @pModuleID2
			and li.LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
			and li.LineItemTypeID = isNull(@pLineitemTypeID, 1)
			and li.ProductID = isNull(@pProductID, li.ProductID)
			and c.CoStarSubsidiaryID = ISNULL(@costarsubsidiaryid, c.CoStarSubsidiaryID)

	End


	Update l
	set DiscountType = 'Additive' 
	from @LI l 
	where
		exists (
			select 1
			from dbo.LineItemDiscount d WITH (NOLOCK)
			where
				l.LineItemID = d.LineItemId and
				DiscountOrder is null and 
				isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
			)
		or
		exists (
			select 1
			from dbo.LineItemDiscount d2 WITH (NOLOCK)
			where
				l.LineItemID = d2.LineitemID and 
				isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
			Group By DiscountOrder
			Having count(*) > 1 
			)
	
	Update @LI
	set DiscountType = 'PiggyBack'
	where DiscountType is null
	
	/********************************
	Handle Additive Discounts
	*********************************/
	
	Insert into @Additive (LineItemID, DiscountPct, DiscountAmount ) 
	select l.LineItemID, sum(DiscountPct) DiscountPct, sum(DiscountAmount) DiscountAmount
	from @LI l join lineitemdiscount d WITH (NOLOCK) on l.LineItemID = d.LineItemID and l.DiscountType = 'additive' 
	and (
		(d.PermDiscountFlag = 1 and (DATEDIFF(mm, l.BillingStartDate, @ReportDate) + 1 ) >= d.DiscountMonth )
			or
		(d.PermDiscountFlag = 0 and DATEDIFF(mm, l.BillingStartDate, @ReportDate) < ((DiscountMonth - 1) + RecurringMonths) 
			and DATEDIFF(mm, l.BillingStartDate, @ReportDate) >= (DiscountMonth - 1) ) 
		)
	where 
		isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
	Group by l.LineItemID
	
	Update l set l.ActualMonthlyPrice = ActualMonthlyPrice - (ActualMonthlyPrice * (.01) * isnull(DiscountPct, 0) )  - isnull(DiscountAmount, 0) 
	from @LI l join @Additive a on l.LineItemID = a.LineItemID 
	
	/********************************
	Handle Piggy Back
	*********************************/
	
	Declare @LineItemID int, @DiscountMonth int, @DiscountPct numeric (37, 20), @DiscountAmount numeric (37, 20), @PermDiscountFlag bit, @RecurringMonths int
	Declare cc cursor Fast_Forward for
	Select l.LineItemID, DiscountMonth, DiscountPct, DiscountAmount, PermDiscountFlag, RecurringMonths 
	from @Li l join LineItemDiscount d WITH (NOLOCK) on l.LineItemID = d.LineItemID and l.DiscountType = 'Piggyback'
	where 
		isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
	order by l.LineItemID, DiscountOrder
	
	Open cc
	Fetch next from cc into @LineItemID, @DiscountMonth, @DiscountPct, @DiscountAmount, @PermDiscountFlag, @RecurringMonths 
	While @@Fetch_Status = 0 
	Begin
		Update l
		set l.ActualMonthlyPrice =  l.ActualMonthlyPrice - (l.ActualMonthlyPrice * (.01) * isnull(@DiscountPct, 0) )  - isnull(@DiscountAmount, 0) 
		From @Li l 
		Where l.LineItemID = @LineItemID and 
			(
			(@PermDiscountFlag = 1 and (DATEDIFF(mm, l.BillingStartDate, @ReportDate) + 1 ) >= @DiscountMonth )
				or
			(@PermDiscountFlag = 0 and DATEDIFF(mm, l.BillingStartDate, @ReportDate) < ((@DiscountMonth - 1) + @RecurringMonths) 
				and DATEDIFF(mm, l.BillingStartDate, @ReportDate) >= (@DiscountMonth - 1) ) 
			)
	
	Fetch cc into @LineItemID, @DiscountMonth, @DiscountPct, @DiscountAmount, @PermDiscountFlag, @RecurringMonths 
	End
	Close cc
	Deallocate cc
	
	Update @Li
	set ActualMonthlyPrice = 0
	where ActualMonthlyPrice < 0

	select @TotalPrice = sum(ActualMonthlyPrice)
	from @Li
	
	Return @TotalPrice
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnMonthlyPriceCalcMonetaryUnit]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
**		Created By:	Barlcay Howe
**		Created Date:	4/5/2012 
**		File: 		$/CodeBase/CRM.WS.Database/CRM.WS.DB.Contracts/Functions/fnMonthlyPriceCalc3MonetaryUnit.sql
**		Name: 		fnMonthlyPriceCalc3Monetary Unit
**		Desc: 		Returns monthly revenue based on LineItem, Contract, SiteLocation or BillingLocation	
**		Remarks:	Rules derived from fnMonthlyPriceCalc3 - only change is to add a parameter to specify the monetary Unit
**					so that they can't get added together. Used in UsageFactTable_ProcessWeek. 
**					Removed the NRB stuff, too, as it is obsolete,.
**
**
** UPDATES:
** DATE		AUTHOR	PURPOSE

** 04/06/2012 	BGH  
**			Copied from fnMonthlyCalc3 to be a version that supports limiting by monetary unit.

*******************************************************************************/
CREATE FUNCTION [dbo].[fnMonthlyPriceCalcMonetaryUnit]        /* CRM Version 4.0.1.0 */
	(@pModuleType varchar(25)	--'Lineitem', 'Contract', 'SiteLocation', 'BillingLocation', 'Contract|SiteLocation'
	,@pModuleID int
	,@pGetDate smalldatetime
	,@pProductID int		--<NULL> for All Products
	,@pLineitemTypeID int		--<NULL> for LineitemTypeID = 1: Default to 'Subscription' type
	,@pModuleID2 int 
	,@pMonetaryUnitId int)		--<NULL> defaults to USD

Returns numeric (38,20)

AS

Begin

	declare @ReportDate datetime, @TotalPrice numeric (37, 20)
	
	
	Select @ReportDate = @pGetDate, @TotalPrice = 0
	
	
	--AJV - Intercept for Property Express & Comps Express
	If @pModuleType = 'SiteLocation' and @pProductID in (35, 42)
	begin
		Return @TotalPrice
	End
	
	If @pMonetaryUnitId = null 
	begin
		set @pMonetaryUnitId = 1
	End
	
	Declare @LI table
		(LineItemID int, 
		CurrentMonthlyPrice numeric (38, 20), 
		BillingStartDate datetime, 
		ActualMonthlyPrice numeric (38, 20), 
		DiscountType char(10) )
	
	Declare @Discount table 
		(LineItemID int,
		DiscountMonth int, 
		DiscountPct numeric(38, 20), 
		DiscountAmount numeric (38, 20), 
		PermDiscountFlag bit, 
		RecurringMonths int)
	
	Declare @Additive table 
		( LineItemID int, 
		DiscountPct numeric (37, 20) , 
		DiscountAmount numeric (37, 20))
		
	/*****************************
	@pModuleType = 'SiteLocation'
	******************************/

	If @pModuleType = 'SiteLocation'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)

		-- Identify NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice 
		from dbo.LineItem AS li WITH (NOLOCK)
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.

		where
			li.SiteLocationID = @pModuleID
			and li.LineItemStatusID in (1, 2, 3, 5) -- 1=Active; 2=Fulfill Only; 3=Bill Only; 5=Terminate
			and li.BillingStartDate >= DateAdd(YYYY, -1, @pGetDate) -- NRB products are to be computed based upon the last 12 months.
			and li.BillingStartDate < DateAdd(DD, 1, cast(convert(varchar(25), @pGetDate, 101) as Datetime))
			and li.ProductID = isnull(@pProductID, li.ProductID)
			and li.MonetaryUnitID = @pMonetaryUnitId 

		union all -- Union All is used because the above dataset identifies NRB LineItems whereas the dataset below identifies non-NRB LineItems (there is no possibility of overlap).

		-- Identify non-NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice
		from dbo.LineItem AS li WITH (NOLOCK) 
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName NOT LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.
		where
			li.SiteLocationID = @pModuleID
			and li.LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
			and li.LineItemTypeID = isNull(@pLineitemTypeID, 1)
			and li.ProductID = isNull(@pProductID, li.ProductID)
			and li.MonetaryUnitID = @pMonetaryUnitId 
	
	End

	
	/*****************************
	@pModuleType = 'Contract'
	*****************************/

	If @pModuleType = 'Contract'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)

		-- Identify NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice 
		from dbo.LineItem AS li WITH (NOLOCK)
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.

		where
			li.ContractID = @pModuleID
			and li.LineItemStatusID in (1, 2, 3, 5) -- 1=Active; 2=Fulfill Only; 3=Bill Only; 5=Terminate
			and li.BillingStartDate >= DateAdd(YYYY, -1, @pGetDate) -- NRB products are to be computed based upon the last 12 months.
			and li.BillingStartDate < DateAdd(DD, 1, cast(convert(varchar(25), @pGetDate, 101) as Datetime))
			and li.ProductID = isnull(@pProductID, li.ProductID)
			and li.MonetaryUnitID = @pMonetaryUnitId 

		union all -- Union All is used because the above dataset identifies NRB LineItems whereas the dataset below identifies non-NRB LineItems (there is no possibility of overlap).

		-- Identify non-NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice
		from dbo.LineItem AS li WITH (NOLOCK) 
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName NOT LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.
		where
			li.ContractID = @pModuleID
			and li.LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
			and li.LineItemTypeID = isNull(@pLineitemTypeID, 1)
			and li.ProductID = isNull(@pProductID, li.ProductID)
			and li.MonetaryUnitID = @pMonetaryUnitId 
	
	End
	
	/*****************************
	@pModuleType = 'BillingLocation'
	*****************************/

	If @pModuleType = 'BillingLocation'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)
		Select distinct li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), CurrentMonthlyPrice
		from dbo.LineItem li WITH (NOLOCK) join dbo.Contract c WITH (NOLOCK) on li.ContractID = c.ContractID  
		where c.BillingLocationID = @pModuleID 
		and LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
		and LineItemTypeID = isNull(@pLineitemTypeID, 1)
		and ProductID = isNull(@pProductID, ProductID)	
		and li.MonetaryUnitID = @pMonetaryUnitId 
	
	End
	
	/*****************************
	@pModuleType = 'LineItem'
	*****************************/
	
	If @pModuleType = 'LineItem'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)
		Select distinct LineItemID, CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), CurrentMonthlyPrice
		from dbo.LineItem  li WITH (NOLOCK) 
		where LineItemID = @pModuleID 
		and LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
		and LineItemTypeID = isNull(@pLineitemTypeID, 1)
		and ProductID = isNull(@pProductID, ProductID)	
		and li.MonetaryUnitID = @pMonetaryUnitId 
	
	End

	/*****************************
	@pModuleType = 'Contract|SiteLocation'
	*****************************/
	If @pModuleType = 'Contract|SiteLocation'
	Begin

		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)
	
		-- Identify NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice 
		from dbo.LineItem AS li WITH (NOLOCK)
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.
		where
			li.ContractID = @pModuleID
			and li.SiteLocationID = @pModuleID2
			and li.LineItemStatusID in (1, 2, 3, 5) -- 1=Active; 2=Fulfill Only; 3=Bill Only; 5=Terminate
			and li.BillingStartDate >= DateAdd(YYYY, -1, @pGetDate) -- NRB products are to be computed based upon the last 12 months.
			and li.BillingStartDate < DateAdd(DD, 1, cast(convert(varchar(25), @pGetDate, 101) as Datetime))
			and li.ProductID = isnull(@pProductID, li.ProductID)
			and li.MonetaryUnitID = @pMonetaryUnitId 
	
		union all -- Union All is used because the above dataset identifies NRB LineItems whereas the dataset below identifies non-NRB LineItems (there is no possibility of overlap).
	
		-- Identify non-NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice
		from dbo.LineItem AS li WITH (NOLOCK) 
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName NOT LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.
		where
			li.ContractID = @pModuleID
			and li.SiteLocationID = @pModuleID2
			and li.LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
			and li.LineItemTypeID = isNull(@pLineitemTypeID, 1)
			and li.ProductID = isNull(@pProductID, li.ProductID)
			and li.MonetaryUnitID = @pMonetaryUnitId 

	End


	Update l
	set DiscountType = 'Additive' 
	from @LI l 
	where
		exists (
			select 1
			from dbo.LineItemDiscount d WITH (NOLOCK)
			where
				l.LineItemID = d.LineItemId and
				DiscountOrder is null and 
				isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
			)
		or
		exists (
			select 1
			from dbo.LineItemDiscount d2 WITH (NOLOCK)
			where
				l.LineItemID = d2.LineitemID and 
				isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
			Group By DiscountOrder
			Having count(*) > 1 
			)
	
	Update @LI
	set DiscountType = 'PiggyBack'
	where DiscountType is null
	
	/********************************
	Handle Additive Discounts
	*********************************/
	
	Insert into @Additive (LineItemID, DiscountPct, DiscountAmount ) 
	select l.LineItemID, sum(DiscountPct) DiscountPct, sum(DiscountAmount) DiscountAmount
	from @LI l join lineitemdiscount d WITH (NOLOCK) on l.LineItemID = d.LineItemID and l.DiscountType = 'additive' 
	and (
		(d.PermDiscountFlag = 1 and (DATEDIFF(mm, l.BillingStartDate, @ReportDate) + 1 ) >= d.DiscountMonth )
			or
		(d.PermDiscountFlag = 0 and DATEDIFF(mm, l.BillingStartDate, @ReportDate) < ((DiscountMonth - 1) + RecurringMonths) 
			and DATEDIFF(mm, l.BillingStartDate, @ReportDate) >= (DiscountMonth - 1) ) 
		)
	where 
		isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
	Group by l.LineItemID
	
	Update l set l.ActualMonthlyPrice = ActualMonthlyPrice - (ActualMonthlyPrice * (.01) * isnull(DiscountPct, 0) )  - isnull(DiscountAmount, 0) 
	from @LI l join @Additive a on l.LineItemID = a.LineItemID 
	
	/********************************
	Handle Piggy Back
	*********************************/
	
	Declare @LineItemID int, @DiscountMonth tinyint, @DiscountPct numeric (37, 20), @DiscountAmount numeric (37, 20), @PermDiscountFlag bit, @RecurringMonths tinyint
	Declare cc cursor Fast_Forward for
	Select l.LineItemID, DiscountMonth, DiscountPct, DiscountAmount, PermDiscountFlag, RecurringMonths 
	from @Li l join LineItemDiscount d WITH (NOLOCK) on l.LineItemID = d.LineItemID and l.DiscountType = 'Piggyback'
	where 
		isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
	order by l.LineItemID, DiscountOrder
	
	Open cc
	Fetch next from cc into @LineItemID, @DiscountMonth, @DiscountPct, @DiscountAmount, @PermDiscountFlag, @RecurringMonths 
	While @@Fetch_Status = 0 
	Begin
		Update l
		set l.ActualMonthlyPrice =  l.ActualMonthlyPrice - (l.ActualMonthlyPrice * (.01) * isnull(@DiscountPct, 0) )  - isnull(@DiscountAmount, 0) 
		From @Li l 
		Where l.LineItemID = @LineItemID and 
			(
			(@PermDiscountFlag = 1 and (DATEDIFF(mm, l.BillingStartDate, @ReportDate) + 1 ) >= @DiscountMonth )
				or
			(@PermDiscountFlag = 0 and DATEDIFF(mm, l.BillingStartDate, @ReportDate) < ((@DiscountMonth - 1) + @RecurringMonths) 
				and DATEDIFF(mm, l.BillingStartDate, @ReportDate) >= (@DiscountMonth - 1) ) 
			)
	
	Fetch cc into @LineItemID, @DiscountMonth, @DiscountPct, @DiscountAmount, @PermDiscountFlag, @RecurringMonths 
	End
	Close cc
	Deallocate cc
	
	Update @Li
	set ActualMonthlyPrice = 0
	where ActualMonthlyPrice < 0

	select @TotalPrice = sum(ActualMonthlyPrice)
	from @Li
	
	Return @TotalPrice
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnMonthlyPriceCalcSubsidiary]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
**		Created By:	Barclay Howe
**		Created Date:	4/5/2012 
**		File: 		$/CodeBase/CRM.WS.Database/CRM.WS.DB.Contracts/Functions/fnMonthlyPriceCalcSubsidiary.sql
**		Name: 		fnMonthlyPriceCalcSubsidiary
**		Desc: 		Returns monthly revenue based on LineItem, Contract, SiteLocation or BillingLocationfor a particular subsidiary	
**		Remarks:	Rules derived from fnMonthlyPriceCalc3 - only change was to add a parameter to select the subsidiary.
**					Removed the NRB stuff, too, as it is obsolete,.
**
**
** UPDATES:
** DATE		AUTHOR	PURPOSE
** 04/05/2012 BGH: Naive version to calculate revenue by subsidiary for a site location
**		To support the UK effort and BOB TFS 39350

*******************************************************************************/
CREATE FUNCTION [dbo].[fnMonthlyPriceCalcSubsidiary]        /* CRM Version 4.0.1.0 */
	(@pModuleType varchar(25)	--'Lineitem', 'Contract', 'SiteLocation', 'BillingLocation', 'Contract|SiteLocation'
	,@pModuleID int
	,@pGetDate smalldatetime
	,@pSubsidiaryId int		
	,@pLineitemTypeID int		--<NULL> for LineitemTypeID = 1: Default to 'Subscription' type
	,@pModuleID2 int 		--<NULL> for all requests, except combination requests, such as providing Contract AND SiteLocation.
	)	

Returns numeric (38,20)

AS

Begin

	declare @ReportDate datetime, @TotalPrice numeric (37, 20)
	Select @ReportDate = @pGetDate, @TotalPrice = 0
	
	Declare @LI table
		(LineItemID int, 
		CurrentMonthlyPrice numeric (38, 20), 
		BillingStartDate datetime, 
		ActualMonthlyPrice numeric (38, 20), 
		DiscountType char(10) )
	
	Declare @Discount table 
		(LineItemID int,
		DiscountMonth int, 
		DiscountPct numeric(38, 20), 
		DiscountAmount numeric (38, 20), 
		PermDiscountFlag bit, 
		RecurringMonths int)
	
	Declare @Additive table 
		( LineItemID int, 
		DiscountPct numeric (37, 20) , 
		DiscountAmount numeric (37, 20))

	
	
	/*****************************
	@pModuleType = 'SiteLocation'
	******************************/

	If @pModuleType = 'SiteLocation'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)

		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice
		from dbo.LineItem AS li WITH (NOLOCK) 
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.
		where
			li.SiteLocationID = @pModuleID
			and li.LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
			and li.LineItemTypeID = isNull(@pLineitemTypeID, 1)
			and c.CoStarSubsidiaryID = @pSubsidiaryId
			
	End

	
	/*****************************
	@pModuleType = 'Contract'
	*****************************/

	If @pModuleType = 'Contract'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)
		-- Identify non-NRB LineItems
		Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice
		from dbo.LineItem AS li WITH (NOLOCK) 
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName NOT LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.
		where
			li.ContractID = @pModuleID
			and li.LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
			and li.LineItemTypeID = isNull(@pLineitemTypeID, 1)
			and c.CoStarSubsidiaryID = @pSubsidiaryId

	End
	
	/*****************************
	@pModuleType = 'BillingLocation'
	*****************************/

	If @pModuleType = 'BillingLocation'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)
		Select distinct li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), CurrentMonthlyPrice
		from dbo.LineItem li WITH (NOLOCK) join dbo.Contract c WITH (NOLOCK) on li.ContractID = c.ContractID  
		where c.BillingLocationID = @pModuleID 
		and LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
		and li.LineItemTypeID = isNull(@pLineitemTypeID, 1)
		and c.CoStarSubsidiaryID = @pSubsidiaryId
	End
	
	/*****************************
	@pModuleType = 'LineItem'
	*****************************/
	
	If @pModuleType = 'LineItem'
	Begin
		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)
		Select distinct LineItemID, CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), CurrentMonthlyPrice
		from dbo.LineItem  li WITH (NOLOCK) inner join Contract c with (nolock) on c.ContractID = li.ContractID
		where LineItemID = @pModuleID 
		and LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
		and li.LineItemTypeID = isNull(@pLineitemTypeID, 1)
		and c.CoStarSubsidiaryID = @pSubsidiaryId
	End

	/*****************************
	@pModuleType = 'Contract|SiteLocation'
	*****************************/
	If @pModuleType = 'Contract|SiteLocation'
	Begin

		Insert into @LI (LineItemID, CurrentMonthlyPrice, BillingStartDate, ActualMonthlyPrice)
	
	Select li.LineItemID, li.CurrentMonthlyPrice, isnull(li.BillingStartDate, @pGetDate), li.CurrentMonthlyPrice
		from dbo.LineItem AS li WITH (NOLOCK) 
		inner join dbo.Contract AS c WITH (NOLOCK) ON
			c.ContractID = li.ContractID
		inner join dbo.Product AS p WITH (NOLOCK) ON
			p.ProductID = li.ProductID AND
			p.ProductName NOT LIKE 'NRB %' AND
			p.IncludeInMonthlyRevenueFlag = 1 -- Ensure that the products produce recurring fees, not one-time fees.
		where
			li.ContractID = @pModuleID
			and li.SiteLocationID = @pModuleID2
			and li.LineItemStatusID in (1,2,3) -- 1=Active; 2=Fulfill Only; 3=Bill Only
			and li.LineItemTypeID = isNull(@pLineitemTypeID, 1)
			and c.CoStarSubsidiaryID = @pSubsidiaryId
		
		-- Identify non-NRB LineItems
		
	End


	Update l
	set DiscountType = 'Additive' 
	from @LI l 
	where
		exists (
			select 1
			from dbo.LineItemDiscount d WITH (NOLOCK)
			where
				l.LineItemID = d.LineItemId and
				DiscountOrder is null and 
				isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
			)
		or
		exists (
			select 1
			from dbo.LineItemDiscount d2 WITH (NOLOCK)
			where
				l.LineItemID = d2.LineitemID and 
				isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
			Group By DiscountOrder
			Having count(*) > 1 
			)
	
	Update @LI
	set DiscountType = 'PiggyBack'
	where DiscountType is null
	
	/********************************
	Handle Additive Discounts
	*********************************/
	
	Insert into @Additive (LineItemID, DiscountPct, DiscountAmount ) 
	select l.LineItemID, sum(DiscountPct) DiscountPct, sum(DiscountAmount) DiscountAmount
	from @LI l join lineitemdiscount d WITH (NOLOCK) on l.LineItemID = d.LineItemID and l.DiscountType = 'additive' 
	and (
		(d.PermDiscountFlag = 1 and (DATEDIFF(mm, l.BillingStartDate, @ReportDate) + 1 ) >= d.DiscountMonth )
			or
		(d.PermDiscountFlag = 0 and DATEDIFF(mm, l.BillingStartDate, @ReportDate) < ((DiscountMonth - 1) + RecurringMonths) 
			and DATEDIFF(mm, l.BillingStartDate, @ReportDate) >= (DiscountMonth - 1) ) 
		)
	where 
		isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
	Group by l.LineItemID
	
	Update l set l.ActualMonthlyPrice = ActualMonthlyPrice - (ActualMonthlyPrice * (.01) * isnull(DiscountPct, 0) )  - isnull(DiscountAmount, 0) 
	from @LI l join @Additive a on l.LineItemID = a.LineItemID 
	
	/********************************
	Handle Piggy Back
	*********************************/
	
	Declare @LineItemID int, @DiscountMonth tinyint, @DiscountPct numeric (37, 20), @DiscountAmount numeric (37, 20), @PermDiscountFlag bit, @RecurringMonths tinyint
	Declare cc cursor Fast_Forward for
	Select l.LineItemID, DiscountMonth, DiscountPct, DiscountAmount, PermDiscountFlag, RecurringMonths 
	from @Li l join LineItemDiscount d WITH (NOLOCK) on l.LineItemID = d.LineItemID and l.DiscountType = 'Piggyback'
	where 
		isnull(datediff(ss, convert(datetime, convert(varchar(10),voiddate,101)), @pGetDate),0)<= 0
	order by l.LineItemID, DiscountOrder
	
	Open cc
	Fetch next from cc into @LineItemID, @DiscountMonth, @DiscountPct, @DiscountAmount, @PermDiscountFlag, @RecurringMonths 
	While @@Fetch_Status = 0 
	Begin
		Update l
		set l.ActualMonthlyPrice =  l.ActualMonthlyPrice - (l.ActualMonthlyPrice * (.01) * isnull(@DiscountPct, 0) )  - isnull(@DiscountAmount, 0) 
		From @Li l 
		Where l.LineItemID = @LineItemID and 
			(
			(@PermDiscountFlag = 1 and (DATEDIFF(mm, l.BillingStartDate, @ReportDate) + 1 ) >= @DiscountMonth )
				or
			(@PermDiscountFlag = 0 and DATEDIFF(mm, l.BillingStartDate, @ReportDate) < ((@DiscountMonth - 1) + @RecurringMonths) 
				and DATEDIFF(mm, l.BillingStartDate, @ReportDate) >= (@DiscountMonth - 1) ) 
			)
	
	Fetch cc into @LineItemID, @DiscountMonth, @DiscountPct, @DiscountAmount, @PermDiscountFlag, @RecurringMonths 
	End
	Close cc
	Deallocate cc
	
	Update @Li
	set ActualMonthlyPrice = 0
	where ActualMonthlyPrice < 0

	select @TotalPrice = sum(ActualMonthlyPrice)
	from @Li
	
	Return isnull(@TotalPrice,0.00)
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnMostRecentCharDate]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- Returns just the date portion of the supplied date
CREATE FUNCTION [dbo].[fnMostRecentCharDate] (@pDate1 DateTime,@pDate2 DateTime,@pDate3 DateTime) Returns Char(20)
AS
BEGIN   
        Declare @retdate datetime
        If ((@pDate2 is NULL) or (@pDate1 > @pDate2))                 
           set @retdate = @pDate1
        else
           set @retdate = @pDate2
 
        if (( @retDate is NULL) or (@retDate < @pDate3))
             set @retdate = @pdate3
        
	return CONVERT(char(20),@retdate,111)
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnMostRecentDate]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------
-- File: C:\COSTARPROJECTS\COSTARINTERNALAPPS\MAIN\ENTERPRISE\SOURCE\Database\CRM.Nightly Processes\Functions\fnMostRecentDate.sql


-- Returns just the date portion of the supplied date
CREATE   Function [dbo].[fnMostRecentDate] (@pDate1 DateTime,@pDate2 DateTime,@pDate3 DateTime) Returns DateTime
AS
BEGIN   
        Declare @retdate datetime
        If ((@pDate2 is NULL) or (@pDate1 > @pDate2))                 
           set @retdate = @pDate1
        else
           set @retdate = @pDate2
 
        if (( @retDate is NULL) or (@retDate < @pDate3))
             set @retdate = @pdate3
        
	return @retdate
END
 



GO
/****** Object:  UserDefinedFunction [dbo].[fnNickNames]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnNickNames] (@FirstName varchar(30))
Returns @tbNickNames Table (NickName varchar(30))
As
   Begin
	insert @tbNickNames (NickName)
	Select Distinct
		c.[Name] as NickName
	From 
		dbo.NickNames a  with (nolock)
	JOIN	dbo.NameNickNames b with (nolock) ON a.NameID = b.NameID
	JOIN	dbo.NickNames c with (nolock) ON b.NickNameID = c.NameID
	Where 
		a.name = @FirstName

	UNION

	Select @FirstName as NickName

	Return
   End

GO
/****** Object:  UserDefinedFunction [dbo].[fnNum2FTSSearch]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnNum2FTSSearch] 
-- CREATE FUNCTION dbo.fnNum2FTSSearch 
				(@Number VARCHAR(18)
				) RETURNS VARCHAR (8000) 
/******************************************************************************
**	Name: dbo.fnNum2FTSSearch
**	
**  Function converts @Number to Ordinal, Cardinal and RomanNumberal search String
**  from use with full text search (FTS).
**
**  rl  08/04/04 Created
**
**  rl  08/05/04 Modified to search for (Number + Ordinal suffix) OR (Number)
**
********************************************************************************/
AS BEGIN

DECLARE @NumStr VARCHAR (8000)
DECLARE @Num_C_Str VARCHAR (8000)
DECLARE @Num_O_Str VARCHAR (8000)
DECLARE @O_Str VARCHAR (8000)
DECLARE @R_Str VARCHAR (10)
DECLARE @right_part VARCHAR (20)
DECLARE @right_pos INT
DECLARE @alt_Str VARCHAR(8000)
DECLARE @Criteria VARCHAR (8000)

DECLARE @NumCardinal VARCHAR (8000)
DECLARE @NumOrdinal VARCHAR (8000) 
DECLARE @NumRoman VARCHAR (10)
DECLARE @AltStr VARCHAR(8000) 

SET @NumStr=@Number

SELECT 	@Num_C_Str = dbo.fnNum2Words (@NumStr)
--SELECT @Num_C_Str
IF charindex(' ',replace(reverse(@Num_C_Str),'-',' '))>0
	BEGIN
		SET @right_pos = -1 + charindex(' ',replace(reverse(@Num_C_Str),'-',' '))
		SELECT @right_part = right (@Num_C_Str,@right_pos) --subString(@Num_C_Str, datalength(@Num_c_Str)-@right_pos,@right_pos)
	END
ELSE
	SELECT @right_part = @Num_C_Str
--SELECT @right_part

SELECT @O_Str =replace	(CASE UPPER(@right_part) 
		WHEN 'ONE' THEN 'first'
		WHEN 'TWO' THEN 'second'
		WHEN 'THREE' THEN 'third'
		WHEN 'FIVE' THEN 'fifth'
		WHEN 'EIGHT' THEN 'eighth'
		WHEN 'TWELVE' THEN 'twelfth'
		ELSE @right_part + 'th'
		END,'y','ie')

SELECT @R_Str =CASE UPPER(@right_part) 
		WHEN 'ONE' THEN 'I'
		WHEN 'TWO' THEN 'II'
		WHEN 'THREE' THEN 'III'
		WHEN 'FOUR' THEN 'IV'
		WHEN 'FIVE' THEN 'V'
		WHEN 'SIX' THEN 'VI'
		WHEN 'SEVEN' THEN 'VII'
		WHEN 'EIGHT' THEN 'VIII'
		WHEN 'NINE' THEN 'IV'
		WHEN 'TEN' THEN 'X'
		END

--SELECT @right_part, convert(VARCHAR,rtrim(@o_Str))

IF @right_pos is not null
	SELECT @Num_O_Str = subString(@Num_C_Str,1, DATALENGTH(@Num_C_Str)- @right_pos ) + @O_Str
ELSE
	SELECT @Num_O_Str = @O_Str

-- SELECT convert(VARCHAR,rtrim(@NumStr)) Number
-- SELECT @Num_C_Str Cardinal 
-- SELECT @Num_O_Str Ordinal

SELECT @Num_C_Str=replace(@Num_C_Str,' ','*')
SELECT @Num_O_Str=replace(@Num_O_Str,' ','*')

SET @Alt_Str =''
IF convert(BIGINT,@NumStr)>20
BEGIN
	SELECT @Alt_Str = ' OR ' + replace(rtrim(replace(
					replace ( '"' + @Num_C_Str + '" ' 
						+ '"' + @Num_O_Str + '"' 
						, ' ', ' OR '
						)
						+ @Alt_Str 
					,'~',' ~ '
					)
				),'-',' ~ ')
	
	IF convert(BIGINT,@NumStr)>100
		SELECT @Alt_Str = ' OR "'+ replace(replace(
						replace (@Num_C_Str,'hundred',''),'**','*'),'*', ' ~ ') 
				+ '" '
				+ ' OR "'+ replace(replace(
						replace (@Num_O_Str,'hundred',''),'**','*'),'*', ' ~ ')
				+ '"'

	IF convert(BIGINT,@NumStr)>1000
		SELECT @Alt_Str = ' OR "'+ replace(replace(
						replace (@Num_C_Str,'thousand',''),'**','*'),'*', ' ~ ') 
				+ '" '
				+ ' OR "'+ replace(replace(
						replace (@Num_O_Str,'thousand',''),'**','*'),'*', ' ~ ')
				+ '"'

	IF convert(BIGINT,@NumStr)=100
		SELECT @Alt_Str = @Alt_Str + ' OR "Hundred"'
	
	IF convert(BIGINT,@NumStr)=1000
		SELECT @Alt_Str = @Alt_Str + ' OR "Thousand"'
END	

IF convert(BIGINT,@NumStr)<=10
BEGIN
	SELECT @Alt_Str = ' OR "' + @R_Str + '"'
END				
--SELECT @Alt_Str

SELECT @criteria = replace('"' + @NumStr + '" ' 
			+ '"' + @NumStr + right(@O_Str,2) + '" ' 
			+ '"'+ @Num_C_Str +'" ' 
			+ '"'+ @Num_O_Str +'"' 
			,' ',' OR ')+ COALESCE(@Alt_Str, '')


-- SET @AltStr = @Alt_Str
-- SET @NumCardinal = @Num_C_Str
-- SET @NumOrdinal = @Num_O_Str
-- SET @NumRoman = @R_Str

RETURN @Criteria -- return the result

END




GO
/****** Object:  UserDefinedFunction [dbo].[fnNum2Words]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE FUNCTION fnNum2Words 
CREATE FUNCTION [dbo].[fnNum2Words] 
				( @Number Numeric (38, 0) -- Input number with as many as 18 digits
				) RETURNS VARCHAR(8000) 

/*
* Based on dbo.udf_Num_ToWords
* Converts a integer number as large as 34 digits into the 
* equivalent words.  The first letter is capitalized.
*
* Attribution: Based on NumberToWords by Srinivas Sampath
*        as revised by Nick Barclay
*
* Example:
select dbo.udf_Num_ToWords (1234567890) + CHAR(10)
      +  dbo.udf_Num_ToWords (0) + CHAR(10)
      +  dbo.udf_Num_ToWords (123) + CHAR(10)
select dbo.udf_Num_ToWords(76543210987654321098765432109876543210)
 
DECLARE @i numeric (38,0)
SET @i = 0
WHILE @I <= 1000 BEGIN 
    PRINT convert (char(5), @i)  
            + convert(varchar(255), dbo.udf_Num_ToWords(@i)) 
    SET @I  = @i + 1 
END
*
* Published as the T-SQL UDF of the Week Vol 2 #9 2/17/03
****************************************************************/
AS BEGIN

DECLARE @inputNumber VARCHAR(38)
DECLARE @NumbersTable TABLE (number CHAR(2), word VARCHAR(10))
DECLARE @outputString VARCHAR(8000)
DECLARE @length INT
DECLARE @counter INT
DECLARE @loops INT
DECLARE @position INT
DECLARE @chunk CHAR(3) -- for chunks of 3 numbers
DECLARE @tensones CHAR(2)
DECLARE @hundreds CHAR(1)
DECLARE @tens CHAR(1)
DECLARE @ones CHAR(1)

IF @Number = 0 Return 'Zero'

-- initialize the variables
SELECT @inputNumber = CONVERT(varchar(38), @Number)
     , @outputString = ''
     , @counter = 1
SELECT @length   = LEN(@inputNumber)
     , @position = LEN(@inputNumber) - 2
     , @loops    = LEN(@inputNumber)/3

-- make sure there is an extra loop added for the remaining numbers
IF LEN(@inputNumber) % 3 <> 0 SET @loops = @loops + 1

-- insert data for the numbers and words
INSERT INTO @NumbersTable   SELECT '00', ''
    UNION ALL SELECT '01', 'one'      UNION ALL SELECT '02', 'two'
    UNION ALL SELECT '03', 'three'    UNION ALL SELECT '04', 'four'
    UNION ALL SELECT '05', 'five'     UNION ALL SELECT '06', 'six'
    UNION ALL SELECT '07', 'seven'    UNION ALL SELECT '08', 'eight'
    UNION ALL SELECT '09', 'nine'     UNION ALL SELECT '10', 'ten'
    UNION ALL SELECT '11', 'eleven'   UNION ALL SELECT '12', 'twelve'
    UNION ALL SELECT '13', 'thirteen' UNION ALL SELECT '14', 'fourteen'
    UNION ALL SELECT '15', 'fifteen'  UNION ALL SELECT '16', 'sixteen'
    UNION ALL SELECT '17', 'seventeen' UNION ALL SELECT '18', 'eighteen'
    UNION ALL SELECT '19', 'nineteen' UNION ALL SELECT '20', 'twenty'
    UNION ALL SELECT '30', 'thirty'   UNION ALL SELECT '40', 'forty'
    UNION ALL SELECT '50', 'fifty'    UNION ALL SELECT '60', 'sixty'
    UNION ALL SELECT '70', 'seventy'  UNION ALL SELECT '80', 'eighty'
    UNION ALL SELECT '90', 'ninety'   

WHILE @counter <= @loops BEGIN

	-- get chunks of 3 numbers at a time, padded with leading zeros
	SET @chunk = RIGHT('000' + SUBSTRING(@inputNumber, @position, 3), 3)

	IF @chunk <> '000' BEGIN
		SELECT @tensones = SUBSTRING(@chunk, 2, 2)
		     , @hundreds = SUBSTRING(@chunk, 1, 1)
		     , @tens = SUBSTRING(@chunk, 2, 1)
		     , @ones = SUBSTRING(@chunk, 3, 1)

		-- If twenty or less, use the word directly from @NumbersTable
		IF CONVERT(INT, @tensones) <= 20 OR @Ones='0' BEGIN
			SET @outputString = (SELECT word 
                                      FROM @NumbersTable 
                                      WHERE @tensones = number)
                   + CASE @counter WHEN 1 THEN '' -- No name
                       WHEN 2 THEN ' thousand ' WHEN 3 THEN ' million '
                       WHEN 4 THEN ' billion '  WHEN 5 THEN ' trillion '
                       WHEN 6 THEN ' quadrillion ' WHEN 7 THEN ' quintillion '
                       WHEN 8 THEN ' sextillion '  WHEN 9 THEN ' septillion '
                       WHEN 10 THEN ' octillion '  WHEN 11 THEN ' nonillion '
                       WHEN 12 THEN ' decillion '  WHEN 13 THEN ' undecillion '
                       ELSE '' END
                               + @outputString
		    END
		 ELSE BEGIN -- break down the ones and the tens separately

             SET @outputString = ' ' 
                            + (SELECT word 
                                    FROM @NumbersTable 
                                    WHERE @tens + '0' = number)
					         + '-'
                             + (SELECT word 
                                    FROM @NumbersTable 
                                    WHERE '0'+ @ones = number)
                   + CASE @counter WHEN 1 THEN '' -- No name
                       WHEN 2 THEN ' thousand ' WHEN 3 THEN ' million '
                       WHEN 4 THEN ' billion '  WHEN 5 THEN ' trillion '
                       WHEN 6 THEN ' quadrillion ' WHEN 7 THEN ' quintillion '
                       WHEN 8 THEN ' sextillion '  WHEN 9 THEN ' septillion '
                       WHEN 10 THEN ' octillion '  WHEN 11 THEN ' nonillion '
                       WHEN 12 THEN ' decillion '   WHEN 13 THEN ' undecillion '
                       ELSE '' END
                            + @outputString
		END

		-- now get the hundreds
		IF @hundreds <> '0' BEGIN
			SET @outputString  = (SELECT word 
                                      FROM @NumbersTable 
                                      WHERE '0' + @hundreds = number)
					            + ' hundred ' 
                                + @outputString
		END
	END

	SELECT @counter = @counter + 1
	     , @position = @position - 3

END

-- Remove any double spaces
SET @outputString = LTRIM(RTRIM(REPLACE(@outputString, '  ', ' ')))
SET @outputstring = UPPER(LEFT(@outputstring, 1)) + SUBSTRING(@outputstring, 2, 8000)


RETURN @outputString -- return the result
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnPeriodFirstDayGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnPeriodFirstDayGet] ( @pPeriod varchar(3), @pDatePeriod DateTime ) returns DateTime
AS
Begin
DECLARE @FirstDay DateTime
DECLARE @Month int
DECLARE @Year int
DECLARE @Temp varchar(20)

SET @Month = DatePart (month, @pDatePeriod)
SET @Year = DatePart (year, @pDatePeriod)
IF @pPeriod = 'Q' OR @pPeriod = 'QTD' BEGIN 
	IF (@Month < 4)		  SET @Month = 1
	ELSE IF (@Month < 7)  SET @Month = 4
	ELSE IF (@Month < 10) SET @Month = 7
	ELSE				  SET @Month = 10
	SET @Temp =  Convert(varchar(2), @Month) + '/01/' + Convert(varchar(4), @Year)			
	SET @FirstDay = Convert (DateTime, @Temp)
END
ELSE IF @pPeriod = 'MTD' BEGIN
	SET @Temp = Convert(varchar(2), @Month) + '/01/' + Convert(varchar(4), @Year)
	SET @FirstDay = Convert (DateTime, @Temp)
END
ELSE IF @pPeriod = 'M' BEGIN
	SET @FirstDay = DateAdd (Month, -1, @pDatePeriod)
END
ELSE IF @pPeriod = 'YTD' BEGIN	-- Year
	SET @Temp = '01/01/' + Convert(varchar(4), @Year)
	SET @FirstDay = Convert (DateTime, @Temp)
END	
ELSE IF @pPeriod = 'Y' BEGIN
	SET @FirstDay = DateAdd (Year, -1, @pDatePeriod)
END
ELSE BEGIN
	SET @FirstDay = DateAdd (day, (Convert(int, @pPeriod)*-1), @pDatePeriod)
END	
RETURN Convert(DateTime, Convert(varchar(20), @FirstDay, 101))
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnPermissionGroupAuthorizedManagerCSVListGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  FUNCTION [dbo].[fnPermissionGroupAuthorizedManagerCSVListGet] (        
@pPermissionGroupID INT
) returns varchar(255)
/*	
	dbo.fnContactSecurityAreaGroupMembershipCSVListGet
	
	function to return multiple Permission Sources, comma separated ie  "Research, ResearchManager, Collections"  - for a given User within a given SecurityArea	

	ex: 
		select dbo.fnContactSecurityAreaGroupMembershipCSVListGet(ContactID, 'Inbox')

	4/20/04 gpv Created

*/
AS
/*	
2/3/2017 PSinha 	EPM-X: Authorized manager list issue.
The list on home page not correct...showing inactive users.
adding cc.Status=1

*/
BEGIN

DECLARE @acc VARCHAR(255)

SELECT
	@acc = isnull(@acc + ', ','') + c.FirstName + ' ' + c.LastName
FROM dbo.PermissionGroup pg with (nolock)
left outer join dbo.PermissionGroupManager pgm with (nolock) ON pg.PermissionGroupID = pgm.PermissionGroupID
join dbo.Contact c with (nolock) on pgm.ManagerContactID = c.ContactID
join dbo.CostarContact cc with (nolock) on pgm.ManagerContactID = cc.ContactID
WHERE pg.PermissionGroupID = @pPermissionGroupID and cc.Status=1
order by c.LastName

--select @acc
return @acc

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnPipelineIDListGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- File: c:\CoStarProjects\CRM.WS.Database\CRM.WS.DB.Lookups\Functions\fnPipelineIDListGet.sql
/******************************************************************************
* PROJECT NAME: New Research System
* SCRIPT NAME: fnPipelineIDListGet.SQL
* CREATION DATE: 06/29/2005
* COPYRIGHT: COSTAR GROUP, INC
* PURPOSE: Grows a list string of all PipelineIDs for a specified contract.
*
* UPDATES:
* DATE		AUTHOR	PURPOSE
* 06/29/2005	LR	Created.
* 02/24/2005    EKO	Commented out GROUP BY clause since no aggregation
*			is performed.  According to LR, it was added since
*			the function would sporadically return just 1 PipelineID
*			when an entire list was expected.  My personal testing
*			shows that the function works fine without the grouping.
******************************************************************************/

CREATE FUNCTION [dbo].[fnPipelineIDListGet] (@pContractID int )        /* CRM Version 4.0.1.0 */
RETURNS Varchar(300)
AS BEGIN

DECLARE @PipelineIDList varchar(300)
SELECT @PipelineIDList =  cast(PipelineID as varchar) + ', ' + isnull(@PipelineIDList , '') 
FROM ProspectPipeline with (nolock)
WHERE ContractID = @pContractID
--group by PipelineID -- Commented out since no aggregation is being performed.
ORDER BY PipelineID desc

SET @PipelineIDList = left(@PipelineIDList, len(@PipelineIDList) - 1 )

RETURN @PipelineIDList
END

GO
/****** Object:  UserDefinedFunction [dbo].[FnPopulateTimeDim]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  Function [dbo].[FnPopulateTimeDim]( @FromYear int, 
                                        @ToYear   int)
RETURNS @TempTimeDim Table (TimeDimDate datetime, 
                            Wk  tinyint,
                            Mo tinyint,
                            Yr smallint,
                            Qtr  tinyint) 

AS

--Kevin Mikailov 01/14/2005
BEGIN

DECLARE   @currentdate datetime,
          @Newdate datetime

DECLARE @Days int
set @Days =1

 While  @FromYear <=@ToYear
  begin
           set @currentdate  = convert(datetime,convert(char(4),@FromYear))
           set @NewDate =  DATEADD(mm, DATEDIFF(mm,0,@currentdate), -1)
            while datepart(month,@NewDate) <=12 and @NewDate <= dateadd(ms,-3,DATEADD(mm, DATEDIFF(m,0, @currentdate  )+12, -1))
            begin
               --insert into timing select @NewDate
                 set @NewDate = dateadd(day,1,@NewDate)
                 set @Days = @Days +1

                 Insert @TempTimeDim
                        (
                        TimeDimDate,
                        Wk,
                        Mo,
                        Yr,
                        Qtr)
                 select @NewDate             as TimeDimDate,
                        DATEPART(WW,@NewDate)as Wk,
                        DATEPART(MM,@NewDate)as Mo,
                        DATEPART(YYYY,@NewDate)as Yr,
                        DATEPART(QQ,@NewDate)as Qtr
            end

       set @FromYear = @FromYear +1
  end
  RETURN
END







GO
/****** Object:  UserDefinedFunction [dbo].[fnPreviousWeekEndDate]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Function [dbo].[fnPreviousWeekEndDate] (@FromDate DateTime) Returns DateTime
As
Begin
	/*
	This function returns the a dateTime representing the Last
	DateTime value of the previous week of the year.

	ie: 2/28/2003 is a Friday.  Function will return the Saturday night of the previous week
	Select dbo.fnPreviousWeekEndDate ('2/28/2003') --2003-02-22 23:59:59.997 
	*/

	Declare @PreviousWeekEndDate dateTime
	Declare @DateString varchar(15)
	
	If DatePart(week, @FromDate) > 1
	Begin	--today is not the first week of the year
		Select @PreviousWeekEndDate = Cast(Convert(varChar(15), 
						DateAdd(day, DatePart(weekday, @FromDate) * -1, @FromDate)
						, 101) + ' 23:59:59.998' as DateTime)
	End
	Else
	Begin
		--today is in the first week of the year
		--12/31/xxxx will always be in the last week of the year
		--1/1/xxxx will always be in in the first week of the year
		Set @DateString = '12/31/' +  Cast(DatePart(year, @FromDate) - 1 as char(4))
		Select @PreviousWeekEndDate = Cast(@DateString + ' 23:59:59.998' as DateTime)
	End

	Return @PreviousWeekEndDate
End


GO
/****** Object:  UserDefinedFunction [dbo].[fnProductCategory]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--------------------------------------------------------------------------------------------------
-- File: c:\CoStarProjects\CRM.WS.Database\CRM.WS.DB.Chart\Functions\fnProductCategory.sql
-- Returns a table containing the TimePeriod breakdown for the specified time period

/**************************************************************************************
** HH 02/15/06 - Change made to load the product list with 
**               Property Express (43) where applicable. 
**               TD # 6676 
** EO 08/23/07 - Added Listings Express (ProductID 60) as part of Property product.
**               Refer to TFS # 7407.
** LR 09/19/08 - TFS 11830 Add Showcase ProductID 61 as a new Category
** EO 02/17/12 - Added PPR, Resolve, and Virtual Premise categories.  TFS # 29042.
** BH 04/03/13 - Added Loop categories TFS 32367. Also ensured that all UK/CAN products keuy off featureproductid.
** BH 08/22/2013 Fixing loop categories adn teh profix changed from loop to LN. TFS 54331
** BH 10/17/2013 Add LeaseAnalysis product to categorization
** TK 3/3/2015   Add Apts product to categorization TFS#142012
** TK 8/26/2015  Add Apts Finder product to categorization TFS#203971
***************************************************************************************/

CREATE FUNCTION [dbo].[fnProductCategory] (@pOtherCategoryName Varchar(17) = null )    /* CRM Version 3.9.99.96 */        /* CRM Version 8.0.15.130 */

RETURNS @ProductCategory Table (
	ProductId int primary key,
	CategoryId tinyint,
	CategoryName varchar(17) )

AS	
BEGIN
	/*
	All Products 	All products listed below
	Property	1, 18 , 35 ,40, 60
	Tenant 		2,19
	Exchange	4 , 47,  48
	Comps		5
	Connect		3
	Advisory	10,20,23,27,29,24,28,30

	We are adding Advisory to the summary list - this may not leave enough room for the pie chart.  
	If so we will probably eliminate advisory.
	*/

	SET @pOtherCategoryName = isNull (@pOtherCategoryName, 'Other')
	INSERT INTO @ProductCategory 
	SELECT distinct p.ProductId
		, CategoryId = CASE	WHEN p.ProductID IN (1, 18, 35, 40, 60)	OR FeatureProductId in (1,40)	THEN 1
					WHEN p.ProductID IN (2, 19)	OR FeatureProductId = 2		THEN 2
					WHEN p.ProductID IN (4, 47, 48)	or FeatureProductId = 47		THEN 3
					WHEN p.ProductID IN (5)	OR FeatureProductId = 5				THEN 4
					WHEN p.ProductID IN (3)				THEN 5
                                        WHEN p.ProductID IN (43)	                THEN 6     
					WHEN p.ProductID IN (10,20,23,27,29,24,28,30)	THEN 7
					WHEN p.ProductID = 61 				THEN 9
					WHEN p.ProductName LIKE 'RSV%'			THEN 10
					WHEN p.ProductName LIKE 'PPR%'			THEN 11
					WHEN p.ProductName LIKE 'VP%'			THEN 12
					WHEN p.ProductID in (64,151,148)		THEN 13
					WHEN p.ProductID in (65)				THEN 14
					WHEN p.ProductID in (149)				THEN 15
					WHEN p.ProductID in (150)				THEN 16
					WHEN p.ProductID in (152)				THEN 17
					WHEN p.ProductID in (153)				THEN 18
					WHEN p.ProductID = 158					THEN 19
					WHEN p.ProductID = 170					THEN 20
					WHEN p.ProductName like 'LN%'			THEN 21
					WHEN p.ProductID = 173					THEN 22
					ELSE 8 END
		, CategoryName = CASE	WHEN p.ProductID IN (1, 18, 35, 40, 60)	OR FeatureProductId in (1,40)	THEN 'Property'
					WHEN p.ProductID IN (2, 19)		OR FeatureProductId = 2	THEN 'Tenant'
					WHEN p.ProductID IN (4, 47, 48)	or FeatureProductId = 47		THEN 'Exchange'
					WHEN p.ProductID IN (5)	 OR FeatureProductId = 5			THEN 'Comps'
					WHEN p.ProductID IN (3)				THEN 'Connect'
                                        WHEN p.ProductID IN (43)       			THEN 'Property Express'
					WHEN p.ProductID IN (10,20,23,27,29,24,28,30)	THEN 'Advisory'
					WHEN p.ProductID = 61				THEN 'Showcase'
					WHEN p.ProductName LIKE 'RSV%'			THEN 'Resolve'
					WHEN p.ProductName LIKE 'PPR%'			THEN 'PPR'
					WHEN p.ProductName LIKE 'VP%'			THEN 'Virtual Premise'
					WHEN p.ProductID in (64,151,148)		THEN 'ShopProperty'
					WHEN p.ProductID in (65)				THEN 'SPN'
					WHEN p.ProductID in (149)				THEN 'IDS'
					WHEN p.ProductID in (150)				THEN 'Propex'
					WHEN p.ProductID in (152)				THEN 'FOCUS'
					WHEN p.ProductID in (153)				THEN 'SP Connect'
					WHEN p.ProductID in (158)				THEN 'Showcase UK'
					WHEN p.ProductID in (170)				THEN 'Showcase CAN'
					WHEN p.ProductName like 'LN%'			THEN 'LoopNet'
					WHEN p.ProductName like '%Finder%'			THEN 'Finder'
					WHEN p.ProductName like '%Apts%'			THEN 'Apts'
					WHEN p.ProductId = 173					THEN 'LeaseAnalysis'
					ELSE @pOtherCategoryName END
	FROM dbo.Product p with (nolock)
	
	RETURN;
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnProductListGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
**		File: 
**		Name: spProductListGet
**		Desc: Returns list of products for a given site 
**
*******************************************************************************/
CREATE FUNCTION [dbo].[fnProductListGet] (@SiteLocationID int) 
RETURNS Varchar(300)
AS BEGIN
DECLARE @ProductList varchar(300)
DECLARE @ProductName varchar(50)
DECLARE ProductCursor CURSOR FAST_FORWARD FOR
	SELECT DISTINCT pr.ProductName
		FROM dbo.LineItem li with (nolock)
		INNER JOIN dbo.Product pr with (nolock) ON li.ProductID = pr.ProductID 
		WHERE li.SiteLocationId = @SiteLocationId 
				AND	li.lineitemStatusID IN (1,2,3) AND	li.lineitemTypeID = 1
		ORDER BY pr.ProductName
 
SET @ProductList = ''
OPEN ProductCursor
FETCH NEXT FROM ProductCursor INTO @ProductName
WHILE @@FETCH_STATUS = 0 BEGIN
	IF @ProductList <> ''
		SET @ProductList = @ProductList + ', '
	SET @ProductList = @ProductList + @ProductName
	FETCH NEXT FROM ProductCursor INTO @ProductName
END
CLOSE ProductCursor
DEALLOCATE ProductCursor
RETURN @ProductList
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnProductListGet2]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- File: c:\CoStarProjects\CRM.WS.Database\CRM.WS.DB.Lookups\Functions\fnProductListGet2.sql
/******************************************************************************
**		Created By:  	Lavanya Reddy
**		Date Created:	6/29/05	
**		File: 
**		Name: 		spProductListGet2
**		Desc: 		Returns list of products for a given Contract and/or Site 
**
*******************************************************************************/
CREATE FUNCTION [dbo].[fnProductListGet2] (@pContractID int )        /* CRM Version 4.0.1.0 */
RETURNS Varchar(300)
AS BEGIN
DECLARE @ProductList varchar(300)

DECLARE @pProductList varchar(300)
SELECT @pProductList =  ProductName + ', ' + isnull(@pProductList , '') 
FROM lineitem l join Product p on l.ProductID = p.ProductID 
WHERE l.ContractID = @pContractID
and l.LineItemStatusID IN (1,2,3) AND	l.LineItemTypeID = 1
group by ProductName


SET @pProductList = left(@pProductList, len(@pProductList) - 1 )


RETURN @pProductList
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnProperCase]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnProperCase](@String Varchar(512))
  Returns Varchar(512)
As
/******************************************************************************
**		File: 
**		Name: fnProperCase
**		Desc: 
*******************************************************************************/

Begin

Return
Rtrim(Ltrim(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
  replace(
    ' ' + Lower(@String)
  ,' a',' A')
  ,' b',' B')
  ,' c',' C')
  ,' d',' D')
  ,' e',' E')
  ,' f',' F')
  ,' g',' G')
  ,' h',' H')
  ,' i',' I')
  ,' j',' J')
  ,' k',' K')
  ,' l',' L')
  ,' m',' M')
  ,' n',' N')
  ,' o',' O')
  ,' p',' P')
  ,' q',' Q')
  ,' r',' R')
  ,' s',' S')
  ,' t',' T')
  ,' u',' U')
  ,' v',' V')
  ,' w',' W')
  ,' x',' X')
  ,' y',' Y')
  ,' z',' Z')
))


End

GO
/****** Object:  UserDefinedFunction [dbo].[fnPropertyFloorStringGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnPropertyFloorStringGet]
-- CREATE FUNCTION dbo.fnPropertyFloorStringGet
(@PropertyID INT
,@AsOfDate DATETIME
) RETURNS  @FloorString TABLE (LocationID INT NULL
                                    , FloorString VARCHAR(1000) NULL
                                    )

/*          
            dbo.fnPropertyFloorStringGet
            function to return Property  Floors as string. ie "4, 5, 6" 
            ex: 
                        select dbo.fnPropertyFloorStringGet (157027, '09/02/04')

            9/02/04 rl Created
*/
AS

BEGIN

-- SET @AsOfDate = convert(varchar,getdate(),101)
-- set @PropertyID = 130713 -- Francis G. Newlands Bldg
-- set @PropertyID = 157027 -- TrumpTower

DECLARE @FloorList table (FloorListID INT PRIMARY KEY  IDENTITY(1,1)
                                    , LocationID INT NULL
                                    , FloorAbbreviation VARCHAR(7) NOT NULL
                                    , FloorSortOrder INT NOT NULL
                                    , FloorString VARCHAR(100) NULL
                                    )
DECLARE @lastLocationID INT
            , @list VARCHAR(8000)

INSERT INTO @FloorList (LocationID ,FloorAbbreviation ,FloorSortOrder )
SELECT lo.TenantLocationID, FloorAbbreviation ,fn.FloorSortOrder 
FROM  LocationOccupancy lo WITH (NOLOCK)
INNER JOIN SpaceOccupied so WITH (NOLOCK) ON so.LocationOccupancyID = lo.LocationOccupancyID
INNER JOIN PropertyFloor pf WITH (NOLOCK)ON pf.PropertyFloorID = so.PropertyFloorID
INNER JOIN FloorName fn WITH (NOLOCK)ON fn.FloorNameID = pf.FloorNameID
WHERE lo.PropertyID = @PropertyID
AND lo.TenantLocationID IS NOT NULL
AND lo.FROMDate <= @AsOfDate
AND ISNULL(lo.ToDate,@AsOfDate) >=@AsOfDate
AND NULLIF(LTRIM(RTRIM(fn.FloorAbbreviation)), '') IS NOT NULL
ORDER BY lo.TenantLocationID, fn.FloorSortOrder

SELECT @lastLocationID = -1,  @list = ''

UPDATE @floorlist
SET    @list = FloorString = 
		CASE
		WHEN @lastLocationID <> LocationID THEN FloorAbbreviation                       
		ELSE @list + ', '+ FloorAbbreviation                   
		END
	, @lastLocationID = LocationID

INSERT INTO @FloorString
SELECT LocationID , MAX(FloorString)
FROM    @floorlist
GROUP BY LocationID

RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnPropertyResearchStatusGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnPropertyResearchStatusGet]( 
	 @pStatusType VarChar( 5 )
	,@pAgentContactId int
	,@pToday DateTime )
	
RETURNS int

AS

/******************************************************************************
**		Name: fnPropertyResearchStatusGet
**		Desc:  Gets status information for the given type:
**
**		Valid Status Types are:
**
**		"Email"
**     "Fax"
**		"Phone"
**
**		Return values: Returns an integer indicating the status type:
**
**		Valid types are:
**
**	   -1	-	Never Called, Emailed or Faxed or the action occurred more than 10 days ago.  In the case of emails, when a broker
**				submits changes and the researcher hasn't viewed the changes, the record is displayed for an additional 7 days with
**				the status of 3.
**		0	-	Call, Email or Fax was status was created within 2 days.
**		1	-	Call, Email or Fax was placed 2-10 days ago.
**		2	-	Agent viewed the email, but researcher hasn't reviewed the changes.
**		3	-	Agent submitted changes, but research hasn't reviewed changes within 17 days.  In the case of emails, when a broker
**				submits changes and the researcher hasn't viewed the changes, the record is displayed for an additional 7 days with
**				the status of 3.
**		4	-	Researcher viewed changes
**
*******************************************************************************/
BEGIN

	DECLARE @Status int;

	SET @Status = -1;

	SELECT 
			@Status = CASE 
			WHEN @pStatusType = 'Phone' THEN
				CASE 
					-- Never Called
					WHEN rus.CallDate = NULL THEN -1 
					-- Call was within 2 days...
					WHEN DATEDIFF( Day, rus.CallDate, @pToday ) <= 2 THEN 0	
					-- Call was made 2-10 days ago...
					WHEN DATEDIFF( Day, rus.CallDate, @pToday ) BETWEEN 2 AND 10 THEN 1	
					ELSE -1 
				END
			WHEN @pStatusType = 'Fax' THEN -1
			WHEN @pStatusType = 'Email' THEN	
				CASE
				-- Never Emailed...
				WHEN rus.EmailDate = NULL THEN -1 
				-- Emailed within 2 days...
				WHEN DATEDIFF( Day, rus.EmailDate, @pToday ) <= 2 AND 
					rus.AgentViewDate IS NULL AND
					rus.AgentSubmissionDate IS NULL AND
					rus.ResearcherReviewDate IS NULL THEN 0
				-- Emailed 2-10 days ago...
				WHEN DATEDIFF( Day, rus.EmailDate, @pToday ) BETWEEN 2 AND 10 AND 
					rus.AgentViewDate IS NULL AND
					rus.AgentSubmissionDate IS NULL AND
					rus.ResearcherReviewDate IS NULL THEN 1
				-- Agent viewed web link...
				WHEN rus.AgentViewDate IS NOT NULL AND rus.AgentSubmissionDate IS NULL AND rus.ResearcherReviewDate IS NULL THEN 2	

				-- Agent made changes, researcher hasn't viewed, but it's been within 17 days, status stays at 3...
				WHEN rus.AgentSubmissionDate IS NOT NULL AND rus.ResearcherReviewDate IS NULL 	AND DATEDIFF( Day, rus.EmailDate, @pToday ) < 18 THEN 3

				-- Agent made changes, researcher hasn't viewed, it's been more than 17 days, change status to -1...
				WHEN rus.ResearcherReviewDate IS NOT NULL THEN 4	-- Researcher Reviewed changes...
				ELSE -1 	
			END
		END
	FROM dbo.ResearchUpdateStatus rus with (nolock)
	WHERE rus.AgentContactID = @pAgentContactID

	RETURN @Status
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnPropertyTenantFloorStringGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnPropertyTenantFloorStringGet] (
@PropertyID INT
,@LocationID INT
,@AsOfDate DATETIME
) returns varchar(100)
/*	
	dbo.fnPropertyTenantFloorStringGet
	
	function to return Property Tenant Floors as string. ie "4, 5, 6" 	

	ex: 
		select dbo.fnPropertyTenantFloorStringGet (157027, 561076, '09/02/04')

	9/02/04 rl Created

*/
AS
BEGIN

DECLARE @acc VARCHAR(100)

-- SET @AsOfDate = convert(varchar,getdate(),101)
-- set @PropertyID = 157027
-- set @LocationID = 561076      

SELECT
	@acc = isnull(@acc + ', ','') + ltrim(rtrim(cast(FloorAbbreviation as varchar(7))))
FROM	LocationOccupancy lo with (NOLOCK)
Inner	Join SpaceOccupied so with (NOLOCK) on so.LocationOccupancyID = lo.LocationOccupancyID
						and lo.TenantLocationID = @LocationID
Inner	Join PropertyFloor pf with (NOLOCK)on pf.PropertyFloorID = so.PropertyFloorID
Inner	Join FloorName fn with (NOLOCK)on fn.FloorNameID = pf.FloorNameID
WHERE lo.PropertyID = @PropertyID
AND lo.FROMDate <= @AsOfDate
AND isnull(lo.ToDate,@AsOfDate) >=@AsOfDate
AND	nullif(ltrim(rtrim(fn.FloorAbbreviation)), '') is not null
order by fn.FloorSortOrder

--select @acc
return @acc

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnPRSOriginalFilename]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnPRSOriginalFilename]
(  @pPropertyID				int
 , @pAttachmentTypeID		smallint
 , @pAttachmentMasterPath   varchar(300) = null
 , @pPropertyAttachmentID   int = null		-- used when updating to prevent deadlock?
) RETURNS  varchar(20)
AS
BEGIN
	DECLARE @OriginalFilename varchar(20)
	DECLARE @Serial varchar(6)
	DECLARE @Ext varchar(6)
	DECLARE @FirstAvailableAsciiCode tinyint
	
	IF @pPropertyAttachmentID IS NULL
		SELECT TOP 1 @FirstAvailableAsciiCode = a.PRSAsciiCode 
			FROM dbo.AttachmentTypePRSImageType a (nolock) 
			WHERE a.AttachmentTypeID = @pAttachmentTypeID 
				AND a.PRSAsciiCode NOT IN 
					(Select Ascii(Substring (OriginalFileName,1,1)) FROM dbo.PropertyAttachment (nolock)
						WHERE PropertyID = @pPropertyID and AttachmentTypeID = @pAttachmentTypeID)
	ELSE
		SELECT TOP 1 @FirstAvailableAsciiCode = a.PRSAsciiCode 
			FROM dbo.AttachmentTypePRSImageType a (nolock) 
			WHERE a.AttachmentTypeID = @pAttachmentTypeID 
				AND a.PRSAsciiCode NOT IN 
					(Select Ascii(Substring (OriginalFileName,1,1)) FROM dbo.PropertyAttachment (nolock)
						WHERE PropertyAttachmentId <> isNull(@pPropertyAttachmentID, PropertyAttachmentID)
						AND PropertyID = @pPropertyID and AttachmentTypeID = @pAttachmentTypeID)
	
	IF @FirstAvailableAsciiCode IS NOT NULL BEGIN
		SELECT @Serial = replace (Serial,' ', '0') FROM dbo.SerialNumber (nolock) WHERE EntityPKID = @pPropertyID
		DECLARE @pos int
		SET @pos = charindex ('.', @pAttachmentMasterPath)
		IF @pos > 0
			SET @Ext = Substring (@pAttachmentMasterPath, @pos, (len(@pAttachmentMasterPath)-@pos)+1)
		else
			SET @Ext = ''
		SET @OriginalFilename = char(@FirstAvailableAsciiCode) + @Serial + @Ext
	END
	ELSE BEGIN
		SET @OriginalFilename = null	
	END
	RETURN @OriginalFilename
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnQuoteDelimitString]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnQuoteDelimitString] ( @commaSepString varchar(8000) )
Returns varchar(8000)
AS

/*
This function is designed to prepare a comma seperated string for use 
in an exec'd sql statment by adding double quotes to the beginning and end
of string as well as on both sides of any imbedded commas.

input:	'BLT, WAS, STL' 
output:	'''BLT'', ''WAS'', ''STL'''

sample statement: 
	declare @market varchar(500)
	Set @market = 'WAS, BLT, STL'
	Select dbo.fnQuoteDelimitString(@market)
	
*/
Begin
	If @commaSepString is NOT NULL
		Set @commaSepString = '''' + replace(@commaSepString, ',', ''',''') + ''''

	return @commaSepString
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnQuoteDoubler]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Orion changes all single quotes to double quotes before calling the SP.  For SPs that use dynamic SQL, that usually works fine.  
-- However, other apps may call an SP without changing single quotes to double quotes.  Therefore, the only way to make the world 
-- safe for quotes is to 1) change all double-quotes to single-quotes, then 2) change all single-quotes to double-quotes.  At 
-- the end of this process, all quotes within the supplied buffer will be doubled.

-- Note:  @pDeclaredBufferSize is the declared size of the original Varchar variable.  For example:
--		Declare @x (200)
--		SELECT dbo.fnQuoteDoubler (@x, 200)
CREATE FUNCTION [dbo].[fnQuoteDoubler] (@pBuffer varchar(8000), @pDeclaredBufferSize int) returns varchar(8000) as
BEGIN
SET @pDeclaredBufferSize = IsNull(@pDeclaredBufferSize, 0)
SET @pBuffer = replace(replace(ltrim(rtrim(@pBuffer)), '''''', ''''),'''','''''')

-- if we are unlucky enough to have a quote in the last column of the original buffer, we need to get rid of it 
IF Len(@pBuffer) > 1 AND @pDeclaredBufferSize > 1 begin
	-- ending with a single-quote is bad.  Ending with a double-quote is ok
	IF Substring (@pBuffer, @pDeclaredBufferSize, 1) = '''' AND SubString (@pBuffer, @pDeclaredBufferSize-1, 1) <> ''''
		SET @pBuffer = SubString (@pBuffer, 1, @pDeclaredBufferSize-1)
END
ELSE IF @pBuffer = ''''
	SET @pBuffer = ''
RETURN @pBuffer
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnRemoveNoiseWords]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************

TFS 22224   -- making this function a part of the Tenant de-duping implementation 
******************************************************************************/ 
CREATE FUNCTION [dbo].[fnRemoveNoiseWords] 
             
				( @Str AS varchar(1000) 
				  ,@Mode AS tinyint = 1
				) RETURNS varchar(8000)
/******************************************************************************
**	Name: dbo.fnFTSCriteriaEx
**	
**  Function to filter @STR for embedded cardinal generational terms 
**  and calls dbo.fnNum2Words for Prefix and Suffix embedded numbers
**  for use with full text search (FTS).
**
**  rl  08/04/04 Created
**  rl  08/31/04 Modified Criteria to word break each phrase
**			Filter punctuation
**			Filter noise words
**			Expand @PhraseWord via USPS Abbreviations 
**				(Business, Street Alias, Street Type, States)
**			Remove duplicate search terms 
**			from SearchNumPhrase and SearchAuxPhrase
**  rl  10/13/04 Modified - Fixed Bug w/Noise Word. Skipped adding blank criteria '() AND'.
**  rl  10/13/04 Modified - Fixed TD#3883. Skipped adding blank criteria 'AND ()'.
**  rl  12/07/04 Modified - Filter noise words from abbreviation expansion
**			Handle embedded apostrophe(') and hyphen(-)
**			Handle long criteria 
**			Handle punctuation
**  rl  12/8/04   Consolidated 2-Pass Full Text Matching fnFTSCriteriaEx using @Mode (1=Contains Search, 2=Prefix Term Search)
**  rl  3/29/05   Modified for decimals in numeric, treat as literal (eg '92.5') 
**			and search numeric and decimal parts
**  rl  3/29/05   Modified ordinal number parsing for words with numeric strings
**  rl  4/11/05   Modified to parse numbers w/decimal 
**  rl 05/31/05   Fixed wildcard prefix term search to limit >2 char words
** ATT 03/24/2006 Remove conversion from number to word number
** CS  03/28/2006 Add additional noise word per Mike B.
** ATT 03/29/2006 Remove space before returning the string
** MCA 11/10/2008 Add additional noise word
********************************************************************************/
AS BEGIN
-- DECLARE @pDebug TINYINT
-- SET @pDebug = 0
DECLARE @delim char(1)
SET @delim = ' '
DECLARE @WkStr varchar(8000) 
DECLARE @wkLen TINYINT
DECLARE @stPos INT
DECLARE @WordLen INT
DECLARE @endPos TINYINT
DECLARE @pSub TINYINT
DECLARE @ParseWord VARCHAR(50)
DECLARE @NumWord VARCHAR(50)
DECLARE @SearchPhrase varchar(8000)
DECLARE @SearchNumPhrase varchar(8000)
DECLARE @SearchAuxPhrase varchar(8000)
DECLARE @SearchPhraseEX varchar(8000)
DECLARE @exCriteria VARCHAR (8000)
	,@NoiseWords varchar(8000)
-- *** Must be in sync with FTS Noise Word File Noise.enu on DB\FTS Server
SET @NoiseWords = '_/_-_''_about_after_all_also_an_and_another_any_are_as_at_be_because_been_before_being_between_both_but_by_came_can_come_could_did_do_each_for_from_get_got_has_had_he_have_her_here_him_himself_his_how_if_in_into_is_it_like_make_many_me_might_more_most_much_must_my_never_now_of_on_only_or_other_our_out_over_said_same_see_should_since_some_still_such_take_than_that_the_their_them_then_there_these_they_this_those_through_to_too_under_up_very_was_way_we_well_were_what_where_which_while_who_with_would_you_your_'
declare @s varchar(500)
--DECLARE @Mode AS tinyint 
DECLARE @SearchChar varchar(1)
SET @Mode = ISNULL(@Mode,1)
SET @s = NULL
SET @pSub = 0
IF (@Mode =2) SET @SearchChar ='*'
ELSE SET @SearchChar =''	-- (@Mode = 1) 
-- Filter out punctuation
-- Filter out Number+Ordinal Combinations (ie) 1st, 2nd, 3rd, 4th, etc...
-- Check for numbers
--	If numbers found convert to Ordinal, Cardinal, etc Forms	
-- Filter out punctuation
SET @WkStr = RTRIM(REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( 
	REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(
	REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(
	REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(
	REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( 
	REPLACE( @Str
	, '!','') ,'"','') ,'#','') ,'$','') ,'%','') ,'&','')
	,'(','') ,')','') ,'+','') ,',','')
	,':','') ,';','') ,'<','')
	,'=','') ,'>','') ,'?','') ,'@','') ,'[','') ,'\','')
	,']','') ,'^','') ,'_','') ,'`','') ,'{','') ,'|','')
	,'}','') ,'~',''),'@','') ,'','') ,'  ',' '))
--,'''',''),'-',''),'/',''),'.','')
SET @wkLen = DATALENGTH (@WkStr)
SET @stPos = 1
SET @WordLen = ISNULL ( NULLIF (CHARINDEX (' ', SUBSTRING( @WkStr, @stPos, @wkLen)) - 1  , -1), @wkLen )
SET @endPos = @stPos + @WordLen  
SELECT @ParseWord = SUBSTRING( @WkStr, @stPos, @WordLen) 
-- IF (@pDebug = 1)
-- BEGIN
-- 	SELECT @ParseWord, @WkStr
-- 	SELECT @wkLen wkLen,   @stPos stPos, @endPos endPos, @WordLen WordLen, @wkLen - @stPos
-- 	
-- END
-- Filter out 
--	Number+Ordinal Combinations (ie) 1st, 2nd, 3rd, 4th, etc...
WHILE @stPos <> -1
BEGIN	
	
	IF CHARINDEX('_'+ @ParseWord +'_', @NoiseWords)>0 -- Check if @ParseWord is contained in @NoiseWords
	BEGIN						  -- Noise Word Found
		SET @pSub = 0				  -- No substitution
		SET @ParseWord = ''			  -- Reset @ParseWord
		GOTO RESUME
	END
	IF (patindex( '%[0-9]st' , @ParseWord ) >0
		AND isnumeric( REPLACE(@ParseWord,'st','') ) = 1 )
--	   OR @ParseWord = 'st'	-- DO NOT FILTER MAY BE ABBREVIATION FOR STREET
	BEGIN 
		SET @pSub =1				 -- Substitution
		SET @NumWord = REPLACE (@ParseWord,'st','') 
	END
	IF (patindex( '%[0-9]nd' , @ParseWord )>0
		AND isnumeric(REPLACE (@ParseWord,'nd','') ) = 1 )
	 OR @ParseWord = 'nd'
	BEGIN 
		SET @pSub =1
		SET @NumWord = REPLACE (@ParseWord,'nd','') 
	END
	IF (patindex( '%[0-9]rd' , @ParseWord )>0
		AND isnumeric(REPLACE (@ParseWord,'rd','') ) = 1 )
--	   OR @ParseWord = 'rd' -- DO NOT FILTER MAY BE ABBREVIATION FOR ROAD
	BEGIN 
		SET @pSub =1
		SET @NumWord = REPLACE (@ParseWord,'rd','') 
	END
	IF (patindex( '%[0-9]th' , @ParseWord )>0
		AND isnumeric(REPLACE (@ParseWord,'th','') ) = 1 )
	 OR @ParseWord = 'th'
	BEGIN 
		SET @pSub =1
		SET @NumWord = REPLACE (@ParseWord,'th','') 
	END
	IF ISNUMERIC(@ParseWord)=1
		SET @NumWord = @ParseWord
/*  ATT Comment out...
	IF ISNUMERIC(@NumWord)=1 AND dbo.fnIsStreetNumNumeric(@NumWord) = 1
	BEGIN
		SET @pSub =1
		SET @SearchNumPhrase =''
		declare @number varchar(50)
		declare @decimal varchar(50)
		declare @pt int
		declare @len int
		set @len = len (@numword)
--		declare @numword varchar(50)
		
--		set @numword = '1.5'
		set @pt = isnull(charindex('.' , @numword),0)
		
		if @pt = 0  
			SET @SearchNumPhrase =  Enterprise.dbo.fnNum2FTSSearch( @NumWord )
		else -- Contains decimal point
		if @pt > 1 and @len >1 -- decimal point in word
		begin
			select @number = left(@NumWord,@pt -1)
			select @decimal = substring(@NumWord,@pt+1,len(@NumWord ))
			
			IF ISNUMERIC(@decimal) =1
				SET @SearchNumPhrase = '("'+ @NumWord + '") OR (('+ Enterprise.dbo.fnNum2FTSSearch( @number ) + ') AND (' + Enterprise.dbo.fnNum2FTSSearch( @decimal )+'))'
			ELSE 	SET @SearchNumPhrase =  Enterprise.dbo.fnNum2FTSSearch( @number )
		
		end -- leading decimal point
		if @pt = 1 and @len >1
		begin
			select @decimal = substring(@NumWord,@pt+1,len(@NumWord ))
			
			IF ISNUMERIC(@decimal) =1
				SET @SearchNumPhrase = '("'+ @NumWord + '") OR ((' + Enterprise.dbo.fnNum2FTSSearch( @decimal )+'))'	
		end
		if rtrim(@SearchNumPhrase) = ''
		begin
			set @pSub=0
			set @SearchNumPhrase = NULL
		end
	END
ATT END  */
-- Search Abbreviations
--	select @s = isnull( @s + ' OR ', '' ) + ISNULL( '"' + a2.Alias + '"'  ,'' )  
--	from Enterprise.dbo.Abbreviation a (nolock)
--	inner join Enterprise.dbo.Abbreviation a2 (nolock) on a.Abbreviation = a2.Abbreviation
--	where a.Alias = @ParseWord 
--	and a2.Alias <> @ParseWord 
--	and CHARINDEX('"' + a2.Alias + '"', ISNULL(@SearchNumPhrase,'')) = 0 
--	and CHARINDEX('"' + a2.Alias + '"', ISNULL(@SearchPhraseEX,'')) = 0 
--	and CHARINDEX('_'+ a2.Alias +'_', @NoiseWords) = 0
--
--	if @@rowcount > 0 
--	BEGIN	
--		set @pSub = 1
--		IF (@Mode =2) AND (LEN(@ParseWord) >2) SET @SearchChar ='*'
--		ELSE SET @SearchChar =''	-- (@Mode = 1) 
--		SET @SearchAuxPhrase = @s + ' OR "' + @ParseWord + @SearchChar + '"'
--		SET @s = NULL
--	END
RESUME:
	IF (RTRIM(LTRIM(@ParseWord)) <> '')  
	BEGIN
		IF (@pSub = 0)
		BEGIN 
			IF (@Mode =2) AND (LEN(@ParseWord) >2) SET @SearchChar ='*'
			ELSE SET @SearchChar =''	-- (@Mode = 1) 
			SET @SearchPhrase = ISNULL(  @SearchPhrase + ' AND ','') + '(' + '"' +  @ParseWord + @SearchChar + '"' + ')'
		END
		ELSE IF (@pSub = 1)
		BEGIN
			SET @SearchPhraseEX = ISNULL( @SearchPhraseEX + ' AND ','' ) 
						+ '(' 
						+ ISNULL( @SearchNumPhrase + ' OR ','')  
						+ ISNULL( @SearchAuxPhrase + ' OR ','') 
						+ ')'
	
			SET @SearchPhraseEX = replace ( @SearchPhraseEX , '( OR', '(') -- Remove orphaned preceding OR
			SET @SearchPhraseEX = replace ( @SearchPhraseEX , 'OR )', ')') -- Remove orphaned trailing OR	
		END
	END
	SET @pSub = 0
	SET @NumWord = NULL
	SET @SearchNumPhrase = NULL
	SET @SearchAuxPhrase = NULL
	IF (@stPos + @WordLen) <= (@wkLen) 
	BEGIN
		SET @stPos = @endPos + 1
		SET @WordLen = ISNULL ( NULLIF (CHARINDEX (' ', SUBSTRING( @WkStr, @stPos, @wkLen)) - 1  , -1), @wkLen - @endPos)
		SET @endPos = @stPos + @WordLen  
		
		SELECT @ParseWord = SUBSTRING( @WkStr, @stPos, @WordLen )
	END
	ELSE
		SET @stPos = -1
	
-- 	IF (@pDebug = 1)
-- 	BEGIN
-- 		SELECT @ParseWord, @WkStr
-- 		SELECT @wkLen wkLen,   @stPos stPos, @endPos endPos, @WordLen WordLen, @wkLen - @stPos
-- 		
-- 	END
		
END
SET @exCriteria = RTRIM(
			ISNULL(@SearchPhrase + ' AND ' ,'')
			+  ISNULL(@SearchPhraseEx,'')
			)
SET @exCriteria = rtrim(UPPER(REPLACE(@exCriteria, '() AND', '')))
SET @exCriteria = rtrim(UPPER(REPLACE(@exCriteria, 'AND ()', '')))
SET @exCriteria  = replace (@exCriteria, '()','')
if RIGHT(@exCriteria,3) = 'AND'
	SET @exCriteria = substring( @exCriteria, 1, datalength( @exCriteria) -3)
SET @exCriteria = REPLACE(REPLACE(REPLACE(@exCriteria,'"',''),'(',''),')','') 
SET @exCriteria = 
	replace(
	replace( 
	replace( 
	replace(
	replace( 
	replace( 
	replace( 
		replace(
		replace(
		
		replace( 
			replace(
				replace(
					replace(
						replace(
							replace(
								replace(
									replace(
										replace(
											replace(
												replace(
													replace(
														replace(
															replace(
																replace(
																	replace( 
																		replace(
																			replace(
																				replace(
																					replace(
																						replace(			--@exCriteria
																							replace(
																								replace(
																									replace(
																										replace(
																											replace(
																												replace(
																													@exCriteria
																												,',','')
																											 ,'.','')
																										,' and ',' ')
																									,' company','')
																								,' &','')
																							,' co ',' ')
																						,'the ','')
																					,' inc ',' ')
																				,'ltd',' ')
																			,'lp',' ')
																		,'llc',' ')
																	,'corporation',' ')
																,'lc',' ')
															,'stores',' ')
														,'store',' ')
													,'limited',' ')
												,'group',' ')
											,'l l c', ' ') --as cleanname
										,' of ', ' ')
									,' shopping ', ' ')
								,' plaza', ' ')
							,' center', ' ')
						,' business ',' ')
					,' centre ', ' ')
				,'''','')
			,'-','')
		,' - ','')
		,'supermarket','') --ATT Add
		,'pharmacy','')
		,'company', '')
		,'C V S', 'CVS')
		,'trust', '')
		,'partnership', '')
		,'incorporated', '')
		,'services', '')
		,'clinic', '')
--return CHARINDEX(' corp',@exCriteria)
IF CHARINDEX(' corp',@exCriteria) = LEN(RTRIM(@exCriteria)) - 4
BEGIN
	SET @exCriteria = REPLACE(@exCriteria,' corp','')
END
/*
IF CHARINDEX(' co',@exCriteria) = LEN(@exCriteria) - 3
BEGIN
	SET @exCriteria = REPLACE(@exCriteria,' co','')
END
IF CHARINDEX(' inc',@exCriteria) = LEN(@exCriteria) - 4
BEGIN
	SET @exCriteria = REPLACE(@exCriteria,' inc','')
END
*/
RETURN Replace( @exCriteria, space(1), '')  --ATT
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnReturnPhoneNumberOnly]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnReturnPhoneNumberOnly] (@phoneNumber varchar(25)) Returns varchar( 14 )

AS

Begin
/*
 04/03/2012 VS TFS 29501 Remove leading zero in phone number. When Showcase can deal with leading zero, remove the line of code before the function returns.
*/
	DECLARE @i int, @ph varChar(25)

	SET @phoneNumber = ltrim( rtrim( @phoneNumber ));

	SET @i = 0
	SET @ph = ''

	WHILE @i <= Len( @phoneNumber )
	Begin
	  /* Remove everything except integers... */
	  if Ascii( SubString( @phoneNumber,@i,1 )) BETWEEN 48 AND 57
	    SET @ph = @ph + SubString( @phoneNumber,@i,1 )
	  SET @i = @i + 1
	End;
	 
	if(Len(@ph) > 0 and ISNUMERIC(@ph)>0)
		set @ph = cast(cast(@ph as decimal(19,0)) as varchar(20))

	Return @ph
End

GO
/****** Object:  UserDefinedFunction [dbo].[fnRSIPriceEstimator]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnRSIPriceEstimator](
 @pPropertyID int
,@pCensusRegionID tinyint 
,@pPropertyTypeID int
,@pTargetSaleDate date) 
returns @RSIPrices Table (SourceRSIndexValueID int, TargetRSIndexValueID int, TargetPrice bigint)
AS
BEGIN

declare @tSourcePeriodValue real = null
declare @tTargetPeriodValue real = null
declare @tPriceMultiplier real = null
declare @tYear char(4) = YEAR(@pTargetSaleDate)
declare @tQuarter tinyint = datepart(qq,@pTargetSaleDate)
declare @tSourcePrice bigint = null
declare @tTargetPrice bigint = null
declare @tSourceRSIndexValueID int = null
declare @tTargetRSIndexValueID int = null


-- Since the index is in quarters, we need to find the quarter in which the sale falls under
set @pTargetSaleDate = case when @tQuarter = 1 then '3/31/'
							when @tQuarter = 2 then '6/30/'
							when @tQuarter = 3 then '9/30/'
							else '12/31/'
							end + @tYear
							
declare @targetComps table(CompID int, CompIndexSaleDate date, DaysFromTargetSale int, SoldForPrice bigint)


insert into @targetComps
select distinct c.CompID
				,cast(case when datepart(qq,c.SoldDate) = 1 then '3/31/'
					       when datepart(qq,c.SoldDate) = 2 then '6/30/'
						   when datepart(qq,c.SoldDate) = 3 then '9/30/'
						   else '12/31/'
						   end + cast(year(c.SoldDate) as char(4)) as date)
				,abs(datediff(dd,c.SoldDate,@pTargetSaleDate)) 
				,c.SoldForPrice
from .Comp c
join .CompEntity ce on c.CompID = ce.CompID
where
     c.IsInProductFlag <> 0 
and  c.CompStatusTypeID <> 10
and  ce.SaleEntityTypeID = 1 
and  c.SoldForPrice is not null and c.SoldForPrice >= 100000 
and (c.PartialInterestSalePct is null or c.PartialInterestSalePct = 100)
and  c.PortfolioTypeID is null
and  ce.PropertyID = @pPropertyID
and  c.SoldDate > '12/31/1999' -- Currently we only have indexes that have values starting Q1 2010



-- Kill Bad Comps using Repeat Sale Rules
delete from @targetComps where CompID in 
(select c.CompID from CompSaleCondition csc (nolock) join @targetComps c on csc.CompID = c.CompID and csc.SaleConditionID in (4,5,7,8,13,11,16,19,20,23,26,27,29,31,32))
 
 -- All Below Markets are excluded
delete from @targetComps where CompID in 
(select c.CompID from CompBelowMarketSaleReason bmsr (nolock) join @targetComps c on bmsr.CompID = c.CompID)

-- Kill any condo or portfolios
delete from @targetComps where CompID in 
(select ce.CompID from @targetComps tc join .CompEntity ce on tc.CompID = ce.CompID group by ce.CompID having count(*) > 1)

-- Take the closet Comp to the target sale date
delete from @targetComps where CompID not in
(select top 1 CompID from @targetComps order by DaysFromTargetSale asc,CompID desc)

/*RB: Why passing in PropertyTypeID and CensusRegionID as parameters when we can retrieve these
values directly from the Property and State tables ?*/
select  @tSourcePeriodValue = r.PeriodValue,
		@tSourceRSIndexValueID = r.RSIndexValueID,
	    @tSourcePrice = tc.SoldForPrice
from RSIndexValue r (nolock)
join @targetComps tc on tc.CompIndexSaleDate = r.PeriodDate
where
    r.PropertyTypeID = @pPropertyTypeID
and r.CensusRegionID = @pCensusRegionID


select 
	@tTargetPeriodValue  = r.PeriodValue,
	@tTargetRSIndexValueID = r.RSIndexValueID
from RSIndexValue r (nolock)
where
    r.PropertyTypeID = @pPropertyTypeID
and r.CensusRegionID = @pCensusRegionID
and r.PeriodDate = @pTargetSaleDate

set @tPriceMultiplier = @tTargetPeriodValue/@tSourcePeriodValue

set @tTargetPrice = @tSourcePrice*@tPriceMultiplier

INSERT INTO @RSIPrices
( SourceRSIndexValueID
, TargetRSIndexValueID
, TargetPrice)
(
Select 
	  SourceRSIndexValueID=@tSourceRSIndexValueID
	, TargetRSIndexValueID=@tTargetRSIndexValueID
	, TargetPrice = @tTargetPrice
)
	
RETURN 

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnSlavoGermanic]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnSlavoGermanic]( @Word char(50) )
RETURNS bit
AS
BEGIN
	--Catch NULL also...
	IF (CHARINDEX('W',@Word) > 0) OR (CHARINDEX('K',@Word) > 0) OR (CHARINDEX('CZ',@Word) > 0)
	--'WITZ' test is in original Lawrence Philips C++ code, but appears to be a subset of the first test for 'W'
	-- OR (CHARINDEX('WITZ',@Word) > 0)
	BEGIN
		RETURN 1
	END
	--ELSE
		RETURN 0
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnSoundexConvertAlpha]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
TFS 22224   -- making this function a part of the Tenant de-duping implementataion 
******************************************************************************/ 

CREATE FUNCTION [dbo].[fnSoundexConvertAlpha]( @instring VARCHAR(50) )
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @cKey VARCHAR(50),
            @cChar VARCHAR(3),
            @cChars VARCHAR(3),
            @cVowels VARCHAR(10),
            @cFirst_char CHAR(1),
            @cResult VARCHAR(10)
    DECLARE @i integer
    /* vowels */
    SELECT @cVowels = 'AEIOU'
    /* trim all spaces */
    SELECT @instring = REPLACE( @instring, ' ', '' )
    SELECT @instring = UPPER( @instring )
    /* save first char */
    SELECT @cFirst_char = LEFT( @instring, 1 )
    /* ( 1) remove all 'S' and 'Z' chars from the end of the surname */
    SELECT @i = LEN( @instring )
    WHILE SUBSTRING( @instring, @i, 1 ) IN ( 'S', 'Z' )
        SELECT @i = @i - 1
    SELECT @instring = LEFT( @instring, @i )
     /* ( 2) transcode initial strings */
    /*      MAC => MC                 */
    /*      PF => F                     */
    SELECT @instring = CASE
                            WHEN LEFT( @instring, 3 ) = 'MAC' THEN 'MC' + SUBSTRING( @instring, 3, LEN( @instring ) )
                            WHEN LEFT( @instring, 2 ) = 'PF' THEN 'F' + SUBSTRING( @instring, 3, LEN( @instring ) )
                            ELSE @instring    -- do nothing
                       END
    /* ( 3) Transcode trailing strings as follows */
    /*      IX       => IC                        */
    /*      EX       => EC                        */
    /*      YE,EE,IE => Y                         */
    /*      NT,ND    => D                         */
    SELECT @instring = CASE
                            WHEN RIGHT( @instring, 2 ) = 'IX' THEN LEFT( @instring, LEN( @instring ) - 2 ) + 'IC'
                            WHEN RIGHT( @instring, 2 ) = 'EX' THEN LEFT( @instring, LEN( @instring ) - 2 ) + 'EC'
                            WHEN RIGHT( @instring, 2 ) IN ( 'YE', 'EE', 'IE' ) THEN LEFT( @instring, LEN( @instring ) - 2 ) + 'Y'
                            WHEN RIGHT( @instring, 2 ) IN ( 'NT', 'ND' ) THEN LEFT( @instring, LEN( @instring ) - 2 ) + 'D'
                            ELSE @instring    -- do nothing
                       END
    /* the step ( 4) I moved to begining of WHILE ... END below */
    /* ( 5) use first character of name as first character of key */
    /* SELECT @cKey = LEFT( @instring, 1 ) */
    /* don't now, what they thing with this, but with @cKey = '' it seems to be working */
    SELECT @cKey = ''
    SELECT @i = 1
    /* while not end of @instring */
    WHILE SUBSTRING( @instring, @i, 1 ) > ''
    BEGIN
        SELECT @cChars = SUBSTRING( @instring, @i, 3 )
        SELECT @cResult = CASE /* ( 4) transcode 'EV' to 'EF' if not at start of name */
                               WHEN @i > 1 AND LEFT( @cChars, 2 ) = 'EV' THEN 'AF'
                               /* ( 6) remove any 'W' that follows a vowel */
                               WHEN LEFT( @cChars, 1 ) = 'W' AND CHARINDEX( SUBSTRING( @instring, @i - 1, 1 ), @cVowels ) > 0 THEN SUBSTRING( @instring, @i - 1, 1 )
                               /* ( 7) replace all vowels with 'A' */
                               WHEN CHARINDEX( LEFT( @cChars, 1 ), @cVowels ) > 0 THEN 'A'
                                /* ( 8) transcode 'GHT' to 'GT' */
                               WHEN LEFT( @cChars, 2 ) = 'GHT' THEN 'GGG'
                                /* ( 9) transcode 'DG' to 'G' */
                               WHEN LEFT( @cChars, 2 ) = 'DG' THEN 'G'
                               /* (10) transcode 'PH' to 'F' */
                               WHEN LEFT( @cChars, 2 ) = 'PH' THEN 'F'
                                /* (11) if not first character, eliminate all 'H' preceded or followed by a vowel */
                               WHEN LEFT( @cChars, 1 ) = 'H' AND @i > 1 AND ( CHARINDEX( SUBSTRING( @instring, @i - 1, 1 ), @cVowels ) > 0 OR CHARINDEX( SUBSTRING( @instring, @i + 1, 1 ), @cVowels ) > 0 ) THEN SUBSTRING( @instring, @i - 1, 1 )
                               /* (12) change 'KN' to 'N', else 'K' to 'C' */
                               WHEN LEFT( @cChars, 2 ) = 'KN' THEN 'N'
                               WHEN LEFT( @cChars, 1 ) = 'K' THEN 'C'
                               /* (13) if not first character, change 'M' to 'N' */
                               WHEN @i > 1 AND LEFT( @cChars, 1 ) = 'M' THEN 'N'
                               /* (14) if not first character, change 'Q' to 'G' */
                               WHEN @i > 1 AND LEFT( @cChars, 1 ) = 'Q' THEN 'G'
                               /* (15) transcode 'SH' to 'S' */
                               WHEN LEFT( @cChars, 2 ) = 'SH' THEN 'S'
                               /* (16) transcode 'SCH' to 'S' */
                               WHEN @cChars = 'SCH' THEN 'SSS'
                               /* (17) transcode 'YW' to 'Y' */
                               WHEN LEFT( @cChars, 2 ) = 'YW' THEN 'Y'
                               /* (18) if not first or last character, change 'Y' to 'A' */
                               WHEN @i > 1 AND @i < LEN( @instring ) AND LEFT( @cChars, 1 ) = 'Y' THEN 'A'     
                               /* (19) transcode 'WR' to 'R' */
                               WHEN LEFT( @cChars, 2 ) = 'WR' THEN 'R'
                               /* (20) if not first character, change 'Z' to 'S' */
                               WHEN @i > 1 AND LEFT( @cChars, 1 ) = 'Z' THEN 'S'
                               ELSE LEFT( @cChars, 1 )
                         END
        SELECT @instring = STUFF( @instring, @i, LEN( @cResult ), @cResult )
        /* Add current to key if current <> last key character */
        IF RIGHT( @cKey, 1 ) != LEFT( @cResult, 1 )
            SELECT @cKey = @cKey + @cResult
        SELECT @i = @i + 1
    END
    /* (21) transcode terminal 'AY' to 'Y' */
    IF RIGHT( @cKey, 2 ) = 'AY'
        SELECT @cKey = LEFT( @cKey, LEN( @cKey ) - 2 ) + 'Y'
  
    /* (22) remove traling vowels */
    /*      start vowels */
    SELECT @i = 1
    WHILE CHARINDEX( SUBSTRING( @cKey, @i, 1 ), @cVowels ) > 0
        /* replace vowels with spaces */
        SELECT @cKey = STUFF( @cKey, @i, 1, ' ' ),
               @i = @i + 1
    /*     end vowels */
    SELECT @i = LEN( @cKey )
    WHILE CHARINDEX( SUBSTRING( @cKey, @i, 1 ), @cVowels ) > 0
        /* replace vowels with spaces */
        SELECT @cKey = STUFF( @cKey, @i, 1, ' ' ),
               @i = @i - 1
    /*     remove spaces */
    SELECT @cKey = REPLACE( @cKey, ' ', '' )
    /* (23) collapse all strings of repeated characters */
    /* not neede, see 'Add current to key if current <> last key character' before step (21) */
/* (24) if first char of original surname was a vowel, append it to the start of code */
    IF CHARINDEX( @cFirst_char, @cVowels ) > 0
        SELECT @cKey = @cFirst_char + @cKey
    RETURN @cKey
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnSplitName]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnSplitName]
	(@fullname varchar(255))
RETURNS @ReturnTable TABLE (FirstName varchar(100),LastName varchar(100))
AS
  BEGIN
	DECLARE @trimmedFullName varchar(255)
	SET @trimmedFullName=LTRIM(RTRIM(@fullname))
	
	--if there are no spaces then put the entire string into the FirstName field
	IF CHARINDEX(' ',@trimmedFullName)=0
	BEGIN
		INSERT INTO @ReturnTable (FirstName, LastName)
		VALUES (@trimmedFullName,NULL)
	END
	ELSE
	BEGIN
		INSERT INTO @ReturnTable (FirstName, LastName)
		(SELECT
		 firstname = RTRIM(LTRIM(Substring(RTRIM(LTRIM(@trimmedFullName)), 1, Charindex(' ', RTRIM(LTRIM(@trimmedFullName))) - 1)))
		,lastname = RTRIM(LTRIM(
					Substring
					(@trimmedFullName,
					( Len(@trimmedFullName) - Patindex('%[ ' + CHAR(8) + ']%',Reverse(@trimmedFullName)) + 1 ) +1,Len(@trimmedFullName) -  
					( Len(@trimmedFullName) -     Patindex('%[ ' + CHAR(8) + ']%',Reverse(@trimmedFullName))+ 1 )) 
					))
		)			
	END
	return
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnStreetRangeCompare]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnStreetRangeCompare](@pStart varchar(15), @pEnd varchar(15), @pValue varchar(15)) returns bit

as
begin
if ((isNumeric(@pStart) = 1) and (isNumeric(@pEnd) = 1) and (isNumeric(@pValue) = 1))
begin

declare @tStart int,@tEnd int,@tValue int,@ret bit

set @tStart = cast(@pStart as decimal(19,4))
set @tEnd = cast(@pEnd as decimal(19,4))
set @tValue = cast(@pValue as decimal(19,4))

if (@tValue >= @tStart and @tValue <= @tEnd)
	set @ret = 1
else
	set @ret = 0
end

else if (@pStart = @pValue)
	set @ret = 1
else
	set @ret = 0

return @ret
end

GO
/****** Object:  UserDefinedFunction [dbo].[fnStringAt]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnStringAt]( @Start int, @StringToSearch varchar(50), @TargetStrings 
varchar(2000) )
RETURNS bit
AS
BEGIN
	DECLARE @SingleTarget varchar(50)
	DECLARE @CurrentStart int
	DECLARE @CurrentLength int
	
	--Eliminate special cases
	--Trailing space is needed to check for end of word in some cases, so always append comma
	--loop tests should fairly quickly ignore ',,' termination
	SET @TargetStrings = @TargetStrings + ','
	
	SET @CurrentStart = 1
	--Include terminating comma so spaces don't get truncated
	SET @CurrentLength = (CHARINDEX(',',@TargetStrings,@CurrentStart) - @CurrentStart) + 1
	SET @SingleTarget = SUBSTRING(@TargetStrings,@CurrentStart,@CurrentLength)
	WHILE LEN(@SingleTarget) > 1
	BEGIN
		IF SUBSTRING(@StringToSearch,@Start,LEN(@SingleTarget)-1) = LEFT(@SingleTarget,LEN(@SingleTarget)-1)
		BEGIN
			RETURN 1
		END
		SET @CurrentStart = (@CurrentStart + @CurrentLength)
		SET @CurrentLength = (CHARINDEX(',',@TargetStrings,@CurrentStart) - @CurrentStart) + 1
		IF NOT @CurrentLength > 1 --getting trailing comma 
		BEGIN
			BREAK
		END
		SET @SingleTarget = SUBSTRING(@TargetStrings,@CurrentStart,@CurrentLength)
	END
	RETURN 0
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnStringAtDef]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnStringAtDef]( @Start int, @StringToSearch varchar(50), 
	@Target1 varchar(50), 
	@Target2 varchar(50) = NULL,
	@Target3 varchar(50) = NULL,
	@Target4 varchar(50) = NULL,
	@Target5 varchar(50) = NULL,
	@Target6 varchar(50) = NULL )
RETURNS bit
AS
BEGIN
	IF CHARINDEX(@Target1,@StringToSearch,@Start) > 0 RETURN 1
	--2 Styles, test each optional argument for NULL, nesting further tests
	--or just take advantage of CHARINDEX behavior with a NULL arg (unless 65 compatibility - code check before CREATE FUNCTION?
	--Style 1:
	--IF @Target2 IS NOT NULL
	--BEGIN
	--	IF CHARINDEX(@Target2,@StringToSearch,@Start) > 0 RETURN 1
	-- (etc.)
	--END
	--Style 2:
	IF CHARINDEX(@Target2,@StringToSearch,@Start) > 0 RETURN 1
	IF CHARINDEX(@Target3,@StringToSearch,@Start) > 0 RETURN 1
	IF CHARINDEX(@Target4,@StringToSearch,@Start) > 0 RETURN 1
	IF CHARINDEX(@Target5,@StringToSearch,@Start) > 0 RETURN 1
	IF CHARINDEX(@Target6,@StringToSearch,@Start) > 0 RETURN 1
	RETURN 0
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnStringToTable]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnStringToTable](@DelimitedStr varchar(max), @Delimiter char(1))
/*********************************


Author:	Ed Hellyer
Date:		Tuesday July 26th 2006

Examples:

--Returns only two rows
select * from dbo.fnStringToTable('!d!d!!!  !', '!')

--Returns four rows
select * from  dbo.fnStringToTable('one, two, three, four', ',')

--Returns four rows
select * from dbo.fnStringToTable(' !!!! !!! !!  !  ', ' ')

--Error conditions returns empty table (This is function abuse)
select * from dbo.fnStringToTable('!!! !! !!  !', '!')

select * from dbo.fnStringToTable('', '!')
select * from dbo.fnStringToTable(null, '!')
select * from dbo.fnStringToTable(null, null)

*********************************/
RETURNS @ReturnTable TABLE ([Value] varchar(2000))
AS
  BEGIN

	--Remove carriage return characters from input string
	set @DelimitedStr=REPLACE(REPLACE(@DelimitedStr,char(10),' '),CHAR(13),' ')

	--Remove extraneous delimiter chars from input string.
	set @DelimitedStr = ltrim(rtrim(@DelimitedStr))
	
	while SUBSTRING(@DelimitedStr, 1, 1) = @Delimiter
	set @DelimitedStr = ltrim(rtrim(Right(@DelimitedStr, len(@DelimitedStr) - 1)))

	while SUBSTRING(@DelimitedStr, len(@DelimitedStr), 1) = @Delimiter
	set @DelimitedStr = ltrim(rtrim(Left(@DelimitedStr, len(@DelimitedStr) - 1)))
	
	set @DelimitedStr = ltrim(rtrim(@DelimitedStr))
	

	--Sanity checks
	if len(IsNull(@DelimitedStr, '')) = 0 or @DelimitedStr is null
	  begin
		return
	  end

	--Being the parsing of the delimited string.
	declare @Start int
	set @Start = 1

	while @Start is not null
	  begin
		insert into @ReturnTable(Value) 
		select LTrim(RTrim(SubString(@DelimitedStr, @Start, abs(@Start - IsNull(NullIf(CharIndex(@Delimiter, @DelimitedStr, @Start + 1), 0), Len(@DelimitedStr) + 1)))))
		
		set @Start = NullIf(CharIndex(@Delimiter, @DelimitedStr, @Start + 1), 0) + 1
	  end

	--delete any empty fields from @Return table
	UPDATE @ReturnTable set Value=REPLACE(value,' ','')
	DELETE FROM @ReturnTable where NULLIF(value,'') IS NULL

	return
	
  END

GO
/****** Object:  UserDefinedFunction [dbo].[fnStripChars]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnStripChars]               
--CREATE FUNCTION dbo.fnStripChars               
				( @StrIn varchar(8000)
				) RETURNS varchar(8000)
/******************************************************************************
**	Name: dbo.fnStripChars
**	
**  Function to filter @StrIn for embedded punctuation 
**
**  eg: **  select replace(dbo.fnStripChars('What''the frequency kenneth?'),' ','')
**
**  rl  10/18/04 Created
**
********************************************************************************/
AS BEGIN

-- DECLARE @pDebug TINYINT
-- SET @pDebug = 0

DECLARE @StrOut varchar(1000) 

SET @StrOut = RTRIM(REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( 
	REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(
	REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(
	REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(
	REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(
	REPLACE( REPLACE( REPLACE( REPLACE( @StrIn
	, '!','') ,'"','') ,'#','')	,'$','') ,'%','') ,'&','')
	,'''','') ,'(','') ,')','')	,'+','') ,',','')
	,'-','') ,'.','') ,'/','')	,':','') ,';','') ,'<','')
	,'=','') ,'>','') ,'?','')	,'@','') ,'[','') ,'\','')
	,']','') ,'^','') ,'_','')	,'`','') ,'{','') ,'|','')
	,'}','') ,'~',''),'@','')	,'','') ,'  ',' '))
RETURN @StrOut
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnStripTrivialWords]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnStripTrivialWords]
-- create function dbo.fnStripTrivialWords   
(                
  @pCompanyName varchar(50)
)
  returns varchar(50)
as

/************************************************************************************
**	Name: fnStripTrivialWords
**	
**  This UDF strips certain symbols and words from an incoming string.  It was designed  
**  to be used when comparing two company names (Location.LocationName), so the output  
**  string size is that of Location.LocationName.
**
**  Modeled after the function f_companyStrip used in the conversion process.
**
**  PM, 9/23/4.
**
*************************************************************************************/
begin

  return RTrim(Ltrim(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
  Replace(
    Upper(' ' + Upper(@pCompanyName) + ' ')
  ,'!','')
  ,'"','')
  ,'#','')
  ,'$','')
  ,'%','')
  ,'&','')
  ,'''','')
  ,'(','')
  ,')','')
  ,'*','')
  ,'+','')
  ,',','')
  ,'-','')
  ,'.','')
  ,'/','')
  ,':','')
  ,';','')
  ,'<','')
  ,'=','')
  ,'>','')
  ,'?','')
  ,'@','')
  ,'[','')
  ,'\','')
  ,']','')
  ,'^','')
  ,'_','')
  ,'`','')
  ,'{','')
  ,'|','')
  ,'}','')
  ,'~','')
  ,' CO ','')
  ,' INC ','')
  ,' CORPORATION ','')
  ,' CORP ','')
  ,' COMPANY ','')
  ,' INCORPORATED ','')
  ,' LLP ','')
  ,' LLC ','')
  ,' PARTNERS ','')
  ,' PARTNER ','')
  ,' THE ','')
  ,' OF ','')
  ,' AS ','')
  ,' FROM ','')
  ,' IT ','')
  ,' ALL ','')
  ,' WAY ','')
  ))

End

GO
/****** Object:  UserDefinedFunction [dbo].[fnStrToInt]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnStrToInt]( @str varchar(50) ) Returns int
as
begin
	declare @int int
	if isNumeric(@str) > 0
	   begin
		--Remove characters that satisfy isNumeric()
		set @str = replace(replace(replace(replace(@str, '.', ''), ',', ''), '$', ''), '+', '')
		
		--Cast remaing value as integer
		set @int = cast(@str as int)		
		
		--If only a hyphen or plus sign was entered, return a null instead of 0
		if (len(@str) = 1 AND @str IN( '-')) OR len(@str) = 0
			Set @int = null
			
	   end
	
	Return @int
end

GO
/****** Object:  UserDefinedFunction [dbo].[fnTimeDimIDs]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
-- Name: fnTimeDimIds
-- 
-- Returns a table containing the TimePeriod breakdown for the specified time period
-- @pWeekOldest is the starting week
-- @pWeekNewest is the ending week
-- For example:  SELECT * FROM dbo.fnTimeDimIDs (12, 9) will return TimeDimIds for weeks 12, 11, 10, 9
--				 SELECT * FROM dbo.fnTimeDimIDs (4, 1) will return TimeDimIds for weeks 4, 3, 2, 1
-- To include the current (partial) week, specify @pWeekNewest as 0.  For example:
--				 SELECT * FROM dbo.fnTimeDimIDs (4, 0) will return TimeDimIds 
--						for weeks 4, 3, 2, 1 + the current week
 ******************************************************************************/
CREATE FUNCTION [dbo].[fnTimeDimIDs] (@pWeekOldest int, @pWeekNewest int = 0)
RETURNS @TimeDimIDs Table (TimeDimId int) AS
BEGIN
	DECLARE @maxWeek int
	SELECT @maxWeek = max(WkCounter) FROM dbo.TimeDim with (nolock)
	INSERT @TimeDimIDs (TimeDimID) SELECT TimeDimId FROM dbo.TimeDim with (nolock)
		WHERE WkCounter >= @maxWeek - @pWeekOldest
		AND WkCounter <= @maxWeek - @pWeekNewest
		ORDER BY TimeDimId
	RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnTimePeriodDays]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Returns the number of days in the specified time period
CREATE FUNCTION [dbo].[fnTimePeriodDays] (@pTimePeriod Varchar(10)) RETURNS int AS
BEGIN
	DECLARE @days int
	SELECT @days = CASE @pTimePeriod	WHEN 'Week'		THEN 7
										WHEN 'W'		THEN 7
										WHEN 'WTD'		THEN 7
										WHEN 'Month'	THEN 30
										WHEN 'M'		THEN 30
										WHEN 'MTD'		THEN 30
										WHEN 'Quarter'	THEN 90
										WHEN 'Q'		THEN 90
										WHEN 'QTD'		THEN 90
										WHEN 'Year'		THEN 365
										WHEN 'Y'		THEN 365
										WHEN 'YTD'		THEN 365
										ELSE Convert (int, @pTimePeriod) END
	RETURN @days							
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnTransactionHistoryReviewStatusCheck]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Returns 1 if the review status is either Verified or Unverified, 0 otherwise
CREATE FUNCTION [dbo].[fnTransactionHistoryReviewStatusCheck] (
	@pReviewStatusId	int
) RETURNS	INT AS  
BEGIN
DECLARE		@rtn INT;
	SELECT @rtn = COUNT(*) WHERE @pReviewStatusId 
			IN 	(SELECT ReviewStatusId 
					FROM dbo.ReviewStatus with (nolock)
					WHERE ReviewStatusDesc = 'Verified' 
					OR	  ReviewStatusDesc = 'UnVerified'
					OR    ReviewStatusDesc = 'CannotVerify'
					OR	  ReviewStatusDesc = 'Cannot Verify')
	RETURN @rtn;
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnUsageTrend]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnUsageTrend] ( @pHitCntOlder int, @pHitCntNewer int) 
RETURNS	Varchar(20) AS  
BEGIN
	declare @ReturnValue	varchar(20);
	declare @pct int
	declare @temp float;	-- perform all calculations as float to avoid arithmetic overflow
	SET @ReturnValue = ''
	SET @pHitCntOlder = isnull(@pHitCntOlder, 0)
	SET @pHitCntNewer = isnull(@pHitCntNewer, 0)
	IF (@pHitCntOlder != 0)	BEGIN
		SET @temp = CONVERT(float, @pHitCntNewer) - CONVERT (float, @pHitCntOlder)
		SET @temp = (@temp * 100.0) / CONVERT (float, @pHitCntOlder)
		SET @pct = CONVERT (int, @temp)
		IF @pct > 1000			SET @ReturnValue = '+1000%'
		ELSE IF @pct > 0		SET @ReturnValue = '+' + Convert(varchar(3), @pct)  + '%'
		ELSE IF @pct <= -1000	SET @ReturnValue = '-1000%'
		ELSE IF @pct < 0		SET @ReturnValue = '-' + Convert(varchar(3), abs(@pct))	+ '%'	
		ELSE IF @pct = 0		SET @ReturnValue = '0%' 
	END
	RETURN @ReturnValue
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnValidatePrimaryAddress]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------
-- File: c:\CoStarProjects\CRM.WS.Database\CRM.WS.DB.Property\Functions\fnValidatePrimaryAddress.sql
CREATE function [dbo].[fnValidatePrimaryAddress]        /* CRM Version 4.0.0.0 */
-- create function dbo.fnValidatePrimaryAddress   
(                
  @pPropertyID int,
  @pPrimaryAddressID int
)
  returns bit
as

/************************************************************************************
**	Name: fnValidatePrimaryAddress
**	
**  This UDF returns a boolean indicating whether the input property / PrimaryAddress 
**  identifiers exist in the association table PropertyAddress.  Developed to use in
**  a table-level check constraint, to make up for the fact that a FK constraint
**  between Property.PrimaryAddressID and PropertyAddress, does not fully enforce
**  the relationship.
**
**  PM, 6/16/4.
**
*******************************************************************************/
begin

  declare @valid bit

  if exists ( select PropertyID
              from dbo.PropertyAddress (nolock)
              where PropertyID = @pPropertyID
              and AddressID = @pPrimaryAddressID )
    set @valid = 1
  else
    set @valid =  0

  return @valid
  
end

GO
/****** Object:  UserDefinedFunction [dbo].[fnValidatePropertyFloor]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------
-- File: c:\CoStarProjects\CRM.WS.Database\CRM.WS.DB.Property\Functions\fnValidatePropertyFloor.sql
CREATE function [dbo].[fnValidatePropertyFloor]        /* CRM Version 4.0.0.0 */
-- create function dbo.fnValidatePropertyFloor   
(     
  @pPropertyFloorID int,           
  @pPropertyID int
)
  returns bit
as

/************************************************************************************
**	Name: fnValidatePropertyFloor
**	
**  This UDF returns a boolean indicating whether the input PropertyFloorID identifies
**  a floor associated with the input PropertyID.  Developed to use in
**  a table-level check constraint on CondoUnit, to make up for the fact that a FK  
**  constraint between CondoUnit and PropertyFloor does not ensure that the floor is
**  valid in relation to the condo's associated property.
**
**  PM, 12/28/4.
**
*******************************************************************************/
begin

  declare @valid bit

  if exists ( select NULL
              from dbo.PropertyFloor (nolock)
              where PropertyFloorID = @pPropertyFloorID
              and PropertyID = @pPropertyID )
    set @valid = 1
  else
    set @valid =  0

  return @valid
  
end

GO
/****** Object:  UserDefinedFunction [dbo].[fnValidateTelephoneNumber]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnValidateTelephoneNumber] ( @pTelephoneNumber AS VARCHAR(20) )

RETURNS BIT -- 0=Invalid phone number; 1=Valid phone number.

AS

/******************************************************************************
*	PROJECT NAME: New Research System
*	SCRIPT NAME: fnValidateTelephoneNumber.SQL
*	CREATION DATE: 03/13/2006
*	COPYRIGHT: COSTAR GROUP, INC
*	PURPOSE: To validate a phone number (including fax, cell, and other phone numbers).
*
*	Assign 1 point for each test mentioned below.  If number passes all the
*	tests below, then it's valid:
*
*	Tests:
*
*	1.	Ensure the telephone string equates to a numeric value OR NULL (after having
*		stripped special characters).  In other words, the telephone string
*		does not contain all zeros.
*
*		Examples of invalid numbers are:
*
*		(000)000-0000; (000) 000-0000; 000 000 0000; 000.000.0000; 000-0000
*
*	2.	Ensure the last 7 digits of the telephone string equate to a numeric value
*		OR NULL (after having stripped special characters).  In other words, the
*		last 7 digits cannot contain all zeros.
*
*		Examples of invalid numbers are:
*
*		(505)000-0000; 505 000 0000; 505.000.0000
*
*	3.	Ensure the telephone string has at least 10 digits.
*
*	RETURN STATUS: BIT -- 0=Invalid phone number; 1=Valid phone number.

DECLARE @Test VARCHAR(25)
SET @Test = '(123) 456-7890'
SELECT Phone = @Test, Valid = CASE WHEN dbo.fnValidateTelephoneNumber(@Test) = 1 THEN 'TRUE' ELSE 'FALSE' END
SET @Test = '000.000.0000'
SELECT Phone = @Test, Valid = CASE WHEN dbo.fnValidateTelephoneNumber(@Test) = 1 THEN 'TRUE' ELSE 'FALSE' END
SET @Test = '(505)000-0000'
SELECT Phone = @Test, Valid = CASE WHEN dbo.fnValidateTelephoneNumber(@Test) = 1 THEN 'TRUE' ELSE 'FALSE' END
SET @Test = '+33 12 3456 7890 12'
SELECT Phone = @Test, Valid = CASE WHEN dbo.fnValidateTelephoneNumber(@Test) = 1 THEN 'TRUE' ELSE 'FALSE' END

*
*	UPDATES:
*	DATE		AUTHOR	PURPOSE
*	03/13/2006	EKO	Created to address TD_CRM Defect # 6637.
*   07/25/2008  CG  Don't check for exactly 10 digits now that we handle foreign phone numbers TFS 11758
******************************************************************************/

BEGIN 

	DECLARE	@ValidTelephoneNumber BIT
	
	-- Strip special characters which delimit area codes, exchange codes, country
	-- codes, etc.  Ex. (999) 999-9999
	-- If telephone number string is empty, treat it as a NULL.
	SET @pTelephoneNumber = NULLIF(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@pTelephoneNumber, '(', ''), ')', ''), '-', ''), ' ', ''), '.', ''), '')

	-- If the telephone string equates to a number > 0 (after special chars are
	-- stripped) OR NULL, then allow it.
	-- Addresses:  (000)000-0000; (000) 000-0000; 000 000 0000; 000.000.0000; 000-0000; 000-000-0005; 000-000-9999
	IF (
		SELECT
			CASE
				-- If string is representative of a number, cast it as a number in order to test for all zeros.
				WHEN ISNUMERIC(@pTelephoneNumber) = 1 THEN CAST(@pTelephoneNumber AS DECIMAL(19,0))
				-- If string is empty or NULL, then assign a value > 0 so that it passes test for all zeros.
				WHEN @pTelephoneNumber IS NULL THEN 1
				-- If string is not representative of a number, assign a value = 0 so that it fails test for all zeros.
				ELSE 0
			END
	) > 0 -- Does the string contain all zeros or is non-numeric in nature?

	AND

	-- If the last 7 characters of the telephone string (after an area code)
	-- equate to a number > 0 (after special chars are stripped) OR NULL, then allow it.
	-- Addresses:  (505)000-0000; 505 000 0000; 505.000.0000; 000-0000; 000-000-0005; 000-000-9999; 000-000-0005; 000-000-9999
	(
		SELECT

			CASE
				-- If subset of string is representative of a number, cast it as a number in order to test for all zeros.
				WHEN ISNUMERIC(RIGHT(@pTelephoneNumber, 7)) = 1  THEN CAST(RIGHT(@pTelephoneNumber, 7) AS DECIMAL(19,0))
				-- If string is empty or NULL, then assign a value > 0 so that it passes test for all zeros.
				WHEN @pTelephoneNumber IS NULL THEN 1
				-- If string is not representative of a number, assign a value = 0 so that it fails test for all zeros.
				ELSE 0
			END
	) > 0 -- Does a subset of the string contain all zeros or is non-numeric in nature?

--	AND
--
--	-- Check to ensure that non-NULL telephone numbers have 10 digits after demarcation symbols have been stripped (including spaces).
--	(
--
--		CASE
--			-- If telephone number is empty string/NULL then allow
--			WHEN @pTelephoneNumber IS NULL THEN 1
--			-- If telephone number has 10 characters (after demarcation symbols have been stripped) then allow
--			WHEN DATALENGTH(@pTelephoneNumber) = 10 THEN 1
--			-- Else don't allow it.
--			ELSE 0
--		END > 0
--
--	)

	BEGIN
		SET @ValidTelephoneNumber = 1
	END
	ELSE
	BEGIN
		SET @ValidTelephoneNumber = 0
	END

	RETURN @ValidTelephoneNumber
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnWebUsersAFLoginName]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnWebUsersAFLoginName] (

@pContactId INT = NULL, -- Mutually exclusive of @pFirstName, @pLastName.  If supplied, it overrides the remaining input parameters.
@pFirstName VARCHAR(50) = NULL, -- Mutually exclusive of @pContactId
@pLastName VARCHAR(50) = NULL  -- Mutually exclusive of @pContactId

)

RETURNS VARCHAR(20) -- Size dictated by WebUsers.AFLoginName

AS

/******************************************************************************
** File: 
** Name: fnWebUsersAFLoginName
** Desc:
**	Returns a unique LoginName based on either the supplied ContactId 
**	or the supplied First and Last names.
**
** DATE		WHO	WHAT
** ----------	-------	--------------------------------------------------------------
** 04/29/2010	EKO	MAJOR UPDATE:
**			1.  Generate a login name suffix of 4 digits (if needed) to accomodate
**			the likihood of many users with same or very similar common name
**			(like J. Smith).
**			2.  Add WHILE loop condition to prevent infinite loop problem.
**			3.  Shorten @AFLoginName variables to the same size as that of
**			WebUsers.AFLoginName.
**			Refer to TFS # 20058.
*******************************************************************************/

BEGIN

	DECLARE
		@AFLoginNameRoot VARCHAR(20), -- FirstName inital + LastName, truncated to first 20 characters.  Size dictated by WebUsers.AFLoginName
		@AFLoginName VARCHAR(20), -- @AFLoginNameRoot + generated number (if needed).  Size dictated by WebUsers.AFLoginName
		@FirstName VARCHAR(50),
		@LastName VARCHAR(50),
		@UserFound BIT, -- 0=Good login name not yet identified; 1=Good login name identified
		@Counter INT
	
	
	-- There are 2 alternatives.  1) ContactId is supplied - get the first and last names from the
	-- Contact record.  2) ContactId is null - use the supplied first and last names
	IF @pContactId IS NOT NULL
	BEGIN
		SELECT
			@FirstName = FirstName,
			@LastName = LastName
		FROM dbo.Contact c with (nolock) 
		WHERE c.ContactId = @pContactId
	
		IF @@ROWCOUNT = 0 
		BEGIN
			RETURN ''
		END
	END
	ELSE
	BEGIN
		SET @FirstName = @pFirstName
		SET @LastName = @pLastName
	END
	
	
	SELECT
		-- Clean the variables:  No NULLs, no prefix or suffix space characters, no single quotes/apostrophes.
		@FirstName = REPLACE(LTRIM(RTRIM(ISNULL(@FirstName, ''))), '''', ''),
		@LastName = REPLACE(LTRIM(RTRIM(ISNULL(@LastName, ''))), '''', ''),
	
		-- Initialize Number Generator variables
		@Counter = 0,
		@UserFound = 0
	
	-- If no usable name was supplied, stop.
	IF DATALENGTH(@FirstName) + DATALENGTH(@LastName) = 0
		RETURN ''
	
	-- Concatenate first letter from first name with the entire last name, then truncate to the datalength limit of @AFLoginName.
	SELECT @AFLoginNameRoot = CAST(LEFT(@FirstName, 1) + @LastName AS VARCHAR(20))
	
	
	-- Loop until an unused login name can be identified (not used by another user)
	-- OR
	-- 10,000 attempts have been made (need to prevent infinite loops here!)
	WHILE @UserFound = 0 AND @Counter < 10000
	BEGIN
		SELECT
			@AFLoginName =
				CASE
					-- Generated number is NOT part of login name.
					WHEN @Counter = 0 THEN @AFLoginNameRoot
	
					-- Generated number DOES need to be part of login name.
					ELSE
						CASE
							-- If datalength of @AFLoginName + generated number will exceed the data
							-- length capacity of WebUsers.AFLoginName, then use the STUFF function
							-- to begin truncating the right-hand side of the login name so generated
							-- number will fit.
							WHEN DATALENGTH(@AFLoginNameRoot) > 20-DATALENGTH(CAST(@Counter AS VARCHAR(10))) THEN
								STUFF(@AFLoginNameRoot,
									DATALENGTH(@AFLoginName)-DATALENGTH(CAST(@Counter AS VARCHAR(10)))+1, --> Starting position where generated number should be inserted.
									DATALENGTH(CAST(@Counter AS VARCHAR(10))), --> Number of chars within generated number.
									CAST(@Counter AS VARCHAR(10)) --> Insert the generated number
								)
	
							-- The datalength capacity of WebUsrs.AFLoginName won't require partial
							-- truncation; therefore, just append generated number.
							ELSE @AFLoginNameRoot + CAST(@Counter AS VARCHAR(10))
						END
				END
	
	
		-- If login name already exists, then increment counter and try a new login name
		IF EXISTS(
			SELECT AFLoginName
			FROM dbo.WebUsers WITH (NOLOCK)
			WHERE AFLoginName = @AFLoginName )
	
			SET @Counter = @Counter + 1
		ELSE
			SET @UserFound = 1
	
	
	END -- WHILE
	
	RETURN @AFLoginName

END -- FUNCTION

GO
/****** Object:  UserDefinedFunction [dbo].[fnWeekBeginDate]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Function [dbo].[fnWeekBeginDate] (@FromDate DateTime) Returns DateTime
As
Begin
	/*
	This function returns the a dateTime representing the first
	DateTime value of the previous week of the year.

	ie: 2/28/2003 is a Friday.  Function will return the Sunday morning of the previous week
	Select dbo.fnPreviousWeekBeginDate ('2/28/2003') --2003-02-22 23:59:59.997 
	*/

	Declare @WeekBeginDate dateTime
	Declare @DateString varchar(15)
	
	If DatePart(week, @FromDate) > 1
	Begin	--@FromDate is not the first week of the year
		Select @WeekBeginDate = Cast(Convert(varChar(15), 
						DateAdd(day, (DatePart(weekday, @FromDate) - 1) * -1, @FromDate)
						, 101) + ' 00:00:00.000' as DateTime)
	End
	Else
	Begin
		--Previous Week is the first week of the year
		--12/31/xxxx will always be in the last week of the year
		--1/1/xxxx will always be in in the first week of the year
		Set @DateString = '1/1/' +  Cast(DatePart(year, @FromDate) as char(4))
		Select @WeekBeginDate = Cast(@DateString + ' 00:00:00.000' as DateTime)
	End


	Return @WeekBeginDate
End


GO
/****** Object:  UserDefinedFunction [dbo].[fnWorkday]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnWorkday](@pStartDate datetime, @pDaysToAdd int)
RETURNS datetime
AS
BEGIN
	DECLARE @EndDate datetime
	DECLARE @Weekday tinyint
	IF @pStartDate IS NOT NULL
	BEGIN
		--Fix the DateFirst issue
		--7 = Sunday (Default setting, US)
		--1 = Monday (European setting)
		IF (@@DATEFIRST = 7)
		BEGIN
			IF DATEPART(WEEKDAY,@pStartDate)=1 --if this is a Sunday,force the weekday to 7
				SET @Weekday=7
			ELSE
				SET @Weekday = DATEPART(weekday, @pStartDate)-1
		END
		ELSE
		BEGIN
			SET @Weekday = DATEPART(weekday, @pStartDate)
		END
			
		--If the StartDate is a Sat or Sun, go back to the last Friday
			if @Weekday = 6 
			begin
				set @pStartDate=DATEADD(day,-1,@pStartDate)
				set @Weekday=@Weekday-1
			end
			if @Weekday = 7
			begin
				set @pStartDate=DATEADD(day,-2,@pStartDate)
				set @Weekday=@Weekday-2
			end
			
		SET @EndDate = 
		(SELECT
			DATEADD(day,
			   @pDaysToAdd%5 +
			   CASE @Weekday + @pDaysToAdd%5
				   WHEN 6 THEN 2
				   WHEN 7 THEN 2
				   WHEN 8 THEN 1
			   ELSE 0 END,
			DATEADD(week,@pDaysToAdd/5,@pStartDate)
			)
		)
    END
    RETURN @EndDate
END

--select dbo.fnWorkday('10/01/2012',7) --10/10/2012
--select dbo.fnWorkday('10/04/2012',7) --10/15/2012
--select dbo.fnWorkday('10/05/2012',7) --10/16/2012
--select dbo.fnWorkday('10/06/2012',7) --10/16/2012
--select dbo.fnWorkday('10/07/2012',7) --10/16/2012
--select dbo.fnWorkday('10/08/2012',7) --10/17/2012
--select dbo.fnWorkday('01/15/2012',7) --01/24/2012
--select dbo.fnWorkday('01/18/2012',7) --01/27/2012

--select dbo.fnWorkday('10/01/2012',10) --10/15/2012
--select dbo.fnWorkday('10/04/2012',10) --10/18/2012
--select dbo.fnWorkday('10/05/2012',10) --10/19/2012
--select dbo.fnWorkday('10/06/2012',10) --10/19/2012
--select dbo.fnWorkday('10/07/2012',10) --10/19/2012
--select dbo.fnWorkday('10/08/2012',10) --10/22/2012
--select dbo.fnWorkday('01/15/2012',10) --01/27/2012
--select dbo.fnWorkday('01/18/2012',10) --02/01/2012

GO
/****** Object:  UserDefinedFunction [dbo].[InterpolateBetweenGeog]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[InterpolateBetweenGeog](@start [geography], @end [geography], @distance [float])
RETURNS [geography] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[InterpolateBetweenGeog]
GO
/****** Object:  UserDefinedFunction [dbo].[InterpolateBetweenGeom]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[InterpolateBetweenGeom](@start [geometry], @end [geometry], @distance [float])
RETURNS [geometry] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[InterpolateBetweenGeom]
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidGeographyFromGeometry]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[IsValidGeographyFromGeometry](@inputGeometry [geometry])
RETURNS [bit] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[IsValidGeographyFromGeometry]
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidGeographyFromText]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[IsValidGeographyFromText](@inputWKT [nvarchar](max), @srid [int])
RETURNS [bit] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[IsValidGeographyFromText]
GO
/****** Object:  UserDefinedFunction [dbo].[JaroWinkler]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[JaroWinkler](@firstWord [nvarchar](4000), @secondWord [nvarchar](4000))
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [PropertyMatch].[UserDefinedFunctions].[JaroWinkler]
GO
/****** Object:  UserDefinedFunction [dbo].[LocateAlongGeog]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[LocateAlongGeog](@g [geography], @distance [float])
RETURNS [geography] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[LocateAlongGeog]
GO
/****** Object:  UserDefinedFunction [dbo].[LocateAlongGeom]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[LocateAlongGeom](@g [geometry], @distance [float])
RETURNS [geometry] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[LocateAlongGeom]
GO
/****** Object:  UserDefinedFunction [dbo].[MakeValidGeographyFromGeometry]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[MakeValidGeographyFromGeometry](@inputGeometry [geometry])
RETURNS [geography] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[MakeValidGeographyFromGeometry]
GO
/****** Object:  UserDefinedFunction [dbo].[MakeValidGeographyFromText]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[MakeValidGeographyFromText](@inputWKT [nvarchar](max), @srid [int])
RETURNS [geography] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[MakeValidGeographyFromText]
GO
/****** Object:  UserDefinedFunction [dbo].[ShiftGeometry]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[ShiftGeometry](@g [geometry], @xShift [float], @yShift [float])
RETURNS [geometry] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[ShiftGeometry]
GO
/****** Object:  UserDefinedFunction [dbo].[Similarity]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[Similarity](@input1 [nvarchar](4000), @input2 [nvarchar](4000), @method [tinyint], @containmentBias [float], @minScoreHint [float])
RETURNS [float] WITH EXECUTE AS CALLER, RETURNS NULL ON NULL INPUT
AS 
EXTERNAL NAME [Microsoft.MasterDataServices.DataQuality].[Microsoft.MasterDataServices.DataQuality.SqlClr].[Similarity]
GO
/****** Object:  UserDefinedFunction [dbo].[SmithWatermanGotoh]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[SmithWatermanGotoh](@firstWord [nvarchar](4000), @secondWord [nvarchar](4000))
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [PropertyMatch].[UserDefinedFunctions].[SmithWatermanGotoh]
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_NCOAProperCase]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  FUNCTION [dbo].[UDF_NCOAProperCase]
 (@StringVal AS Varchar(8000)) 
RETURNS Varchar(8000)
AS

/********************************************************************************************************************************************
* PROJECT NAME:               NCOA    
* SCRIPT NAME:                DBO.UDF_NCOAProperCase.sql     
* CREATION DATE:              SEPTEMBER 08, 2004
* COPYRIGHT:                  COSTAR GROUP, INC    
* PROJECT MANAGER::           KARL HEISER
* PROGRAMMER:                 KEVIN MIKAILOV
* PURPOSE:                    Convert Data into Proper Case
* INPUT PARAMETERS:           @StringVal
* OUTPUT PARAMATERS:          NONE
* OUTPUT VALUES:              SUCCESSFULL = 0, ERROR = ANY NONE-ZERO (VALUE OF @@ERROR)
* RESULT SET:                 @StringVal in proper case
* TABLES:                     NONE
*                              
* RETURN STATUS :             NONE
* USAGE:                      
* LOCAL VARIABLES:            SEE BELOW:
* CALLED BY:                  DBO.NCOALoadEnterprise
* CALLS:                      NONE      
*  
* DATA MODIFICATIONS:         
*                     
* UPDATES: 
* DATE AUTHOR PURPOSE: 
**********************************************************************************************************************************************/ 
  --COMMENTS/NOTES::
/*********************************************************************************************************************************************
* 
**********************************************************************************************************************************************/ 

BEGIN
 DECLARE 
  @Char AS VARCHAR(1)
  , @Len AS INT
  , @NewVal AS VARCHAR(8000)
  , @Pos AS INT
  , @PrevChar AS VARCHAR(1)
  , @NextChar AS VARCHAR(1) --added

 IF @StringVal IS NULL 
  RETURN NULL

 SELECT 
  @Char=''
  , @NewVal=''
  , @Pos = 1
  , @Len=DATALENGTH(@StringVal)
  , @StringVal=Upper(@StringVal)

 WHILE @Pos <= @Len 
  BEGIN
   SET @Char=SUBSTRING(@StringVal, @Pos, 1)
   SET @PrevChar=SUBSTRING(@StringVal, @Pos-1, 1)
   SET @NextChar=SUBSTRING(@StringVal, @Pos+1, 1) --added
   IF ASCII(@PrevChar) = 39 --if ' added
   BEGIN --added
    --if at end of string then datalength will be 0 and this character should NOT be capitalized
    IF DATALENGTH(@NextChar) = 0 --added
     SET @Char=LOWER(@Char) --added
    ELSE
    BEGIN
     --if next character is a space than the letter should NOT be capitalized
     IF ASCII(@NextChar) = 32 --added
      SET @Char=LOWER(@Char) --added
     ELSE
      SET @Char=UPPER(@Char) --added
    END
   END --added
   ELSE
   BEGIN
    IF ASCII(@PrevChar) Between 65 And 90 OR ASCII(@PrevChar) Between 97 And 122 
     SET @Char=LOWER(@Char)
    ELSE --added
    BEGIN --added
     --if previous character was a number then change the case to a lower
     IF ASCII(@PrevChar) Between 48 And 57 --added
      SET @Char = LOWER(@Char) --added
     ELSE --added
      SET @Char=UPPER(@Char) --added
    END
   END

   SET @NewVal=@NewVal + @Char
   SET @Pos = @Pos + 1
 END
 RETURN RTRIM(LTRIM(@NewVal))
-- RETURN @NewVal
END




GO
/****** Object:  UserDefinedFunction [dbo].[VacuousGeographyToGeometry]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[VacuousGeographyToGeometry](@toConvert [geography], @targetSrid [int])
RETURNS [geometry] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[VacuousGeographyToGeometry]
GO
/****** Object:  UserDefinedFunction [dbo].[VacuousGeometryToGeography]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[VacuousGeometryToGeography](@toConvert [geometry], @targetSrid [int])
RETURNS [geography] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SQLSpatialTools].[SQLSpatialTools.Functions].[VacuousGeometryToGeography]
GO
/****** Object:  UserDefinedFunction [loopnet].[fnContractProductGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [loopnet].[fnContractProductGet]
(
	@pContractID	int = null
)
  returns @ReturnTable table 
	(	
		ContractID int not null, 
		FeatureProductID int not null, 
		ListingLimitCount int, 
		ListingLimitMode varchar(50)
	)
as 
/**************************************************************************************************************
** Name: fnContractProductGet
** Desc: Select from LoopNet contract listing limits with modes
*
* Revision:
* Date          AUTHOR				PURPOSE 
* 02/23/2017    Todd Seymour        TFS 421395: Added Function
**
***************************************************************************************************************/
begin
	declare @ErrorMessage varchar(250)
	declare @ContractStatistics table 
		(
			ContractID int, 
			SilverLimit int, 
			SilverMode varchar(50), 
			GoldLimit int, 
			GoldMode varchar(50), 
			PlatinumLimit int, 
			PlatinumMode varchar(50), 
			DiamondLimit int, 
			DiamondMode varchar(50)
		)

	insert into @ContractStatistics
		select  li.ContractID
			,sum(isnull(case when p.FeatureProductId in (162) then li.UnitQuantity else 0 end, 0)) SilverLimit
			  , min(case when p.FeatureProductId in (162) then d.DatasetCD else null end) SilverMode
			,sum(isnull(case when p.FeatureProductId in (283) then li.UnitQuantity else 0 end,0)) GoldLimit
			  , min(case when p.FeatureProductId in (283) then d.DatasetCD else null end) GoldMode
			,sum(isnull(case when p.FeatureProductId in (259) then li.UnitQuantity else 0 end,0)) PlatinumLimit
			  , min(case when p.FeatureProductId in (259) then d.DatasetCD else null end) PlatinumMode
			,sum(isnull(case when p.FeatureProductId in (260) then li.UnitQuantity else 0 end,0)) DiamondLimit
			  , min(case when p.FeatureProductId in (260) then d.DatasetCD else null end) DiamondMode
		from loopnet.vwLineItemCombined li with(nolock) 
		  inner join dbo.Product p with(nolock)
		    on li.ProductID = p.ProductID
		  inner join dbo.DataSet d with(nolock)
		    on li.DatasetID = d.DatasetID
		where (@pContractID is null or li.ContractID = @pContractID)
			  and p.FeatureProductId  in (162, 259, 260, 283) and (li.lineitemstatusid in (1,2))
		group by li.contractid
		
	insert into @ReturnTable
	  select ContractID, 162, coalesce(cs.SilverLimit,0), coalesce(SilverMode,'CAPPED') from @ContractStatistics as cs
		union
	  select ContractID, 283, coalesce(cs.GoldLimit,0), coalesce(GoldMode,'CAPPED') from @ContractStatistics as cs
		union
	  select ContractID, 259, coalesce(cs.PlatinumLimit,0), coalesce(PlatinumMode,'CAPPED') from @ContractStatistics as cs
		union
	  select ContractID, 260, coalesce(cs.DiamondLimit,0), coalesce(DiamondMode,'CAPPED') from @ContractStatistics as cs

	return 
end

GO
/****** Object:  UserDefinedFunction [dbo].[fnCompEntityDerivedPriceGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* ********************************************************************************************************************************************* */
CREATE FUNCTION [dbo].[fnCompEntityDerivedPriceGet] ()
Returns Table
As
/***************************************************************************************************
**	Name: fnCompEntityDerivedPriceGet
**
**  Goal:
**  Return a derived price given a CompEntityID.
**
**  Note:
**  DO NOT try to get the price from the comp record before using this sproc.  This results
**  in a doubling of effort.
**
**  20060525  DJR  Creation.
**  20060530  DJR  Condensed Property, Condo and Land into one select statement. 50% performance boost.
**  20060531  DJR  Rewrote as function returning a table instead of a single value.
**  20060712  RBM  Changed "CompCountPricePerSQFT" to "CompCountPrice"..
**  20060803  DJR  Added "dbo." to a couple of from statements...
**  20060817  RBM  Modified to pull CompCountPrice at the county-ptype level (not the subtype level)
**  20060911  LR   Return PropertyID 
**  20060202  DJR  Added nullifs to handle 0 values.
***************************************************************************************************/
return(

       /* PULL FROM Property / CONDO / LAND... */
               select ci.CompID, ci.CompEntityID, ci.EntityID, ci.PropertyID, 
                       coalesce (nullif(case when ci.SaleEntityTypeId = 1  -- Property
                                             then isnull(convert(bigint, ci.GrossBldgSqFt), convert(bigint, ci.RentableSqFtTotal)) * convert(bigint, ci.PricePerSquareFoot) else null
                                        end,0)
                                ,nullif(convert(bigint, cu.UnitSqFt) * convert(bigint, ci.PricePerSquareFoot),0)  -- Condo
                                ,nullif(convert(bigint, l.SqFtGross) * convert(bigint, ci.PricePerSquareFoot),0)      /* Land */) DerivedPrice
                 from  (select ce.CompId,
                               ce.CompEntityID, 
                               ce.EntityId,
                               ce.SaleEntityTypeId,
                               p.PropertyID,
                               p.GrossBldgSqFt,
                               p.RentableSqFtTotal,
                               p.PropertyTypeId,
                               ccp.PricePerSquareFoot
                        From dbo.CompEntity  ce       With (NOLOCK)
                        Join dbo.Property   p         With (NOLOCK) On p.Propertyid         = ce.PropertyID
                        Join dbo.Address    a          With (NOLOCK) On p.PrimaryAddressID   = a.AddressID
                        Join dbo.CompCountyPrice
                                 ccp       With (NOLOCK) On a.CountyID            = ccp.CountyID
                                                                    And p.PropertyTypeID     = ccp.PropertyTypeID
                                                                    And ccp.PropertySubTypeID Is Null --Get the derived price at the county/p-type level (not sub type level).
                          ) ci
                     left Join dbo.CondoUnit   cu   With (NOLOCK) On ci.EntityID         = cu.CondoUnitID
                                                                        And ci.SaleEntityTypeId = 2
                     left Join dbo.Land   l	With (NOLOCK) On ci.PropertyID       = l.PropertyID
                                                                        And ci.PropertyTypeId   = 3 -- Land
                                                                        And ci.SaleEntityTypeId = 1


)

GO
/****** Object:  UserDefinedFunction [dbo].[fnCompAssignmentPriceGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[fnCompAssignmentPriceGet]()   
Returns Table
As
/***************************************************************************************************
**	Name: fnCompAssignmentPriceGet
**
**  Goal:
**  Return a derived price given a CompId. This is a variation of the existing fnCompDerivedPriceGet function.  This is to 
**  be used for Compassignment to retrieve the maximum derived value for the comp. This max value is used to 
**  assign to the instutionalComps team. Also, this will use the PropertyLoan table for computing Loan balance sum.  
**
**  Note:
**  DO NOT try to get the price from the comp record before using this sproc.  This results
**  in a doubling of effort.
**  HH  05/22/2012  TFS 29474.  Changing rule to return the max from CompsDerived ,Assessments,and loans prices.  If all are null 
**  return the the PropertyDerived 
**  HH  04/23/2013  TFS 35226.  Changing rule to return the first value found, not the highest of the first 3. 
***************************************************************************************************/
return(
       select  CompDerivedPrice.CompId,                    
        DerivedPrice =  case when ( Case when ISNULL(CompDerivedPrice.DerivedPrice,0) > 0            
                                  then CompDerivedPrice.DerivedPrice
                             when ISNULL(APNDerivedPrice.Derivedprice,0) >  0                                                         
                                  then APNDerivedPrice.Derivedprice
                             when ISNULL(LoanDerivedPrice.DerivedPrice,0) >  0                            
                                  then  LoanDerivedPrice.DerivedPrice
                             else 
                                  ISNULL(PropertyDerivedPrice.Derivedprice,0) end) >=  999999999999  THEN 999999999999
                        else  (Case when ISNULL(CompDerivedPrice.DerivedPrice,0) >0
                                  then CompDerivedPrice.DerivedPrice
                             when ISNULL(APNDerivedPrice.Derivedprice,0) > 0 
                                  then APNDerivedPrice.Derivedprice
                             when ISNULL(LoanDerivedPrice.DerivedPrice,0) > 0 
                                  then  LoanDerivedPrice.DerivedPrice
                             else 
                                  ISNULL(PropertyDerivedPrice.Derivedprice,0) end) end            
                                   
       /* GET FROM THE COMPS TABLE, IF POSSIBLE */
       from   (Select CompID,
                      coalesce(nullif(Comp.SoldForPrice, 0)
                              ,nullif(Comp.AskingPriceLow, 0)
                              ,nullif(Comp.AskingPriceHigh, 0)
                              ,nullif(Comp.AssessedTotalValue, 0)
                              ,nullif(Comp.AssessedImprovementValue + Comp.AssessedLandValue, 0)) DerivedPrice
               from   dbo.Comp Comp With (NOLOCK)) CompDerivedPrice

       /* PULL FROM THE ASSESSMENTS */
       left join
               (select CompID,
                       isnull(sum(nullif(CompAPNAssessment.AssessedTotalValue,0))
                             ,sum(nullif(CompAPNAssessment.AssessedImprovementValue + CompAPNAssessment.AssessedLandValue,0))) DerivedPrice
                from   dbo.CompAPNAssessment CompAPNAssessment With (NOLOCK)
                join   dbo.CompDocument      CompDocument      With (NOLOCK) on CompDocument.CompDocumentId = CompAPNAssessment.CompDocumentId
                group by CompDocument.CompID) APNDerivedPrice
       on CompDerivedPrice.CompID = APNDerivedPrice.CompID
       
	   /* Pull from PropertyLoan */	
       left join (
	 select pl.CompID, sum(pl.Balance) DerivedPrice
		From PropertyLoan pl WITH (NOLOCK) 
		Group by pl.CompID ) LoanDerivedPrice 
	on CompDerivedPrice.CompID = LoanDerivedPrice.CompID 
	
       /* PULL FROM PROPERTY / CONDO / LAND... */
       left join (
	 select pdp.CompID, sum(pdp.DerivedPrice) DerivedPrice
		From dbo.fnCompEntityDerivedPriceGet () pdp 
		Group by pdp.CompID ) PropertyDerivedPrice 
	on CompDerivedPrice.CompID = PropertyDerivedPrice.CompID 
            )

GO
/****** Object:  UserDefinedFunction [dbo].[fnCompDerivedPriceGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--------------------------------------------------------------------------------------------------
-- File: C:\CoStarProjects\Enterprise\CRM.WS.Database\CRM.WS.DB.Comp\Functions\fnCompDerivedPriceGet.sql


/********************************************************************************************************************************************** */
CREATE FUNCTION [dbo].[fnCompDerivedPriceGet] ()        /* CRM Version 5.4.14.1023 */
Returns Table
As
/***************************************************************************************************
**	Name: fnCompDerivedPriceGet
**
**  Goal:
**  Return a derived price given a CompId.
**
**  Note:
**  DO NOT try to get the price from the comp record before using this sproc.  This results
**  in a doubling of effort.
**
**  20060525  DJR  Creation.
**  20060530  DJR  Condensed Property, Condo and Land into one select statement. 50% performance boost.
**  20060531  DJR  Rewrote as function returning a table instead of a single value.
**  20060712  RBM  Changed "CompCountyPricePerSQFT" to "CompCountyPrice"..
**  20060803  DJR  Added "dbo." to a couple of from statements...
**  20060817  RBM  Modified to pull compCountyPrice at the county-propertytype level (not the subtype level)
**  20060906  LR   Use fnCompEntityDerivedPriceGet for pulling Property/condo/land price at entity level. 
**                 This also fixes a bug where the derived price was not including condo or land values
**                 if the Portfoio included a mixed bag of properties.
**  20070202  DJR  Added nullifs to take care of 0 vals.
**  20080521  MCA  Returns a max value if the derived price is greater than 999999999999.  Price must be 12 digits or less.
**  20081110  JMH  Added code to include Loan amount. 	
***************************************************************************************************/
return(
       select  CompDerivedPrice.CompId,
               CASE WHEN COALESCE(CompDerivedPrice.DerivedPrice, APNDerivedPrice.Derivedprice, LoanDerivedPrice.DerivedPrice, PropertyDerivedPrice.Derivedprice) > 999999999999
					THEN 999999999999
					ELSE COALESCE(CompDerivedPrice.DerivedPrice, APNDerivedPrice.Derivedprice, LoanDerivedPrice.DerivedPrice, PropertyDerivedPrice.Derivedprice)
			   END AS DerivedPrice

       /* GET FROM THE COMPS TABLE, IF POSSIBLE */
       from   (Select CompID,
                      coalesce(nullif(Comp.SoldForPrice, 0)
                              ,nullif(Comp.AskingPriceLow, 0)
                              ,nullif(Comp.AskingPriceHigh, 0)
                              ,nullif(Comp.AssessedTotalValue, 0)
                              ,nullif(Comp.AssessedImprovementValue + Comp.AssessedLandValue, 0)) DerivedPrice
               from   dbo.Comp Comp With (NOLOCK)) CompDerivedPrice

       /* PULL FROM THE ASSESSMENTS */
       left join
               (select CompID,
                       isnull(sum(nullif(CompAPNAssessment.AssessedTotalValue,0))
                             ,sum(nullif(CompAPNAssessment.AssessedImprovementValue + CompAPNAssessment.AssessedLandValue,0))) DerivedPrice
                from   dbo.CompAPNAssessment CompAPNAssessment With (NOLOCK)
                join   dbo.CompDocument      CompDocument      With (NOLOCK) on CompDocument.CompDocumentId = CompAPNAssessment.CompDocumentId
                group by CompDocument.CompID) APNDerivedPrice
       on CompDerivedPrice.CompID = APNDerivedPrice.CompID
       
	   /* Pull from CompLoan */	
       left join (
	 select cl.CompID, sum(cl.Balance) DerivedPrice
		From [CompLoan] cl WITH (NOLOCK) 
		Group by cl.CompID ) LoanDerivedPrice 
	on CompDerivedPrice.CompID = LoanDerivedPrice.CompID 
	
       /* PULL FROM PROPERTY / CONDO / LAND... */
       left join (
	 select pdp.CompID, sum(pdp.DerivedPrice) DerivedPrice
		From dbo.fnCompEntityDerivedPriceGet () pdp 
		Group by pdp.CompID ) PropertyDerivedPrice 
	on CompDerivedPrice.CompID = PropertyDerivedPrice.CompID 
            )

GO
/****** Object:  UserDefinedFunction [dbo].[fnMFPropertyUnitCounts]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------
-- File: C:\COSTARPROJECTS\COSTARINTERNALAPPS\MAIN\ENTERPRISE\SOURCE\CRM.WS.Database\CRM.WS.DB.Property\Functions\fnMFPropertyUnitCounts.sql

CREATE FUNCTION [dbo].[fnMFPropertyUnitCounts]()        /* CRM Version  */
RETURNS TABLE
RETURN
(
	with cte
	as
	(
		SELECT
		vw.PropertyID,
		vw.StateID,
		vw.CountyID,
		pa.PropertyApartmentID,
		latestConfirmedUM.PropertyApartmentHistoryID AS ConfirmedPropertyApartmentHistoryID,
		latestConfirmedUM.TotalNumUnits AS ConfirmedTotalNumUnits,
		maxUM.MaxNumUnits
	FROM  dbo.vwMultifamilyProperty vw with (noexpand)
	JOIN dbo.PropertyApartment pa ON vw.PropertyID=pa.PropertyID
	JOIN (SELECT PropertyApartmentID,MAX(TotalNumUnits) as MaxNumUnits FROM dbo.vwPropertyApartmentNumUnits with (noexpand) GROUP BY PropertyApartmentID)MaxUM ON pa.PropertyApartmentID=maxUM.PropertyApartmentID
	LEFT JOIN
		(
		SELECT 
		  	  vw2.PropertyApartmentID
			, vw2.PropertyApartmentHistoryID
			, vw2.DerivedMonthYearDate
			, vw2.TotalNumUnits
			, RankedByDate=RANK() OVER (PARTITION BY vw2.PropertyApartmentID ORDER BY vw2.DerivedMonthYearDate DESC)
		FROM dbo.vwPropertyApartmentNumUnits vw2 with (noexpand)
		WHERE 
			vw2.VarianceTypeID=2
		)latestConfirmedUM ON pa.PropertyApartmentID=latestConfirmedUM.PropertyApartmentID
							AND latestConfirmedUM.RankedByDate=1
			
	)
	SELECT CTE.PropertyID,
		CTE.StateID,
		CTE.CountyID,
		CTE.PropertyApartmentID,
		HasVariance=ISNULL(Variance.HasVariance,0),
		CTE.ConfirmedPropertyApartmentHistoryID,
		ISNULL(CTE.ConfirmedTotalNumUnits,CTE.MaxNumUnits) as ConfirmedTotalNumUnits
	FROM CTE 
	LEFT JOIN (SELECT DISTINCT pah.PropertyApartmentID, HasVariance=1
				FROM dbo.PropertyApartmentHistory pah (nolock) 
				WHERE pah.VarianceTypeID=1
			  )Variance ON CTE.PropertyApartmentID=Variance.PropertyApartmentID
)
--select * from dbo.fnMFPropertyUnitCounts()

GO
/****** Object:  UserDefinedFunction [dbo].[fnPropertyMultifamilyNeighborhoods]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------------------------------
-- File: C:\COSTARPROJECTS\COSTARINTERNALAPPS\MAIN\ENTERPRISE\SOURCE\CRM.WS.Database\CRM.WS.DB.Property\Functions\fnPropertyMultifamilyNeighborhoods.sql

--drop function fnPropertyMultifamilyNeighborhoods
CREATE FUNCTION [dbo].[fnPropertyMultifamilyNeighborhoods]()        /* CRM Version  */
RETURNS TABLE
	RETURN
	--Get a list of distinct MF properties in a particular Neighborhood
	WITH NeighborhoodsWithCounties AS
	(
	SELECT DISTINCT 
	  n.NeighborhoodID
	, pshp.PropertyID
	, NeighborhoodTypeRank=RANK() OVER (PARTITION BY pshp.PropertyID ORDER BY n.NeighborhoodType DESC) --'N'ancy over 'M'ary
	, multifamilyProps.ConfirmedTotalNumUnits as LatestConfirmedNumUnits
	FROM
	 dbo.Neighborhood n (nolock) 
	--every neighborhood should have at least one shape id. This may return multiple shapes since some neighborhoods overlap
	JOIN dbo.Shape shp (nolock) ON n.NeighborhoodID=shp.EntityID AND shp.ShapeTypeID=17 
	--some shapes may not have any properties that fall in that shape. So this could return 0 records that is why we have a LEFT JOIN
	JOIN dbo.PropertyShape pshp (nolock) ON shp.ShapeID=pshp.ShapeID 
	JOIN dbo.Property p (nolock) on pshp.PropertyID=p.PropertyID
	JOIN dbo.fnMFPropertyUnitCounts() multifamilyProps ON p.PropertyID=multifamilyProps.PropertyID
	WHERE
		--if we don't have a confirmed unit count, then make sure we have at least ONE unit mix with 20 or more units
			multifamilyProps.ConfirmedTotalNumUnits >= 20
	)
	, DefaultNeighborhoods AS
	(
		SELECT
			  n.NeighborhoodID
			, mfPropAddr.PropertyID
			, mfPropAddr.ConfirmedTotalNumUnits as LatestConfirmedNumUnits
		FROM
			dbo.Neighborhood n (nolock) 
			LEFT JOIN dbo.Shape shp (nolock) on n.NeighborhoodID=shp.EntityID AND shp.ShapeTypeID=17
			--Get Multifamily properties that do not map to any neighborhood shapes
			JOIN (SELECT  mfprop.PropertyID
						, mfprop.ConfirmedTotalNumUnits
						, addr.StateID 
					FROM dbo.fnMFPropertyUnitCounts() mfprop
					JOIN dbo.Property p (nolock) on mfprop.PropertyID=p.PropertyID
					JOIN dbo.Address addr (nolock) on p.PrimaryAddressID=addr.AddressID
					LEFT JOIN dbo.PropertyShape pshp (nolock) on p.PropertyID=pshp.PropertyID
					LEFT JOIN dbo.Shape shp (nolock) on pshp.ShapeID=shp.ShapeID AND shp.ShapeTypeID=17
				WHERE
					shp.ShapeID IS NULL
					AND mfprop.ConfirmedTotalNumUnits >= 20
				)mfPropAddr ON n.StateID=mfPropAddr.StateID
			WHERE shp.ShapeID IS NULL
	)

	SELECT NeighborhoodID, PropertyID, LatestConfirmedNumUnits FROM NeighborhoodsWithCounties WHERE NeighborhoodTypeRank=1
	UNION ALL
	SELECT NeighborhoodID, PropertyID, LatestConfirmedNumUnits  FROM DefaultNeighborhoods
	
--select * from dbo.fnPropertyMultifamilyNeighborhoods()


GO
/****** Object:  UserDefinedFunction [dbo].[fnCurrentApartmentUnitMix]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCurrentApartmentUnitMix](@pAsOfDate DateTime)
Returns Table
As
/*
Purpose:  The aim of this function is to return the most recent (actually latest) property 
          apartment keys with respect to a given date.
          PropertyID - The property associated with the unit mix.
          PropertyApartmentID - The PropertyAPartment Key associated with the unit mix.  
          PropertyApartmentHistoryID - The most recent history ID with reespect to *@pAsOfDate.  Note:
          if @pAsOfDate is null then return the latest (even if it is in the future).

20060222 RBM Creation
*/
Return(
    Select 
      pa.PropertyID
     ,pah.PropertyApartmentID
     ,pah.PropertyApartmentHistoryID
     ,pah.DerivedMonthYearDate
    From dbo.PropertyApartment              pa  (NoLock)
    Inner Join dbo.PropertyApartmentHistory pah (NoLock) on pah.PropertyApartmentID = pa.PropertyApartmentID
    Inner Join (
      /*
      This sub-query identifies the most recent key PropertyApartmentHistory record for each 
      PropertyApartment item that it is joined with.
      */
      Select 
        PropertyApartmentID
      , DerivedMonthYearDate = Max(DerivedMonthYearDate)  
      From dbo.PropertyApartmentHistory (NoLock)
      Where 1=1
        And DerivedMonthYearDate <= IsNull(@pAsOfDate,DerivedMonthYearDate)
      Group By PropertyApartmentID  
    )                                       CurMix1      on CurMix1.PropertyApartmentID = pah.PropertyApartmentID
                                                        And CurMix1.DerivedMonthYearDate = pah.DerivedMonthYearDate
    Where 1=1
)

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCRMEnabledCountryCodes]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetCRMEnabledCountryCodes](@pProcedureName varchar(255) = null)
RETURNS TABLE
/*

Author:	Ed Hellyer
Date:	Jan 24th 2012

Purpose:
Due to the hacking of CRM to support localization (occurring a piece at a time from project to project) I have added a column to the Culture 
table called IsEnabledForCRMFlag.  In this function I'm using this flag to return a distinct list of supported countries.

For this project I'm using this function in the Inbox refresh procedures so that these procedures (currently hardcoded for 'USA' only) are now 
driven by a table via this function  (One source of truth).  There is a possibility that some stored procedures may need to behave differently 
therefore I'm including the @pProcedureName parameter.  The parameter @pProcedureName may be used to modify the behavior of this function as
needed, but initially will NOT be used.  

Example calling:
It is my intent that this procedure always be used with the system functions like so.
select CountryCode from dbo.fnGetCRMEnabledCountryCodes(OBJECT_NAME(@@procID))


History:
Editby	Date			TFS			Comment
EJH		Jan 24th 2012	TFS# 28789	Create function to satisfy TFS 28789.
EJH		Feb 13th 2012	None		Looking at the select I realized that we need a distinct to be future proof.  We have countries with multiple cultures.

*/

AS RETURN
(
	select distinct CountryCode
	from dbo.Culture with (nolock)
	where IsEnabledForCRMFlag = 1
)

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetLocationNameFTS]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create Function dbo.fnGetLocationNameFTS
CREATE FUNCTION [dbo].[fnGetLocationNameFTS]
(
  @pLocationID Int
, @pAll        Bit
, @pToday      DateTime
)
  Returns  Table
As
/*
===================================================================================================
Purpose:      The goal of this function is return a table representing string correlating a 
              locations Name, AKAs, Research Market, City, State, Zip And Property ID together.
              
              The format of the returned LocationName column is as follows:
          
              Location Name [[[AKA1] [AKA2]] ... [AKAn]] [xRMXX] [xRMpXX] [xRMfXX] [xCTCity0Name] [xSTState] [xZPZipCode] [xPIPropertyID]
          
              Where:
              Location Name - Is the location name field from location.locationname 
              [[[AKA1] [AKA2]] ... [AKAn]] - Are the AKAs tied to a particular location.
              [xRMXX] - The current research market that the location is in.
              *[xRMpXX] - The research market that the location was in. (based on previous occupancy)
              *[xRMfXX] - The research market that the location will be in. (based on future occupancy)
              [xCTCity0Name] - The city that the location is currently in.  (spaces are replaced with "0"'s)
              [xSTState] - The state that the location is currently in.
              [xZPZipCode] - The zip code that the location is currently in.
              [xPIPropertyID] - The property that the location is currently in.

              *Note that the "xRMp" and "xRMf" tokens are build through this function.  
              See dbo.fnGetRMFTStringByLocation which "STUFF"s these tokens into LocationFTS.LocationName 
              on occupancy changes.
           
              The following are some sample location names that this function produces..
                Barker Pacific Group xRM20 xCTLos0Angeles xSTCA xZP90017 xPI248886 
                Marangi Brothers xRM23 xCTEast0Rutherford xSTNJ 
                Acorn Fund xRM6 xCTChicago xSTIL xZP60606 xPI144284 
                A1 Aluminum Products Inc. xRM20 xCTGardena xSTCA xZP90248 xPI271024 

              The aim here was to correlate a locations address name information in 
              to one summary column and full text it so that searches (via resTenantGet) would 
              perform better.  This way when searching for "costar" in the Washington market for example
              we wouldn't have to traverse the old location and AKA FT indexes then go to the address
              table filtering on an unindexed "research market" colum.  Intead we can get a candidate
              list of location ids by one simple query on 1 table w/o the overhead incurred when 
              referencing location, AKA, and address independantly.

History:      RBM 20060616 Creation
			  Sean Roussy 06/11/2010 TFS 20667. The zip field became deprecated during Ent UK but not in this 
												procedure. It has been replaced by Address.PostCode.
===================================================================================================
*/
Return(
Select --Distinct 
    l.LocationID
   ,LocationName = 
    Max(
    IsNull(
      Cast(
       RTrim(LTrim(l.LocationName))                             +' '
     + 
       Case
         When SubLoc.AKAExists = 1 Then RTrim(Ltrim(dbo.fnGetAKAList(l.LocationID,' '))) + ' '
         Else ''
       End
     + IsNull('xRM'+Cast(        Coalesce(aC.ResearchMarketID,a.ResearchMarketID) As Varchar(4)) +' ','')
     + IsNull('xCT'+Cast(Replace(Coalesce(aC.City            ,a.City),' ','0')    As Varchar(30))+' ','')
     + IsNull('xST'+Cast(        Coalesce(aC.State           ,a.State)            As Varchar(4)) +' ','')
     + IsNull('xZP'+Cast(        Coalesce(aC.PostCode             ,A.PostCode, AC.Zip, A.Zip)              As Varchar(5)) +' ','')
     + IsNull('xPI'+Cast(        Coalesce(lo.PropertyID,p.PropertyID)             As Varchar(16))+' ','')
       As Varchar(1024))  
    ,'')
    )
  From (
    Select 
      LocationID
    , AKAExists = 1
    From dbo.Location ls (NoLock)
    Where Exists (
      Select Top 1 1 From AKA Where LocationID = ls.LocationID
    )
    Union All
    Select 
      LocationID
    , AKAExists = 0
    From Location ls (NoLock)
    Where Not Exists (
      Select Top 1 1 From AKA (NoLock) Where LocationID = ls.LocationID
    )
  ) SubLoc
  Inner Join dbo.Location          l  (NoLock)  on l.LocationID = SubLoc.LocationID
  Left  Join dbo.Address           a  (NoLock)  on A.AddressID  = l.AddressID
  Left  Join dbo.Property          p  (NoLock)  on p.PrimaryAddressID = a.AddressID
  Left  Join dbo.LocationOccupancy lo (NoLock)  on lo.TenantLocationID = l.LocationID
                                               And lo.FromDate <= @pToday
                                               And (lo.ToDate Is Null or lo.ToDate >= @pToday)
  Left  Join dbo.Property          pC (NoLock)  on lo.PropertyID = pC.PropertyID
  Left  join dbo.Address           aC (NoLock)  on pC.PrimaryAddressID = ac.AddressID 
  Where l.LocationName > ''
    And (
      l.LocationID = @pLocationID OR 1=@pAll
    )
     
  Group By l.LocationID
 )

GO
/****** Object:  UserDefinedFunction [dbo].[fnListingScrapeBrokerContactFieldsParse]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnListingScrapeBrokerContactFieldsParse]
(@ListingScrapeID int)
RETURNS TABLE
AS
RETURN
(
	WITH CTE
	AS
	(
		SELECT
		  lsc.ListingScrapeID
		, LTRIM(RTRIM(fn.FirstName)) as BrokerContactFirstName
		, LTRIM(RTRIM(fn.LastName)) as BrokerContactLastName
		, LTRIM(RTRIM(lsc.BrokerContactPhone)) as BrokerContactPhone
		, LTRIM(RTRIM(lsc.BrokerContactEmail)) as BrokerContactEmail
		, lsc.BrokerLocationID
		, lsc.PropertyID
		FROM dbo.ListingScrape lsc (NOLOCK)
		CROSS APPLY dbo.fnSplitName(lsc.BrokerContactName) fn 
		WHERE	
			ListingScrapeID=@ListingScrapeID
	)
	SELECT
		  ListingScrapeID
		  --Update the LastName and FirstName fields to take only the characters to the left of any commas because of cases like this : John Adams, SIOR
		, BrokerContactFirstName=
								(CASE WHEN CHARINDEX(',',BrokerContactFirstName)>0 THEN dbo.fnCleanString(LEFT(BrokerContactFirstName,CHARINDEX(',',BrokerContactFirstName)-1))
										ELSE dbo.fnCleanString(BrokerContactFirstName)
								END)
		, BrokerContactLastName=(CASE WHEN CHARINDEX(',',BrokerContactLastName)>0 THEN dbo.fnCleanString(LEFT(BrokerContactLastName,CHARINDEX(',',BrokerContactLastName)-1))
										ELSE dbo.fnCleanString(BrokerContactLastName)
								END)
		, BrokerContactPhone=dbo.fnCleanString(BrokerContactPhone)
		, BrokerContactEmail=NULLIF(BrokerContactEmail,'')
		, BrokerLocationID
		, PropertyID
	FROM CTE
)

GO
/****** Object:  UserDefinedFunction [dbo].[fnMFProperties]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnMFProperties]()
RETURNS TABLE
RETURN
(
	SELECT p.PropertyID
	FROM
		dbo.Property p
	  WHERE 
		p.PropertyTypeID=11
		AND (p.PropertySubTypeID IS NULL OR p.PropertySubTypeID<>62) --Exclude Mobile homes
		AND p.ConstructionStatusID<>2 --Exclude demolished
		AND p.CoStarBldgTypeID=1 --Include Costar Yes only
)

GO
/****** Object:  UserDefinedFunction [dbo].[fnPropertyPInPShapeGet]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnPropertyPInPShapeGet] (@pPropertyID int, @pShapeTypeID int=null)        /* CRM Version  */
RETURNS TABLE
AS
RETURN 
(
	WITH CTE AS
	(
	SELECT p.PropertyID,addr.Latitude, addr.Longitude, LatLongMercatorShape=Projection::Mercator(0).Project(geography::Point(addr.Latitude,addr.Longitude,4326)).MakeValid()
	FROM dbo.Property p (NOLOCK) 
	JOIN dbo.Address addr (NOLOCK) ON p.PrimaryAddressID=addr.AddressID
	WHERE
		addr.Latitude <> 0 and addr.Longitude <> 0
		and addr.Latitude > -90.0 and addr.Latitude < 90.0
		and p.PropertyID=@pPropertyID
	)
	--select * from cte
	SELECT CTE.PropertyID,shp.ShapeID,shp.ShapeTypeID, shpt.ShapeTypeName, shp.EntityID
	FROM dbo.Shape shp with (index (SIndx_Shape_MercatorShapeData_USOnly),nolock) --with this index hint the query performs a lot faster than without it
	JOIN dbo.ShapeType shpt with (nolock) on shp.ShapeTypeID=shpt.ShapeTypeID
	JOIN CTE ON shp.MercatorShapeData.STIntersects(CTE.LatLongMercatorShape)=1
	WHERE shp.ShapeTypeID=ISNULL(@pShapeTypeID,shp.ShapeTypeID)
)

GO
/****** Object:  UserDefinedFunction [dbo].[fnStrToPhoneKeys]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Function [dbo].[fnStrToPhoneKeys] (@inputVal varChar(50)) 
Returns varChar(50)
WITH SCHEMABINDING
as
Begin
	Declare @pos int 				--current Postion of @inputVal
	Declare @char char(1)			--character of current postion
	Declare @phoneKey char(1)		--phone key number of @char
	Declare @outputVal varChar(50)	--complete phone key code
	
	Set @inputVal = ltrim(rtrim(@inputVal))
	Set @outputVal = ''
	Set @pos = 1
	
	While @pos <= len(@inputVal)
	Begin
		--Get the Character for current position
		set @char = lower(subString(@inputVal, @pos, 1))
	
		--If @char Between a and z
		If ascii(@char) Between 97 AND 122
		Begin
			Set @phoneKey = case 
			
				-- @char is a-o
				/*
				since all phone key pads between letters a and o have 3 letters each
				the phoneKey number can be caclulated based on the ascii code of the letter.
				
				((ascii(<Letter between a and o>) - 97) / 3) + 2
				
				ascii code - 97 will convert a to 0, b to 1, c to 2, d to 3 etc...
				(<a> 0, <b> 1 or <c> 2) / 3		= 0			+ 2 = 2		a,b,c are on PhoneKey 2
				(<d> 3, <e> 4 or <f> 5) / 3		= 1			+ 2 = 3		d,e,f are on PhoneKey 3
				(<m> 12, <n> 13 or <o> 14) /3	= 4			+ 2 = 6		m,n,o are on PhoneKey 6
				*/
				when ascii(@char) < 112 then cast(((ascii(@char)-97)/3) + 2 as char(1))
	
				--@char is p-s
				--From keyCode 7 on our cool devide by 3 thing is screwed 
				--because 7 has 4 letters associated with it (PQRS)
				when ascii(@char) < 116 then '7'
	
				--@char is p-s
				when ascii(@char) < 119 then '8'		
	
				-- @char is w-z
				else '9' 
			End
		End

		--current character is a number 0-9
		Else if ascii(@char) Between 48 AND 57
		Begin
			Set @phoneKey = @char
		End

		--current character is not a-z or 0-9
		Else
		Begin
			Set @outputVal = Null
			goto quit
		End


		Set @outputVal = @outputVal + @phoneKey
		Set @pos = @pos + 1
	End
	
	If len(@outputVal) = 0 
		Set @outputVal = Null
	
	quit:
	return @outputVal
End

GO
/****** Object:  UserDefinedFunction [dbo].[ForSalePrimaryBroker]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ForSalePrimaryBroker]
(
	@pForSaleID INT
	,@pLocationID INT
	,@pContactID INT
)
RETURNS TABLE
AS
	RETURN SELECT
		 ForSaleID
		,ContactID
		,LocationID
	FROM
	(
		SELECT
			fsc.ForSaleID
			,fsc.ContactID
			,fsc.LocationID
			,ContactRank = ROW_NUMBER() OVER (PARTITION BY fsc.ForSaleID, fsc.LocationID ORDER BY fsc.SortOrder)
		FROM 
			Enterprise.dbo.ForSaleContact fsc WITH (NOLOCK)
		INNER JOIN 
			Enterprise.dbo.ForSale fs WITH (NOLOCK) 
			ON fs.ForSaleID = fsc.ForSaleID
		WHERE
			fs.ForSaleID = @pForSaleID
			AND 
			fsc.LocationID = @pLocationID
			AND 
			(fsc.ContactID = @pContactID OR @pContactID IS NULL)
			AND 
			fsc.ContactRoleID = 11
	) psb
	WHERE
		psb.ContactRank = 1

GO
/****** Object:  UserDefinedFunction [dbo].[LandForLeasePrimaryBroker]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[LandForLeasePrimaryBroker]
(
	@pLandForLeaseID INT
	,@pLocationID INT
	,@pContactID INT
)
RETURNS TABLE
AS
	RETURN SELECT
		 LandForLeaseID
		,ContactID
		,LocationID
	FROM
	(
		SELECT
			lflc.LandForLeaseID
			,lflc.ContactID
			,lflc.LocationID
			,ContactRank = ROW_NUMBER() OVER (PARTITION BY lflc.LandForLeaseID, lflc.LocationID ORDER BY lflc.SortOrder)
		FROM 
			Enterprise.dbo.LandForLeaseContact lflc WITH (NOLOCK)
		INNER JOIN 
			Enterprise.dbo.LandForLease lfl WITH (NOLOCK) 
			ON lfl.LandForLeaseID = lflc.LandForLeaseID
		WHERE
			lfl.LandForLeaseID = @pLandForLeaseID
			AND 
			lflc.ContactRoleID = 20
			AND 
			lflc.LocationID = @pLocationID
			AND 
			(lflc.ContactID = @pContactID OR @pContactID IS NULL)
	) psb
	WHERE
		psb.ContactRank = 1

GO
/****** Object:  UserDefinedFunction [dbo].[SpaceForLeasePrimaryBroker]    Script Date: 12/18/2017 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SpaceForLeasePrimaryBroker]
(
	@pSpaceForLeaseID INT
	,@pLocationID INT
	,@pContactID INT
)
RETURNS TABLE
AS
	RETURN SELECT
		 SpaceForLeaseID
		,ContactID
		,LocationID
	FROM
	(
		SELECT
			sflc.SpaceForLeaseID
			,sflc.ContactID
			,sflc.LocationID
			,ContactRank = ROW_NUMBER() OVER (PARTITION BY sflc.SpaceForLeaseID, sflc.LocationID ORDER BY sflc.SortOrder)
		FROM 
			Enterprise.dbo.SpaceForLeaseContact sflc WITH (NOLOCK)
		INNER JOIN 
			Enterprise.dbo.SpaceForLease sfl WITH (NOLOCK) 
			ON sfl.SpaceForLeaseID = sflc.SpaceForLeaseID
		WHERE
			sfl.SpaceForLeaseID = @pSpaceForLeaseID
			AND 
			sflc.ContactRoleID = 20
			AND 
			sflc.LocationID = @pLocationID
			AND 
			(sflc.ContactID = @pContactID OR @pContactID IS NULL)
	) psb
	WHERE
		psb.ContactRank = 1

GO
