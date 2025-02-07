-- ------------------------------------------------------------------------------------
-- Query 1: Select customers born after 1990-01-01 with points > 1000
-- Select From: 'customers' table
-- Filter: birth_date > '1990-01-01' AND points > 1000
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE birth_date > '1990-01-01'
  AND points > 1000;

-- ------------------------------------------------------------------------------------
-- Query 2: Select customers born after 1990-01-01 OR (points > 1000 AND state = 'VA')
-- Select From: 'customers' table
-- Filter: birth_date > '1990-01-01' OR (points > 1000 AND state = 'VA')
-- Note: Parentheses ensure correct precedence of `AND` over `OR`
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE birth_date > '1990-01-01'
   OR (points > 1000 AND state = 'VA');

-- ------------------------------------------------------------------------------------
-- Query 3: Select customers NOT born after 1990-01-01 AND NOT having points > 1000
-- Select From: 'customers' table
-- Filter: NOT (birth_date > '1990-01-01' OR points > 1000)
-- Note: Using **De Morgan’s Law**, this is equivalent to Query 4
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE NOT (birth_date > '1990-01-01' OR points > 1000);

-- ------------------------------------------------------------------------------------
-- Query 4: Select customers born on or before 1990-01-01 AND points ≤ 1000
-- Select From: 'customers' table
-- Filter: birth_date <= '1990-01-01' AND points <= 1000
-- Note: Equivalent to Query 3 but rewritten without `NOT` (De Morgan’s Law)
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE birth_date <= '1990-01-01'
  AND points <= 1000;

-- ------------------------------------------------------------------------------------
-- Query 5: Select order items from order_id 6 where total price > 30
-- Select From: 'order_items' table
-- Filter: order_id = 6 AND (unit_price * quantity) > 30
-- Note: Multiplication has higher precedence than `AND`, so parentheses are optional
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM order_items
WHERE order_id = 6
  AND (unit_price * quantity) > 30;
