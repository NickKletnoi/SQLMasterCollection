DECLARE @e TABLE (i INT)
DECLARE @i INT
INSERT INTO @e SELECT UserID i FROM dbo.Users WHERE IsActive = 1  -- your query to select a load list;
WHILE EXISTS (SELECT 1 FROM @e)
BEGIN 
	SELECT TOP 1 @i = i FROM @e

    					 EXEC dbo.DoSomething @i -- your code to do something for a particular i goes here

       DELETE FROM @e where i = @i
END
