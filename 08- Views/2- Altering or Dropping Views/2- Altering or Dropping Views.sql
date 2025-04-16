-- Remarks on Views:
-- With CREATE OR REPLACE VIEW, there's no need for DROP VIEW IF EXISTS before creating/updating a view.

USE sql_invoicing;

-- Query: Create a view to get the total sales for each client
-- View name: sales_by_client
-- Columns:
--   - client_id (from table clients)
--   - name (from table clients)
--   - total_sales (sum of invoice_total from table invoices)
-- Sources: clients table joined with invoices table
-- Join condition: clients and invoices using client_id
-- Grouping: by client_id, name
CREATE OR REPLACE VIEW sales_by_client AS
SELECT c.client_id, c.name, SUM(i.invoice_total)
FROM clients c
         JOIN invoices i USING (client_id)
GROUP BY c.client_id, c.name;