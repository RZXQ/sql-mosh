-- Select customers whose last name starts with 'b'.
USE sql_store;
SELECT *
FROM customers
WHERE last_name LIKE 'b%';

-- Select customers whose last name starts with 'b', followed by exactly four characters, and ends with 'y'.
USE sql_store;
SELECT *
FROM customers
WHERE last_name LIKE 'b____y';

-- Select customers whose last name contains 'b' anywhere.
USE sql_store;
SELECT *
FROM customers
WHERE last_name LIKE '%b%';

-- Select customers whose last name ends with 'y'.
USE sql_store;
SELECT *
FROM customers
WHERE last_name LIKE '%y';

-- Select customers whose address contains 'trail' or 'avenue'.
USE sql_store;
SELECT *
FROM customers
WHERE address LIKE '%trail%'
   OR address LIKE '%avenue%';

-- Select customers whose phone number ends with '9'.
USE sql_store;
SELECT *
FROM customers
WHERE phone LIKE '%9';