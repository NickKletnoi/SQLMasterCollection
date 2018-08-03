USE [msdb]
GO

/****** Object:  Job [ERAE_NEW_ETL]    Script Date: 06/03/2011 13:42:47 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 06/03/2011 13:42:47 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'ERAE_NEW_ETL', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'GAF.COM\svc_biadmin', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load Product Dimension]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Product Dimension', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEMDProduct" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\FNPROD\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeASPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load Sales Territory Dimension]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Sales Territory Dimension', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEMDSalesTerritory" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\FNPROD\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeASPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDSalesTerritory-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load Customer Dimension]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Customer Dimension', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEMDCustomer" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\FNPROD\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeASPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDCustomer-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load Selling Company Dimension]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Selling Company Dimension', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEMDSellingCompany" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\FNPROD\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeASPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDSellingCompany-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load Distribution Location Dimension]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Distribution Location Dimension', 
		@step_id=5, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEMDDistributionLocation" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\FNPROD\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeASPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDDistributionLocation-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load Manufacturing Location Dimension]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Manufacturing Location Dimension', 
		@step_id=6, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEMDManufacturingLocation" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\FNPROD\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeASPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDManufacturingLocation-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load User Dimension]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load User Dimension', 
		@step_id=7, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEMDUser" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\LOCAL\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeASPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDUser-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load Backlog Fact]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Backlog Fact', 
		@step_id=8, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEFDBacklog" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\FNPROD\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeASPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEFDBacklog-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load Sales Plan Fact]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Sales Plan Fact', 
		@step_id=9, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEFDSalesPlan" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\PROD\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeASPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEFDSalesPlan-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load Security Fact]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Security Fact', 
		@step_id=10, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEFDSecurity" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\LOCAL\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeSQLPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEFDSecurity-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load SecurityCustomer Fact]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load SecurityCustomer Fact', 
		@step_id=11, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEFDSecurityCustomer" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\LOCAL\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeASPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEFDSecurity-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Load Sales Fact]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Load Sales Fact', 
		@step_id=12, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEFDSales" /SERVER WAYNERAEISPRD1 /CONFIGFILE "C:\Configs\FNPROD\Config.dtsConfig" /CONNECTION CubeTarget;"\"Data Source=WayneRaeASPRD1;Initial Catalog=ERAEBI;Provider=MSOLAP.4;Integrated Security=SSPI;Impersonation Level=Impersonate;\"" /CONNECTION DataSource;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEMDProduct-{91C92BF2-A75E-4FA7-9A60-EE89F96AB8AD}DataSource;\"" /CONNECTION DataTarget;"\"Data Source=WayneRaeSQLPROD;Initial Catalog=ERAEDWPROD;Provider=SQLNCLI10.1;Integrated Security=SSPI;Application Name=SSIS-ERAEFDSales-{FDDC58E8-D630-45E6-9AE2-C78DE01185CB}DataTarget;\"" /CHECKPOINTING OFF /LOGGER "{440945A4-2A22-4F19-B577-EAF5FDDC5F7A}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Process IntelliGAF]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Process IntelliGAF', 
		@step_id=13, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAECUBEInteliGAF" /SERVER WAYNERAEISPRD1 /CHECKPOINTING OFF /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Process SALES]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Process SALES', 
		@step_id=14, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAECUBESALES" /SERVER WAYNERAEISPRD1 /CHECKPOINTING OFF /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Backup ERAEBI]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Backup ERAEBI', 
		@step_id=15, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=4, 
		@on_fail_step_id=16, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAECUBEBackup" /SERVER WAYNERAEISPRD1 /CHECKPOINTING OFF /LOGGER "{0A039101-ACC1-4E06-943F-279948323883}";"ErrorLog.xml" /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [QA and Email]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'QA and Email', 
		@step_id=16, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/DTS "\MSDB\ERAE_NEW_ETL\ERAEQA" /SERVER WAYNERAEISPRD1 /CHECKPOINTING OFF /LOGGER "{94150B25-6AEB-4C0D-996D-D37D1C4FDEDA}";DataSource /REPORTING E', 
		@database_name=N'master', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Daily TM Email]    Script Date: 06/03/2011 13:42:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Daily TM Email', 
		@step_id=17, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\DailyTmEmail\DailyTMemail.exe', 
		@flags=32
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20110228, 
		@active_end_date=99991231, 
		@active_start_time=44500, 
		@active_end_time=235959, 
		@schedule_uid=N'7b74f1b0-dd99-4565-beb2-5cffc1df0ad5'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO

