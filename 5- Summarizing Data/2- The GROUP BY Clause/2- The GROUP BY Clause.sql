-- Query: Retrieve total sales by client from the `invoices` table
-- Select:
--   - client_id
--   - SUM(invoice_total) as total_sales
-- From: `invoices`
-- Filter: Includes rows where invoice_date is on or after '2019-07-01'
-- Group By: client_id
-- Order By: total_sales in descending order
USE sql_invoicing;
SELECT client_id, SUM(invoice_total) AS total_sales
FROM invoices
WHERE invoice_date >= '2019-07-01'
GROUP BY client_id
ORDER BY total_sales DESC;

-- Query: Retrieve total sales by state and city from the `invoices` table
-- Select:
--   - state, city (from `clients`)
--   - SUM(invoice_total) as total_sales
-- From: `invoices`
-- Join: Combines `invoices` and `clients` on client_id
-- Filter: Includes rows where invoice_date is on or after '2019-07-01'
-- Group By: state, city
USE sql_invoicing;
SELECT c.state, c.city, SUM(invoice_total) AS total_sales
FROM invoices i
         INNER JOIN clients c USING (client_id)
WHERE invoice_date >= '2019-07-01'
GROUP BY state, city;

-- Query: Retrieve total payments grouped by date and payment method
-- Select:
--   - date (from `payments`)
--   - payment_method name (from `payment_methods`)
--   - SUM(amount) as total_payments
-- From: `payments`
-- Join: Combines `payments` and `payment_methods` on payment_id = payment_method_id
-- Group By: date and payment_method
-- Order By: date
USE sql_invoicing;
SELECT p.date, pm.name AS payment_method, SUM(amount) AS total_payments
FROM payments p
         INNER JOIN payment_methods pm ON p.payment_id = pm.payment_method_id
GROUP BY p.date, payment_method
ORDER BY p.date;