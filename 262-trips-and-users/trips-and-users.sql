
SELECT request_at AS Day,
Round(SUM(CASE WHEN Status ='Completed' THEN 0 ELSE 1 END )/COUNT(Id),2) AS `Cancellation Rate` FROM Trips 
WHERE Client_Id IN (SELECT users_id FROM Users WHERE banned='NO') 
AND driver_id IN (SELECT users_id FROM Users WHERE banned='No') 
AND request_at between '2013-10-01' AND '2013-10-03'
GROUP BY request_at