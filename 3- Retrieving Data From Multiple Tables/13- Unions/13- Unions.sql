-- Query: Retrieve order IDs, dates, and statuses for active and archived orders
-- Select: order_id, order_date, 'Active' as status from orders where order_date >= '2019-01-01'
-- Select: order_id, order_date, 'Archived' as status from orders where order_date < '2019-01-01'
-- Combine: Both queries using UNION to merge results
-- Note: Column names and types must match for UNION
USE sql_store;
SELECT order_id, order_date, 'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT order_id, order_date, 'Archived' AS status
FROM orders
WHERE order_date < '2019-01-01';

-- Query: Retrieve full names of customers and shippers in a single column
-- Select: first_name as full_name from customers
-- Select: name from shippers
-- Combine: Both queries using UNION to merge results
-- Note: Ensures column names are consistent across both queries
USE sql_store;
SELECT first_name AS full_name -- First Query Determines the Output Column Name
FROM customers
UNION
SELECT name
FROM shippers;

-- Query: Categorize customers based on points into Bronze, Silver, and Gold
-- Select: customers with points < 2000 as 'Bronze'
-- Select: customers with points BETWEEN 2000 AND 3000 as 'Silver'
-- Select: customers with points > 3000 as 'Gold'
-- Combine: All three queries using UNION to merge results
-- Order: By first_name in ascending order
USE sql_store;
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
