USE sql_store;

-- Selects all columns from 'order_items' table
-- Joins 'order_items' with 'products' table from 'sql_inventory' database
-- On condition: matching 'product_id' in both tables
SELECT *
FROM order_items oi
         JOIN sql_inventory.products p
              ON oi.product_id = p.product_id;