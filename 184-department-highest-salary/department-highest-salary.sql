# Write your MySQL query statement below
SELECT Department, Employee, Salary FROM (
SELECT D.name as Department,  E.name as Employee, Salary, rank()over(Partition by departmentid ORDER BY Salary DESC) as rnk  
FROM Employee E JOIN Department D ON E.departmentId = D.id) A WHERE rnk =1
