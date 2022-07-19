/*Query: What were the most expensive tickets sold? */

SELECT 
	pricepaid/qtysold as PPT,
	eventname,
	sellerid,
	buyerid,
	listid,
	DATE(saletime)
FROM sales
LEFT JOIN event
ON sales.eventid = event.eventid
LEFT JOIN date
on sales.dateid = date.dateid
ORDER BY PPT DESC, eventname DESC, DATE(saletime) DESC, sellerid DESC, buyerid DESC;