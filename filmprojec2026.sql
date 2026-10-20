#SQL PRACTICE QUESTIONS – FILM DATASET
create database films;
show databases;
use films;
#BASIC SQL
select * from film;


#1.Display all film record
select * from film;

-#2.Display only the title and release_year of all films
select title,release_year from film;

-- 3.Find the total number of films
select count(*) as total_films from film;

#4.Display all unique ratings
select distinct (rating) from film;

#5.Find films released in the year 2006
select title,release_year from film where release_year=2006;

#6.Find films with a rental rate greater than 3
select rental_rate from film where rental_rate > 3;

#7.Find films with a rental duration of more than 5 days
select title,rental_duration from film where rental_duration > 5;

#8.Find films whose length is greater than 120 minutes
select title,length from film where length>120;

#9.Find films with a replacement cost greater than 20
select title,replacement_cost from film where replacement_cost>20;

#10.Display films having a rating of 'PG'
select title,rating from film where rating='PG';

#11.Find films with rental rates between 2 and 4
select title,rental_rate from film where rental_rate between 2 and 4;
select * from film;

#12.Find films whose length is between 90 and 120 minutes
select title,length from film where length between 90 and 120;

#13.Find films with replacement costs between 15 and 25
select title,length from film where length between 90 and 120;

#14.Find films whose title starts with 'A'
select title from film where title like "A%";

#15.Find films whose title ends with 'N'
select title from film where title like "%N";

#16.Find films whose title contains the word 'LOVE'
select title from film where title like "%LOVE%";
select * from film;

#17.Find films having a rating of 'PG' or 'G'
select title,rating from film where rating="PG" or rating="G";

#18.Find films released between 2005 and 2006
select title,release_year from film where release_year between 2005 and 2006;

#19.Find films where rental duration is 3, 5, or 7 days
select title,rental_duration from film where rental_duration in (3,5,7);

#20.Find films whose rental rate is not equal to 2.99
select title,rental_rate from film where rental_rate != 2.99;

#21.Display films from lowest to highest rental rate
select title,rental_rate from film where rental_rate != 2.99;

#22.Display films from highest to lowest rental rate
select title,rental_rate from film order by rental_rate desc;

#23.Display films according to their length from longest to shortest
select title,length from film order by length desc;

#24.Display films according to replacement cost from highest to lowest
select title,replacement_cost from film order by replacement_cost desc;

#25.Display films alphabetically by title
select title from film order by title asc;

#26.Display the 10 most expensive films based on replacement cost
select title,replacement_cost from film  order by replacement_cost desc limit 10;

#27.Display the 5 longest films
select title,length from film order by length desc limit 5;

#28.Find the average rental rate
select avg(rental_rate) as total_avg from film;

#29.Find the maximum rental rate
select max(rental_rate) as total_max from film;

#30.Find the minimum rental rate
select min(rental_rate) as total_min from film;

#31 find average film length?
select avg(length) as average from film;

##32.Find the longest film
select max(length) as longest from film;

#33.Find the shortest film
select min(length) as shortest from film;

#34.Find the total replacement cost of all films
select sum(replacement_cost) as total from film;

#35.Find the average replacement cost
select avg(replacement_cost) as average from film;

#36.Find the total number of films for each rating
select rating,count(*) as total_film from film group by rating;

#37.Find the number of films for each rating
select rating,count(rating) as total_film from film group by rating;

#38.Find the average rental rate for each rating
select rating,avg(rental_rate) as average from film group by rating;

#39.Find the average film length for each rating
select rating,avg(length) as film_length from film group by rating;

#40.Find the maximum replacement cost for each rating
select rating,max(replacement_cost) as reaplacement from film group by rating;

#41.Find the minimum rental rate for each rating
select rating,min(rental_rate) as rental from film group by rating;

#42.Find ratings having more than 10 films
select rating,count(*) as no_films from film group by rating having count(*)>10;

#43.Find ratings where the average rental rate is greater than 2.50
select rating,avg(rental_rate) as average from film group by rating having avg(rental_rate)>2.50;

#44.Find ratings where the average film length is greater than 100 minutes
select rating,avg(length) as average from film group by rating having avg(length)>100;

#45.Categorize films based on length as Short, Medium, or Long using CASE
 select title,length, case 
 when length <90 then "short"
 when length between 90 and 120 
 then "medium" else "long" 
 end as film_category from film;

