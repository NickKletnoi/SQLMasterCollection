

DECLARE @first INT=0,@second INT=1,@current INT,@result INT,@size INT=30,@count INT=2
IF @size<2 begin print 'the request is invalid' end
WHILE (@count<@size)
BEGIN
SET @current=@first+@second;
SET @first=@second;
SET @second=@current;
SET @count=@count+1;
PRINT cast(@current as varchar(25)) + '>>> ' +cast(@count as varchar(25)) ; 
END

/*
3>>> 5
5>>> 6
8>>> 7
13>>> 8
21>>> 9
34>>> 10
55>>> 11
89>>> 12
144>>> 13
233>>> 14
377>>> 15
610>>> 16
987>>> 17
1597>>> 18
2584>>> 19
4181>>> 20
6765>>> 21
10946>>> 22
17711>>> 23
28657>>> 24
46368>>> 25
75025>>> 26
121393>>> 27
196418>>> 28
317811>>> 29
514229>>> 30
        

*/

