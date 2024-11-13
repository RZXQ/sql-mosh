USE sql_store;

-- Selects 'customer_id' and 'first_name' from 'customers' table, 'order_id' from the result of joining 'customers' and 'orders',
-- and 'name' from 'shippers' table as 'shipper'
-- First joins 'customers' with 'orders' using LEFT JOIN to include all customers, even those without orders
-- Then joins the resulting table with 'shippers' using LEFT JOIN to include all customers and their orders, even if an order has no assigned shipper
SELECT c.customer_id, c.first_name, o.order_id, sh.name AS shipper
FROM customers c
         LEFT JOIN orders o ON c.customer_id = o.customer_id
         LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;

-- Selects 'order_id' and 'order_date' from 'orders' table, 'first_name' from 'customers' as 'customer',
-- 'name' from 'shippers' as 'shipper', and 'name' from 'order_statuses' as 'status'
-- Joins 'orders' with 'customers' using INNER JOIN because each order must have a customer
-- Joins the resulting table with 'shippers' using LEFT JOIN to include all orders, even those without a shipper
-- Joins the resulting table with 'order_statuses' using INNER JOIN as each order must have a valid status
SELECT o.order_id, o.order_date, c.first_name AS customer, sh.name AS shipper, os.name AS status
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id
         LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id
         JOIN order_statuses os ON o.status = os.order_status_id;