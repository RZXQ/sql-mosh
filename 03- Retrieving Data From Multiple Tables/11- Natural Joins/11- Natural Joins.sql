USE sql_store;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve order ID and customer first name using NATURAL JOIN
-- Select: 'order_id' from 'orders', 'first_name' from 'customers'
-- From: 'orders' (aliased as 'o')
-- Join: NATURAL JOIN with 'customers' (aliased as 'c') 
--       (automatically joins on all columns with identical names, such as 'customer_id')
-- Note: NATURAL JOIN can lead to unpredictable behavior if additional columns share the same name 
--       or if schema changes occur over time. Explicit JOINs (e.g., USING or ON) are generally preferred.
-- ------------------------------------------------------------------------------------
SELECT o.order_id, c.first_name
FROM orders o
         NATURAL JOIN customers c;
