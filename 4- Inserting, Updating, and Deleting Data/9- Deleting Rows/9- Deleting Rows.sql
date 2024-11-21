USE sql_invoicing;

DELETE
FROM invoices
WHERE invoice_id = 1;

DELETE
FROM invoices
WHERE client_id = (SELECT client_id FROM clients WHERE name = 'MyWorks');