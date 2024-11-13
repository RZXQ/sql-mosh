-- Selects all columns from 'order_items' table
-- Joins 'order_items' with 'order_item_notes' table from 'sql_store' database
-- On condition: matching both 'order_id' and 'product_id' in both tables as a composite key
USE sql_store;
SELECT *
FROM order_items oi
         JOIN order_item_notes oin
              ON oi.order_id = oin.order_id
                  AND oi.product_id = oin.product_id;