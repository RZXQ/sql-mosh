-- Query: Calculate total sales per state and city with subtotals and grand totals
-- Select:
--   - state and city (from `clients`)
--   - SUM(invoice_total) as total_sales (from `invoices`)
-- From: `invoices` joined with `clients`
-- Join: Combines `invoices` and `clients` on client_id
-- Group By: state and city
-- Modifier: WITH ROLLUP adds subtotals (for each state) and a grand total (for all states)
USE sql_invoicing;
SELECT state, city, SUM(invoice_total) AS total_sales
FROM invoices i
         JOIN clients c USING (client_id)
GROUP BY state, city
WITH ROLLUP;

-- Query: Calculate total payments per payment method with subtotals and grand totals
-- Select:
--   - payment_method name (from `payment_methods`)
--   - SUM(amount) as total (from `payments`)
-- From: `payments` joined with `payment_methods`
-- Join: Combines `payments` and `payment_methods` on payment_method_id
-- Group By: payment_method name
-- Modifier: WITH ROLLUP adds subtotals (for each payment method) and a grand total (for all methods)
USE sql_invoicing;
SELECT pm.name AS payment_method, SUM(p.amount) AS total
FROM payments p
         JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY pm.name
WITH ROLLUP;
