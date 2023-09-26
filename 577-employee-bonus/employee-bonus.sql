# Write your MySQL query statement below
SELECT name, bonus
FROM Employee E LEFT JOIN Bonus b ON E.empId = b.empid 
 WHERE bonus < 1000 OR bonus is null