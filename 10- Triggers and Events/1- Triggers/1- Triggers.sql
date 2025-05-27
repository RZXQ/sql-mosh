USE sql_invoicing;

-- ===========================================================================
-- TRIGGER 1: payments_after_insert
--
-- PURPOSE: Automatically update invoice payment totals when a new payment is added
--
-- WHEN IT RUNS: After a new payment record is inserted into the payments table
--
-- HOW IT WORKS:
-- 1. Trigger activates after each new row is inserted into the payments table
-- 2. For that specific new payment row, it finds the matching invoice
-- 3. It adds the payment amount to the invoice's payment_total field
-- ===========================================================================

DROP TRIGGER IF EXISTS payments_after_insert;

DELIMITER $$
CREATE TRIGGER payments_after_insert
    AFTER INSERT -- Runs after a new row is successfully inserted
    ON payments -- Watches the payments table
    FOR EACH ROW -- Executes once for each inserted row
BEGIN
    -- Find the invoice that matches this payment and update its total
    UPDATE invoices
    SET payment_total = payment_total + NEW.amount -- Add new payment amount
    WHERE invoice_id = NEW.invoice_id; -- Match to the specific invoice
END $$
DELIMITER ;

-- Test the trigger with a sample payment insertion
INSERT INTO payments(payment_id, client_id, invoice_id, date, amount, payment_method)
VALUES (DEFAULT, 5, 3, '2019-01-01', 10, 1);

-- ===========================================================================
-- TRIGGER 2: payments_after_delete
--
-- PURPOSE: Automatically update invoice payment totals when a payment is deleted
--
-- WHEN IT RUNS: After a payment record is deleted from the payments table
--
-- HOW IT WORKS:
-- 1. Trigger activates after each row is deleted from the payments table
-- 2. For that specific deleted payment row, it finds the matching invoice
-- 3. It subtracts the payment amount from the invoice's payment_total field
-- ===========================================================================

DROP TRIGGER IF EXISTS payments_after_delete;

DELIMITER $$
CREATE TRIGGER payments_after_delete
    AFTER DELETE -- Runs after a row is successfully deleted
    ON payments -- Watches the payments table
    FOR EACH ROW -- Executes once for each deleted row
BEGIN
    -- Find the invoice that matches this deleted payment and update its total
    UPDATE invoices
    SET payment_total = payment_total - OLD.amount -- Subtract deleted payment amount
    WHERE invoice_id = OLD.invoice_id; -- Match to the specific invoice
END $$
DELIMITER ;