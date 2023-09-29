SELECT name FROM SalesPerson 
WHERE sales_id NOT IN (SELECT sales_id FROM Orders WHERE com_id IN(SELECT Com_id FROM Company WHERE name ='RED'))
