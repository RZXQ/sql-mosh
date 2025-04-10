-- DATE_FORMAT and TIME_FORMAT placeholders summary:
-- %Y - Year, numeric, four digits (e.g., 2024)
-- %y - Year, numeric, two digits (e.g., 24)
-- %M - Month name, textual, full name (e.g., May)
-- %m - Month number, numeric (01..12)
-- %D - Day of month with ordinal suffix, textual (1st, 2nd, etc.)
-- %d - Day of month, numeric (01..31)
-- %H - Hour (00..23), 24-hour format
-- %h - Hour (01..12), 12-hour format
-- %i - Minutes, numeric (00..59)
-- %s - Seconds, numeric (00..59)
-- %p - AM or PM indicator

-- Examples:

-- Year (2-digit)
SELECT DATE_FORMAT(NOW(), '%y');

-- Year (4-digit)
SELECT DATE_FORMAT(NOW(), '%Y');

-- Month (numeric) and Year
SELECT DATE_FORMAT(NOW(), '%m %Y');

-- Month (textual) and Year
SELECT DATE_FORMAT(NOW(), '%M %Y');

-- Day (numeric), Month (textual), Year
SELECT DATE_FORMAT(NOW(), '%d %M %Y');

-- Day (ordinal), Month (textual), Year
SELECT DATE_FORMAT(NOW(), '%D %M %Y');

-- Time in 12-hour format with hours, minutes, seconds, and AM/PM
SELECT TIME_FORMAT(NOW(), '%h:%i:%s %p');