-- ------------------------------------------------------------------------------------
-- Query 1: Retrieve all customer records
-- Select From: 'customers' table
-- Note: Fetches all columns for all customers
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers;

-- ------------------------------------------------------------------------------------
-- Query 2: Retrieve customer names and points with a computed discount factor
-- Select From: 'customers' table
-- Columns: first_name, last_name, points, computed discount factor
-- Computation: (points * 10) + 100
-- Note: 'AS' assigns an alias to the computed column
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT first_name, last_name, points, (points * 10) + 100 AS 'discount factor'
FROM customers;

-- ------------------------------------------------------------------------------------
-- Query 3: Retrieve product names, unit prices, and computed new price
-- Select From: 'products' table
-- Columns: name, unit_price, computed new_price
-- Computation: unit_price * 1.1
-- Note: 'AS' assigns an alias to the computed column
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT name, unit_price, unit_price * 1.1 AS new_price
FROM products;

-- ------------------------------------------------------------------------------------
-- Query 4: Retrieve unique states from customer records
-- Select From: 'customers' table
-- Columns: state (distinct values)
-- Note: DISTINCT ensures unique values are returned
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT DISTINCT state
FROM customers;
