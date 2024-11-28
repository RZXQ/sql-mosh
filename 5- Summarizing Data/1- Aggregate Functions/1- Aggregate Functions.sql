USE sql_invoicing;

# 1. **FROM**: Specifies the tables to retrieve data from.
# 2. **JOIN**: Combines rows from two or more tables based on a related column between them.
# 3. **WHERE**: Filters the rows based on a specified condition.
# 4. **GROUP BY**: Groups rows sharing a property so that aggregate functions can be applied to each group.
# 5. **HAVING**: Filters groups based on a specified condition (used only with `GROUP BY`).
# 6. **SELECT**: Specifies the columns to retrieve.
# 7. **ORDER BY**: Specifies the order in which to return the rows.
# 8. **LIMIT**/**OFFSET**: Specifies the number of rows to return and from which point to start (optional).

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