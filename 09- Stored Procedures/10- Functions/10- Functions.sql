-- Attributes:
-- • DETERMINISTIC: Same input always gives the same result.
-- • READS SQL DATA: Function only reads data; no modifications.
-- • MODIFIES SQL DATA: Function modifies data using INSERT/UPDATE/DELETE (choose only one between READS or MODIFIES).

-- Query: Create a function to calculate the risk factor for a given client based on their invoices
-- Function name: get_risk_factor_for_client
-- Parameters:
--    Input:
--      - client_id (int): ID of the client whose risk factor we want to calculate
--    Output:
--      - risk_factor (decimal, 2 decimal places): Calculated risk factor for the client. Returns 0 if there are no invoices.
-- Calculation:
--      - Risk factor is calculated as: (total invoice amount / invoice count) * 5
-- From: invoices table

DROP FUNCTION IF EXISTS get_risk_factor_for_client;

DELIMITER $$
CREATE FUNCTION get_risk_factor_for_client(client_id TINYINT) RETURNS DECIMAL(9, 2)
    DETERMINISTIC READS SQL DATA MODIFIES SQL DATA
BEGIN
    DECLARE risk_factor DECIMAL(9, 2);
    DECLARE invoices_total DECIMAL(9, 2);
    DECLARE invoices_count INT;

    SELECT COUNT(*), SUM(i.invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices i
    WHERE i.client_id = client_id;

    SET risk_factor = invoices_total / invoices_count * 5;
    RETURN IFNULL(risk_factor, 0);

END $$
DELIMITER ;

SELECT client_id, name, get_risk_factor_for_client(client_id)
FROM clients;

