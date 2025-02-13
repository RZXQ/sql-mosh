-- ------------------------------------------------------------------------------------
-- Query: Retrieve customer details along with their orders and assigned shipper.
-- Select:
--   - customer_id, first_name from customers
--   - order_id from orders
--   - name (as shipper) from shippers
-- From: customers (c)
-- Join:
--   - LEFT JOIN orders (o) on c.customer_id = o.customer_id
--   - LEFT JOIN shippers (sh) on o.shipper_id = sh.shipper_id
-- Note:
--   - Includes all customers, even those without orders.
--   - Includes orders even if no shipper is assigned.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT c.customer_id, c.first_name, o.order_id, sh.name AS shipper
FROM customers c
         LEFT JOIN orders o ON c.customer_id = o.customer_id
         LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve order details, including customer name, shipper name, and order status.
-- Select:
--   - order_id, order_date from orders
--   - first_name (as customer) from customers
--   - name (as shipper) from shippers
--   - name (as status) from order_statuses
-- From: orders (o)
-- Join:
--   - INNER JOIN customers (c) on o.customer_id = c.customer_id
--   - LEFT JOIN shippers (sh) on o.shipper_id = sh.shipper_id
--   - INNER JOIN order_statuses (os) on o.status = os.order_status_id
-- Note:
--   - Includes all orders with valid customers and their statuses.
--   - Orders are included even if no shipper is assigned.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT o.order_id,
       o.order_date,
       c.first_name AS customer,
       sh.name      AS shipper,
       os.name      AS status
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id
         LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id
         JOIN order_statuses os ON o.status = os.order_status_id;
