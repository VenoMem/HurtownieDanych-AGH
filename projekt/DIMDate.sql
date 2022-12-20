DECLARE @StartDate  date = '20041231';

DECLARE @CutoffDate date = DATEADD(DAY, -1, DATEADD(YEAR, 30, @StartDate));

;WITH seq(n) AS 
(
  SELECT 0 UNION ALL SELECT n + 1 FROM seq
  WHERE n < DATEDIFF(DAY, @StartDate, @CutoffDate)
),
d(d) AS 
(
  SELECT DATEADD(DAY, n, @StartDate) FROM seq
),
src AS
(
  SELECT
	date_id = convert(int, convert(varchar(10),d,112)),
    TheDate         = CONVERT(date, d),
    TheDay          = DATEPART(DAY,       d),
    TheWeek         = DATEPART(WEEK,      d),
    TheMonth        = DATEPART(MONTH,     d),
    TheQuarter      = DATEPART(Quarter,   d),
    TheYear         = DATEPART(YEAR,      d)
  FROM d
)

select * into DIMDate from src
  
  
 OPTION (MAXRECURSION 0);