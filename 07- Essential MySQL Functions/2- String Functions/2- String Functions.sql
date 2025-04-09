-- =========================================================
-- 1. Length Function:
-- Purpose: Shows length (number of characters) in the given string
-- =========================================================
SELECT LENGTH('sky');

-- =========================================================
-- 2. Uppercase and Lowercase:
-- Purpose: Converts string characters to uppercase and lowercase
-- =========================================================
SELECT UPPER('sky'); -- convert entire string to Uppercase
SELECT LOWER('Sky');
-- convert entire string to Lowercase

-- =========================================================
-- 3. Trim Functions:
-- Purpose: Removes unwanted spaces from strings
-- =========================================================
SELECT LTRIM('     Sky'); -- Remove spaces only from the LEFT side
SELECT RTRIM('Sky     '); -- Remove spaces only from the RIGHT side
SELECT TRIM('     Sky     ');
-- Remove spaces from BOTH sides

-- =========================================================
-- 4. Left and Right Functions:
-- Purpose: Extracts substring from left or right side of a string
-- =========================================================
SELECT LEFT('Kindergarten', 4); -- Extract LEFT 4 characters
SELECT RIGHT('Kindergarten', 6);
-- Extract RIGHT 6 characters

-- =========================================================
-- 5. Substring Functions:
-- Purpose: Extracts substring based on position and length
-- =========================================================
SELECT SUBSTR('Kindergarten', 3); -- Start from position 3 until end
SELECT SUBSTR('Kindergarten', 3, 5);
-- Start from position 3, get next 5 characters

-- =========================================================
-- 6. Locate Function:
-- Purpose: Find position of a substring within another string
-- Returns 0 if substring is not found; Case-sensitive
-- =========================================================
SELECT LOCATE('n', 'Kindergarten'); -- position of first occurrence of 'n'
SELECT LOCATE('N', 'Kindergarten'); -- position of 'N' (case-sensitive, returns 0)
SELECT LOCATE('q', 'Kindergarten'); -- position of nonexistent 'q', should return 0
SELECT LOCATE('garten', 'Kindergarten');
-- position of substring 'garten'

-- =========================================================
-- 7. Replace Function:
-- Purpose: Replace substring occurrences with another substring
-- =========================================================
SELECT REPLACE('Kindergarten', 'garten', 'garden');
-- replacing 'garten' with 'garden'

-- =========================================================
-- 8. Concat Function:
-- Purpose: Concatenate strings together
-- =========================================================
SELECT CONCAT('first', 'last'); -- Simple concatenation

USE sql_store;

SELECT CONCAT(first_name, ' ', last_name) -- Concatenate columns with space
FROM customers;