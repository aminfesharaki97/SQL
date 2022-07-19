/* Query: Find the day over day count of orders to see how the business is doing.*/

SELECT  DATE(saletime), count(DATE(saletime)) 
FROM sales
GROUP BY DATE(saletime)  
ORDER BY DATE(saletime); 