#46.Categorize films based on rental rate as Cheap, Moderate, or Expensive using CASE
select title,rental_rate, case 
when rental_rate <90 then "cheap"
when rental_rate between 90 and 120
then "moderate" else "expensive"
end as film_category from film;  

#47.Display title, length, and film_category using CASE
 select title,length,case 
 when length <90 then "short"
 when length between 90 and 120
 then "medium" else "long"
 end as film_category from film;
 
#48.Find the second-highest rental rate
select distinct rental_rate from film limit 1 offset 1;

#49.Find the third-highest replacement cost
select distinct rental_rate from film limit 1 offset 2;

#50.Find the film(s) having the maximum length
select title,length from film where length = (select max(length) from film);

#51.Find films whose rental rate is higher than the average rental rate
select title,rental_rate from film where rental_rate>(select avg(rental_rate) from film);

#52.Find films whose replacement cost is higher than the average replacement cost
select title,replacement_cost from film where replacement_cost>(select avg(replacement_cost) from film);

#53.Find the rating with the highest average rental rate
select rating,avg(rental_rate) as highest_avg from film group by rating order by avg(rental_rate) desc;

#54.Find the rating with the longest average film length
select rating,avg(length) as longest from film group by rating order by avg(length) desc; 

#55.Display the top 5 films based on replacement cost
select title,replacement_cost from film order by replacement_cost desc limit 5;

#56.Find the number of films for each release year
select release_year,count(*) as total_film from film group by release_year order by release_year;

#57.Find the average rental rate for each release year
select release_year,avg(rental_rate) as average from film group by release_year ;
select * from film;

#58.Find the year having the highest number of films
select release_year,count(*) as total_film from film group by release_year order by total_film desc limit 1;

##60.Display each film's title, rental rate, replacement cost, and the difference between replacement cost and rental rate
select title,rental_rate,replacement_cost,(replacement_cost-rental_rate) as difference from film;

## subquery question
select * from film;
#Find the longest film using a subquery.
select title,length from film where length=(select max(length) from film);

#Find the shortest film using a subquery.
select title,length from film where length=(select min(length) from film);

#Find films with a length greater than the average film length.
select title,length from film where length>(select avg(length) from film);

#Find films with a length less than the average film length.
select title,length from film where length<(select avg(length) from film);

#Find films with a rental rate greater than the average rental rate.
select title,rental_rate from film where length>(select avg(rental_rate) from film);

#Find films with a rental rate less than the average rental rate.
select title,rental_rate from film where length<(select avg(rental_rate) from film);

#Find films having the maximum replacement cost.
select title,replacement_cost from film where replacement_cost=(select max(replacement_cost) from film);

#Find films having the minimum replacement cost.
select title,replacement_cost from film where replacement_cost=(select min(replacement_cost) from film);

#Find films having the maximum rental duration.
select title,rental_duration from film where rental_duration=(select max(rental_duration) from film);

#Find films having the minimum rental duration.
select title,rental_duration from film where rental_duration=(select min(rental_duration) from film);


#Medium Level

#Find films with a replacement cost greater than the average replacement cost.
select title,replacement_cost from film where replacement_cost>(select avg(replacement_cost) from film);

#Find films with a replacement cost less than the average replacement cost.
select title,replacement_cost from film where replacement_cost<(select avg(replacement_cost) from film);

#Find films having the same length as the longest film.
select title,length from film where length=(select max(length) from film);

#Find all films whose rating is the same as the rating of the longest film.
select rating,title,length from film where rating=(select rating from film where length=(select max(length) from film));

#Find films whose length is greater than the average length of PG films.
select rating,title,length from film where length>(select avg(length) from film where rating="PG");

#Find films whose rental rate is greater than the average rental rate of R-rated films.
select title,rental_rate from film where rental_rate>(select avg(rental_rate) from film where rating="R");

#Find films whose replacement cost is equal to the maximum replacement cost.
select title,replacement_cost from film where replacement_cost=(select max(replacement_cost) from film);

#Find films whose length is equal to the minimum length.
select title,length from film where length=(select min(length) from film);

#Find films with a length greater than the average length but rental rate less than the average rental rate.
select title,length,rental_rate from film where length>(select avg(length) from film
 where rental_rate<(select avg(rental_rate) from film)); 

