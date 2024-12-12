-- Query: Calculate total sales and number of invoices per client where conditions are met
-- Select:
--   - client_id
--   - SUM(invoice_total) as total_sales
--   - COUNT(*) as number_of_invoices
-- From: `invoices` (in `sql_invoicing` database)
-- Group By: client_id
-- Filter (Having): Includes clients where total_sales > 500 and number_of_invoices > 5
-- Note: `WHERE` is used before `GROUP BY` to filter rows, and `HAVING` is used after to filter groups
USE sql_invoicing;
SELECT client_id, SUM(invoice_total) AS total_sales, COUNT(*) AS number_of_invoices
FROM sql_invoicing.invoices
GROUP BY client_id
HAVING total_sales > 500
   AND number_of_invoices > 5;

-- Query: Calculate total sales per customer in Virginia (VA) where total sales exceed 100
-- Select:
--   - customer_id, first_name, last_name (from `customers`)
--   - SUM(quantity * unit_price) as total_sales (from `order_items`)
-- From: `customers` joined with `orders` and `order_items`
-- Join:
--   - `customers` and `orders` on customer_id
--   - `orders` and `order_items` on order_id
-- Filter (Where): Includes rows where state = 'VA'
-- Group By: customer_id, first_name, last_name
-- Filter (Having): Includes customers where total_sales > 100
-- Note: `WHERE` filters rows before grouping, `HAVING` filters groups after aggregation
USE sql_store;
SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.quantity * oi.unit_price) AS total_sales
FROM customers c
         JOIN orders o USING (customer_id)
         JOIN order_items oi USING (order_id)
WHERE state IN ('VA')
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING total_sales > 100;