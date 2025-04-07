-- Retrieve clients with total sales, overall average invoice, and sales difference
USE sql_invoicing;

-- Query using subqueries with derived table
SELECT *
FROM (SELECT DISTINCT client_id,
                      name,
                      -- Total sales per client
                      (SELECT SUM(invoice_total) FROM invoices i WHERE i.client_id = c.client_id) AS total_sales,
                      -- Overall average invoice total
                      (SELECT AVG(invoice_total) FROM invoices)                                   AS average,
                      -- Difference between client's total sales and overall average
                      (SELECT SUM(invoice_total) FROM invoices i WHERE i.client_id = c.client_id) -
                      (SELECT AVG(invoice_total) FROM invoices)                                   AS difference
      FROM clients c) AS sales_summary
WHERE total_sales IS NOT NULL;

-- Query using JOIN, calculating overall average
USE sql_invoicing;

SELECT c.client_id,
       -- Client's total sales
       SUM(i.invoice_total)                                             AS total_sales,
       -- Overall average invoice total
       (SELECT AVG(invoice_total) FROM invoices)                        AS average,
       -- Difference: Client's total sales minus overall average
       SUM(i.invoice_total) - (SELECT AVG(invoice_total) FROM invoices) AS difference
FROM clients c
         LEFT JOIN invoices i USING (client_id)
GROUP BY c.client_id
HAVING difference IS NOT NULL;

-- Query using JOIN, calculating average invoice total per client
USE sql_invoicing;

SELECT c.client_id,
       -- Client's total sales
       SUM(i.invoice_total)                                             AS total_sales,
       -- Client's average invoice total
       AVG(i.invoice_total)                                             AS average,
       -- Difference: Client's total sales minus overall average
       SUM(i.invoice_total) - (SELECT AVG(invoice_total) FROM invoices) AS difference
FROM clients c
         LEFT JOIN invoices i USING (client_id)
GROUP BY c.client_id
HAVING difference IS NOT NULL;