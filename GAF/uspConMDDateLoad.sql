USE [ERAEDWPROD]
GO

/****** Object:  StoredProcedure [dbo].[uspConMDDateLoad]    Script Date: 07/19/2011 14:30:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[uspConMDDateLoad]
	@Year Char(4)
AS
	DECLARE @StartDate Date, @EndDate Date
	SET @StartDate = @Year + '-01-01'
	SET @EndDate = @Year + '-12-31'
	
	-- Delete existing date range first to be able to insert the same date range
	DELETE FROM [dbo].[ConDate] WHERE DateSK >= @StartDate AND DateSK <= @EndDate
	
	DECLARE @MyDate Date, @HalfYear Date, @HalfYearCount Char(1), @Qtr Date, @Month Date, @Week Date
	DECLARE @DayOfHalfYear Int, @DayOfQtr TinyInt, @DayOfMonth TinyInt
	
	DECLARE @FiscalYear Date, @FiscalHalfYear Date, @FiscalHalfYearCount Char(1), @FiscalQtr Date, @FiscalMonth Date, @FiscalMonthPrev Date, @FiscalWeek Date
	DECLARE @FiscalQtrCount TinyInt, @FiscalMonthCount TinyInt, @FiscalWeekCount TinyInt, @WeeksInFirstFiscalMonth TinyInt
	DECLARE @FiscalDayOfHalfYear Int, @FiscalDayOfQtr TinyInt, @FiscalDayOfMonth TinyInt
	DECLARE @FiscalHalfYearName VarChar(14)
	 
	SET @MyDate = @StartDate
	SET @DayOfHalfYear = 0	
	SET @DayOfQtr = 0
	SET @DayOfMonth = 0
	
	SET @FiscalMonth = @StartDate
	SET @FiscalMonthPrev = '1900-01-01'
	SET @FiscalQtrCount = 0
	SET @FiscalMonthCount = 0
	SET @FiscalWeekCount = 0
	SET @WeeksInFirstFiscalMonth = 0
	
	-- START LOOPING THROUGH THE DAYS OF THE DATE RANGE ONE DAY AT A TIME
	WHILE @MyDate <= @EndDate
	BEGIN
		
		SET @HalfYear = 
		CASE
			WHEN @MyDate <= CONVERT(DATE, DATENAME(YEAR, @MyDate) + '0630', 112) THEN CONVERT(DATE, DATENAME(YEAR, @MyDate) + '0101', 112)
			WHEN @MyDate <= CONVERT(DATE, DATENAME(YEAR, @MyDate) + '1231', 112) THEN CONVERT(DATE, DATENAME(YEAR, @MyDate) + '0701', 112)
			ELSE CONVERT(DATE, '19000101', 112)
		END
		
		SET @HalfYearCount = 
		CASE
			WHEN @MyDate <= CONVERT(DATE, DATENAME(YEAR, @MyDate) + '0630', 112) THEN '1'
			WHEN @MyDate <= CONVERT(DATE, DATENAME(YEAR, @MyDate) + '1231', 112) THEN '2'
			ELSE '0'
		END

		SET @Qtr = CONVERT(DATE, DATEADD(QUARTER, DATEDIFF(QUARTER, 0, @MyDate), 0), 112)
		
		SET @Month = CONVERT(DATE, DATEADD(DAY, -(DAY(@MyDate)-1), @MyDate), 112)
		
		SET @Week = DATEADD(Day, 1 - DATEPART(Weekday, @MyDate), @MyDate)--CONVERT(DATE, DATEADD(WEEK, DATEDIFF(WEEK, 0, @MyDate), 0), 112)
		
		IF @MyDate = @HalfYear
			SET @DayOfHalfYear = 1
		ELSE
			SET @DayOfHalfYear = @DayOfHalfYear + 1
		
		IF @MyDate = @Qtr
			SET @DayOfQtr = 1
		ELSE
			SET @DayOfQtr = @DayOfQtr + 1
		
		IF @MyDate = @Month
			SET @DayOfMonth = 1
		ELSE
			SET @DayOfMonth = @DayOfMonth + 1
		
		-- Fiscal Year
		SET @FiscalYear = @StartDate
		
		-- Fiscal Week
		IF DATENAME(WEEKDAY, @MyDate) = 'Monday' 
			BEGIN
				SET @FiscalWeek = @MyDate
				SET @FiscalWeekCount = @FiscalWeekCount + 1
			END
		ELSE
			IF @FiscalWeek IS NULL
				BEGIN
					SET @FiscalWeek = @FiscalYear
					SET @FiscalWeekCount = @FiscalWeekCount + 1
				END
		
		-- Fiscal Month Begin
		IF DATEPART(WEEKDAY, @StartDate) >= 5 OR DATEPART(WEEKDAY, @StartDate) = 1
			BEGIN
				SET @WeeksInFirstFiscalMonth = 5
				SET @FiscalMonth = 
					CASE
						WHEN @FiscalWeekCount < 6 THEN @StartDate	
						WHEN @FiscalWeekCount = 6 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 10 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 15 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 19 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 23 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 28 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 32 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 36 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 41 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 45 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 49 THEN @FiscalWeek	
						ELSE @FiscalMonth
					END
			END
		ELSE
			BEGIN
				SET @WeeksInFirstFiscalMonth = 4
				SET @FiscalMonth = 
					CASE
						WHEN @FiscalWeekCount < 5 THEN @StartDate	
						WHEN @FiscalWeekCount = 5 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 9 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 14 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 18 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 22 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 27 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 31 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 35 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 40 THEN @FiscalWeek	
						WHEN @FiscalWeekCount = 44 THEN @FiscalWeek
						WHEN @FiscalWeekCount = 48 THEN @FiscalWeek	
						ELSE @FiscalMonth
					END
			END
		
		IF @FiscalMonthPrev <> @FiscalMonth SET @FiscalMonthCount = @FiscalMonthCount + 1
		
		SET @FiscalMonthPrev = @FiscalMonth
		-- Fiscal Month End
		
		-- Fiscal Quarter Begin
		SET @FiscalQtr = 
		CASE
			WHEN @FiscalMonthCount = 1 THEN @FiscalMonth
			WHEN @FiscalMonthCount = 4 THEN @FiscalMonth
			WHEN @FiscalMonthCount = 7 THEN @FiscalMonth
			WHEN @FiscalMonthCount = 10 THEN @FiscalMonth
			ELSE @FiscalQtr
		END
		
		SET @FiscalQtrCount = 
		CASE
			WHEN @FiscalMonthCount = 1 THEN 1
			WHEN @FiscalMonthCount = 4 THEN 2
			WHEN @FiscalMonthCount = 7 THEN 3
			WHEN @FiscalMonthCount = 10 THEN 4
			ELSE @FiscalQtrCount
		END
		-- Fiscal Quarter End

		-- Fiscal Half Year Begin
		SET @FiscalHalfYear = 
		CASE
			WHEN @FiscalQtrCount = 1 THEN @FiscalQtr
			WHEN @FiscalQtrCount = 3 THEN @FiscalQtr
			ELSE @FiscalHalfYear
		END
		
		SET @FiscalHalfYearCount = 
		CASE
			WHEN @FiscalQtrCount = 1 THEN 1
			WHEN @FiscalQtrCount = 3 THEN 2
			ELSE @FiscalHalfYearCount
		END
		
		SET @FiscalHalfYearName = 
		CASE
			WHEN @FiscalQtrCount = 1 THEN '1st Half, ' + @Year
			WHEN @FiscalQtrCount = 3 THEN '2nd Half, ' + @Year
			ELSE @FiscalHalfYearName
		END
		
		-- Fiscal Half Year End
		
		INSERT INTO ConDate (
				[DateSK], [DateName], [DateNameAbbr]
				,[Year], [YearName]
				,[HalfYear], [HalfYearName]
				,[Quarter], [QuarterName], [QuarterNameAbbr]
				,[Month], [MonthName], [MonthNameAbbr]
				,[Week], [WeekName], [WeekNameAbbr]
				,[DayOfYear], [DayOfYearName]
				,[DayOfHalfYear], [DayOfHalfYearName]
				,[DayOfQuarter], [DayOfQuarterName]
				,[DayOfMonth], [DayOfMonthName]
				,[DayOfWeek], [DayOfWeekName]
				,[WeekOfYear], [WeekOfYearName]
				,[MonthOfYear], [MonthOfYearName]
				,[MonthOfHalfYear], [MonthOfHalfYearName]
				,[MonthOfQuarter], [MonthOfQuarterName]
				,[QuarterOfYear], [QuarterOfYearName]
				,[QuarterOfHalfYear], [QuarterOfHalfYearName]
				,[HalfYearOfYear], [HalfYearOfYearName]
				,[FiscalYear], [FiscalYearName], [FiscalYearNameAbbr]
				,[FiscalHalfYear], [FiscalHalfYearName]
				,[FiscalQuarter], [FiscalQuarterName], [FiscalQuarterNameAbbr]
				,[FiscalMonth], [FiscalMonthName], [FiscalMonthNameAbbr]
				,[FiscalWeek], [FiscalWeekName], [FiscalWeekNameAbbr]
				,[FiscalDay], [FiscalDayName], [FiscalDayNameAbbr]
				,[FiscalDayOfYear], [FiscalDayOfYearName]
				,[FiscalDayOfHalfYear], [FiscalDayOfHalfYearName]
				,[FiscalDayOfQuarter], [FiscalDayOfQuarterName]
				,[FiscalDayOfMonth], [FiscalDayOfMonthName]
				,[FiscalDayOfWeek], [FiscalDayOfWeekName]
				,[FiscalWeekOfYear], [FiscalWeekOfYearName]
				,[FiscalMonthOfYear], [FiscalMonthOfYearName]
				,[FiscalMonthOfHalfYear], [FiscalMonthOfHalfYearName]
				,[FiscalMonthOfQuarter], [FiscalMonthOfQuarterName]
				,[FiscalQuarterOfYear], [FiscalQuarterOfYearName]
				,[FiscalQuarterOfHalfYear], [FiscalQuarterOfHalfYearName]
				,[FiscalHalfYearOfYear], [FiscalHalfYearOfYearName]
				,[USHolidays], [USHolidayName], [BusinessHoliday]				)
		VALUES (@MyDate  -- DateSK
				, DATENAME(WEEKDAY, @MyDate) + ', ' + DATENAME(MONTH, @MyDate) + ' ' + DATENAME(DAY, @MyDate) + ' ' + DATENAME(YEAR, @MyDate)		--DateName
				, SUBSTRING(DATENAME(WEEKDAY, @MyDate), 1, 3) + ', ' + SUBSTRING(DATENAME(MONTH, @MyDate), 1, 3) + ' ' + DATENAME(DAY, @MyDate) + ' ' + DATENAME(YEAR, @MyDate)	--DateNameAbbr
				, DATENAME(YEAR, @MyDate)													--Year
				, 'Calendar ' + DATENAME(YEAR, @MyDate)										--YearName
				, @HalfYear																	--HalfYear
				, 'Semester ' + @HalfYearCount + ', ' + DATENAME(YEAR, @HalfYear)			--HalfYearName
				, @Qtr																		--Quarter
				, 'Quarter ' + DATENAME(QUARTER, @Qtr) + ', ' + DATENAME(YEAR, @Qtr)		--QuarterName
				, 'Qtr ' + DATENAME(QUARTER, @Qtr) + ', ' + DATENAME(YEAR, @Qtr)			--QuarterNameAbbr
				, @Month																	--Month
				, DATENAME(MONTH, @Month) + ' ' + DATENAME(YEAR, @Month)					--MonthName
				, SUBSTRING(DATENAME(MONTH, @Month), 1, 3) + ' ' + DATENAME(YEAR, @Month)	--MonthNameAbbr
				, @Week																		--Week
				, 'Week ' + DATENAME(WEEK, @Week) + ', ' + DATENAME(YEAR, @Week)			--WeekName
				, 'Wk ' + DATENAME(WEEK, @Week) + ', ' + DATENAME(YEAR, @Week)				--WeekNameAbbr
				, DATENAME(DAYOFYEAR, @MyDate)												--DayOfYear
				, 'Day ' + DATENAME(DAYOFYEAR, @MyDate)										--DayOfYearName
				, @DayOfHalfYear															--DayOfHalfYear
				, 'Day ' + CAST(@DayOfHalfYear AS VarChar(3))								--DayOfHalfYearName
				, @DayOfQtr																	--DayOfQuarter
				, 'Day ' + CAST(@DayOfQtr AS VarChar(2))									--DayOfQuarterName
				, @DayOfMonth																--DayOfMonth
				, 'Day ' + CAST(@DayOfMonth AS VarChar(2))									--DayOfMonthName
				, DATEPART(WEEKDAY, @MyDate)												--DayOfWeek
				, 'Day ' + CAST(DATEPART(WEEKDAY, @MyDate) AS Char(1))						--DayOfWeekName
				, DATEPART(WEEK, @Week)														--WeekOfYear
				, 'Week ' + DATENAME(WEEK, @MyDate)											--WeekOfYearName
				, DATEPART(MONTH, @MyDate)													--MonthOfYear
				, 'Month ' + CAST(DATEPART(MONTH, @MyDate) AS VarChar(2))					--MonthOfYearName
				, 0																			--MonthOfHalfYear
				, 'Month ' + '0'															--MonthOfHalfYearName
				, 0																			--MonthOfQuarter
				, 'Month ' + '0'															--MonthOfQuarterName
				, DATEPART(QUARTER, @MyDate)												--QuarterOfYear
				, 'Quarter ' + DATENAME(QUARTER, @MyDate)									--QuarterOfYearName
				, 0																			--QuarterOfHalfYear
				, 'Quarter ' + '0'															--QuarterOfHalfYearName
				, @HalfYearCount															--HalfYearOfYear
				, 'Semester ' + @HalfYearCount												--HalfYearOfYearName
				, @FiscalYear																--FiscalYear
				, DATENAME(YEAR, @FiscalYear)												--FiscalYearName
				, 'Fis Cal ' + DATENAME(YEAR, @FiscalYear)									--FiscalYearNameAbbr
				, @FiscalHalfYear															--[FiscalHalfYear]
				, @FiscalHalfYearName														--[FiscalHalfYearName]
				, @FiscalQtr																--[FiscalQuarter]
				, 'Qtr ' + CAST(@FiscalQtrCount AS Char(1)) + ', ' + @Year					--[FiscalQuarterName]
				, 'Fis Qtr ' + CAST(@FiscalQtrCount AS Char(1)) + ', ' + @Year				--[FiscalQuarterNameAbbr]
				, @FiscalMonth																--[FiscalMonth]
				, SUBSTRING(DATENAME(MONTH, CAST(@Year + '-' + CAST(@FiscalMonthCount AS VarChar(2)) + '-01' AS Date)), 1, 3) + ', ' + DATENAME(YEAR, @FiscalMonth)			--[FiscalMonthName]
				, 'Fis ' + SUBSTRING(DATENAME(MONTH, CAST(@Year + '-' + CAST(@FiscalMonthCount AS VarChar(2)) + '-01' AS Date)), 1, 3) + ', ' + DATENAME(YEAR, @FiscalMonth)	--[FiscalMonthNameAbbr]
				, @FiscalWeek																													--[FiscalWeek]
				, 'Week ' + CAST(@FiscalWeekCount AS VarChar(2)) + ', ' + DATENAME(YEAR, @FiscalYear)											--[FiscalWeekName]
				, 'Fis Wk ' + CAST(@FiscalWeekCount AS VarChar(2)) + ', ' + DATENAME(YEAR, @FiscalYear)											--[FiscalWeekNameAbbr]
				, @MyDate																														--[FiscalDay]
				, DATENAME(WEEKDAY, @MyDate) + ', ' + DATENAME(MONTH, @MyDate) + ' ' + DATENAME(DAY, @MyDate) + ' ' + DATENAME(YEAR, @MyDate)	--[FiscalDayName]
				, SUBSTRING(DATENAME(WEEKDAY, @MyDate), 1, 3) + ', ' + SUBSTRING(DATENAME(MONTH, @MyDate), 1, 3) + ' ' + DATENAME(DAY, @MyDate) + ' ' + DATENAME(YEAR, @MyDate)	--[FiscalDayNameAbbr]
				, NULL--[FiscalDayOfYear]
				, NULL--[FiscalDayOfYearName]
				, NULL--[FiscalDayOfHalfYear]
				, NULL--[FiscalDayOfHalfYearName]
				, NULL--[FiscalDayOfQuarter]
				, NULL--[FiscalDayOfQuarterName]
				, NULL--[FiscalDayOfMonth]
				, NULL--[FiscalDayOfMonthName]
				, NULL--[FiscalDayOfWeek]
				, NULL--[FiscalDayOfWeekName]
				, @FiscalWeekCount									--[FiscalWeekOfYear]
				, 'Week ' + CAST(@FiscalWeekCount AS VarChar(2))	--[FiscalWeekOfYearName]
				, @FiscalMonthCount									--[FiscalMonthOfYear]
				, 'Month ' + CAST(@FiscalMonthCount AS VarChar(2))	--[FiscalMonthOfYearName]
				, NULL--[FiscalMonthOfHalfYear]
				, NULL--[FiscalMonthOfHalfYearName]
				, NULL--[FiscalMonthOfQuarter]
				, NULL--[FiscalMonthOfQuarterName]
				, @FiscalQtrCount									--[FiscalQuarterOfYear]
				, 'Quarter ' + CAST(@FiscalQtrCount AS Char(1))		--[FiscalQuarterOfYearName]
				, NULL--[FiscalQuarterOfHalfYear]
				, NULL--[FiscalQuarterOfHalfYearName]
				, @FiscalHalfYearCount								--[FiscalHalfYearOfYear]
				, NULL--[FiscalHalfYearOfYearName]
				, NULL--[USHolidays]
				, NULL--[USHolidayName]
				, NULL--[BusinessHoliday]
				)
				
		SET @MyDate = DATEADD(day, 1, @MyDate)
	END
	
	-- US Holidays
	-- 2012
	UPDATE ConDate SET USHolidays = 1, USHolidayName = 'New Year''s Day observed' WHERE DateSK = '2012-01-02'
	UPDATE ConDate SET USHolidays = 1, USHolidayName = 'Martin Luther King Day' WHERE DateSK = '2012-01-16'
	UPDATE ConDate SET USHolidays = 1, USHolidayName = 'Presidents'' Day' WHERE DateSK = '2012-02-20'
	UPDATE ConDate SET USHolidays = 1, USHolidayName = 'Memorial Day' WHERE DateSK = '2012-05-28'
	UPDATE ConDate SET USHolidays = 1, USHolidayName = 'Independence Day' WHERE DateSK = '2012-07-04'
	UPDATE ConDate SET USHolidays = 1, USHolidayName = 'Labor Day' WHERE DateSK = '2012-09-03'
	UPDATE ConDate SET USHolidays = 1, USHolidayName = 'Columbus Day' WHERE DateSK = '2012-10-08'
	UPDATE ConDate SET USHolidays = 1, USHolidayName = 'Veterans Day observed' WHERE DateSK = '2012-11-12'
	UPDATE ConDate SET USHolidays = 1, USHolidayName = 'Thanksgiving Day' WHERE DateSK = '2012-11-22'
	UPDATE ConDate SET USHolidays = 1, USHolidayName = 'Christmas Day' WHERE DateSK = '2012-12-25'
	
	-- Business Holidays
	-- 2012
	UPDATE ConDate SET BusinessHoliday = 1 WHERE DateSK = '2012-01-02'
	UPDATE ConDate SET BusinessHoliday = 1 WHERE DateSK = '2012-02-20'
	UPDATE ConDate SET BusinessHoliday = 1 WHERE DateSK = '2012-05-28'
	UPDATE ConDate SET BusinessHoliday = 1 WHERE DateSK = '2012-07-04'
	UPDATE ConDate SET BusinessHoliday = 1 WHERE DateSK = '2012-09-03'
	UPDATE ConDate SET BusinessHoliday = 1 WHERE DateSK = '2012-11-22'
	UPDATE ConDate SET BusinessHoliday = 1 WHERE DateSK = '2012-11-23'
	UPDATE ConDate SET BusinessHoliday = 1 WHERE DateSK = '2012-12-24'
	UPDATE ConDate SET BusinessHoliday = 1 WHERE DateSK = '2012-12-25'
	--SELECT @p1, @p2


GO

