-- Triggers: blocks of SQL code automatically executed before or after insert, update, or delete statements.

USE sql_invoicing;

-- ========================================
-- Trigger: payments_after_insert
-- Description: Updates invoice payment_total after a new payment is inserted
-- ========================================

DROP TRIGGER IF EXISTS payments_after_insert;

DELIMITER $$
CREATE TRIGGER payments_after_insert
    AFTER INSERT
    ON payments
    FOR EACH ROW
BEGIN
    -- Increment invoice payment_total by the newly inserted payment amount
    UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
END $$
DELIMITER ;

-- Test insertion (example usage)
INSERT INTO payments(payment_id, client_id, invoice_id, date, amount, payment_method)
VALUES (DEFAULT, 5, 3, '2019-01-01', 10, 1);

-- ========================================
-- Trigger: payments_after_delete
-- Description: Updates invoice payment_total after a payment is deleted
-- ========================================

DROP TRIGGER IF EXISTS payments_after_delete;

DELIMITER $$
CREATE TRIGGER payments_after_delete
    AFTER DELETE
    ON payments
    FOR EACH ROW
BEGIN
    -- Decrease invoice payment_total by the deleted payment amount
    UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
END $$
DELIMITER ;