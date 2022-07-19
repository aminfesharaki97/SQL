/* Query: Find the event with the highest amount of sales for each city*/


/*Note: Unsure if the goal is to find the total number of tickets sold (a) or the total paid price (b) */

/*Quantity sold (a) */
SELECT venuecity, eventname, sum(qtysold) as QS
FROM sales
JOIN event
ON sales.eventid = event.eventid 
JOIN venue
ON event.venueid = venue.venueid
GROUP BY venuecity,eventname
ORDER BY venuecity, QS desc;

/*Total Paid Price (b) */
SELECT venuecity, eventname, sum(pricepaid) as QS
FROM sales
JOIN event
ON sales.eventid = event.eventid 
JOIN venue
ON event.venueid = venue.venueid
GROUP BY venuecity,eventname
ORDER BY venuecity, QS desc;


