USE sql_store;

-- 1. Select All Columns
-- This command selects all columns from the 'customers' table.
-- Using '*' means we fetch every column available in the table.
SELECT *
FROM customers;

-- 2. Calculate Discount Factor
-- This query selects specific columns (first_name, last_name, and points) from the 'customers' table.
-- It then calculates a 'discount factor' based on the formula (points * 10) + 100.
-- 'AS' renames the result column to make it easier to identify in the output.
SELECT first_name, last_name, points, (points * 10) + 100 AS 'discount factor'
FROM customers;

-- 3. Calculate New Price for Products
-- This query selects 'name' and 'unit_price' columns from the 'products' table.
-- It then calculates a 'new_price' by multiplying 'unit_price' by 1.1, which represents a 10% increase.
-- 'AS new_price' names the calculated column for clarity.
SELECT name, unit_price, unit_price * 1.1 AS new_price
FROM products;

-- 4. List Unique States for Customers
-- This query selects unique 'state' values from the 'customers' table.
-- 'DISTINCT' removes duplicate states, showing each state only once in the results.
SELECT DISTINCT state
FROM customers;