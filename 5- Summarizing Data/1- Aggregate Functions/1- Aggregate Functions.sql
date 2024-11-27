USE sql_invoicing;

-- Selects max, min, avg, total (with 10% tax), count of invoices,
-- count of records, count of client IDs, and count of distinct client IDs
-- from the invoices table where invoice date is after '2019-07-01'
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

-- Summarizes total sales, total payments, and outstanding amounts
-- for the first half of 2019
-- Unions with: the same summary for the second half of 2019
-- Unions with: the same summary for the whole of 2019
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