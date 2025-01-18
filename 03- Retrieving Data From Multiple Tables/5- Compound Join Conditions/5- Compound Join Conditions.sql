-- Query: Retrieve all columns from order_items and join with order_item_notes
-- Select: all columns from order_items
-- From: order_items (oi)
-- Join: order_item_notes (oin)
-- Condition: oi.order_id = oin.order_id AND oi.product_id = oin.product_id (composite key)
USE sql_store;
SELECT *
FROM order_items oi
         JOIN order_item_notes oin ON oi.order_id = oin.order_id AND oi.product_id = oin.product_id;
