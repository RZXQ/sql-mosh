-- Query: Retrieve all data from the 'sales_by_client' view and join it with the 'clients' table
-- Select: All columns (*)
-- From: 'sales_by_client' view joined with 'clients' table
-- Join: 'sales_by_client' and 'clients' using client_id
USE sql_invoicing;
SELECT *
FROM sales_by_client
         JOIN clients USING (client_id);

-- Query: Create a view to get total sales for each client
-- View Name: sales_by_client
-- Columns in View: 
--   - client_id (from 'clients')
--   - name (from 'clients')
--   - total_sales (sum of invoice_total from 'invoices')
-- From: 'clients' table joined with 'invoices' table
-- Join: 'clients' and 'invoices' using client_id
-- Group By: client_id, name
-- Note: Calculates the sum of invoice_total for each client
CREATE OR REPLACE VIEW sales_by_client AS
SELECT c.client_id, c.name, SUM(invoice_total) AS total_sales
FROM clients c
         JOIN invoices i USING (client_id)
GROUP BY c.client_id, c.name;

-- Query: Create a view to calculate the balance for each client
-- View Name: clients_balance
-- Columns in View:
--   - client_id (from 'clients')
--   - name (from 'clients')
--   - balance (sum of invoice_total - payment_total)
-- From: 'invoices' table joined with 'clients' table
-- Join: 'invoices' and 'clients' using client_id
-- Group By: client_id, name
-- Note: Calculates balance as the difference between invoice_total and payment_total
USE sql_invoicing;
CREATE OR REPLACE VIEW clients_balance AS
SELECT c.client_id, c.name, SUM(i.invoice_total - i.payment_total) AS balance
FROM invoices i
         JOIN clients c USING (client_id)
GROUP BY c.client_id, c.name;
