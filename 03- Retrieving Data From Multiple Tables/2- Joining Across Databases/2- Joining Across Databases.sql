-- ------------------------------------------------------------------------------------
-- Query: Retrieve all columns from order_items and join with products from sql_inventory
-- Select: all columns from order_items
-- From: order_items (oi)
-- Join: sql_inventory.products (p)
-- Condition: oi.product_id = p.product_id
-- Note: Make sure both order_items and sql_inventory.products tables are accessible.
--       Ensure that product_id exists in both tables for a successful join.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM order_items oi
         JOIN sql_inventory.products p
              ON oi.product_id = p.product_id;
