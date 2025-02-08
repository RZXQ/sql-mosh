-- ------------------------------------------------------------------------------------
-- Query: Retrieve all columns from orders and customers using explicit join syntax
-- Select: all columns from orders and customers
-- From: orders (o)
-- Join: customers (c) ON o.customer_id = c.customer_id
-- Note: This is an explicit join using the JOIN clause, which is generally preferred
--       for readability and clarity, especially when joining multiple tables.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve all columns from orders and customers using implicit join syntax
-- Select: all columns from orders and customers
-- From: orders (o), customers (c)
-- Condition: o.customer_id = c.customer_id (specified in WHERE clause)
-- Note: Implicit join syntax uses the WHERE clause for joining tables. While it is functionally
--       equivalent to the inner join, it is considered outdated and less readable compared to
--       the explicit JOIN syntax.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM orders o,
     customers c
WHERE o.customer_id = c.customer_id;