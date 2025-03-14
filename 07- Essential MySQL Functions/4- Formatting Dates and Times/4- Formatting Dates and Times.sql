-- Format current year (2-digit)
SELECT DATE_FORMAT(NOW(), '%y');

-- Format current year (4-digit)
SELECT DATE_FORMAT(NOW(), '%Y');

-- Format current month (numeric) and year (4-digit)
SELECT DATE_FORMAT(NOW(), '%m %Y');

-- Format current month (textual) and year (4-digit)
SELECT DATE_FORMAT(NOW(), '%M %Y');

-- Format current day (numeric), month (textual), and year (4-digit)
SELECT DATE_FORMAT(NOW(), '%d %M %Y');

-- Format current day (ordinal), month (textual), and year (4-digit)
SELECT DATE_FORMAT(NOW(), '%D %M %Y');

-- Format current time with hours, minutes, seconds, and AM/PM
SELECT TIME_FORMAT(NOW(), '%h:%i:%s %p');