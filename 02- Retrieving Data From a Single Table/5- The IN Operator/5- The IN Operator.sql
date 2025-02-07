-- ------------------------------------------------------------------------------------
-- Query 1: Select customers residing in 'VA', 'GA', or 'FL'
-- Select From: 'customers' table
-- Filter: state IN ('VA', 'GA', 'FL')
-- Note: `IN` is a shorthand for multiple `OR` conditions.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE state IN ('VA', 'GA', 'FL');

-- ------------------------------------------------------------------------------------
-- Query 2: Select products with quantity in stock of 49, 38, or 72
-- Select From: 'products' table
-- Filter: quantity_in_stock IN (49, 38, 72)
-- Note: `IN` improves readability over multiple `OR` statements.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72);

-- ------------------------------------------------------------------------------------
-- Query 3: Select customers who do NOT reside in 'VA', 'GA', or 'FL'
-- Select From: 'customers' table
-- Filter: state NOT IN ('VA', 'GA', 'FL')
-- Note: `NOT IN` excludes the specified states.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE state NOT IN ('VA', 'GA', 'FL');
