USE sql_store;

-- 1. Select all columns from the 'customers' table.
SELECT *
FROM customers;

-- 2. Select 'first_name', 'last_name', and 'points' from the 'customers' table; compute 'discount factor' as (points * 10) + 100.
SELECT first_name, last_name, points, (points * 10) + 100 AS 'discount factor'
FROM customers;

-- 3. Select 'name' and 'unit_price' from the 'products' table; compute 'new_price' as unit_price * 1.1.
SELECT name, unit_price, unit_price * 1.1 AS new_price
FROM products;

-- 4. Select unique 'state' values from the 'customers' table.
SELECT DISTINCT state
FROM customers;