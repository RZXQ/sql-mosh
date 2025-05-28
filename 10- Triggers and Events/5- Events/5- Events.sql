-- MySQL Event Scheduler: Automated Database Maintenance
-- This script sets up automatic yearly cleanup of old audit records.

USE sql_invoicing;

-- Step 1: Check if event scheduler is running
SHOW VARIABLES LIKE 'event%'; -- Should show event_scheduler = ON
SET GLOBAL event_scheduler = ON;
-- Enable it if currently OFF

-- Step 2: Create a yearly cleanup event
DELIMITER $$

CREATE EVENT yearly_delete_stale_audit_rows
    ON SCHEDULE
        EVERY 1 YEAR -- Runs once per year
            STARTS '2019-01-01' -- First execution date
            ENDS '2025-03-01' -- Last execution date (optional)
    DO BEGIN
    -- Remove audit records older than 1 year
    DELETE
    FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END$$

DELIMITER ;