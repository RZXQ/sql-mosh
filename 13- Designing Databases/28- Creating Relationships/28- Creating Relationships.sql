USE sql_store2;

--   'order_id' as primary key
--   'customer_id' (foreign key to 'customers.customer_id')
--   Cascade on update, restrict on delete

DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
    order_id    INT PRIMARY KEY, -- primary key not null and unique
    customer_id INT NOT NULL,
    FOREIGN KEY fk_orders_customers (customer_id) REFERENCES customers (customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);