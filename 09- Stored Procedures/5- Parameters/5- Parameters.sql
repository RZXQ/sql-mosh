-- Query: Create a stored procedure to retrieve clients by state
-- Database: `sql_invoicing`
-- Procedure Name: `get_clients_by_state`
-- Parameter: `state` (CHAR(2)) - The state code to filter clients
-- Functionality: Retrieves all records from the `clients` table where the state matches the input parameter
DROP PROCEDURE IF EXISTS get_clients_by_state; -- Removes existing procedure if it exists
USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
    SELECT *
    FROM clients c
    WHERE c.state = state;
END$$
DELIMITER ;
CALL get_clients_by_state('ca');

-- Query: Create a stored procedure to retrieve invoices for a specific client
-- Database: `sql_invoicing`
-- Procedure Name: `get_invoices_by_client`
-- Parameter: `client_id` (INT) - The client ID to filter invoices
-- Functionality: Retrieves all records from the `invoices` table where the client_id matches the input parameter
DROP PROCEDURE IF EXISTS get_invoices_by_client;
DELIMITER $$
CREATE PROCEDURE get_invoices_by_client(client_id INT)
BEGIN
    SELECT *
    FROM invoices i
    WHERE i.client_id = client_id;
END$$
DELIMITER ;
CALL get_invoices_by_client(2);
