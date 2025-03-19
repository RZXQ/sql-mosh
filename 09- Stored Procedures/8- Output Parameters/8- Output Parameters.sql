USE sql_invoicing;

-- Query: Drop the stored procedure before creating it to avoid conflict
-- Procedure Name: get_unpaid_invoices_for_client
DROP PROCEDURE IF EXISTS get_unpaid_invoices_for_client;

-- Query: Create stored procedure to retrieve unpaid invoice count and total amount for given client_id
-- Procedure name: get_unpaid_invoices_for_client
-- Parameters:
--    Input:
--      - client_id (int): ID of the client whose unpaid invoices we want to retrieve
--    Output:
--      - invoices_count (int): Number of unpaid invoices for the specified client
--      - invoices_total (decimal, 2 decimal places): Total value of unpaid invoices
-- Logic:
--    - Count number of invoices where payment_total equals zero
--    - Calculate total sum of invoice_total for unpaid invoices
--    - Use IFNULL to handle cases when no unpaid invoices exist to avoid null result
-- Sources: invoices table
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

-- Query: Call stored procedure get_unpaid_invoices_for_client with client_id=5
-- Action: Retrieve unpaid invoice count and invoice total value for client id 5
CALL get_unpaid_invoices_for_client(3, @invoice_count, @invoice_total);

-- Query: Display results returned by stored procedure
-- Output variables:
--   - @invoice_count: holds count of unpaid invoices
--   - @invoice_total: holds total sum of unpaid invoices with two-decimal formatting
SELECT @invoice_count           AS 'Number of Unpaid Invoices',
       ROUND(@invoice_total, 2) AS 'Total Amount of Unpaid Invoices';