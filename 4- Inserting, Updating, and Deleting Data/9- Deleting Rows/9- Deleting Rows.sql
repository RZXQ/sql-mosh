-- Switch to the "sql_invoicing" database
USE sql_invoicing;

-- Delete a specific invoice with invoice_id = 1 from the "invoices" table
DELETE
FROM invoices
WHERE invoice_id = 1;

-- Delete all invoices associated with the client whose name is 'MyWorks'
-- The inner query selects the client_id of the client named 'MyWorks'
DELETE
FROM invoices
WHERE client_id = (SELECT client_id FROM clients WHERE name = 'MyWorks');