-- Query 1: Get invoice details, overall average invoice total, and the difference from average
USE sql_invoicing;
SELECT invoice_id,
       invoice_total,
       (SELECT AVG(invoice_total) FROM invoices)                 AS invoice_average,
       invoice_total - (SELECT AVG(invoice_total) FROM invoices) AS difference
FROM invoices;

-- Query 2 (subqueries): Get client sales totals, overall average invoice total, and difference
USE sql_invoicing;
SELECT DISTINCT client_id,
                name,
                (SELECT SUM(invoice_total) FROM invoices i WHERE i.client_id = c.client_id) AS total_sales,
                (SELECT AVG(invoice_total) FROM invoices)                                   AS average,
                (SELECT total_sales - average)                                              AS difference
FROM clients c;

-- Query 2 (GROUP BY): Same as above using JOIN and GROUP BY instead of subqueries
USE sql_invoicing;
SELECT client_id,
       SUM(invoice_total)                                             AS total_sales,
       (SELECT AVG(invoice_total) FROM invoices)                      AS average,
       SUM(invoice_total) - (SELECT AVG(invoice_total) FROM invoices) AS difference
FROM clients c
         LEFT JOIN invoices i USING (client_id)
GROUP BY client_id;