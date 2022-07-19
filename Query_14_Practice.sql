/*Query: Determine whether there are any resellers in the dataset.*/

select 
	s1.buyerid AS user1, 
	s2.sellerid AS user2,
	sum(s2.qtysold)
from sales s1
inner join sales s2
on s1.eventid = s2.eventid
WHERE s1.buyerid = s2.sellerid 
GROUP BY s2.sellerid;
