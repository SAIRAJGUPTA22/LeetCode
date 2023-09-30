# Write your MySQL query statement below
WITH Requests AS
(
  SELECT requester_id AS id FROM RequestAccepted
  UNION ALL
  SELECT accepter_id AS id FROM RequestAccepted

)
SELECT ID, COUNT(*) AS num FROM Requests 
GROUP BY ID ORDER BY COUNT(*) DESC LIMIT 1