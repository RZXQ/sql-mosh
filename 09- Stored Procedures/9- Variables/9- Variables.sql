-- Query: Create a stored procedure to calculate the risk factor from invoices
-- Drop Procedure: `get_risk_factor` (if it already exists)
-- Create Procedure: `get_risk_factor`
--   - Parameters: None
--   - Local Variables:
--     - `risk_factor` (DECIMAL(9,2)): Holds calculated result of the risk factor
--     - `invoice_count` (INT): Holds total count of invoices
--     - `invoices_total` (DECIMAL(9,2)): Holds total sum of invoice totals
--   - Select: invoice count and total invoice amount
--       - From: `invoices` table
--       - Calculation: risk_factor = invoices_total / invoice_count * 5
USE sql_invoicing;

-- session variable
SET @invoices_count = 0;

DROP PROCEDURE IF EXISTS get_risk_factor;
DELIMITER $$
CREATE PROCEDURE get_risk_factor()
BEGIN
    # local variable
    DECLARE risk_factor DECIMAL(9, 2) DEFAULT 0;
    DECLARE invoice_count INT;
    DECLARE invoices_total DECIMAL(9, 2);

    SELECT COUNT(*), SUM(invoice_total)
    INTO invoice_count, invoices_total
    FROM invoices;

    SET risk_factor = invoices_total / invoice_count * 5;-- set value
    SELECT risk_factor;
END$$
DELIMITER ;

-- Call the stored procedure to calculate and retrieve the risk factor
CALL get_risk_factor();