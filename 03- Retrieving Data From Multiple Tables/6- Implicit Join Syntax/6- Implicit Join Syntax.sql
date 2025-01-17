-- Query: Retrieve all columns from orders and customers using explicit join syntax
-- Select: all columns from orders and customers
-- From: orders (o)
-- Join: customers (c) on o.customer_id = c.customer_id
USE sql_store;
SELECT *
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id;

-- Query: Retrieve all columns from orders and customers using implicit join syntax
-- Select: all columns from orders and customers
-- From: orders (o), customers (c)
-- Condition: o.customer_id = c.customer_id (specified in WHERE clause)
-- Note: Implicit join syntax uses the WHERE clause and is equivalent to an inner join
USE sql_store;
SELECT *
FROM orders o,
     customers c
WHERE o.customer_id = c.customer_id;
