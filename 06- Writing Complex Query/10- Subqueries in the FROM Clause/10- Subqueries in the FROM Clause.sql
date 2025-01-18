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
-- Outer Query:
--   - Filters out rows where total_sales is NULL
USE sql_invoicing;

SELECT *
FROM (SELECT DISTINCT client_id,
                      name,
                      (SELECT SUM(invoice_total) FROM invoices i WHERE client_id = c.client_id) AS total_sales,
                      (SELECT AVG(invoice_total) FROM invoices)                                 AS average,
                      (SELECT total_sales - average)                                            AS difference
      FROM clients c) AS sales_summary
WHERE total_sales IS NOT NULL;
