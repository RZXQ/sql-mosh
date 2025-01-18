-- Query: Retrieve customer details, their orders, and assigned shipper
-- Select: customer_id, first_name from customers; order_id from orders; name (as shipper) from shippers
-- From: customers (c)
-- Join: orders (o) on c.customer_id = o.customer_id using LEFT JOIN
-- Join: shippers (sh) on o.shipper_id = sh.shipper_id using LEFT JOIN
-- Note: Includes all customers, even those without orders, and includes orders without shippers
USE sql_store;
SELECT c.customer_id, c.first_name, o.order_id, sh.name AS shipper
FROM customers c
         LEFT JOIN orders o ON c.customer_id = o.customer_id
         LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id;

-- Query: Retrieve order details, customer name, shipper name, and order status
-- Select: order_id, order_date from orders; first_name (as customer) from customers; name (as shipper) from shippers; name (as status) from order_statuses
-- From: orders (o)
-- Join: customers (c) on o.customer_id = c.customer_id using INNER JOIN
-- Join: shippers (sh) on o.shipper_id = sh.shipper_id using LEFT JOIN
-- Join: order_statuses (os) on o.status = os.order_status_id using INNER JOIN
-- Note: Includes all orders with customers and their statuses, even if the order has no shipper
USE sql_store;
SELECT o.order_id, o.order_date, c.first_name AS customer, sh.name AS shipper, os.name AS status
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id
         LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id
         JOIN order_statuses os ON o.status = os.order_status_id;
