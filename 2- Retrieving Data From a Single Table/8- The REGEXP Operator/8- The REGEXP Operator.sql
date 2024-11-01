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

-- 1. LIKE and REGEXP Basics
-- 1.1. LIKE pattern matching (contains 'field')
SELECT *
FROM customers
WHERE last_name LIKE '%field%';

-- 1.2. REGEXP pattern matching (contains 'field')
SELECT *
FROM customers
WHERE last_name REGEXP 'field';

-- 2. Anchors in REGEXP
-- 2.1. ^ Beginning of string (starts with 'field')
SELECT *
FROM customers
WHERE last_name REGEXP '^field';

-- 2.2. $ End of string (ends with 'field')
SELECT *
FROM customers
WHERE last_name REGEXP 'field$';

-- 3. Logical OR in REGEXP
-- 3.1. Match beginning of string 'field', 'mac', or 'rose'
SELECT *
FROM customers
WHERE last_name REGEXP '^field|mac|rose';

-- 3.2. Match end of string 'field', or 'mac', or 'rose'
SELECT *
FROM customers
WHERE last_name REGEXP 'field$|mac|rose';

-- 4. Character Classes and Ranges in REGEXP
-- 4.1. Match 'ge', 'me', or 'ie'
SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';

-- 4.2. Match 'ef', 'em', or 'eq'
SELECT *
FROM customers
WHERE last_name REGEXP 'e[fmq]';

-- 4.3. Match any letter from 'a' to 'h' followed by 'e'
SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';

-- 5. Exercises
-- 5.1. Match 'elka' or 'ambur' in first_name
SELECT *
FROM customers
WHERE first_name REGEXP 'elka|ambur';

-- 5.2. Match last names ending with 'ey' or 'on'
SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$';

-- 5.3. Match beginning with 'my' or contains 'se'
SELECT *
FROM customers
WHERE last_name REGEXP '^my|se';

-- 5.4. Match 'br' or 'bu' in last_name
SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]'; -- or using where last_name REGEXP 'br|bu'