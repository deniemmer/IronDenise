-- 1. How many copies of the film _Hunchback Impossible_ exist in the inventory system?
-- with inner join:
SELECT title, COUNT(inventory_id)
FROM film
INNER JOIN inventory 
ON film.film_id = inventory.film_id
WHERE title = "Hunchback Impossible";

-- with subqueries:
select title, sum(Copies) from (
select title, count(inventory_id) as Copies from film
inner join inventory
ON film.film_id = inventory.film_id
group by title, inventory_id
) as sub1
where title="Hunchback Impossible";

-- 2. List all films whose length is longer than the average of all the films. 

SELECT film.title, film.length
FROM film 
WHERE film.length > (SELECT AVG(film.length) 
                   FROM film ) ;
-- to check:                   
select avg(film.length) from film;

-- 3. Use subqueries to display all actors who appear in the film _Alone Trip_
select concat(first_name,' ',last_name) as 'Actors in Alone Trip'
	from actor
	where actor_id in 
	(select actor_id from film_actor where film_id = 
    (select film_id from film where title = 'Alone Trip'));
    
-- 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
-- Identify all movies categorized as family films.

select title as 'Family Movies'
	from film as f
	join film_category as fc on fc.film_id = f.film_id
	join category as c on c.category_id = fc.category_id
	where c.name = 'Family';
    
select title as 'Family Movies'
	from film where film_id in
    (select film_id from film_category where category_id =
    (select category_id from category where name='Family'));
    
-- 5. Get name and email from customers from Canada using subqueries. 
-- Do the same with joins. Note that to create a join, you will have to identify the 
-- correct tables with their primary keys and foreign keys, 
-- that will help you get the relevant information.

-- using subqueries

select country, last_name, first_name, email
from country inner join customer where country_id in
(select customer_id from customer where customer_id =
    (select country_id from country where country='Canada'));

-- using joins
SELECT country, last_name, first_name, email
FROM country c
INNER JOIN customer cu
ON c.country_id = 20
WHERE country = 'Canada';




