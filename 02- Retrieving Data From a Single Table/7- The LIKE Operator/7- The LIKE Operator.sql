-- ------------------------------------------------------------------------------------
-- Query 1: Select customers whose last name starts with 'b'
-- Select From: 'customers' table
-- Filter: last_name LIKE 'b%'
-- Note: The `%` wildcard matches any number of characters.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name LIKE 'b%';

-- ------------------------------------------------------------------------------------
-- Query 2: Select customers whose last name starts with 'b', followed by exactly four characters, and ends with 'y'
-- Select From: 'customers' table
-- Filter: last_name LIKE 'b____y'
-- Note: `_` matches exactly one character.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name LIKE 'b____y';

-- ------------------------------------------------------------------------------------
-- Query 3: Select customers whose last name contains 'b' anywhere
-- Select From: 'customers' table
-- Filter: last_name LIKE '%b%'
-- Note: The `%` wildcard allows 'b' to appear anywhere in the last name.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name LIKE '%b%';

-- ------------------------------------------------------------------------------------
-- Query 4: Select customers whose last name ends with 'y'
-- Select From: 'customers' table
-- Filter: last_name LIKE '%y'
-- Note: The `%` wildcard matches any number of characters before 'y'.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name LIKE '%y';

-- ------------------------------------------------------------------------------------
-- Query 5: Select customers whose address contains 'trail' or 'avenue'
-- Select From: 'customers' table
-- Filter: address LIKE '%trail%' OR address LIKE '%avenue%'
-- Note: Using `OR` to match either 'trail' or 'avenue' anywhere in the address.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE address LIKE '%trail%'
   OR address LIKE '%avenue%';

-- ------------------------------------------------------------------------------------
-- Query 6: Select customers whose phone number ends with '9'
-- Select From: 'customers' table
-- Filter: phone LIKE '%9'
-- Note: The `%` wildcard allows any characters before '9'.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE phone LIKE '%9';
