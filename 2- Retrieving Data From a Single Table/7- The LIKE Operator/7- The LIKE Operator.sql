-- Use sql_store database.
USE sql_store;

-- Select customers whose last name starts with 'b'.
SELECT *
FROM customers
WHERE last_name LIKE 'b%';

-- Select customers whose last name starts with 'b', followed by exactly four characters, and ends with 'y'.
SELECT *
FROM customers
WHERE last_name LIKE 'b____y';

-- Select customers whose last name contains 'b' anywhere.
SELECT *
FROM customers
WHERE last_name LIKE '%b%';

-- Select customers whose last name ends with 'y'.
SELECT *
FROM customers
WHERE last_name LIKE '%y';

-- Select customers whose address contains 'trail' or 'avenue'.
SELECT *
FROM customers
WHERE address LIKE '%trail%'
   OR address LIKE '%avenue%';

-- Select customers whose phone number ends with '9'.
SELECT *
FROM customers
WHERE phone LIKE '%9';