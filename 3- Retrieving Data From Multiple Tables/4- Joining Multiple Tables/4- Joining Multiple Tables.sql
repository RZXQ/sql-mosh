-- Selects 'order_id' and 'order_date' from 'orders' table
-- Selects 'first_name' and 'last_name' from 'customers' table for customer details
-- Selects 'name' from 'order_statuses' table as 'status' for order status description
-- Joins 'orders' table with 'customers' table from 'sql_store' database on condition: 'customer_id' matches
-- Joins 'orders' table with 'order_statuses' table from 'sql_store' database on condition: 'status' matches 'order_status_id'
USE sql_store;
SELECT o.order_id, o.order_date, c.first_name, c.last_name, os.name AS status
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id
         JOIN order_statuses os ON o.status = os.order_status_id;


-- Selects 'date', 'invoice_id', and 'amount' from 'payments' table
-- Selects 'name' from 'clients' table for client name
-- Selects 'name' from 'payment_methods' table for payment method name
-- Joins 'payments' table with 'clients' table from 'sql_invoicing' database on condition: 'client_id' matches
-- Joins 'payments' table with 'payment_methods' table from 'sql_invoicing' database on condition: 'payment_method' matches 'payment_method_id'
USE sql_invoicing;
SELECT p.date, p.invoice_id, p.amount, c.name, pm.name
FROM payments p
         JOIN clients c ON p.client_id = c.client_id
         JOIN payment_methods pm ON p.payment_method = pm.payment_method_id;