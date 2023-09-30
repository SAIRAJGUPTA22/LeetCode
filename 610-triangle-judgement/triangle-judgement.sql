# Write your MySQL query statement below
SELECT x,y,z ,
CASE WHEN X+Y > Z AND  Y+Z > X AND  Z+X > Y THEN 'Yes'

ELSE 'No'
END AS triangle FROM Triangle