-- How Outer Joins work:
-- 1. Cross Join: First, it creates what is known as a Cartesian product (cross join) of the two participating tables.
--    This means that each row from the left table is combined with each row from the right table.
-- 2. Apply the 'ON' Clause: The next step is to apply the join condition specified in the 'ON' clause.
--    It filters the Cartesian product to only include rows where the condition evaluates to 'TRUE'.
-- 3. Include All Left Rows: For rows in the left table that do not find any matching rows in the right table
--    based on the 'ON' condition, the result will include these rows with 'NULL' values for columns from the right table.
--    Essentially, the 'LEFT JOIN' ensures that all rows from the left table appear in the result set.

USE sql_store;

-- Selects 'customer_id' and 'first_name' from 'customers' table, 'order_id' from 'orders' table
-- Joins 'customers' with 'orders' using INNER JOIN
-- On condition: matching 'customer_id' in both tables
-- Note: INNER JOIN excludes customers without orders
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
         INNER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Selects 'customer_id' and 'first_name' from 'customers' table, 'order_id' from 'orders' table
-- Joins 'customers' with 'orders' using LEFT JOIN
-- On condition: matching 'customer_id' in both tables
-- Note: LEFT JOIN includes all customers, even those without orders
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
         LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Selects 'customer_id' and 'first_name' from 'customers' table, 'order_id' from 'orders' table
-- Joins 'customers' with 'orders' using RIGHT JOIN
-- On condition: matching 'customer_id' in both tables
-- Note: RIGHT JOIN includes all orders, even if there are no matching customers
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
         RIGHT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Selects 'product_id' and 'name' from 'products' table, 'quantity' from 'order_items' table
-- Joins 'products' with 'order_items' using LEFT JOIN
-- On condition: matching 'product_id' in both tables
-- Note: LEFT JOIN includes all products, even if they are not in any order
SELECT p.product_id, p.name, oi.quantity
FROM products p
         LEFT JOIN order_items oi ON p.product_id = oi.product_id;
