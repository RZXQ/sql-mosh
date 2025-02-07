/*
Summary:
1. Null checks in SQL:
   - IS NULL: Checks if a column contains NULL values
   - IS NOT NULL: Checks if a column does not contain NULL values
*/

-- ------------------------------------------------------------------------------------
-- Query 1: Select customers whose phone number is NULL
-- Select From: 'customers' table
-- Filter: phone IS NULL
-- Note: `IS NULL` checks for records where the phone number is not provided
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE phone IS NULL;

-- ------------------------------------------------------------------------------------
-- Query 2: Select customers whose phone number is NOT NULL
-- Select From: 'customers' table
-- Filter: phone IS NOT NULL
-- Note: `IS NOT NULL` selects records where the phone number is available
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- ------------------------------------------------------------------------------------
-- Query 3: Select orders where shipped_date is NULL
-- Select From: 'orders' table
-- Filter: shipped_date IS NULL
-- Note: Checks for orders that have not been shipped (no shipped_date available)
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM orders
WHERE shipped_date IS NULL;
