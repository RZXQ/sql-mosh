-- How Outer Joins Work:
-- 1. Start with all rows from the left table.
-- 2. For each row in the left table, attempt to find matching rows in the right table based on the 'ON' condition.
-- 3. If a match is found:
--    - Combine the left table row with the matching right table row(s).
-- 4. If no match is found:
--    - Combine the left table row with NULLs for all columns from the right table.
-- This process ensures that all rows from the left table are included in the result set,
-- with corresponding data from the right table when available.

USE sql_store;

-- Selects 'customer_id' and 'first_name' from 'customers' table, 'order_id' from 'orders' table
-- Joins 'customers' with 'orders' using INNER JOIN
-- On condition: matching 'customer_id' in both tables
-- Note: INNER JOIN excludes customers without orders
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id;

-- Selects 'customer_id' and 'first_name' from 'customers' table, 'order_id' from 'orders' table
-- Joins 'customers' with 'orders' using LEFT JOIN
-- On condition: matching 'customer_id' in both tables
-- Note: LEFT JOIN includes all customers, even those without orders
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
         LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Selects 'customer_id' and 'first_name' from 'customers' table, 'order_id' from 'orders' table
-- Joins 'customers' with 'orders' using RIGHT JOIN
-- On condition: matching 'customer_id' in both tables
-- Note: RIGHT JOIN includes all orders, even if there are no matching customers
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
         RIGHT JOIN orders o ON c.customer_id = o.customer_id;
-- Selects 'product_id' and 'name' from 'products' table, 'quantity' from 'order_items' table
-- Joins 'products' with 'order_items' using LEFT JOIN
-- On condition: matching 'product_id' in both tables
-- Note: LEFT JOIN includes all products, even if they are not in any order
SELECT p.product_id, p.name, oi.quantity
FROM products p
         LEFT JOIN order_items oi ON p.product_id = oi.product_id;