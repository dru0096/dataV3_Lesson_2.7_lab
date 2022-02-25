/* How many films are there for each of the categories in the category table.
 Use appropriate join to write this query. */
 
 USE sakila
 
 SELECT  cat.name, count(fc.film_id) as "Number of films" FROM sakila.film_category as fc
 JOIN sakila.category as cat
 ON fc.category_id = cat.category_id
 GROUP BY cat.name;
 
 /* Display the total amount rung up by each staff member in August of 2005. */
 
SELECT st.staff_id, sum(p.amount) as "Total_Amount"
FROM sakila.staff as st
JOIN sakila.payment as p
ON st.staff_id = p.staff_id
WHERE month(p.payment_date) = 8 and year(p.payment_date) = 2005
GROUP BY st.staff_id;
 
SELECT month(payment_date), year(payment_date) FROM payment;

 /* 3. Which actor has appeared in the most films?  Answer: Susan Davis*/
 
 SELECT concat(a.first_name,' ',a.last_name) as "Actor Name", count(fa.film_id)
 FROM sakila.actor as a
 JOIN sakila.film_actor as fa
 ON a.actor_id=fa.actor_id
 GROUP BY concat(a.first_name,' ',a.last_name)
 ORDER BY count(fa.film_id) DESC;
 
/* 4. Most active customer (the customer that has rented the most number of films)  Answer: Eleanor Hunt*/

SELECT concat(c.first_name,' ',c.last_name) as "Customer Name", count(r.rental_id) 
FROM sakila.customer as c
JOIN sakila.rental as r
ON c.customer_id = r.customer_id
GROUP BY concat(c.first_name,' ',c.last_name)
ORDER BY count(r.rental_id) DESC; 

/* 5. Display the first and last names, as well as the address, of each staff member. */


SELECT s.first_name, s.last_name, a.address, a.city_id, a.postal_code
FROM sakila.staff as s
JOIN sakila.address as a
ON s.address_id = a.address_id;


/* 6. List each film and the number of actors who are listed for that film. */

SELECT f.title, count(actor_id) as "Number of Actors/Actresses" FROM sakila.film as f
JOIN sakila.film_actor as fa
ON f.film_id = fa.film_id
GROUP BY title;

/* 7. Using the tables payment and customer and the JOIN command:
		-list the total paid by each customer. 
		-List the customers alphabetically by last name. */
        
SELECT c.first_name, c.last_name, sum(p.amount) FROM sakila.customer as c
JOIN sakila.payment as p
ON c.customer_id = p.customer_id
GROUP BY first_name, last_name
ORDER BY last_name ASC;


/* 8. List number of films per category. */


SELECT  cat.name, count(fc.film_id) as "Number of films" FROM sakila.film_category as fc
 JOIN sakila.category as cat
 ON fc.category_id = cat.category_id
 GROUP BY cat.name;
