/* Query: What percentage of listed tickets did each event sell? */

SELECT 
	eventname,
	listing.eventid,
	sum(numtickets) as TotalNumberTicket,
	sum(qtysold) as TotalTicketSold,
	100*sum(qtysold)/sum(numtickets) as PercentSold
FROM Listing
LEFT JOIN sales
ON listing.eventid = sales.eventid
LEFT JOIN event
ON listing.eventid = event.eventid
GROUP BY eventname, listing.eventid
ORDER BY PercentSold DESC;
