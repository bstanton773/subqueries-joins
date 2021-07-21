-- Multi-joins
SELECT *
FROM film;

SELECT *
FROM actor;

SELECT *
FROM film_actor;

SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor
JOIN actor
ON film_actor.actor_id = actor.actor_id;


SELECT film.film_id, title, release_year, actor_id
FROM film_actor
JOIN film
ON film.film_id = film_actor.film_id;


SELECT film.film_id, title, actor.actor_id, first_name, last_name, release_year
FROM film_actor
JOIN actor
ON film_actor.actor_id = actor.actor_id
JOIN film
ON film.film_id = film_actor.film_id
WHERE actor.last_name LIKE '%s'
ORDER BY film.title;


-- SUBQUERIES

-- Two separate queries which are combined with one executing based on result of first execution

-- Find all customers that have made payments of more than 175
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175;

SELECT *
FROM customer
WHERE customer_id IN (148, 526, 178, 137, 144, 459);

-- PUT INTO SUBQUERY
SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);


-- Bad Example
-- Return a table of films based on the film_id = actor_id
SELECT *
FROM film
WHERE film_id IN (
    -- SUBQUERY is returning a list of integers
    SELECT actor_id
    FROM film_actor
    WHERE actor_id < 10
);


-- Using joins and subqueries

SELECT film.title, actor.first_name, actor.last_name, film.rental_rate
FROM film_actor
JOIN film
ON film_actor.film_id = film.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE film.film_id IN (
    SELECT film_id
    FROM film
    WHERE rental_rate >= 4.99
)
ORDER BY film.title;
