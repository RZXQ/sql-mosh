-- Query: Create a stored procedure to retrieve all clients
-- Database: `sql_invoicing`
-- Procedure Name: `get_clients`
-- Functionality: Fetches all records from the `clients` table
USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_clients()
BEGIN
    SELECT *
    FROM clients;
END$$
DELIMITER ;

CALL get_clients();

-- Query: Create a stored procedure to retrieve invoices with unpaid balances
-- Database: `sql_invoicing`
-- Procedure Name: `get_invoices_with_balance`
-- Functionality: Returns all invoices where the unpaid balance is greater than 0
USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_invoices_with_balance()
BEGIN
    SELECT *
    FROM invoices
    WHERE invoice_total - payment_total > 0;
END$$
DELIMITER ;
CALL get_invoices_with_balance();
