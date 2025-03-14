-- =========================================================
-- 1. Length Function:
-- Purpose: Shows length (number of characters) in the given string
-- =========================================================
SELECT length('sky');

-- =========================================================
-- 2. Uppercase and Lowercase:
-- Purpose: Converts string characters to uppercase and lowercase
-- =========================================================
SELECT upper('sky'); -- convert entire string to Uppercase
SELECT lower('Sky');
-- convert entire string to Lowercase

-- =========================================================
-- 3. Trim Functions:
-- Purpose: Removes unwanted spaces from strings
-- =========================================================
SELECT ltrim('     Sky'); -- Remove spaces only from the LEFT side
SELECT rtrim('Sky     '); -- Remove spaces only from the RIGHT side
SELECT trim('     Sky     ');
-- Remove spaces from BOTH sides

-- =========================================================
-- 4. Left and Right Functions:
-- Purpose: Extracts substring from left or right side of a string
-- =========================================================
-- Extract LEFT 4 characters
SELECT left('Kindergarten', 4);
-- Extract RIGHT 6 characters
SELECT right('Kindergarten', 6);

-- =========================================================
-- 5. Substring Functions:
-- Purpose: Extracts substring based on position and length
-- =========================================================
SELECT substr('Kindergarten', 3); -- Start from position 3 until end
SELECT substr('Kindergarten', 3, 5);
-- Start from position 3, get next 5 characters

-- =========================================================
-- 6. Locate Function:
-- Purpose: Find position of a substring within another string
-- Returns 0 if substring is not found; Case-sensitive
-- =========================================================
SELECT locate('n', 'Kindergarten'); -- position of first occurrence of 'n'
SELECT locate('N', 'Kindergarten'); -- position of 'N', (case-sensitive, returns 0)
SELECT locate('q', 'Kindergarten'); -- position of nonexistent 'q', should return 0
SELECT locate('garten', 'Kindergarten');
-- position of substring 'garten'

-- =========================================================
-- 7. Replace Function:
-- Purpose: Replace substring occurrences with another substring
-- =========================================================
SELECT replace('Kindergarten', 'garten', 'garden');
-- replacing 'garten' with 'garden'

-- =========================================================
-- 8. Concat Function:
-- Purpose: Concatenate strings together
-- =========================================================
SELECT concat('first', 'last'); -- Simple concatenation
USE sql_store;
SELECT concat(first_name, ' ', last_name) -- Concatenate columns with space
FROM customers;