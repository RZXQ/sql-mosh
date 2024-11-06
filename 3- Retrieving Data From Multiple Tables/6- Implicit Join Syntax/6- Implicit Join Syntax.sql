-- 1. Switch to the specific database 'sql_store'
USE sql_store;

-- 2. The following are examples of explicit and implicit JOIN syntax:
-- 2.1. Explicit JOIN syntax (recommended way):
--      - Provides clear visibility of the JOIN operation.
-- SELECT *
-- FROM orders o
--      JOIN customers c
--           ON o.customer_id = c.customer_id;

-- 2.2. Implicit JOIN syntax (not recommended):
--      - This approach lists tables in the FROM clause and places the join condition in the WHERE clause.
--      - Warning: Omitting the WHERE clause results in a CROSS JOIN (every record in one table 
--        joins with every record in the other table).
SELECT *
FROM orders o,
     customers c
WHERE o.customer_id = c.customer_id; -- JOIN condition: matching customer_id in both tables