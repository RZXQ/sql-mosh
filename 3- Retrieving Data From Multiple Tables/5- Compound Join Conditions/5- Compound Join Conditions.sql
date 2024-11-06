-- 1. Switch to the specific database 'sql_store'
USE sql_store;

-- 2. Retrieve all columns from the 'order_items' table.
-- 3. Perform an INNER JOIN with the 'order_item_notes' table
--    - The JOIN is based on two conditions:
--        a. 'order_id' columns from both tables must match
--        b. 'product_id' columns from both tables must match
SELECT *
FROM order_items oi -- Alias for order_items table (oi)
         JOIN order_item_notes oin -- Alias for order_item_notes table (oin)
              ON oi.order_id = oin.order_Id -- Condition: Matching order_id
                  AND oi.product_id = oin.product_id; -- Condition: Matching product_id (compound join condition)