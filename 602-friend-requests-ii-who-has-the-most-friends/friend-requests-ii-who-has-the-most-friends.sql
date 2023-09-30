# Write your MySQL query statement below
WITH Requests AS
(
  SELECT requester_id AS id FROM RequestAccepted
  UNION ALL
  SELECT accepter_id AS id FROM RequestAccepted

),
Number_of_Requests as
(SELECT Id, COUNT(*) AS num FROM Requests
GROUP BY Id)
SELECT Id, num FROM Number_of_Requests
WHERE ID IN (SELECT ID FROM Number_of_Requests WHERE num = (SELECT MAX(num) FROM Number_of_Requests))