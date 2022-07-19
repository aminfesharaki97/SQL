/* Query: Find the count of sales per venue city.*/

SELECT city, sum(qtysold)
FROM sales, users
WHERE sales.sellerid = users.userid
GROUP BY city
ORDER BY city;

