WITH CTEDupRecords
AS
(
bcp CoStar.cube.D_Market out C:\Temp\Market.txt -c -T