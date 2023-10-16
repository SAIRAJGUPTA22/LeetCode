/* Write your T-SQL query statement below */
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
DECLARE @WindowDate DATE;
SELECT @StartDate = MIN(visited_on)
      ,@WindowDate = DATEADD(DAY, 6, MIN(visited_on))
      ,@EndDate = MAX(visited_on)
FROM Customer;

WITH dates_CTE (date) AS (
    SELECT @StartDate AS date
    UNION ALL
    SELECT DATEADD(DAY, 1, date) AS date
    FROM dates_CTE
    WHERE date < @EndDate
)
    ,DailyTotals AS (
    SELECT dates.date AS visited_on
          ,ISNULL(SUM(cust.amount), 0) AS DailyTotal
    FROM dates_CTE dates
    LEFT JOIN Customer cust ON dates.date = cust.visited_on
    GROUP BY dates.date
)
    ,Averages AS (
    SELECT visited_on
          ,SUM(DailyTotal) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount
          ,SUM(DailyTotal) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) / CAST(7 AS FLOAT) AS average_amount
    FROM DailyTotals
)
SELECT visited_on
      ,amount
      ,ROUND(average_amount, 2) AS average_amount
FROM Averages
WHERE visited_on >= @WindowDate;