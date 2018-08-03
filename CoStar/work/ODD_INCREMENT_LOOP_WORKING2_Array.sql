 ------------------------------------
 select * from dbo.LoopCntTest
 --------------------------------
  
DECLARE @b INT=1,@e INT=25,@c INT=25,@p INT

WHILE (@b <= @e)
BEGIN
PRINT 'from :'+ cast(@p as char(5)) + ' to: ' + cast(@b as char(5)) 
SET @b = @b + @c
SET @p = @b - @c
IF @b = @e BREAK;
END
GO
 
------------------------------

DECLARE @b INT=1,@e INT=30,@c INT=5,@p INT,@d INT
WHILE (@b<=@e)
BEGIN
PRINT cast(@p as varchar(25)) + ' ' + cast(@d as varchar(25))
SET @b=@b+@c SET @d=@b-1 SET @p=@b-@c IF  @b=@e BREAK;
END

/*
1	5         
6	10        
11	15        
16	20        
21	25        

*/
 
