-- Function: get_risk_factor_for_client
-- Description: Calculates client's risk factor based on invoices.

-- Attributes:
-- • DETERMINISTIC: Same input always gives the same result.
-- • READS SQL DATA: Function only reads data; no modifications.
-- • MODIFIES SQL DATA: Function modifies data using INSERT/UPDATE/DELETE (choose only one between READS or MODIFIES).

-- Parameters:
-- • client_id_param (INT): Client's ID to calculate risk_factor.

-- Returns: INTEGER representing the risk factor.

USE sql_invoicing;

DROP FUNCTION IF EXISTS get_risk_factor_for_client;

CREATE FUNCTION get_risk_factor_for_client(client_id_param INT) RETURNS INTEGER
    DETERMINISTIC READS SQL DATA MODIFIES SQL DATA
BEGIN
    DECLARE riskFactor DECIMAL(9, 2) DEFAULT 0;
    DECLARE invoiceCount INT;
    DECLARE invoiceTotal DECIMAL(9, 2);

    -- Count invoices and get invoice total for client
    SELECT COUNT(*), SUM(invoice_total)
    INTO invoiceCount, invoiceTotal
    FROM invoices
    WHERE client_id = client_id_param;

    -- Compute risk_factor: (total invoice amount / invoice count) * 5
    SET riskFactor = IFNULL(invoiceTotal / invoiceCount * 5, 0);

    RETURN CAST(riskFactor AS INTEGER);
END;

-- Example usage:
SELECT client_id, name, get_risk_factor_for_client(client_id) AS risk_factor
FROM clients;