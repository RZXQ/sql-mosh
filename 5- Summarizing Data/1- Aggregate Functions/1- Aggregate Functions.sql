-- Query: Retrieve aggregated statistics from the `invoices` table
-- Select:
--   - MAX(invoice_total) as highest
--   - MIN(invoice_total) as lowest
--   - AVG(invoice_total) as average
--   - SUM(invoice_total * 1.1) as total (with 10% tax)
--   - COUNT(invoice_total) as number_of_invoices
--   - COUNT(*) as total_records
--   - COUNT(client_id) as client_id
--   - COUNT(DISTINCT client_id) as distinct_client_id
-- From: `invoices`
-- Filter: Includes only rows where `invoice_date` is after '2019-07-01'
USE sql_invoicing;
SELECT MAX(invoice_total)        AS highest,
       MIN(invoice_total)        AS lowest,
       AVG(invoice_total)        AS average,
       SUM(invoice_total * 1.1)  AS total,
       COUNT(invoice_total)      AS number_of_invoices,
       COUNT(*)                  AS total_records,
       COUNT(client_id)          AS client_id,
       COUNT(DISTINCT client_id) AS distinct_client_id
FROM invoices
WHERE invoice_date > '2019-07-01';

-- Query: Summarize total sales, payments, and outstanding amounts for specified periods
-- Select:
--   - Summary label (e.g., 'First half of 2019', 'Second half of 2019', 'Total')
--   - SUM(invoice_total) as total_sales
--   - SUM(payment_total) as total_payments
--   - SUM(invoice_total - payment_total) as what_we_expect (outstanding amounts)
-- From: `invoices`
-- Filter:
--   - First half of 2019: `invoice_date` between '2019-01-01' and '2019-06-30'
--   - Second half of 2019: `invoice_date` between '2019-07-01' and '2019-12-31'
--   - Full year of 2019: `invoice_date` between '2019-01-01' and '2019-12-31'
-- Union: Combines results from the three time periods into one result set
USE sql_invoicing;
SELECT 'First half of 2019',
       SUM(invoice_total)                 AS total_sales,
       SUM(payment_total)                 AS total_payments,
       SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT 'Second half of 2019',
       SUM(invoice_total)                 AS total_sales,
       SUM(payment_total)                 AS total_payments,
       SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
UNION
SELECT 'Total',
       SUM(invoice_total)                 AS total_sales,
       SUM(payment_total)                 AS total_payments,
       SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-12-31';