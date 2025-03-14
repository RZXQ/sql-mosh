-- =========================================================
-- 1. Current Date and Time functions:
-- Purpose: Retrieve current date/time values
-- =========================================================
SELECT NOW(); -- Return current date and time
SELECT CURDATE(); -- Return current date only
SELECT CURTIME();
-- Return current time only

-- =========================================================
-- 2. Extract specific components from date/time:
-- Purpose: Retrieve year, month, day, hour, minute, and second separately
-- =========================================================
SELECT YEAR(NOW()); -- Extracts year from current date/time
SELECT MONTH(NOW()); -- Extracts month number (1-12)
SELECT DAY(NOW()); -- Extracts day number (1-31)
SELECT HOUR(NOW()); -- Extracts hour component of current time (0-23)
SELECT MINUTE(NOW()); -- Extracts minute component of current time (0-59)
SELECT SECOND(NOW());
-- Extracts second component of current time (0-59)

-- =========================================================
-- 3. Retrieve day/month names:
-- Purpose: Get readable names of current day/month
-- =========================================================
SELECT DAYNAME(NOW()); -- Returns the name of the current weekday (e.g., Monday)
SELECT MONTHNAME(NOW());
-- Returns the name of the current month (e.g., January)

-- =========================================================
-- 4. Using EXTRACT function:
-- Purpose: Extract chosen date/time components explicitly from date or datetime values
-- =========================================================
SELECT EXTRACT(YEAR FROM NOW()); -- Explicit extraction of year from current date/time
SELECT EXTRACT(YEAR FROM NOW()); -- Similar operation as above; explicitly extract the year
SELECT EXTRACT(MONTH FROM NOW()); -- Extract month explicitly
SELECT EXTRACT(DAY FROM NOW()); -- Another explicit way to extract day from date/time