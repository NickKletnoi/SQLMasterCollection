
/****** Object:  Stored Procedure dbo.usp_etl_FC_GPPS    Script Date: 9/10/2001 18:58:57 PM ******/

Alter                       PROCEDURE dbo.usp_etl_FC_GPPS
        @P_JOB_TAB_WK  	int,
	@P_POST_DATE	datetime,
	@P_STORE_NK     varchar(6) = 'ALL'
    
AS


/************************************************************************
      NAME:        usp_etl_FC_GPPS
      AUTHOR:      Yuri Nogin
      DESCRIPT:    Procedure usp_etl_FC_GPPS is responsible for populating data
	           into the FC_GPPS table from the sg_fc_gpps as a base table and
		   performing all appropriate key lookups.
		
      REVISIONS:   March-21, 2002	 - Created
                   April-30, 2002        - Modified
                   September 18, 2003    - Modified 
	           

      PARAMETERS:  
	p_job_tab_wk - The unique identifier of the previously established job record
        p_post_date - The As Of date for the dimension production load
        p_store_nk - The store number
	
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

DECLARE @STORES table (store_nk varchar(6))

DECLARE @FC_GPPS table (
	[store_wk] [smallint] NOT NULL ,
	[product_wk] [int] NOT NULL ,
	[calendar_wk] [int] NOT NULL ,
	[reason_wk] [smallint] NOT NULL,
        [sales_qty] [int] NULL ,
	[sales_amount] [money] NULL,
	[stales_qty] [int] NULL ,
	[forecastsales_qty] [int] NULL ,
        [originalforecastsales_qty] [int] NULL,
	[forecastorder_qty] [int] NULL ,
	[order_qty] [int] NULL ,
	[adjustedorder_qty] [int]  NULL ,
	[received_qty] [int]  NULL,
	[inventory_qty] [int] NULL ,
	[inventoryadjustment_qty] [int] NULL ,
	[inventoryadjustmentcount_qty] [int] NULL,
	[recommendedorder_qty] [int] NULL,
	[retail] [money] NULL,
	[exclude_date_flg] char(1) NULL 
	
) 


-- initialize constants
SET @VERSION = 'Version 1.1'
SET @PROCEDURE_NAME = 'usp_etl_FC_GPPS loading store No - ' +  @P_STORE_NK
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

BEGIN TRANSACTION tr_start

SELECT @error_num = @@ERROR
/*MUST HAVE*/
/*Initialize the Task Record in TASK TAB*/
IF (@error_num = 0)
  EXEC @error_num = gpps_audit.dbo.usp_init_status
    @P_TASK_NAME = @PROCEDURE_NAME,
    @P_POST_DATE = @P_POST_DATE,
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
	
	
	-- get all the stores	
	IF UPPER(@P_STORE_NK) = 'ALL'
		
		Insert INTO @STORES SELECT DISTINCT cast(store_nk as int) from dbo.SG_FC_GPPS
		
	ELSE
		Insert INTO @STORES SELECT cast(store_nk as int) from dbo.SG_FC_GPPS	WHERE store_nk = @P_STORE_NK

	SET @P_CURRENT_STORE_NK = NULL
	SELECT TOP 1 @P_CURRENT_STORE_NK = store_nk  FROM @STORES

