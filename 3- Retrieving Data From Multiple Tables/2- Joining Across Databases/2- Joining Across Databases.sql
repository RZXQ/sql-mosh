/*
Summary:
1. Database Context:
   - `USE sql_inventory;` sets the current database for the session.
   - Use table prefixes only for tables outside the current database.
*/

-- 1. Set the current database to `sql_inventory` so unprefixed tables default to this database.
USE sql_inventory;

-- 2. Retrieve Order Item and Product Details
-- - Joins `order_items` from `sql_store` with `products` in `sql_inventory`.
-- - Retrieves all columns from both tables.
SELECT * -- 2.1 Selects all columns from both `order_items` and `products` tables
FROM sql_store.order_items oi -- 2.2 Uses prefix `sql_store` for `order_items` since it’s outside the current database
         JOIN
     products p -- 2.3 No prefix needed for `products` as it's in the `sql_inventory` database
     ON oi.product_id = p.product_id; -- 2.4 Joins rows where `product_id` matches in both tables