SELECT
    id,
    SUM(CASE WHEN Month = 'Jan' THEN Revenue ELSE null END) AS Jan_Revenue,
    SUM(CASE WHEN Month = 'Feb' THEN Revenue ELSE null END) AS Feb_Revenue,
    SUM(CASE WHEN Month = 'Mar' THEN Revenue ELSE null END) AS Mar_Revenue,
    SUM(CASE WHEN Month = 'Apr' THEN Revenue ELSE null END) AS Apr_Revenue,   
    SUM(CASE WHEN Month = 'May' THEN Revenue ELSE null END) AS May_Revenue,
    SUM(CASE WHEN Month = 'Jun' THEN Revenue ELSE null END) AS Jun_Revenue,
    SUM(CASE WHEN Month = 'Jul' THEN Revenue ELSE null END) AS Jul_Revenue,
    SUM(CASE WHEN Month = 'Aug' THEN Revenue ELSE null END) AS Aug_Revenue, 
    SUM(CASE WHEN Month = 'Sep' THEN Revenue ELSE null END) AS Sep_Revenue,
    SUM(CASE WHEN Month = 'Oct' THEN Revenue ELSE null END) AS Oct_Revenue,
    SUM(CASE WHEN Month = 'Nov' THEN Revenue ELSE null END) AS Nov_Revenue,
    SUM(CASE WHEN Month = 'Dec' THEN Revenue ELSE null END) AS Dec_Revenue       
FROM Department
GROUP BY id;