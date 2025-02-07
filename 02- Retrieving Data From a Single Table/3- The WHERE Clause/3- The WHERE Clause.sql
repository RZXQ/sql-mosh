-- ------------------------------------------------------------------------------------
-- Query 1: Select customers with points greater than 3000
-- Select From: 'customers' table
-- Filter: points > 3000
-- Note: Retrieves all columns for customers with more than 3000 points
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE points > 3000;

-- ------------------------------------------------------------------------------------
-- Query 2: Select customers where the state is 'VA'
-- Select From: 'customers' table
-- Filter: state = 'VA'
-- Note: In MySQL, string comparisons are case-insensitive by default unless the column
--       uses a binary collation. This query will match 'va', 'VA', 'Va', etc.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE state = 'VA';

-- ------------------------------------------------------------------------------------
-- Query 3: Select customers where the state is not 'VA'
-- Select From: 'customers' table
-- Filter: state != 'VA'
-- Note: The `!=` operator is equivalent to `<>` in SQL.
--       In MySQL, this string comparison is case-insensitive by default.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE state != 'VA';

-- ------------------------------------------------------------------------------------
-- Query 4: Select customers born after January 1, 1990
-- Select From: 'customers' table
-- Filter: birth_date > '1990-01-01'
-- Note: Dates must be in 'YYYY-MM-DD' format. MySQL correctly handles date comparisons.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE birth_date > '1990-01-01';

-- ------------------------------------------------------------------------------------
-- Query 5: Select orders placed on or after January 1, 2019
-- Select From: 'orders' table
-- Filter: order_date >= '2019-01-01'
-- Note: Includes all orders placed on January 1, 2019, and later.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM orders
WHERE order_date >= '2019-01-01';
