SELECT * FROM customer;

SELECT * FROM order_;


-- INNER JOIN or JOIN
SELECT *
FROM customer
JOIN order_ -- INNER JOIN = JOIN
ON customer.customer_id = order_.customer_id;


-- LEFT JOIN
SELECT first_name, last_name, customer.customer_id, order_.customer_id, amount
FROM customer -- LEFT TABLE
LEFT JOIN order_ -- RIGHT TABLE
ON customer.customer_id = order_.customer_id;


-- RIGHT JOIN
SELECT first_name, last_name, customer.customer_id, order_.customer_id, amount
FROM customer -- LEFT TABLE
RIGHT JOIN order_ -- RIGHT TABLE
ON customer.customer_id = order_.customer_id;


-- FULL JOIN
SELECT *
FROM customer
FULL JOIN order_
ON customer.customer_id = order_.customer_id;


SELECT c.first_name, c.last_name, c.email, o.amount, o.order_date
FROM customer as c
JOIN order_ as o
ON c.customer_id = o.customer_id