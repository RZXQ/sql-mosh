-- ------------------------------------------------------------------------------------
-- Query: Retrieve invoices larger than the largest invoice for client 3 (using MAX())
-- Select: All columns from 'invoices'
-- Filter (WHERE): invoice_total > (SELECT MAX(invoice_total) FROM invoices WHERE client_id = 3)
-- Note: Uses a subquery with MAX() to find the largest invoice total for client 3
-- ------------------------------------------------------------------------------------
USE sql_invoicing;
SELECT *
FROM invoices
WHERE invoice_total > (SELECT MAX(invoice_total)
                       FROM invoices
                       WHERE client_id = 3);

-- ------------------------------------------------------------------------------------
-- Query: Retrieve invoices larger than all invoices for client 3 (using ALL())
-- Select: All columns from 'invoices'
-- Filter (WHERE): invoice_total > ALL (SELECT invoice_total FROM invoices WHERE client_id = 3)
-- Note: Compares invoice_total against all invoices of client 3
-- ------------------------------------------------------------------------------------
USE sql_invoicing;
SELECT *
FROM invoices
WHERE invoice_total > ALL (SELECT invoice_total
                           FROM invoices
                           WHERE client_id = 3);
