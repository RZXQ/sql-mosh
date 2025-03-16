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
CREATE VIEW sales_by_client AS
SELECT c.client_id, c.name, SUM(i.invoice_total) AS total_sales
FROM clients c
         JOIN invoices i USING (client_id)
GROUP BY c.client_id, c.name;

-- Query: Select clients whose total sales exceed 500
-- Select: All columns (*)
-- From: sales_by_client view
-- Condition: total_sales greater than 500
SELECT *
FROM sales_by_client
WHERE total_sales > 500;

-- Query: Create a view to calculate the balance for each client
-- View name: clients_balance
-- Columns:
--   - client_id (from table clients)
--   - name (from table clients)
--   - balance (sum of each client's invoice_total minus payment_total)
-- Sources: clients table joined with invoices table
-- Join condition: clients and invoices using client_id
-- Grouping: by client_id, name
CREATE VIEW clients_balance AS
SELECT c.client_id, c.name, SUM(i.invoice_total - i.payment_total) AS balance
FROM clients c
         JOIN invoices i USING (client_id)
GROUP BY c.client_id, c.name;