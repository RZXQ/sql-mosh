-- Query: Create a stored procedure to fetch client records filtered by state
-- Drop Procedure: `get_clients_by_state` (if it already exists)
-- Create Procedure: `get_clients_by_state`
--   - Parameter: `state` (CHAR(2)) - Accepts a state code to filter clients
--   - Select: All columns (`*`)
--   - From: `clients` table
--   - Filter (Where): Returns rows where `state` matches the input parameter, or all rows if `state` is `NULL`
-- Note: Uses `IFNULL` to handle `NULL` values for the `state` parameter

-- Approach A: use IF...ELSE
USE sql_invoicing;
DROP PROCEDURE IF EXISTS get_clients_by_state;

DELIMITER $$
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
    IF state IS NULL THEN
        SELECT *
        FROM clients;
    ELSE
        SELECT * FROM clients c WHERE c.state = state;
    END IF;
END
$$
DELIMITER ;

CALL get_clients_by_state(null);

-- Approach B: USE IFNULL
USE sql_invoicing;
DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
    SELECT *
    FROM clients c
    WHERE c.state = IFNULL(state, c.state);
END$$
DELIMITER ;

-- Call the stored procedure with `NULL` to retrieve all clients
CALL get_clients_by_state(NULL);


-- Query: Create a stored procedure to fetch payment records filtered by client ID and payment method
-- Drop Procedure: `get_payments` (if it already exists)
-- Create Procedure: `get_payments`
--   - Parameters:
--     - `client_id` (INT) - Accepts a client identifier to filter payments
--     - `payment_method_id` (TINYINT) - Accepts a payment method ID to filter payments
--   - Select: All columns (`*`)
--   - From: `payments` table
--   - Filter (Where): Returns rows where `client_id` and `payment_method` match the input parameters, or all rows if parameters are `NULL`
-- Note: Uses `IFNULL` to handle `NULL` values for the input parameters
USE sql_invoicing;
DROP PROCEDURE IF EXISTS get_payments;
DELIMITER $$
CREATE PROCEDURE get_payments(client_id INT, payment_method_id TINYINT)
BEGIN
    SELECT *
    FROM payments p
    WHERE p.client_id = IFNULL(client_id, p.client_id)
      AND p.payment_method = IFNULL(payment_method_id, p.payment_method);
END$$
DELIMITER ;

-- Call the stored procedure with specific values for filtering
CALL get_payments(5, 2);