WHILE (@P_CURRENT_STORE_NK IS NOT NULL)
	BEGIN
		BEGIN TRANSACTION tr_temp
		Insert INTO @FC_GPPS 
			(
				[store_wk], 
				[product_wk], 
				[calendar_wk], 
				[reason_wk],
		       		[sales_qty],
				[sales_amount],
				[stales_qty],
				[forecastsales_qty],
				[originalforecastsales_qty],
				[forecastorder_qty],
				[order_qty],
				[adjustedorder_qty],
				[received_qty],
				[inventory_qty],
				[inventoryadjustment_qty],
				[inventoryadjustmentcount_qty],
				[recommendedorder_qty],
				[retail],
				[exclude_date_flg] 
			)
		SELECT 		ds.store_wk, 
				dp.product_wk as product_wk, 
				dc1.calendar_wk, 
				isnull(dr.[reason_wk],0),
		       		st.[sales_qty],
				st.[sales_amount],
				st.[stales_qty],
				st.[forecastsales_qty],
				st.[[originalforecastsales_qty],
				st.[forecastorder_qty],
				st.[order_qty],
				st.[adjustedorder_qty],
				st.[received_qty],
				st.[inventory_qty],
				st.[inventoryadjustment_qty],
				st.[inventoryadjustmentcount_qty],
				st.[recommendedorder_qty],
				st.[retail],
				st.[exclude_date_flg] 
	        FROM          dbo.SG_FC_GPPS st INNER JOIN
	                      DI_CALENDAR dc1 ON st.calendar_nk = dc1.calendar_nk LEFT OUTER JOIN
			      DI_ADJUSTMENT_REASON dr ON st.reasoncode = dr.reason_nk INNER JOIN
	                      DI_PRODUCT_V dp ON st.item_nk = dp.item_nk AND dp.current_record_flg = 'Y'  INNER JOIN 	
			      DI_STORE_V ds ON ds.store_nk = st.store_nk AND ds.current_record_flg = 'Y' AND ds.Store_nk = @P_CURRENT_STORE_NK
		
		IF (@error_num = 0) /* Insert and Update the FC_GPPS*/
		     BEGIN
			       COMMIT TRANSACTION tr_temp	
		               BEGIN TRANSACTION tr_ins
		
		                /* Insert new data */
		               INSERT INTO FC_GPPS
					(store_wk, 
					 product_wk, 
					 calendar_wk, 
					 reason_wk, 
					 sales_qty, 
					 sales_amount, 
					 stales_qty, 
					 forecastsales_qty,
					 originalforecastsales_qty,
					 forecastorder_qty, 
					 order_qty, 
					 adjustedorder_qty, 
					 received_qty, 
					 inventory_qty, 
					 inventoryadjustment_qty, 
					 inventoryadjustmentcount_qty, 
					 recommendedorder_qty, 
					 retail, 
					 exclude_date_flg
					 )
				SELECT	 
					 stg.store_wk, 
					 stg.product_wk, 
					 stg.calendar_wk, 
					 stg.reason_wk, 
					 stg.sales_qty, 
					 stg.sales_amount, 
					 stg.stales_qty, 
					 stg.forecastsales_qty,
					 stg.originalforecastsales_qty
					 stg.forecastorder_qty, 
					 stg.order_qty, 
					 stg.adjustedorder_qty, 
					 stg.received_qty, 
					 stg.inventory_qty, 
					 stg.inventoryadjustment_qty, 
					 stg.inventoryadjustmentcount_qty, 
					 stg.recommendedorder_qty, 
					 stg.retail, 
					 stg.exclude_date_flg
				FROM @FC_GPPS stg
		                WHERE NOT EXISTS (SELECT 1 FROM FC_GPPS fc
		                                            WHERE fc.store_wk = stg.store_wk
		                                                AND fc.product_wk = stg.product_wk
		                                                AND fc.calendar_wk = stg.calendar_wk
								AND fc.reason_wk = stg.reason_wk)
		                        
		                        
	        		SELECT @error_num = @error_num  + @@ERROR, @inserted_count = @inserted_count + @@ROWCOUNT
                     		
				IF (@error_num = 0) 
			            BEGIN
			               	COMMIT TRANSACTION tr_ins
				    END	
	
		            END --end insert
		
			IF (@can_run = @YES_FLAG and @error_num = 0)
			BEGIN
			   BEGIN TRANSACTION tr_status		
			  	
			
				  EXEC gpps_audit.dbo.usp_complete_status 
				    	@P_TASK_TAB_WK = @task_wk,
				    	@P_STATUS_CODE = @status_code,
				    	@P_RECORDS_INSERTED = @inserted_count,
					@P_RECORDS_UPDATED = @updated_count, 
					@P_RECORDS_DUPLICATED = @duplicated_count,
					@P_RECORDS_FAILED = @failed_count, 
				    	@P_ERROR_NUM = @error_num
				
				
				COMMIT TRANSACTION tr_status
			END
		
		DELETE FROM @STORES WHERE store_nk = @P_CURRENT_STORE_NK
		SET @P_CURRENT_STORE_NK = NULL
		SELECT TOP 1 @P_CURRENT_STORE_NK = store_nk  FROM @STORES
		if @@rowcount = 0 
			SET @P_CURRENT_STORE_NK = NULL
	END -- WHILE LOOP END

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
