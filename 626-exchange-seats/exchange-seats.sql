# Write your MySQL query statement below
SELECT id, COALESCE
 (CASE WHEN id%2 = 0 THEN LAG(student) OVER() ELSE LEAD(student) OVER()
END, student) AS student FROM Seat


