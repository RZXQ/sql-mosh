USE sql_store;

-- Inserts a new record into the `orders` table
-- Columns: customer_id, order_date, status
-- Values: 1, '2019-01-02', 1
INSERT INTO orders(customer_id, order_date, status)
VALUES (1, '2019-01-02', 1);

-- Inserts two records into the `order_items` table
-- Uses LAST_INSERT_ID() to reference the last inserted order_id from the `orders` table
-- Columns: order_id, item_id, product_id, list_price
-- Values for the first record: LAST_INSERT_ID(), 1, 1, 2.95
-- Values for the second record: LAST_INSERT_ID(), 2, 1, 3.95
INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 2.95),
       (LAST_INSERT_ID(), 2, 1, 3.95);