-- Use USING when joining tables with identically named columns.

-- Query: Retrieve order ID, customer name, and shipper name
-- Select: order_id from orders; first_name from customers; name from shippers
-- From: orders (o)
-- Join: customers (c) using customer_id with INNER JOIN (column must exist in both tables)
-- Join: shippers (sh) using shipper_id with LEFT JOIN (includes orders with or without a shipper)
USE sql_store;
SELECT o.order_id, c.first_name, sh.name
FROM orders o
         JOIN customers c USING (customer_id)
         LEFT JOIN shippers sh USING (shipper_id);

-- Query: Retrieve all columns from order_items and order_item_notes
-- Select: all columns from order_items and order_item_notes
-- From: order_items
-- Join: order_item_notes using composite key (order_id, product_id) with INNER JOIN
-- Note: Composite keys ensure a match on both order_id and product_id
USE sql_store;
SELECT *
FROM order_items
         JOIN order_item_notes USING (order_id, product_id);

-- Query: Retrieve payment details with client name and payment method
-- Select: date, amount from payments; name from clients; name from payment_methods
-- From: payments (p)
-- Join: clients (c) using client_id with INNER JOIN (every payment must have a client)
-- Join: payment_methods (pm) on payment_method_id with INNER JOIN (link payments to methods)
USE sql_invoicing;
SELECT p.date, c.name, p.amount, pm.name
FROM payments p
         JOIN clients c USING (client_id)
         JOIN payment_methods pm ON p.payment_method = pm.payment_method_id;
