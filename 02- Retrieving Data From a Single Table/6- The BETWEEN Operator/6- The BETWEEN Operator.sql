-- ------------------------------------------------------------------------------------
-- Query 1: Select customers with points between 1000 and 3000 (inclusive)
-- Select From: 'customers' table
-- Filter: points BETWEEN 1000 AND 3000
-- Note: `BETWEEN` includes both 1000 and 3000.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;

-- ------------------------------------------------------------------------------------
-- Query 2: Select customers born between 1990-01-01 and 2000-01-01 (inclusive)
-- Select From: 'customers' table
-- Filter: birth_date BETWEEN '1990-01-01' AND '2000-01-01'
-- Note: `BETWEEN` includes both boundary dates.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';
