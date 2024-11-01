-- Explanation of wildcard characters:
-- - % (percent sign): matches any number of characters (including zero)
-- - _ (underscore): matches exactly one character
SELECT *
FROM customers
WHERE last_name LIKE 'b%';

SELECT *
FROM customers
WHERE last_name LIKE 'b____y';

-- 1. Select customers whose last name starts with 'b'
-- - % (percent sign) matches any number of characters (including zero)
-- - 'b%' matches all last names starting with 'b'
USE sql_store;

-- 2. Select customers whose last name contains 'b' anywhere
-- - '%b%' matches any last name that has 'b' at any position
SELECT *
FROM customers
WHERE last_name LIKE 'b%';

-- 3. Select customers whose last name ends with 'y'
-- - '%y' matches all last names ending with 'y'
SELECT *
FROM customers
WHERE last_name LIKE '%b%';

-- 4. Select customers whose last name starts with 'b', followed by exactly four characters, and ends with 'y'
-- - _ (underscore) matches exactly one character
-- - 'b____y' matches last names starting with 'b', followed by any 4 characters, and ending with 'y'
SELECT *
FROM customers
WHERE last_name LIKE '%y';


-- 5. Select customers whose address contains 'trail' or 'avenue'
-- - '%trail%' matches addresses containing 'trail'
-- - '%avenue%' matches addresses containing 'avenue'
SELECT *
FROM customers
WHERE address LIKE '%trail%'
   OR address LIKE '%avenue%';

-- 6. Select customers whose phone number ends with '9'
-- - '%9' matches any phone number that ends with the digit '9'
SELECT *
FROM customers
WHERE phone LIKE '%9';
