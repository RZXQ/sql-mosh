-- 1. Switch to the 'sql_store' database to retrieve order details
USE sql_store;

-- 2. Query to join multiple tables: orders, customers, and order_statuses
SELECT o.order_id,       -- Order ID from 'orders'
       o.order_date,     -- Order date from 'orders'
       c.first_name,     -- Customer's first name from 'customers'
       c.last_name,      -- Customer's last name from 'customers'
       os.name AS status -- Order status name from 'order_statuses', renamed as 'status'
FROM orders o -- Main table: 'orders', alias as 'o'
         JOIN customers c -- Join 'customers' to get customer details
              ON o.customer_id = c.customer_id -- Match each order's customer ID with customer's ID
         JOIN order_statuses os -- Join 'order_statuses' to get the status name
              ON o.status = os.order_status_id;
-- Match order's status with corresponding status ID


-- --- Exercise Section ---
-- 3. Switch to the 'sql_invoicing' database to retrieve payment details
USE sql_invoicing;

-- 4. Query to join multiple tables: payments, clients, and payment_methods
SELECT p.date,                 -- Payment date from 'payments'
       p.invoice_id,           -- Invoice ID linked to the payment
       p.amount,               -- Payment amount
       c.name  AS client_name, -- Client's name from 'clients', renamed as 'client_name'
       pm.name AS method       -- Payment method name from 'payment_methods', renamed as 'method'
FROM payments p -- Main table: 'payments', alias as 'p'
         JOIN clients c -- Join 'clients' to get client details
              ON p.client_id = c.client_id -- Match each payment's client ID with client's ID
         JOIN payment_methods pm -- Join 'payment_methods' to get method name
              ON p.payment_method = pm.payment_method_id; -- Match payment's method ID with method's ID