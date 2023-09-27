# Write your MySQL query statement below
SELECT name from Employee Where Id in 
(SELECT ManagerId FROM Employee Group BY ManagerID Having count(*)>=5)