-- Add intervals to current date/time
SELECT DATE_ADD(NOW(), INTERVAL 1 DAY); -- One day from now
SELECT DATE_ADD(NOW(), INTERVAL 1 YEAR); -- One year from now
SELECT DATE_ADD(NOW(), INTERVAL -1 YEAR);
-- One year before now (using negative INTERVAL)

-- Subtract intervals from current date/time
SELECT DATE_SUB(NOW(), INTERVAL 1 YEAR);
-- One year before now (using DATE_SUB)

-- Calculate difference in days between two date/time values
SELECT DATEDIFF('2019-01-05 09:00', '2019-01-01 17:00');
-- Result in days

-- Calculate difference in seconds between two times
SELECT TIME_TO_SEC('09:02') - TIME_TO_SEC('09:00'); -- Result in seconds