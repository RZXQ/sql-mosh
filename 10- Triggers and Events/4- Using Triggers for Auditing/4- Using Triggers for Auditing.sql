USE sql_invoicing;
SHOW TRIGGERS FROM sql_invoicing;

-- ------------------------------------------------------------------------------------
-- Query: Drop the payments_after_insert trigger if it exists
-- Drop: Trigger named payments_after_insert
-- From: sql_invoicing database
-- Note: Ensures no conflict before creating a new trigger with the same name
-- ------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS payments_after_insert;

-- ------------------------------------------------------------------------------------
-- Query: Create a trigger to handle actions after inserting into payments
-- Create: Trigger named payments_after_insert
-- Event: AFTER INSERT ON payments
-- Action: 1) Update invoices.payment_total by adding NEW.amount
--         2) Insert audit log into payments_audit with NEW values
-- Note: Uses NEW to access the inserted row’s data
-- ------------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER payments_after_insert
    AFTER INSERT
    ON payments
    FOR EACH ROW
BEGIN
    UPDATE invoices SET payment_total = payment_total + NEW.amount WHERE invoice_id = NEW.invoice_id;
    INSERT INTO payments_audit VALUES (NEW.client_id, NEW.date, NEW.amount, 'Insert', NOW());
END $$
DELIMITER ;

-- ------------------------------------------------------------------------------------
-- Query: Insert a new payment to test the payments_after_insert trigger
-- Insert: New row into payments
-- Values: Default payment_id, client_id 5, invoice_id 18, date '2019-01-01', amount 100, payment_method 1
-- Note: Triggers payments_after_insert to update invoices and log to payments_audit
-- ------------------------------------------------------------------------------------
INSERT INTO payments
VALUES (DEFAULT, 5, 18, '2019-01-01', 100, 1);

-- ------------------------------------------------------------------------------------
-- Query: Drop the payments_after_delete trigger if it exists
-- Drop: Trigger named payments_after_delete
-- From: sql_invoicing database
-- Note: Ensures no conflict before creating a new trigger with the same name
-- ------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS payments_after_delete;

-- ------------------------------------------------------------------------------------
-- Query: Create a trigger to handle actions after deleting from payments
-- Create: Trigger named payments_after_delete
-- Event: AFTER DELETE ON payments
-- Action: 1) Update invoices.payment_total by subtracting OLD.amount
--         2) Insert audit log into payments_audit with OLD values
-- Note: Uses OLD to access the deleted row’s data
-- ------------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER payments_after_delete
    AFTER DELETE
    ON payments
    FOR EACH ROW
BEGIN
    UPDATE invoices SET payment_total = payment_total - OLD.amount WHERE invoice_id = OLD.invoice_id;
    INSERT INTO payments_audit VALUES (OLD.client_id, OLD.date, OLD.amount, 'Delete', NOW());
END $$
DELIMITER ;

-- ------------------------------------------------------------------------------------
-- Query: Delete a payment to test the payments_after_delete trigger
-- Delete: Row from payments
-- Condition: payment_id = 12
-- Note: Triggers payments_after_delete to update invoices and log to payments_audit
-- ------------------------------------------------------------------------------------
DELETE
FROM payments
WHERE payment_id = 12;