-- Task: Reset primary and foreign keys for the 'orders' table in 'sql_store' database
   
-- Steps:
-- 1. Drop existing primary key from 'orders'
-- 2. Add a new primary key on 'order_id'
-- 3. Drop the existing foreign key 'fk_orders_customers'
-- 4. Add a foreign key on 'customer_id' referencing 'customers(customer_id)' with ON UPDATE CASCADE and ON DELETE RESTRICT

USE sql_store;

SHOW TABLES;

ALTER TABLE orders
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (order_id),
    DROP FOREIGN KEY fk_orders_customers,
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT;