/* Query:  What days were outliers for the number of ticket sales?*/


/* Combine Ticket sales for Each Unique Day */
SELECT  SUBSTR(saletime, 1,10), SUM(qtysold)
FROM sales
GROUP BY SUBSTR(saletime, 1,10) 
ORDER BY SUM(qtysold)

/* Find Total Ticket Sales */
SELECT  SUM(qtysold)
FROM sales 

/* Find Total # of Distinct Days */ 
SELECT  Count(DISTINCT SUBSTR(saletime, 1,10))
FROM sales

/* Find Average Ticket Sales */
SELECT  SUM(qtysold)/Count(DISTINCT SUBSTR(saletime, 1,10))
FROM sales ;

/* How many days were below a certain value (or higher)*/
SELECT  SUBSTR(saletime, 1,10), SUM(qtysold) 
FROM sales
GROUP BY SUBSTR(saletime, 1,10) 
HAVING SUM(qtysold) < 235
ORDER BY SUM(qtysold);

/* Combine Ticket sales for Each Unique Day */
SELECT  SUBSTR(saletime, 1,10), SUM(qtysold)
FROM sales
GROUP BY SUBSTR(saletime, 1,10) 
ORDER BY SUBSTR(saletime, 1,10);



