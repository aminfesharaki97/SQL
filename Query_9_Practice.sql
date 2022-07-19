/* Query: Find all the users who have bought a ticket to a musical and also like sports. */




SELECT username, (firstname ||' ' || lastname ) as name
FROM sales
CROSS JOIN event
ON sales.eventid = event.eventid 
CROSS JOIN category
ON event.catid = category.catid
JOIN users
ON sales.buyerid = users.userid
WHERE sales.buyerid = users.userid
AND users.likesports = '1'
AND category.catname = 'Musicals'
GROUP BY name;

/* Sales -> 'BuyerID' -> User -> 'User ID ' -> 'likesports'
* Sales -> 'EventID' -> Event -> 'CatID' -> Category -> 'Musicals'
* Return Likes Sports = 1 & Category name = Musicals */


