USE sql_invoicing;


-- Query: Create stored procedure to retrieve unpaid invoice count and total amount for given client_id
-- Procedure name: get_unpaid_invoices_for_client
-- Parameters:
--    Input:
--      - client_id (int): ID of the client whose unpaid invoices we want to retrieve
--    Output:
--      - invoices_count (int): Number of unpaid invoices for the specified client
--      - invoices_total (decimal, 2 decimal places): Total value of unpaid invoices
-- From: invoices table

DROP PROCEDURE IF EXISTS get_unpaid_invoices_for_client;

DELIMITER $$
CREATE PROCEDURE get_unpaid_invoices_for_client(client_id INT, OUT invoices_count INT, OUT invoices_total DECIMAL(9, 2))
BEGIN
    SELECT COUNT(*), SUM(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices i
    WHERE i.client_id = client_id
      AND i.payment_total = 0;
END $$
DELIMITER ;

set @invoice_count = 0;
CALL get_unpaid_invoices_for_client(3, @invoice_count, @invoice_total);

SELECT @invoice_count, @invoice_total;