-- Query: Retrieve all invoices with their average total and the difference from the average
-- Select:
--   - invoice_id
--   - invoice_total
--   - The overall average invoice_total across all invoices as invoice_average
--   - The difference between invoice_total and the overall average as difference
-- Subquery:
--   - Calculates the average invoice_total for all invoices
USE sql_invoicing;
SELECT invoice_id,
       invoice_total,
       (SELECT AVG(invoice_total) FROM invoices)                 AS invoice_average,
       invoice_total - (SELECT AVG(invoice_total) FROM invoices) AS difference
FROM invoices;

-- Query: Retrieve clients with their total sales, the average invoice amount, and the difference
-- Select:
--   - DISTINCT client_id and name from `clients`
--   - Total sales for each client calculated as the sum of invoice_totals for that client
--   - The overall average invoice_total across all invoices
--   - The difference between total sales for the client and the overall average invoice_total
-- Subqueries:
--   - First subquery calculates the total sales (SUM(invoice_total)) for each client
--   - Second subquery calculates the overall average invoice_total
--   - The difference is computed as total sales minus the overall average
USE sql_invoicing;
SELECT DISTINCT client_id,
                name,
                (SELECT SUM(invoice_total) FROM invoices i WHERE client_id = c.client_id) AS total_sales,
                (SELECT AVG(invoice_total) FROM invoices)                                 AS average,
                (SELECT total_sales - average)                                            AS difference
FROM clients c;
