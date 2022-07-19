/** Quick Preview of what fields are in the world.country table in the database**/
SELECT *
FROM world.country
LIMIT 10;

/* 1.1 How many countries became independent in the twentieth century */
SELECT COUNT(DISTINCT NAME)
FROM world.country
WHERE IndepYear >= 1901 /** The 20th (twentieth) century began on January 1, 1901 **/ 
AND IndepYear <= 2000; /** The 20th (twentieth) century ended on December 31, 2000 **/

/* 1.2 How many people in the world are expected to live for 75 years or more */
SELECT SUM(Population)
FROM world.country
WHERE LifeExpectancy >= 75;

/* 1.3 List the 10 most populated countries in the world with their populations as a percentage of the world population.*/
/** Find world population first in order to find the percentage **/
SELECT SUM(Population)
FROM world.country; /** World populatiom = 6078749450 **/

SELECT Name, Population/6078749450*100 /** Divide individual country population with world population and multiply by 100 to find percentage **/
FROM world.country
ORDER BY Population DESC
LIMIT 10; /** Returns the 10 most populated countries **/

/* 1.4 List the top 10 countries with the highest population density. */
SELECT Name, Population/SurfaceArea /** Population density = Population/SurfaceArea **/
FROM world.country
ORDER BY Population/SurfaceArea DESC
LIMIT 10; /** Returns the names of the 10 highest population densities  **/

/* 1.5 How many countries are there in each “Region”? Write a SQL query that produces a list of regions with a column for country counts for each region and order the count descending*/
 SELECT Region, COUNT(Name)
 FROM world.country
 GROUP BY Region
 ORDER BY COUNT(Name) DESC;


/* 1.6 What countries have more than 10 languages represented? Write a SQL query, using the "HAVING" clause, that produces the list of countries that have greater than 10 languages. Group by "CountryCode" and order by language count descending.*/
SELECT Name, COUNT(
FROM world.country
GROUP BY Name, Capital
HAVING Capital > 10
ORDER BY Capital DESC;

/** Quick Preview of what fields are in the world.countrylanguage table in the database**/
SELECT *
FROM world.country, world.countrylanguage
LIMIT 10;



