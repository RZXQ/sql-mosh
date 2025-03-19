USE sql_invoicing;

-- Query: Create a stored procedure to get customer's unpaid invoice count and balance total
-- Procedure name: get_customer_balance
-- Parameters:
--   - client_id: INT (input parameter for selecting specific client)
--   - invoices_count: INT (output parameter for count of unpaid invoices)
--   - invoices_total: INT (output parameter for sum of unpaid invoices)
-- Logic:
--   - Count all invoices (COUNT(*)) for the specified client ID that have no payments (payment_total = 0)
--   - Calculate the total invoice amount (SUM(invoice_total)) for these unpaid invoices
-- Sources: invoices table
DROP PROCEDURE IF EXISTS get_customer_balance;

DELIMITER $$
CREATE PROCEDURE get_customer_balance(client_id INT, OUT invoices_count INT, OUT invoices_total INT)
BEGIN
    SELECT COUNT(*), SUM(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices i
    WHERE i.client_id = client_id
      AND payment_total = 0
    GROUP BY i.client_id;
END$$
DELIMITER ;

CALL get_customer_balance(5, @a, @b);

SELECT @a, @b;