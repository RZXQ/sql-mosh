-- Add specific intervals to the current date/time
SELECT DATE_ADD(NOW(), INTERVAL 1 DAY); -- Current date/time plus 1 day
SELECT DATE_ADD(NOW(), INTERVAL 1 YEAR); -- Current date/time plus 1 year
SELECT DATE_ADD(NOW(), INTERVAL -1 YEAR);
-- Current date/time minus 1 year (using negative interval)

-- Subtract specific intervals from the current date/time explicitly
SELECT DATE_SUB(NOW(), INTERVAL 1 YEAR);
-- Current date/time minus 1 year

-- Find duration in days between two date/time values
SELECT DATEDIFF('2019-01-05 09:00', '2019-01-01 17:00');
-- Days between the two specified dates

-- Find time difference in seconds
SELECT TIME_TO_SEC('09:02') - TIME_TO_SEC('09:00'); -- Seconds between specified times