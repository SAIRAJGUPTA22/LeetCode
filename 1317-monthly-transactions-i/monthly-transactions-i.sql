SELECT A.month, A.country, A.trans_count,CASE WHEN approved_count>0 THEN approved_count ELSE 0 END AS approved_count, A.trans_total_amount,CASE WHEN approved_total_amount >0 THEN approved_total_amount ELSE 0 END AS  
approved_total_amount
FROM (
    SELECT SUBSTRING(CONVERT(VARCHAR, trans_date, 120), 1, 7) AS month, country, COUNT(id) AS trans_count, SUM(amount) AS trans_total_amount
    FROM Transactions
    GROUP BY SUBSTRING(CONVERT(VARCHAR, trans_date, 120), 1, 7), country
) A
LEFT JOIN (
    SELECT SUBSTRING(CONVERT(VARCHAR, trans_date, 120), 1, 7) AS month, country, COUNT(id) AS approved_count, SUM(amount) AS approved_total_amount
    FROM Transactions
    WHERE State = 'approved'
    GROUP BY SUBSTRING(CONVERT(VARCHAR, trans_date, 120), 1, 7), country
) B
ON A.month = B.month AND A.country = B.country;
