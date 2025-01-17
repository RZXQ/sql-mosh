-- Query: Delete a specific invoice from the "invoices" table
-- Delete From: `invoices`
-- Filter: Deletes the row where invoice_id = 1
-- Note: Removes a single invoice based on its unique ID
USE sql_invoicing;
DELETE
FROM invoices
WHERE invoice_id = 1;

-- Query: Delete all invoices associated with a specific client
-- Delete From: `invoices`
-- Filter: Deletes rows where client_id matches the client_id of the client named 'MyWorks'
-- Source: Uses a subquery to find the client_id based on the client's name
-- Note: Removes all invoices tied to the client named 'MyWorks'
USE sql_invoicing;
DELETE
FROM invoices
WHERE client_id = (SELECT client_id FROM clients WHERE name = 'MyWorks');