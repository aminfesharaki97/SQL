/*Query: How many tickets were sold on each holiday of 2008?*/

SELECT 
	DATE(saletime)
	sum(qtysold),
FROM sales
LEFT JOIN date
ON sales.dateid = date.dateid
WHERE date.holiday = '1'
GROUP BY DATE(saletime);
