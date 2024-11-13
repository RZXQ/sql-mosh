USE sql_store;

-- Selects order IDs, order dates, and status for both active and archived orders from the 'orders' table
-- Uses UNION to combine two separate queries:
--   1. Active orders with 'Active' status where 'order_date' is on or after '2019-01-01'
--   2. Archived orders with 'Archived' status where 'order_date' is before '2019-01-01'
-- Note: The column numbers and types in both queries must match for the UNION operation
SELECT order_id, order_date, 'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT order_id, order_date, 'Archived' AS status
FROM orders
WHERE order_date < '2019-01-01';

-- Retrieves full names of all customers and shippers from 'customers' and 'shippers' tables
-- Uses UNION to combine customer names (as 'first_name') and shipper names (as 'name') into a single column, labeled as 'full_name'
-- Ensures column names are consistent across both queries for proper UNION execution
SELECT first_name AS full_name
FROM customers
UNION
SELECT name
FROM shippers;

-- Categorizes customers based on their points into 'Bronze', 'Silver', and 'Gold' types
-- 1. Retrieves customers with < 2000 points and assigns them 'Bronze' type
-- 2. Retrieves customers with 2000-3000 points (inclusive) and assigns them 'Silver' type
-- 3. Retrieves customers with > 3000 points and assigns them 'Gold' type
-- Uses UNION to combine these three customer categories into one result set
-- Orders the final result by 'first_name' in ascending order
SELECT customer_id, first_name, points, 'Bronze' AS type
FROM customers
WHERE points < 2000
UNION
SELECT customer_id, first_name, points, 'Silver' AS type
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT customer_id, first_name, points, 'Gold' AS type
FROM customers
WHERE points > 3000
ORDER BY first_name;