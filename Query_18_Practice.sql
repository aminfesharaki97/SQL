
/*Query: Which users attend events together most frequently?*/

select 
	s1.buyerid AS user1, 
	s2.buyerid AS user2,
	COUNT(*) OVER(PARTITION BY s1.buyerid) AS event_count
from sales s1
inner join sales s2
on s1.eventid = s2.eventid
group by s1.buyerid, s2.buyerid
HAVING s1.buyerid != s2.buyerid
order by event_count desc;
