# Write your MySQL query statement below
WITH immediate AS (
  SELECT * FROM (
    SELECT customer_id, order_date,customer_pref_delivery_date, RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS rnk
    FROM Delivery) A WHERE rnk =1
    
)
SELECT ROUND(
    (SELECT COUNT(*) FROM immediate WHERE order_date = customer_pref_delivery_date) /
    (SELECT COUNT(*) FROM immediate)
, 4) * 100 AS immediate_percentage;
