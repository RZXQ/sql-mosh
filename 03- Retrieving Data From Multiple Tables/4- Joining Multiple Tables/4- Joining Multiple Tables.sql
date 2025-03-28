-- ------------------------------------------------------------------------------------
-- Query: Retrieve order details, customer details, and order status
-- Select: order_id, order_date from orders; first_name, last_name from customers;
--         name (as status) from order_statuses
-- From: orders (o)
-- Join: customers (c) ON o.customer_id = c.customer_id
-- Join: order_statuses (os) ON o.status = os.order_status_id
-- Note: This query joins the orders table with customers to get customer details
--       and order_statuses to retrieve the order's status name.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT o.order_id, c.customer_id, os.order_status_id
FROM orders o
         RIGHT JOIN customers c ON o.customer_id = c.customer_id
         LEFT JOIN order_statuses os ON o.order_id = os.order_status_id;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve payment details, client name, and payment method
-- Select: date, invoice_id, amount from payments; name from clients;
--         name from payment_methods
-- From: payments (p)
-- Join: clients (c) ON p.client_id = c.client_id
-- Join: payment_methods (pm) ON p.payment_method = pm.payment_method_id
-- Note: This query links payments to clients for client names and payment_methods
--       to get the corresponding payment method name.
-- ------------------------------------------------------------------------------------
USE sql_invoicing;
