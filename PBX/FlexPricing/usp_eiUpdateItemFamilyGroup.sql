if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[usp_eiUpdateItemFamilyGroup]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[usp_eiUpdateItemFamilyGroup]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE dbo.usp_eiUpdateItemFamilyGroup

/******************************************************************************
    Created On:    11/15/2000    [dbo]

    Description:
        This procedure updates Item-FamilyGroup relation for the ItemFamilyGroup table

    Input Parameters:
	@iTraceFlag -- whether or not to write to the Application Trace table for auditing/troubleshooting
	@msgtype -- message type ('D', 'A', 'U')
	@Itemcode -- Item code
	@FamilyGroupcode -- FamilyGroup code the Item belongs to
	@effectivedate -- effective date that the Item belongs to the FamilyGroup
	@terminationdate -- termination date that the Item belongs to the FamilyGroup

    Output Parameters:
        None

    Notes: Six digits Itemcode consists of two digits of subdepartmentcode,  
               two digits of FamilyGroup code amd  two digits of Itemcode.

	Modifed:
	11/06/2003	PMAC	Commented out FamilyGroupCode = @FamilyGroupcode in Delete Section and
						added 'and TerminationDate > dbo.ufn_GetStartOfDay(getdate())' to avoid
						extending previous termination dates.
******************************************************************************/

/*******************************************
    Parameters
*******************************************/
          (
	  @iTraceFlag int
	, @msgtype char(1)
	, @Itemcode int
	, @FamilyGroupcode int
	, @effectivedate datetime
	, @terminationdate datetime
           )
AS

SET NOCOUNT ON

/*******************************************
    User Variables
*******************************************/
	    
declare @vchCodeSection char (256) -- used for trace processing
declare @cRows char (10) -- used for trace processing

declare @intError int

declare @TraceSessionName varchar(32)  -- captures session name for logging

/*******************************************
    Transact-SQL
*******************************************/

-- set trace session name to be the current date time
SET @TraceSessionName = rtrim(convert(varchar(32), getdate()))

SET @vchCodeSection = 'Start Procedure: ItemCode=' + cast (@Itemcode as char(10)) + ' ; FamilyGroupCode = ' + cast (@FamilyGroupcode as char(10)) 
if @iTraceFlag = 1 exec usp_peLogTrace @TraceSessionName, 'usp_eiUpdateItemFamilyGroup', @vchCodeSection


If @msgtype = 'D'  -- Message type: Delete -- means terminate Item-FamilyGroup relationship
	begin
	
	-- delete records for this Item-FG taking effect in the future and terminate ones in the past
	SET @vchCodeSection = 'Processing Delete Item-FG relationship:  Deleting/Terminating records'
	if @iTraceFlag = 1 exec usp_peLogTrace @TraceSessionName, 'usp_eiUpdateItemFamilyGroup', @vchCodeSection

	BEGIN TRANSACTION
		Update	ItemFamilyGroup Set
			Status = 'I'
	 	Where 	ItemCode = @Itemcode
		-- 	and FamilyGroupCode = @FamilyGroupcode
			and Effectivedate > dbo.ufn_GetEndOfDay(dateadd(day,-1,getdate()))

		Update	ItemFamilyGroup Set
			TerminationDate = dbo.ufn_GetEndOfDay(dateadd(day,-1,getdate()))
	 	Where 	ItemCode = @Itemcode
		--	and FamilyGroupCode = @FamilyGroupcode
			and Effectivedate <= dbo.ufn_GetEndOfDay(dateadd(day,-1,getdate()))
			and TerminationDate > dbo.ufn_GetStartOfDay(getdate())
	COMMIT TRANSACTION

	IF @@ERROR <> 0 GOTO Error_Handler

	if @iTraceFlag = 1 
	BEGIN
	    SET @vchCodeSection = 'Processed Delete Item-FG relationship:  Deleting/Terminating records'
    	if @iTraceFlag = 1 exec usp_peLogTrace @TraceSessionName, 'usp_eiUpdateItemFamilyGroup', @vchCodeSection
	END

	end