#Find films whose rental duration is greater than the average rental duration.
select title,rental_duration from film where rental_duration>(select avg(rental_duration) from film); 

#Using IN Subqueries
#Find films whose rating appears in films with a length greater than 150 minutes.
select title,rating,length from film where rating in(select distinct rating from film where length>150);

#Find films whose language_id exists in films having a rental rate greater than 4.
select title,language_id,rental_rate from film where language_id in (select distinct language_id from film where rental_rate>4);

#Find films with ratings that have at least one film longer than 170 minutes.
select title,rating,length from film where rating in (select distinct rating from film where length>170) ;

#Find films whose rental duration exists in films with replacement cost greater than 25.
select title,rental_duration,replacement_cost from film where rental_duration in (select distinct rental_duration from 
film where replacement_cost>25);

#Find all films having ratings used by films whose title starts with 'A'.
select title,rating from film where rating in (select distinct rating from film where title like"A%");
#Using NOT IN Subqueries

#Find films whose rating is not used by any film longer than 150 minutes.
select title,rating,length from film where rating not in (select distinct rating from film where length>150);

#Find films whose language_id is not used by films with rental rate greater than 4.
select title,language_id,rental_rate from film where language_id not in (select distinct language_id from film where rental_rate>4);

#Find films whose rental duration is not present in films with replacement cost greater than 25.
select title,rental_duration,replacement_cost from film where rental_duration not in (select distinct 
rental_duration from film where replacement_cost>25);

#Challenge 🔥
#Find the second longest film using a subquery.
select title,length from film where length=(select distinct max(length) from film where 
 length<(select distinct max(length) from film));

#Find the second highest replacement cost using a subquery.
select title,replacement_cost from film where replacement_cost=(select max(replacement_cost) from film where 
 replacement_cost<(select max( replacement_cost) from film));

#Find the third longest film using a subquery.
select title,length from film where length=(select distinct max(length) from film where 
 length<(select distinct max(length) from film where 
 length<(select distinct max(length) from film)));

#Find films having a length greater than all PG-rated films.
select title,length,rating from film where length>all(select length from film where rating="PG");

#Find films having a replacement cost greater than every G-rated film.
select title,replacement_cost,rating from film where replacement_cost> all(select replacement_cost from film where rating="g");

#Find films having a length less than all films rated R.
select title,length,rating from film where length=all(select min(length) from film where rating="R");

#Find the rating(s) whose average film length is greater than the overall average film length.
select rating,avg(length) as avg_len from film group by rating having avg(length)>(select avg(length) from film);

#Find films belonging to ratings whose average length is greater than 120 minutes.
select title,rating,avg(length) from film where rating in(select rating from film group by rating having avg(length)>120);

#Find films with a replacement cost greater than the maximum replacement cost of PG films.
select title,replacement_cost,rating from film where replacement_cost>(select max(replacement_cost) from film where rating="PG");

#Find films with a rental rate less than the minimum rental rate of R-rated films.
select title,rental_rate,rating from film where rental_rate<(select min(rental_rate) from film where rating="R");

#find films that have the same replacement cost as another film using a correlated subquery.
select title,replacement_cost from film f1 where exists(select 1 from film f2 where 
f1.replacement_cost=f2.replacement_cost and f1.film_id<> f2.film_id);

#find films that are longer than the average length of films with the same rating using a correlated subquery.
select title,rating,length from film f1 where length>(select avg(length) from film f2 where f1.rating=f2.rating);

use films;
select * from film;

select last_update from film;

alter table film add primary key(film_id);

#1Find films whose length is equal to the average length of all films.
select title,length from film where length=(select avg(length) from film);

#2Find films whose rental_rate is equal to the maximum rental rate.
select title,rental_rate from film where rental_rate=(select max(rental_rate) from film);

#Find films whose replacement_cost is below the average replacement cost.
select title,replacement_cost from film where replacement_cost<(select avg(replacement_cost) from film);

#Find films with a rental_duration greater than the average rental duration.
select title,rental_duration from film where rental_duration>(select avg(rental_duration) from film);

#Find films having the same rating as the shortest film.
select title,rating from film where rating=(select min(rating) from film);

#Find films whose replacement_cost is equal to the minimum replacement cost.
select title,replacement_cost from film where replacement_cost=(select min(replacement_cost) from film);

