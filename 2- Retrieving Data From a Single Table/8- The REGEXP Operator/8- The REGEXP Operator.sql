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

-- Select customers whose last name contains 'field' (LIKE).
SELECT *
FROM customers
WHERE last_name LIKE '%field%';

-- Select customers whose last name contains 'field' (REGEXP).
SELECT *
FROM customers
WHERE last_name REGEXP 'field';

-- Select customers whose last name starts with 'field'.
SELECT *
FROM customers
WHERE last_name REGEXP '^field';

-- Select customers whose last name ends with 'field'.
SELECT *
FROM customers
WHERE last_name REGEXP 'field$';

-- Select customers whose last name starts with 'field', 'mac', or 'rose'.
SELECT *
FROM customers
WHERE last_name REGEXP '^field|mac|rose';

-- Select customers whose last name ends with 'field', 'mac', or 'rose'.
SELECT *
FROM customers
WHERE last_name REGEXP 'field$|mac|rose';

-- Select customers whose last name contains 'ge', 'me', or 'ie'.
SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';

-- Select customers whose last name contains 'ef', 'em', or 'eq'.
SELECT *
FROM customers
WHERE last_name REGEXP 'e[fmq]';

-- Select customers whose last name contains any letter from 'a' to 'h' followed by 'e'.
SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';

-- Select customers whose first name contains 'elka' or 'ambur'.
SELECT *
FROM customers
WHERE first_name REGEXP 'elka|ambur';

-- Select customers whose last name ends with 'ey' or 'on'.
SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$';

-- Select customers whose last name starts with 'my' or contains 'se'.
SELECT *
FROM customers
WHERE last_name REGEXP '^my|se';

-- Select customers whose last name contains 'br' or 'bu'.
SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]'; -- or using where last_name REGEXP 'br|bu'