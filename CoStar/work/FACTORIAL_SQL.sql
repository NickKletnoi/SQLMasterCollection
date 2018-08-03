
------------------------------factorial ----
DECLARE @f INT=1,@n INT=5
--------------------------
WHILE(@n > 0)
BEGIN
SET @f = @f * @n
SET @n = @n - 1
END
-------------------------
SELECT @f

