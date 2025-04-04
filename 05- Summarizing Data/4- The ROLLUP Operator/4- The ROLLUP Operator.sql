-- How WITH ROLLUP Works in MySQL:
-- 1. Purpose: WITH ROLLUP is a modifier used with GROUP BY to generate subtotals and a grand total for grouped data.
-- 2. Base Grouping: GROUP BY first groups rows based on the specified columns (e.g., state, city) and applies aggregate functions (e.g., SUM).
-- 3. Rollup Process: WITH ROLLUP then adds extra rows to the result set:
--    - Subtotals: For each level of grouping, it calculates aggregates by "rolling up" the groups hierarchically.
--    - Grand Total: It calculates an aggregate for all rows combined.
-- 4. Hierarchy: Rollup works based on the order of columns in GROUP BY:
--    - For GROUP BY A, B:
--      - (A, B): Base grouping.
--      - (A, NULL): Subtotal for each A (aggregating across all B values).
--      - (NULL, NULL): Grand total for all rows.
--    - For GROUP BY A:
--      - (A): Base grouping.
--      - (NULL): Grand total for all rows.
-- 5. NULL Values: In rollup rows, NULL indicates the "rolled-up" level:
--    - (A, NULL) means "all B values for this A."
--    - (NULL, NULL) means "all A and B values."
-- 6. Use Case: WITH ROLLUP is useful for reporting, providing totals at different levels in a single query.

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
