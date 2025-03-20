-- This SQL script enables MySQL event scheduling and creates a yearly event.
-- The event automatically deletes audit records older than 1 year from the payments_audit table.
-- Make sure the event scheduler is enabled before running the event creation part.

USE sql_invoicing;

# Event: a task (or block of SQL code) that gets executed according to a schedule
# Before using events, we need to turn on the MySQL events scheduler that constantly looks for events to execute.

SHOW VARIABLES LIKE 'event%'; -- ensure the event_scheduler is ON
SET GLOBAL event_scheduler = ON;
-- If it is off, we need to turn this on.

DELIMITER $$
-- The events' name should start with timer.
-- Some example scheduling formats: AT '2019-05-01', EVERY 1 DAY, EVERY 2 DAY, EVERY 1 YEAR.
CREATE EVENT yearly_delete_stale_audit_rows
    ON SCHEDULE EVERY 1 YEAR STARTS '2019-01-01' ENDS '2025-03-01'
    DO BEGIN
    DELETE FROM payments_audit WHERE action_date < NOW() - INTERVAL 1 YEAR;
END$$
DELIMITER ;