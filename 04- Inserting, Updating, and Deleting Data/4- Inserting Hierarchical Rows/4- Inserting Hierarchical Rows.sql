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
-- Note: Uses LAST_INSERT_ID() to reference the last inserted 'order_id'.
--       However, since LAST_INSERT_ID() remains the same during a session, both records
--       will use the same 'order_id', ensuring they are linked to the same order.
-- ------------------------------------------------------------------------------------
USE sql_store;
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (LAST_INSERT_ID(), 1, 1, 2.95),
       (LAST_INSERT_ID(), 2, 1, 3.95);
