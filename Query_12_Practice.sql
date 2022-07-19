/* Query: How long did it take sold-out listings to sell out? */


SELECT 
	listing.listid as list_id, 
	numtickets, 
	sum(qtysold) as Total, 
	DATE(listtime), 
	DATE(saletime),
	JULIANDAY(DATE(saletime)) - JULIANDAY(DATE(listtime)) as SoldOut_Time
FROM listing
LEFT JOIN sales
ON listing.listid = sales.listid 
GROUP BY list_id
HAVING Total = numtickets
ORDER BY SoldOut_Time;

--METHOD NOTES--
--Find Listing Number of Tickets and List Time and ListID
--Combine to Sales with Listid. Find Quantity sold.
--When (Find) Last Timestamp where Quantity sold = Number of Tickets
--Subtract the Dates 
