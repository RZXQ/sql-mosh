-- How Outer Joins Work:
-- 1. Include all rows from the left table.
-- 2. Match rows from the right table based on the 'ON' condition.
-- 3. If a match is found, include data from both tables.
-- 4. If no match is found, include NULLs for columns from the right table.

-- Query: Retrieve customers with orders using INNER JOIN
-- Select: customer_id, first_name from customers; order_id from orders
-- From: customers (c)
-- Join: orders (o) on c.customer_id = o.customer_id
-- Note: Excludes customers without orders
USE sql_store;
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id;

-- Query: Retrieve all customers, including those without orders, using LEFT JOIN
-- Select: customer_id, first_name from customers; order_id from orders
-- From: customers (c)
-- Join: orders (o) on c.customer_id = o.customer_id
-- Note: Includes all customers, even those without orders
USE sql_store;
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
         LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Query: Retrieve all orders, including those without matching customers, using RIGHT JOIN
-- Select: customer_id, first_name from customers; order_id from orders
-- From: customers (c)
-- Join: orders (o) on c.customer_id = o.customer_id
-- Note: Includes all orders, even if no matching customers exist
USE sql_store;
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
         RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- Query: Retrieve all products, including those not in any order, using LEFT JOIN
-- Select: product_id, name from products; quantity from order_items
-- From: products (p)
-- Join: order_items (oi) on p.product_id = oi.product_id
-- Note: Includes all products, even if they are not in any order
USE sql_store;
SELECT p.product_id, p.name, oi.quantity
FROM products p
         LEFT JOIN order_items oi ON p.product_id = oi.product_id;
