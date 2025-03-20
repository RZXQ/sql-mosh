-- 1. VIEW EVENTS
-- Show all events in the current database:
SHOW EVENTS;

-- Alternatively, use a filter for specific event names:
-- SHOW EVENTS LIKE 'yearly%';


-- 2. DROP EVENTS
-- Safely remove an existing event if it exists:
DROP EVENT IF EXISTS yearly_delete_sales;


-- 3. MODIFY EVENTS
-- Update scheduling or event logic:
DELIMITER $$

ALTER EVENT yearly_delete_stale_audit_rows
    ON SCHEDULE EVERY 1 YEAR
        STARTS '2019-01-01'
        ENDS '2025-03-01'
    DO
    BEGIN
        DELETE
        FROM payments_audit
        WHERE action_date < NOW() - INTERVAL 1 YEAR;
    END$$

DELIMITER ;


-- 4. TEMPORARILY DISABLE/ENABLE EVENTS
-- Temporarily deactivate the event:
ALTER EVENT yearly_delete_stale_audit_rows DISABLE;

-- Later, re-enable the event when needed:
-- ALTER EVENT yearly_delete_stale_audit_rows ENABLE;