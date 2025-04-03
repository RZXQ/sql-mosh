-- ====================================================================================
-- Essential Notes About LAST_INSERT_ID():
--
-- 1. The MySQL function LAST_INSERT_ID() returns the last automatically generated value
--    for an AUTO_INCREMENT PRIMARY KEY column.
--
-- 2. LAST_INSERT_ID() is only updated when a primary key (with AUTO_INCREMENT) value is
--    assigned automatically by the database.
--
-- 3. If a value is explicitly provided when inserting data, LAST_INSERT_ID() will NOT be
--    updated and will continue holding the previous generated ID.
--
-- Practical example scenario:
--     INSERT INTO table_name (auto_pk, ...) VALUES (NULL, ...); -- updates LAST_INSERT_ID()
--     INSERT INTO table_name (auto_pk, ...) VALUES (123, ...);  -- does NOT update LAST_INSERT_ID()
--
-- This behavior ensures consistency of generated IDs and prevents unexpected results.
-- ====================================================================================

-- ------------------------------------------------------------------------------------
-- Query: Insert a new order record into the 'orders' table
-- Insert Into: 'orders' table
-- Columns: customer_id, order_date, status
-- Values: (1, '2019-01-02', 1)
-- Note: Adds a new order for customer_id 1 with the specified order date and status
-- ------------------------------------------------------------------------------------
USE sql_store;
INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-02', 1);

-- ------------------------------------------------------------------------------------
-- Query: Insert two new records into the 'order_items' table
-- Insert Into: 'order_items' table
-- Columns: order_id, product_id, quantity, unit_price
-- Values for first record: (LAST_INSERT_ID(), 1, 1, 2.95)
-- Values for second record: (LAST_INSERT_ID(), 2, 1, 3.95)
-- Note: Uses LAST_INSERT_ID() to reference the last automatically inserted 'order_id'.
--       LAST_INSERT_ID() remains constant during the session until the next AUTO_INCREMENT
--       insertion, ensuring multiple inserts can reference the same parent 'order_id'.
-- ------------------------------------------------------------------------------------
USE sql_store;
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (LAST_INSERT_ID(), 1, 1, 2.95),
       (LAST_INSERT_ID(), 2, 1, 3.95);