-- WEEK 3 DAY 2
-- 1. Which actor has appeared in the most films?
SELECT count(film_actor.actor_id), actor.first_name, actor.last_name 
FROM actor INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id order by count(film_actor.actor_id) desc limit 1;

-- 2. Most active customer (the customer that has rented the most number of films)
SELECT count(rental.customer_id), customer.first_name, customer.last_name 
FROM customer INNER JOIN rental ON rental.customer_id = customer.customer_id
GROUP BY rental.customer_id order by count(rental.customer_id) desc limit 1;

-- 3. List number of films per category
select category.name, count(film_category.film_id)
from category inner join film_category
on film_category.category_id = category.category_id
group by category.category_id, category.name;

-- 4. Display the first and last names, as well as the address, of each staff member
 SELECT staff.first_name, staff.last_name, 
(SELECT address.address FROM address
 WHERE staff.address_id = address.address_id) address 
 FROM staff ;
 
 -- 5. Display the total amount rung up by each staff member in August of 2005.
SELECT staff.first_name, staff.last_name, SUM(payment.amount)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
where payment.payment_id between 22 and 32 -- i couldnt do by the date
GROUP BY payment.staff_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT film.title, COUNT(film_actor.actor_id)
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY film.title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.

SELECT customer.last_name, customer.first_name, SUM(payment.amount)
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id
ORDER BY last_name ASC;
 



