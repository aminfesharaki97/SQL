
/*
 *Tickit database is a sample database from Amazon Web Services 
 * Amin Fesharaki - USD
 */


 /* Drop Tables */

 DROP TABLE IF EXISTS users;
 DROP TABLE IF EXISTS venue;
 DROP TABLE IF EXISTS category;
 DROP TABLE IF EXISTS date;
 DROP TABLE IF EXISTS event;
 DROP TABLE IF EXISTS listing;
 DROP TABLE IF EXISTS sales;

 /* Create Tables */
 create table users(
	userid integer not null ,
	username char(8),
	firstname varchar(30),
	lastname varchar(30),
	city varchar(30),
	state char(2),
	email varchar(100),
	phone char(14),
	likesports boolean,
	liketheatre boolean,
	likeconcerts boolean,
	likejazz boolean,
	likeclassical boolean,
	likeopera boolean,
	likerock boolean,
	likevegas boolean,
	likebroadway boolean,
	likemusicals boolean);

 create table venue(
	venueid smallint not null,
	venuename varchar(100),
	venuecity varchar(30),
	venuestate char(2),
	venueseats integer);

 create table category(
	catid smallint not null,
	catgroup varchar(10),
	catname varchar(10),
	catdesc varchar(50));

create table date(
	dateid smallint not null,
	caldate date not null,
	day character(3) not null,
	week smallint not null,
	month character(5) not null,
	qtr character(5) not null,
	year smallint not null,
	holiday boolean default('N'));

create table event(
	eventid integer not null,
	venueid smallint not null,
	catid smallint not null,
	dateid smallint not null,
	eventname varchar(200),
	starttime timestamp);

create table listing(
	listid integer not null,
	sellerid integer not null,
	eventid integer not null,
	dateid smallint not null,
	numtickets smallint not null,
	priceperticket decimal(8,2),
	totalprice decimal(8,2),
	listtime timestamp);

create table sales(
	salesid integer not null,
	listid integer not null,
	sellerid integer not null,
	buyerid integer not null,
	eventid integer not null,
	dateid smallint not null,
	qtysold smallint not null,
	pricepaid decimal(8,2),
	commission decimal(8,2),
	saletime timestamp);

/* Load Data */

.mode list
.import /Users/datascience/Desktop/tickitdb/allusers_pipe.txt users
.import /Users/datascience/Desktop/tickitdb/venue_pipe.txt venue
.import /Users/datascience/Desktop/tickitdb/category_pipe.txt category
.import /Users/datascience/Desktop/tickitdb/date2008_pipe.txt date
.import /Users/datascience/Desktop/tickitdb/allevents_pipe.txt event
.import /Users/datascience/Desktop/tickitdb/listings_pipe.txt listing


.mode tabs
.import /Users/datascience/Desktop/tickitdb/sales_tab.txt sales 

/* Handle data before SQLite */)




/* Change Booleans 1 = True / 0 = False */

/* Date - Holiday */
UPDATE date  
SET holiday = '1'
WHERE holiday = 'TRUE';
UPDATE date 
SET holiday = '0'
WHERE holiday = 'FALSE';

/* Users - likesports */
UPDATE users 
SET likesports = '1'
WHERE likesports ='TRUE';
UPDATE users
SET likesports = '0'
WHERE likesports = 'FALSE';

/* Users - liketheatre */
UPDATE users 
SET liketheatre = '1'
WHERE liketheatre ='TRUE';
UPDATE users
SET liketheatre = '0'
WHERE liketheatre = 'FALSE';


/* Users - likeconcerts */
UPDATE users 
SET likeconcerts = '1'
WHERE likeconcerts ='TRUE';
UPDATE users
SET likeconcerts = '0'
WHERE likeconcerts = 'FALSE';


/* Users - likejazz */
UPDATE users 
SET likejazz = '1'
WHERE likejazz ='TRUE';
UPDATE users
SET likejazz = '0'
WHERE likejazz = 'FALSE';


/* Users - likeclassical */
UPDATE users 
SET likeclassical = '1'
WHERE likeclassical ='TRUE';
UPDATE users
SET likeclassical = '0'
WHERE likeclassical = 'FALSE';


/* Users - likeopera */
UPDATE users 
SET likeopera = '1'
WHERE likeopera ='TRUE';
UPDATE users
SET likeopera = '0'
WHERE likeopera = 'FALSE';


/* Users - likerock */
UPDATE users 
SET likerock = '1'
WHERE likerock ='TRUE';
UPDATE users
SET likerock = '0'
WHERE likerock = 'FALSE';


/* Users - likevegas */
UPDATE users 
SET likevegas = '1'
WHERE likevegas ='TRUE';
UPDATE users
SET likevegas = '0'
WHERE likevegas = 'FALSE';

/* Users - likebroadway */
UPDATE users 
SET likebroadway = '1'
WHERE likebroadway ='TRUE';
UPDATE users
SET likebroadway = '0'
WHERE likebroadway = 'FALSE';

/* Users - likemusicals */
UPDATE users 
SET likemusicals = '1'
WHERE likemusicals ='TRUE';
UPDATE users
SET likemusicals= '0'
WHERE likemusicals= 'FALSE';

/* Fix SALES time 
 *  MM/DD/YYYY HH:MM:DD -> YYYY-MM-DD HH:MM:SS
 */


UPDATE sales
SET saletime = '0' || saletime
WHERE SUBSTR(saletime, 2, 1) = '/';
UPDATE sales
SET saletime = SUBSTR(saletime,1,3) || '0' || SUBSTR(saletime,4,15)
WHERE SUBSTR(saletime, 5,1) = '/';
UPDATE sales
SET saletime = SUBSTR(saletime, 7,4) || '-' || SUBSTR(saletime, 1,2) || '-' || SUBSTR(saletime,4,2) || SUBSTR(saletime,11,16);


