USE [RevPro]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetDayFromPeriod]    Script Date: 1/29/2018 3:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetDayFromPeriod](@d varchar(10))  
RETURNS DATE
AS   

BEGIN  
   DECLARE @v VARCHAR(10)
SET @v= CONVERT(DATE, LEFT(@d,4)+'/'+RIGHT(@d,2)+'/'+'01') 
	RETURN @v
END;  


GO
