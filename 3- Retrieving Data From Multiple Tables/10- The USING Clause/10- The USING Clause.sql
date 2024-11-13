USE sql_store;

-- Selects 'order_id' from 'orders' table, 'first_name' from 'customers' table, and 'name' from 'shippers' table
-- Joins 'orders' with 'customers' using INNER JOIN and 'USING' clause on 'customer_id' (column name must be the same in both tables)
-- Joins the resulting table with 'shippers' using LEFT JOIN and 'USING' clause on 'shipper_id' to include orders with or without a shipper
SELECT o.order_id, c.first_name, sh.name
FROM orders o
         JOIN customers c USING (customer_id)
         LEFT JOIN shippers sh USING (shipper_id);

-- Selects all columns from 'order_items' table
-- Joins 'order_items' with 'order_item_notes' using INNER JOIN and 'USING' clause on composite key ('order_id', 'product_id')
SELECT *
FROM order_items
         JOIN order_item_notes USING (order_id, product_id);

USE sql_invoicing;

-- Selects 'date' and 'amount' from 'payments' table, 'name' from 'clients' table, and 'name' from 'payment_methods' table
-- Joins 'payments' with 'clients' using INNER JOIN and 'USING' clause on 'client_id' (client must exist for each payment, so INNER JOIN is sufficient)
-- Joins 'payments' with 'payment_methods' using INNER JOIN on 'payment_method_id' to link each payment to its payment method
SELECT p.date, c.name, p.amount, pm.name
FROM payments p
         JOIN clients c USING (client_id)
         JOIN payment_methods pm ON p.payment_method = pm.payment_method_id;