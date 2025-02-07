/*
Summary:
1. Sorting in SQL:
   - ORDER BY: Specifies the sort order of the result set
   - DESC: Sorts the result set in descending order
*/

/* Default sorting order:
 * - The default sorting order is by the primary key if no ORDER BY clause is specified
 */

-- ------------------------------------------------------------------------------------
-- Query 1: Select all customers without sorting
-- Select From: 'customers' table
-- Note: No ORDER BY clause means the result is in default order, usually by primary key.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers;

-- ------------------------------------------------------------------------------------
-- Query 2: Select customers sorted by first name in ascending order
-- Select From: 'customers' table
-- Filter: ORDER BY first_name (ascending)
-- Note: Default sorting order is ascending (ASC) if no direction is specified
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
ORDER BY first_name;

-- ------------------------------------------------------------------------------------
-- Query 3: Select customers sorted by first name in descending order
-- Select From: 'customers' table
-- Filter: ORDER BY first_name DESC (descending)
-- Note: DESC sorts results in descending order
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
ORDER BY first_name DESC;

-- ------------------------------------------------------------------------------------
-- Query 4: Select customers sorted by state (DESC) and first name (ASC)
-- Select From: 'customers' table
-- Filter: ORDER BY state DESC, first_name (ascending by default)
-- Note: Multiple columns can be used for sorting
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
ORDER BY state DESC, first_name;

-- ------------------------------------------------------------------------------------
-- Query 5: Select first name and last name, sorted by birth_date
-- Select From: 'customers' table
-- Filter: ORDER BY birth_date (ascending by default)
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT first_name, last_name
FROM customers
ORDER BY birth_date;

-- ------------------------------------------------------------------------------------
-- Query 6: Select first name, last name, and 10 as points, sorted by points and first name
-- Select From: 'customers' table
-- Filter: ORDER BY points, first_name
-- Note: Constant value '10' is treated like a column in the ORDER BY clause
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT first_name, last_name, 10 AS points
FROM customers
ORDER BY points, first_name;

-- ------------------------------------------------------------------------------------
-- Query 7: Select first name and last name, sorted by the first and second columns (avoid in production)
-- Select From: 'customers' table
-- Filter: ORDER BY 1, 2 (Positional ordering, should be avoided in production)
-- Note: Avoid using column positions (1, 2) in production code for readability
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT first_name, last_name
FROM customers
ORDER BY 1, 2;

-- ------------------------------------------------------------------------------------
-- Query 8: Select all columns, calculate total_price, sorted by total_price (DESC)
-- Select From: 'order_items' table
-- Filter: WHERE order_id = 2, ORDER BY total_price DESC
-- Note: Sorting by a calculated field (total_price)
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC;
