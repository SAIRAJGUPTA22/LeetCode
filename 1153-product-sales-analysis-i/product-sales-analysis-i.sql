# Write your MySQL query statement below
SELECT product_name, year, price FROM Sales S
JOIN Product P ON P.product_id = S.product_id
