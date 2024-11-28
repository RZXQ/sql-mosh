-- Select invoices larger than all invoices for client 3
-- using MAX()
USE sql_invoicing;
SELECT *
FROM invoices
WHERE invoice_total > (SELECT MAX(invoice_total) FROM invoices WHERE client_id = 3);

-- Select invoices larger than all invoices for client 3
-- using ALL()
SELECT *
FROM invoices
WHERE invoice_total > ALL (SELECT invoice_total FROM invoices WHERE client_id = 3);

