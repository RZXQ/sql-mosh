-- Query: Retrieve clients without invoices (using LEFT JOIN)
-- Select:
--   - All columns from `clients`
-- Join:
--   - `clients` with `invoices` on client_id using a LEFT JOIN
-- Filter: Includes rows where no matching invoice exists (invoice_id IS NULL)
USE sql_invoicing;
SELECT *
FROM clients
         LEFT JOIN invoices USING (client_id)
WHERE invoice_id IS NULL;

-- Query: Retrieve customers who have ordered Lettuce (id = 3) using subqueries
-- Select:
--   - customer_id, first_name, last_name from `customers`
-- Filter: Includes customers whose customer_id matches orders that contain product_id = 3
-- Note: Uses nested subqueries to find matching orders and order items
USE sql_store;
SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN (SELECT customer_id
                      FROM orders
                      WHERE order_id IN (SELECT order_id
                                         FROM order_items
                                         WHERE product_id = 3));

-- Query: Retrieve customers who have ordered Lettuce (id = 3) using JOINs
-- Select:
--   - customer_id, first_name, last_name from `customers`
-- Join:
--   - `customers` with `orders` on customer_id
--   - `orders` with `order_items` on order_id
-- Filter: Includes rows where product_id = 3
-- Note: Uses DISTINCT to ensure unique customers in the result
USE sql_store;
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customers c
         JOIN orders o USING (customer_id)
         JOIN order_items oi USING (order_id)
WHERE oi.product_id = 3;
