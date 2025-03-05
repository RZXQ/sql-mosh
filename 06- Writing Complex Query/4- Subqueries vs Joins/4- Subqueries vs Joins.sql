-- ------------------------------------------------------------------------------------
-- Query: Retrieve clients without invoices (using LEFT JOIN)
-- Select: All columns from 'clients'
-- Join: 'clients' with 'invoices' on client_id using LEFT JOIN
-- Filter (WHERE): invoice_id IS NULL (means no matching record in 'invoices')
-- ------------------------------------------------------------------------------------
USE sql_invoicing;
SELECT *
FROM clients
         LEFT JOIN invoices USING (client_id)
WHERE invoice_id IS NULL;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve customers who have ordered Lettuce (id = 3) using subqueries
-- Select: customer_id, first_name, last_name from 'customers'
-- Filter (WHERE): customer_id IN (SELECT customer_id FROM orders WHERE order_id IN
--                                 (SELECT order_id FROM order_items WHERE product_id = 3))
-- Note: Uses nested subqueries to filter customers who ordered product_id = 3
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN (SELECT customer_id
                      FROM orders
                      WHERE order_id IN (SELECT order_id
                                         FROM order_items
                                         WHERE product_id = 3));

-- ------------------------------------------------------------------------------------
-- Query: Retrieve customers who have ordered Lettuce (id = 3) using JOINs
-- Select: DISTINCT customer_id, first_name, last_name from 'customers'
-- Join: 'customers' with 'orders' (on customer_id), and 'orders' with 'order_items' (on order_id)
-- Filter (WHERE): oi.product_id = 3
-- Note: DISTINCT ensures each customer appears only once
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customers c
         JOIN orders o USING (customer_id)
         JOIN order_items oi USING (order_id)
WHERE oi.product_id = 3;
