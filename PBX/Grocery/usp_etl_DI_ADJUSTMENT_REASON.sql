
/****** Object:  Stored Procedure dbo.usp_etl_DI_ADJUSTMENT_REASON    Script Date: 4/30/2002 18:58:57 PM ******/
CREATE        PROCEDURE dbo.usp_etl_DI_ADJUSTMENT_REASON
        @P_JOB_TAB_WK  	int
    
AS


/************************************************************************
      NAME:        usp_etl_DI_ADJUSTMENT_REASON
      AUTHOR:      Yuri Nogin
      DESCRIPT:    Procedure usp_etl_DI_ADJUSTMENT_REASON is responsible for populating data
	           into the DI_ADJUSTMENT_REASON dimension from the sg_fc_gpps as a base table for the reasoncode 
		   and reasondescription columns.
		
      REVISIONS:   April-30, 2002	 - Created
                   

      PARAMETERS:  
	p_job_tab_wk - The unique identifier of the previously established job record
   ************************************************************************/

SET NOCOUNT ON
SET ANSI_NULLS OFF /* Allows NULL to equal NULL in evaluations */
SET CONCAT_NULL_YIELDS_NULL OFF  /*Concatenation of the NK fields may include nulls which should not affect the concatenation*/	

-- common variables
DECLARE @task_wk               int
DECLARE @restart_value         varchar(40)
DECLARE @can_run               char(1)
DECLARE @status_code           char(1)
DECLARE @error_num             int
DECLARE @inserted_count        int
DECLARE @duplicated_count 	   int
DECLARE @updated_count 		   int
DECLARE @failed_count 		   int
DECLARE @latest_wk			   int
DECLARE @general_location	   varchar(50)
DECLARE @user_error_msg		   varchar(1000)
DECLARE @POST_DATE             datetime


-- constants
DECLARE @VERSION              varchar(30)
DECLARE @PROCEDURE_NAME       varchar(50)
DECLARE @COMMIT_INTERVAL      int
DECLARE @FAILURE_FLAG         char(1)
DECLARE @SUCCESS_FLAG         char(1)
DECLARE @ERROR_FLAG	      char(1)
DECLARE @RUN_FLAG	      char(1)
DECLARE @YES_FLAG             char(1)
DECLARE @P_BATCH_ID           int
DECLARE @P_CURRENT_STORE_NK   varchar(6)

DECLARE @REASONS table ([reasoncode] [smallint] NULL,
			[reasondescription] [varchar] (50) NULL
		        )



-- initialize constants
SET @VERSION = 'Version 1.0'
SET @PROCEDURE_NAME = 'usp_etl_DI_ADJUSTMENT_REASON loading data'
SET @COMMIT_INTERVAL = 100  /*interval at which a commit is issued*/
SET @FAILURE_FLAG = 'F'
SET @SUCCESS_FLAG = 'C'
SET @ERROR_FLAG = 'E'
SET @RUN_FLAG = 'R'
SET @YES_FLAG = 'Y'

-- initialize variables
SET @inserted_count = 0
SET @duplicated_count = 0
SET @updated_count = 0
SET @failed_count = 0
SET @status_code = @RUN_FLAG
SET @latest_wk = -999
SET @P_BATCH_ID = 1
SET @POST_DATE = getdate()


BEGIN TRANSACTION tr_start

SELECT @error_num = @@ERROR
/*MUST HAVE*/
/*Initialize the Task Record in TASK TAB*/
IF (@error_num = 0)
  EXEC @error_num = gpps_audit.dbo.usp_init_status
    @P_TASK_NAME = @PROCEDURE_NAME,
    @P_POST_DATE = @POST_DATE,
    @R_TASK_WK = @task_wk OUTPUT,
    @R_RESTART_VALUE = @restart_value OUTPUT,
    @R_CAN_RUN = @can_run OUTPUT,
    @P_JOB_ID = @P_JOB_TAB_WK,
    @P_VERSION = @VERSION,
    @P_THREAD_ID = @P_BATCH_ID	


/*check to make sure we don't have any errors and that 
we are not in a duplicate load (Can_Run = 'Y')*/

IF (@error_num = 0 AND @can_run = @YES_FLAG) -- CAN RUN START
BEGIN
 			
	COMMIT TRANSACTION tr_start
	


	-- get all the reasons	
	Insert INTO @REASONS SELECT DISTINCT [reasoncode], [reasondescription]
	from dbo.SG_FC_GPPS where reasoncode is not null
		
     BEGIN
               BEGIN TRANSACTION tr_ins

                /* Insert new data */
               INSERT INTO DI_ADJUSTMENT_REASON
			(				
			[reason_nk],
			[reason_description]
			)
		SELECT	 
			stg.[reasoncode],
			stg.[reasondescription]
                FROM @REASONS stg
                    WHERE NOT EXISTS (SELECT 1 FROM DI_ADJUSTMENT_REASON di
                                            WHERE di.reason_nk = stg.reasoncode)
                        
                        
        		SELECT @error_num = @error_num  + @@ERROR, @inserted_count = @inserted_count + @@ROWCOUNT
                     		
				IF (@error_num = 0) 
			            BEGIN
			               	COMMIT TRANSACTION tr_ins
				    END	
	
       END --end insert
	/*Switch from RUN_FLAG to SUCCESS_FLAG*/
 	IF (@status_code = @RUN_FLAG and @error_num = 0)
		SET @status_code = @SUCCESS_FLAG
END -- CAN RUN END
	
IF (@error_num <> 0)
BEGIN
	/*if you have an error code then you'll want to rollback the transaction*/	
	if @@trancount > 0 
		BEGIN
			ROLLBACK 
		END
END

	BEGIN TRANSACTION tr_status
	
	IF (@error_num <> 0)
		BEGIN
        
			/*log the error information*/
	  		EXEC gpps_audit.dbo.usp_write_error
	    			@P_TASK_TAB_WK = @task_wk,
	    			@P_ERROR_NUM = @error_num,
	    			@P_GENERAL_LOCATION = @PROCEDURE_NAME,
	    			@P_ERROR_CODE = @FAILURE_FLAG
	    	
	  		SET @status_code = @FAILURE_FLAG
		END

        EXEC gpps_audit.dbo.usp_complete_status 
	    	@P_TASK_TAB_WK = @task_wk,
	    	@P_STATUS_CODE = @status_code,
	    	@P_RECORDS_INSERTED = @inserted_count,
		@P_RECORDS_UPDATED = @updated_count, 
		@P_RECORDS_DUPLICATED = @duplicated_count,
		@P_RECORDS_FAILED = @failed_count, 
	    	@P_ERROR_NUM = @error_num
	COMMIT TRANSACTION tr_status







SELECT @error_num
RETURN @error_num











GO
