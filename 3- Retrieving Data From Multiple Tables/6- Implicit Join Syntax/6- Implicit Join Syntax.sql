USE sql_store;

-- the original query(explicit join syntax):
-- Selects all columns from 'orders' table
-- Joins 'orders' with 'customers' table from 'sql_store' database
-- On condition: matching 'customer_id' in both tables
SELECT *
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id;

-- Implicit join syntax:
-- Selects all columns from 'orders' table
-- Joins 'orders' with 'customers' table from 'sql_store' database using implicit join syntax
-- On condition: matching 'customer_id' in both tables
-- Note: Implicit join syntax (using WHERE clause for joins) is supported in MySQL but generally not recommended
SELECT *
FROM orders o,
     customers c
WHERE o.customer_id = c.customer_id;