Else			-- Message type: Add/Update -- means Insert/Update Item-FamilyGroup relationship record

	begin

	SET @vchCodeSection = 'Processing Add/Update MessageType:  Add/Update Item-FamilyGroup relationship record'

	if @iTraceFlag = 1 exec usp_peLogTrace @TraceSessionName, 'usp_eiUpdateItemFamilyGroup', @vchCodeSection

	If (select count(*) from ItemFamilyGroup where Itemcode = @Itemcode
		and FamilyGroupCode = @FamilyGroupcode and Effectivedate = dbo.ufn_GetStartOfDay(@effectivedate)
		and Status = 'A') = 0  -- New Item-FamilyGroup-EffDate
	  begin

    if @iTraceFlag = 1 
    BEGIN
		SET @vchCodeSection = 'Processing New Item-FG record: deleting future records, terminating past records, insert new record'	
    	exec usp_peLogTrace @TraceSessionName, 'usp_eiUpdateItemFamilyGroup', @vchCodeSection
    END

    BEGIN TRANSACTION
		UPDATE	ItemFamilyGroup
		SET	Status = 'I'
		WHERE	ItemCode = @Itemcode AND
			EffectiveDate < @terminationdate AND
			TerminationDate > @effectivedate AND
			Status = 'A' AND
			EffectiveDate > @effectivedate

		UPDATE	ItemFamilyGroup
		SET	TerminationDate = dbo.ufn_GetEndOfDay(dateadd(day,-1,@effectivedate))
		WHERE	ItemCode = @Itemcode AND
			EffectiveDate < @terminationdate AND
			TerminationDate > @effectivedate AND
			Status = 'A' AND
			EffectiveDate <= @effectivedate

		-- insert the new Item-FG relationship
		Insert Into ItemFamilyGroup (
			  Itemcode
			, FamilyGroupcode
			, effectivedate
			, terminationdate
	                   )
	    	  Values   (
			  @Itemcode
			, @FamilyGroupcode
			, dbo.ufn_GetStartOfDay(@effectivedate)
			, dbo.ufn_GetEndOfDay(@terminationdate)
                       )

	IF @@ERROR <> 0 GOTO Error_Handler

    COMMIT TRANSACTION

    if @iTraceFlag = 1 
    BEGIN
		SET @vchCodeSection = 'Processed New Item-FG record: deleting future records, terminating past records, insert new record'
    	exec usp_peLogTrace @TraceSessionName, 'usp_eiUpdateItemFamilyGroup', @vchCodeSection
    END

	end

	Else							-- Existing Item
	  begin
    if @iTraceFlag = 1 
    BEGIN
	    SET @vchCodeSection = 'Processing Existing Item-FG record: updating termination date or inactivating record'
    	exec usp_peLogTrace @TraceSessionName, 'usp_eiUpdateItemFamilyGroup', @vchCodeSection
    END
	BEGIN TRANSACTION
		Update	ItemFamilyGroup Set
			Terminationdate = dbo.ufn_GetEndOfDay(@terminationdate)
		Where   Itemcode = @Itemcode
			and FamilyGroupCode = @FamilyGroupcode and Effectivedate = dbo.ufn_GetStartOfDay(@effectivedate)
			and Status = 'A'

		UPDATE	ItemFamilyGroup
		SET	Status = 'I'
		WHERE	ItemCode = @Itemcode AND
			EffectiveDate < @terminationdate AND
			TerminationDate > @effectivedate AND
			Status = 'A' AND
			EffectiveDate > @effectivedate
	  COMMIT TRANSACTION
    if @iTraceFlag = 1 
    BEGIN
	    SET @vchCodeSection = 'Processed Existing Item-FG record: updating termination date or inactivating record'
    	exec usp_peLogTrace @TraceSessionName, 'usp_eiUpdateItemFamilyGroup', @vchCodeSection
    END

	  end

	end

SET @vchCodeSection = 'End Procedure: ItemCode=' + cast (@Itemcode as char(10)) + ' ; FamilyGroupCode = ' + cast (@FamilyGroupcode as char(10)) 
if @iTraceFlag = 1 exec usp_peLogTrace @TraceSessionName, 'usp_eiUpdateItemFamilyGroup', @vchCodeSection

--Resubmit the price detail cache
update pricedetailresults
set    processed='N'
,      DateTimeEntered=getdate()
,      RestartCount = 0
where itemcode = @Itemcode 
and Status='A'
and processed in ('P', 'Y')




RETURN 0

Error_Handler:
	declare @vchEffDate char(10)
	SET @vchEffDate = convert(char(10),@effectivedate,101)
	RAISERROR(50058, 18, 1, 'Flexible Pricing System', 'usp_eiUpdateItemFamilyGroup', @ItemCode, @FamilyGroupCode, @vchEffDate, @vchCodeSection)
	IF @@TRANCOUNT > 0 
		ROLLBACK TRANSACTION

	RETURN 99


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


GRANT  EXECUTE  ON [dbo].[usp_eiUpdateItemFamilyGroup]  TO [FullAccess]
GO

