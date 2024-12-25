-- Query: Create a stored procedure to retrieve all client records
-- Drop Procedure: `get_clients` (if it already exists)
-- Create Procedure: `get_clients`
--   - Select: All columns (`*`)
--   - From: `clients` table
-- Note: Uses `DELIMITER $$` to define the stored procedure block
USE sql_invoicing;

DROP PROCEDURE IF EXISTS get_clients;
DELIMITER $$;
CREATE PROCEDURE get_clients()
BEGIN
    SELECT *
    FROM clients;
END$$;
DELIMITER ;
