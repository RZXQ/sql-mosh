/*
Summary:
1. Wildcards for matching:
   - ^: Beginning of string
   - $: End of string
   - |: Logical OR
   - []: Character class
   - [a-f]: Character range
2. LIKE vs. REGEXP:
   - LIKE: Simple pattern matching with %, _
   - REGEXP: Advanced pattern matching with regular expressions
*/

-- ------------------------------------------------------------------------------------
-- Query 1: Select customers whose last name contains 'field' (using LIKE)
-- Select From: 'customers' table
-- Filter: last_name LIKE '%field%'
-- Note: `LIKE` uses `%` as a wildcard to match any characters before or after 'field'
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name LIKE '%field%';

-- ------------------------------------------------------------------------------------
-- Query 2: Select customers whose last name contains 'field' (using REGEXP)
-- Select From: 'customers' table
-- Filter: last_name REGEXP 'field'
-- Note: `REGEXP` provides more advanced pattern matching than `LIKE`
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP 'field';

-- ------------------------------------------------------------------------------------
-- Query 3: Select customers whose last name starts with 'field'
-- Select From: 'customers' table
-- Filter: last_name REGEXP '^field'
-- Note: `^` indicates the start of the string
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP '^field';

-- ------------------------------------------------------------------------------------
-- Query 4: Select customers whose last name ends with 'field'
-- Select From: 'customers' table
-- Filter: last_name REGEXP 'field$'
-- Note: `$` indicates the end of the string
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP 'field$';

-- ------------------------------------------------------------------------------------
-- Query 5: Select customers whose last name starts with 'field', 'mac', or 'rose'
-- Select From: 'customers' table
-- Filter: last_name REGEXP '^field|mac|rose'
-- Note: `|` acts as a logical OR within the regex pattern
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP '^field|mac|rose';

-- ------------------------------------------------------------------------------------
-- Query 6: Select customers whose last name ends with 'field', 'mac', or 'rose'
-- Select From: 'customers' table
-- Filter: last_name REGEXP 'field$|mac|rose'
-- Note: `$` ensures matching at the end of the string
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP 'field$|mac|rose';

-- ------------------------------------------------------------------------------------
-- Query 7: Select customers whose last name contains 'ge', 'me', or 'ie'
-- Select From: 'customers' table
-- Filter: last_name REGEXP '[gim]e'
-- Note: Character class `[gim]` matches any of the letters 'g', 'i', or 'm' followed by 'e'
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';

-- ------------------------------------------------------------------------------------
-- Query 8: Select customers whose last name contains 'ef', 'em', or 'eq'
-- Select From: 'customers' table
-- Filter: last_name REGEXP 'e[fmq]'
-- Note: Character class `[fmq]` matches 'f', 'm', or 'q' after 'e'
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP 'e[fmq]';

-- ------------------------------------------------------------------------------------
-- Query 9: Select customers whose last name contains any letter from 'a' to 'h' followed by 'e'
-- Select From: 'customers' table
-- Filter: last_name REGEXP '[a-h]e'
-- Note: `[a-h]` is a character range matching any letter from 'a' to 'h'
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';

-- ------------------------------------------------------------------------------------
-- Query 10: Select customers whose first name contains 'elka' or 'ambur'
-- Select From: 'customers' table
-- Filter: first_name REGEXP 'elka|ambur'
-- Note: `|` is used as a logical OR to match either 'elka' or 'ambur'
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE first_name REGEXP 'elka|ambur';

-- ------------------------------------------------------------------------------------
-- Query 11: Select customers whose last name ends with 'ey' or 'on'
-- Select From: 'customers' table
-- Filter: last_name REGEXP 'ey$|on$'
-- Note: `$` ensures the match happens at the end of the string
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$';

-- ------------------------------------------------------------------------------------
-- Query 12: Select customers whose last name starts with 'my' or contains 'se'
-- Select From: 'customers' table
-- Filter: last_name REGEXP '^my|se'
-- Note: `^` specifies the beginning of the string, `|` matches 'my' or 'se' anywhere
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP '^my|se';

-- ------------------------------------------------------------------------------------
-- Query 13: Select customers whose last name contains 'br' or 'bu'
-- Select From: 'customers' table
-- Filter: last_name REGEXP 'b[ru]'
-- Note: Character class `[ru]` matches either 'r' or 'u' after 'b'
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]';
