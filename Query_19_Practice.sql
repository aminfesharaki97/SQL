/* Query: How common is it for users to buy tickets to events outside of their state?*/

SELECT COUNT(DISTINCT (users.userid))
FROM sales, users, event, venue
WHERE sales.buyerid = users.userid
AND event.eventid = sales.eventid
AND event.venueid = venue.venueid
AND users.state != venue.venuestate;


