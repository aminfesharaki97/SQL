
/* Query: Find the number of unique buyers per day */

SELECT  DATE(saletime), count( DISTINCT buyerid) 
FROM sales
GROUP BY DATE(saletime) 
ORDER BY DATE(saletime);