#Find films with a length greater than the minimum length of PG films.
select title,length,rating from film where length>(select min(length) from film having rating="PG"); 

#Find films with a rental rate less than the maximum rental rate of G films.
select title,rental_rate,rating from film where rental_rate<(select max(rental_rate) from film having rating="G");

#Find films whose length is greater than the average length of R-rated films.
select title,length,rating from film where length>(select avg(length) from film having rating="r");

#Find films with a replacement cost greater than the average replacement cost of PG-13 films.
select title,replacement_cost,rating from film where replacement_cost>(select avg(replacement_cost) from film having rating="PG-13");

#Find the second lowest rental rate using a subquery.
select title,rental_rate from film where rental_rate=(select distinct min(rental_rate) from film where rental_rate >
(select distinct min(rental_rate) from film));

#Find the third highest replacement cost using a subquery.
select title,replacement_cost from film where replacement_cost=(select max(replacement_cost) from film 
where replacement_cost<(select max(replacement_cost) from film where replacement_cost<(select max(replacement_cost) 
from film )));

#Find films with the second shortest length.
select title,length from film where length=(select min(length) from film where length >(select min(length) from film));

#Find films whose length is between the minimum and maximum length of PG films.
select title,length,rating from film where length between (select min(length) from film where rating="PG") and
 (select max(length) from film where rating="PG");

#Find films whose rental rate is greater than the average rental rate of their own rating.
select title,rental_rate,rating from film where rental_rate>(select avg(rental_rate) from film );

#Find films whose replacement cost is less than the average replacement cost of their own rating.
select title,replacement_cost,rating from film where replacement_cost>(select avg(replacement_cost) from film);

#Find films that have the same rental duration as another film using a correlated subquery.
select title,rental_duration from film f1 where exists(select 1 from film f2 where f1.rental_duration=f2.rental_duration
and f1.film_id<> f2.film_id);

#Find films whose length is greater than the average length of films with the same rental duration.
select title,length,rental_duration from film f1 where length >(select avg(length) from film f2 where f1.rental_duration=f2.rental_duration);

#Find films with the highest replacement cost in each rating.
select title,replacement_cost,rating from film f1 where replacement_cost=(select max(replacement_cost) from film f2 
where f1.rating=f2.rating);

#Find films with the lowest rental rate in each rating.
select title,rental_rate,rating from film f1 where rental_rate=(select min(rental_rate) from film f2 where f1.rating=f2.rating);
#EXISTS / NOT EXISTS
#Find films that have another film with the same rating.
select title,rating from film f1 where exists(select 1 from film f2 where f1.rating=f2.rating
and f1.film_id<>f2.film_id);

#Find films that have another film with the same length.
select title,length from film f1 where exists(select 1 from film f2 where f1.length=f2.length
and f1.film_id<>f2.film_id);

#Find films whose replacement_cost is unique — no other film has the same cost.
select title,replacement_cost from film f1 where not exists(select * from film f2 
where f1.replacement_cost=f2.replacement_cost and f1.film_id<>f2.film_id);

#Find films whose length is unique — no other film has the same length.
select title,length from film f1 where not exists(select * from film f2 where f1.length=f2.length and f1.film_id<f2.film_id);
 
#Find ratings that have at least one film longer than 170 minutes using EXISTS.
select title,rating,length from film f1 where exists(select * from film f2 where f2.length>170);

#Find films whose rating has more than one film using a correlated subquery.
select title,rating from film f1 where exists(select * from film f2 where f1.rating=f2.rating and f1.film_id<>f2.film_id);

#Find films that have no other film with the same rental rate using NOT EXISTS.
select title,rental_rate from film f1 where not exists
(select * from film f2 where f1.rental_rate=f2.rental_rate and f1.film_id<>f2.film_id);

#SQL PRACTICE QUESTIONS

#1. Display all records from the film table.
select * from film;

#2. Display only the title, release_year, and rental_rate columns.
select title,release_year,rental_rate from film;

#3. Find all films released in 2006.
select title,release_year from film where release_year=2006;

#4. Find films having a rental_rate greater than 3.
select title,rental_rate from film where rental_rate>3;

#5. Find films with a length greater than 120 minutes.
select title from film where length>120;

#6. Display films where the rating is 'PG'.
select title,rating from film where rating="PG";

#7. Find films where rental_duration is greater than 5 days.
select title,rental_duration from film where rental_duration>5;

