# Write your MySQL query statement below
SELECT p.Product_id, p.product_name FROM Product P JOIN sales S 
ON P.product_ID = S.product_ID
GROUP BY Product_ID HAVING MIN(S.sale_date) >= "2019-01-01" AND MAX(S.sale_date) <= "2019-03-31"