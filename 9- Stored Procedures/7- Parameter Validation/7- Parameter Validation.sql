-- Query: Define and execute a stored procedure for handling payments
-- Procedure Name: make_payment
-- Parameters:
--   - invoice_id (INT): ID of the invoice to update
--   - payment_amount (DECIMAL(9, 2)): Amount to be paid
--   - payment_date (DATE): Date of payment
-- Steps:
--   1. Validate payment_amount to ensure it is greater than 0
--      - Error Handling: Triggers an SQL exception with SQLSTATE '22003' if invalid
--   2. Update the `invoices` table:
--      - Columns Updated:
--        - `payment_total`: Set to `payment_amount`
--        - `payment_date`: Set to `payment_date`
--      - Filter (Where): Matches the `invoice_id` provided as input
-- Note:
--   - DROP PROCEDURE ensures the procedure is redefined without conflicts.
--   - Delimiters ($$) are used to encapsulate the procedure definition.
--   - Example Call: `CALL make_payment(2, -100, '2019-01-01');` triggers an exception due to invalid `payment_amount`.

USE sql_invoicing;
DROP PROCEDURE IF EXISTS make_payment;
DELIMITER $$
CREATE PROCEDURE make_payment(invoice_id INT, payment_amount DECIMAL(9, 2), payment_date DATE)
BEGIN
    IF payment_amount <= 0 THEN
        SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid Payment Amount';
    END IF;

    UPDATE invoices i
    SET i.payment_total = payment_amount,
        i.payment_date  = payment_date
    WHERE i.invoice_id = invoice_id;
END
$$
DELIMITER ;

CALL make_payment(2, -100, '2019-01-01');