#8. Display films with a replacement_cost greater than 20
select title,replacement_cost from film where replacement_cost>20;

#9. Find films having a rental_rate equal to 0.99.
select title,rental_rate from film where rental_rate=0.99;

#10. Display the first 10 films based on film_id.
select title,film_id from film where film_id limit 10;

#11. Find films released in 2006 with a rental_rate greater than 3.
select title,release_year,rental_rate from film where release_year=2006 and rental_rate>3;

#12. Find films with a length greater than 100 and rental_rate less than 3.
select title,length,rental_rate from film where length>100 and rental_rate<3;

#13. Find films rated PG or G.
select title,rating from film  where rating="PG" or rating="G";

#14. Find films where the rental_duration is between 4 and 6 days.
select title,rental_duration from film  where rental_duration between 4 and 6;

#15. Find films where the replacement_cost is between 15 and 20.
select title,replacement_cost from film  where replacement_cost between 15 and 20;

#16. Find films released in 2006 or having a rental_rate greater than 4.
select title,release_year,rental_rate from film where release_year=2006 or rental_rate>4;

#17. Find films where the rating is not 'R'.
select title,rating from film where rating!="R";

#18. Find films with a length between 90 and 120 minutes.
select title,length from film where length between 90 and 120;

#19. Display all films sorted by title in ascending order.
select title from film order by title asc;

#20. Display all films sorted by rental_rate from highest to lowest.
select title,rental_rate from film order by rental_rate desc;

#21. Display films sorted by length from longest to shortest.
select title,length from film order by length desc;

#22. Display films sorted by replacement_cost in ascending order.
select title,replacement_cost from film order by replacement_cost asc;

#23. Display films sorted first by rating and then by rental_rate descending.
select title,rating,rental_rate from film order by rating and rental_rate desc;

#24. Find the total number of films.
select count(*) as total_number from film ;

#25. Find the average rental_rate.
select avg(rental_rate) from film;

#26. Find the maximum rental_rate.
select max(rental_rate) from film;

#27. Find the minimum rental_rate.
select min(rental_rate) from film;

#28. Find the average film length.
select avg(length) from film;

#29. Find the maximum replacement_cost.
select max(replacement_cost) from film;

#30. Find the minimum replacement_cost.
select min(replacement_cost) from film;

#31. Find the total of all replacement_costs.
select sum(replacement_cost) as total from film;

#32. Find the average rental_duration.
select avg(rental_duration) from film;

#33. Count the number of films for each rating.
select rating,count(*) as total from film group by rating;

#34. Find the average rental_rate for each rating.
select rating,avg(rental_rate) from film group by rating;

#35. Find the average length of films for each rating.
select rating,avg(length) from film group by rating;

#36. Find the maximum replacement_cost for each rating.
select rating,avg(replacement_cost) from film group by rating;

#37. Find the minimum rental_rate for each rating.
select rating,min(rental_rate) from film group by rating;

#38. Count films released in each release_year.
select release_year,count(title) as films  from film group by release_year;

#39. Find the average film length for each release_year.
select avg(length),release_year from film group by release_year;

#40. Find ratings having more than 10 films.
select rating,count(*) as number_film from film group by rating having count(*)>10;

#41. Find ratings where the average rental_rate is greater than 3.
select rating,avg(rental_rate) as average from film group by rating having average>3;

#42. Find ratings where the average film length is greater than 100 minutes.
select rating,avg(length) as average from film group by rating having average>100;

#43. Find release_years having more than 20 films.
select release_year,count(*) as films from film group by release_year having count(*)>20;

#44. Find films whose title starts with 'A'.
select title from film where title like "A%";

#45. Find films whose title ends with 'N'.
select title from film where title like "%N";

#46. Find films whose title contains the word 'LOVE'.
select title from film where title like "%LOVE%";

#47. Find films whose title contains the letter 'R'.
select title from film where title like "%R%";
select * from film;
#48. Find films with a description containing the word 'man'.
select title,description from film where description like "%man%";

#49. Find films whose title has exactly 5 characters.
select title from film where title like "-----";

#50. Find the 5 most expensive films based on replacement_cost.
select title,replacement_cost from film order by replacement_cost desc limit 5;

#51. Find the 10 films with the highest rental_rate.
select title,rental_rate from film order by rental_rate desc limit 10;

