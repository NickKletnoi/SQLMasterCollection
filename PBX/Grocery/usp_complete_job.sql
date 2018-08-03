CREATE  PROCEDURE dbo.usp_complete_job 
	(	@P_JOB_TAB_WK		int ,
		@P_STATUS_CODE        	char(1) = 'C',
                @P_STATUS_TEXT        	varchar(4000) = '',
		@P_ERROR_CODE		int = 50104	/*Process Completed*/

                ) AS

   /* ***********************************************************************
      NAME:        usp_complete_job
      AUTHOR:      Encore Development
      DESCRIPT:    Function usp_complete_job marks a job record as completed.  
		   Optional parms allow for the update of the task record before the 
		   setting of the end time.  In order to enable the optional parms, one of the following must be 
		   set to something other than the default:
			@P_STATUS_TEXT     
			@P_ERROR_CODE	
		
      REVISIONS:  05.05.2000 - Created
		  06.27.2000 - Modified - Trey Johnson - Changed @P_STATUS_CODE to @JobStatusCode in final Update of JOB_TAB
		  08.04.2000 - Modified - Trey Johnson - Modified StatusText creation logic
      PARAMETERS:  
	p_job_tab_wk - The unique identifier of the previously established job record
	p_status_code - The completion status of the job 
			(E[rror], F[atal Error], C[ompleted]) [Defaults to 'C'] 
			NOTE: Status Code Will be Overwritten by the Most-Severe Status of any of it's tasks
        p_status_text - The current status message associated with the status code [Defaults to '']
			NOTE: Statuses From the Error and Fatal Error Tasks will be appendeed to the status message
        p_error_code - If the status is related to an error then the code is reported here [Defaults to 0]
   ************************************************************************/

DECLARE @Current_Key integer
DECLARE @ErrorNum integer
DECLARE @JobStatusCode char(1)
DECLARE @JobStatusText varchar(4000)
DECLARE @TaskStatusMessage varchar(4000)


SELECT @ErrorNum = 0

SELECT @Current_Key = @P_JOB_TAB_WK	

/*Check the Status Code*/
exec @ErrorNum = usp_check_status_code @P_STATUS_CODE

IF @ErrorNum <> 0 
	RETURN @ErrorNum

/*Create a temporary table for assigning priority to statuses*/

CREATE TABLE #tmpStatus (	status_code char(1),
			  	status_rank int NOT NULL)

INSERT INTO #tmpStatus 
VALUES ('R', 99)

INSERT INTO #tmpStatus 
VALUES ('F', 50)

INSERT INTO #tmpStatus 
VALUES ('E', 20)

INSERT INTO #tmpStatus 
VALUES ('A', 10)

INSERT INTO #tmpStatus 
VALUES ('C', 1)




/*Determine the JOB's Status from the Tasks*/
SELECT @JobStatusCode = ISNULL(	( SELECT
					MAX(TT.status_code)
				  FROM
					TASK_TAB TT, #tmpStatus TMP
				  WHERE
					TT.job_tab_wk = @P_JOB_TAB_WK AND
					TT.status_code = TMP.status_code AND 
					TMP.status_rank = (	SELECT MAX(status_rank) 
								FROM #tmpStatus
							  )
				), @P_STATUS_CODE )



SELECT @JobStatusText =  CASE 	WHEN @P_STATUS_TEXT <> '' AND @JobStatusCode = @P_STATUS_CODE
				THEN @P_STATUS_TEXT
				WHEN @JobStatusCode = 'R'
				THEN 'Running'
				WHEN @JobStatusCode = 'F'
				THEN 'Failed'
				WHEN @JobStatusCode = 'E'
				THEN 'Exception Ocurred'
				WHEN @JobStatusCode = 'A'
				THEN 'Aborted'
				WHEN @JobStatusCode = 'C'
				THEN 'Completed'
				ELSE
					@P_STATUS_TEXT
			END

IF @JobStatusCode <> 'C'
BEGIN

/*Cursor for Getting E[rror] and F[atal Error] Statuses*/
DECLARE task_status CURSOR 
      FAST_FORWARD FOR
      SELECT
                 RTRIM(LTRIM(task_name + '-' +  status_code + '-' + status_text))
      FROM TASK_TAB  
      WHERE 
		job_tab_wk = @P_JOB_TAB_WK AND
		status_code = @JobStatusCode
      ORDER BY status_code DESC	/*Make Fatal Errors Take Precedence*/
	FOR READ ONLY


/*Loop through the Cursor Building the Status Message*/
 OPEN task_status
 FETCH NEXT FROM task_status INTO 
                 @TaskStatusMessage

         /* Loop through cursor until last row */
         WHILE (@@fetch_status = 0) and (LEN(RTRIM(LTRIM(@JobStatusText))) + LEN(RTRIM(LTRIM(@TaskStatusMessage)))<4000)
            BEGIN
		SELECT @JobStatusText = RTRIM(LTRIM(@JobStatusText)) + RTRIM(LTRIM(@TaskStatusMessage))

		FETCH NEXT FROM task_status INTO 
                 @TaskStatusMessage
	    END			

CLOSE task_status
DEALLOCATE task_status
END
	
/*Update the JOB Record -- Set the End Time, the Status Code and the Elapsed Time*/
	 UPDATE JOB_TAB
	 SET 	job_status_code = 		@JobStatusCode,
		job_status_text = 		ISNULL(job_status_text,'') + ' ' +  @JobStatusText,
		job_end_time = 	GETDATE(),
		job_last_time =	GETDATE(),							/*Set the Last Updated Time to the System Time*/
		job_elapsed_seconds = 	ISNULL(job_elapsed_seconds,0) + DATEDIFF(s, job_last_time, GETDATE()) 	/*Calculate the Elapsed Time in Seconds*/	
         WHERE 
		job_tab_wk = @P_JOB_TAB_WK 

	/*Get the Error Number */
	SELECT @ErrorNum = (CASE WHEN @@ERROR <> 0 THEN @@ERROR ELSE @ErrorNum END)
	
	/*Returns 0 (no error if successful) otherwise returns the error*/
	RETURN @ErrorNum

/*End of usp_complete_job*/








GO
