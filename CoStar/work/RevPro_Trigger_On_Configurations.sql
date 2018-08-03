Create TRIGGER apt.trgr_SSIS_Configurations_in_RevPro_Upd  
ON dbo.SSIS_Configurations 
AFTER UPDATE   
AS   
IF (UPDATE (ConfiguredValue) )  
BEGIN  

UPDATE RC
SET RC.ConfiguredValue=SC.ConfiguredValue
FROM dbo.SSIS_Configurations SC JOIN RevPro..SSIS_Configurations RC ON SC.ConfigurationFilter=RC.ConfigurationFilter
END;  
GO  