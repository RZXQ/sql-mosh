-- ==================== 1- The SELECT Statement ==================== --
SELECT * FROM table_name;
SELECT column1, column2 FROM table_name;
SELECT DISTINCT column_name FROM table_name;
SELECT column_name AS alias_name FROM table_name;

-- ==================== 2- The WHERE Clause ==================== --
SELECT * FROM table_name WHERE condition;

-- ==================== 3- The AND, OR, and NOT Operators ==================== --
SELECT * FROM table_name WHERE condition1 AND condition2;
SELECT * FROM table_name WHERE condition1 OR condition2;
SELECT * FROM table_name WHERE NOT condition;

-- ==================== 4- The IN Operator ==================== --
SELECT * FROM table_name WHERE column_name IN (value1, value2);

-- ==================== 5- The BETWEEN Operator ==================== --
SELECT * FROM table_name WHERE column_name BETWEEN value1 AND value2;

-- ==================== 6- The LIKE Operator ==================== --
-- Wildcards: % (any sequence of characters), _ (single character)
SELECT * FROM table_name WHERE column_name LIKE 'pattern';

-- ==================== 7- The REGEXP Operator ==================== --
-- Wildcards for matching:
--   - ^: Beginning of string
--   - $: End of string
--   - |: Logical OR
--   - []: Character class
--   - [a-f]: Character range
SELECT * FROM table_name WHERE column_name REGEXP 'pattern';

-- ==================== 8- The IS NULL Operator ==================== --
SELECT * FROM table_name WHERE column_name IS NULL;
SELECT * FROM table_name WHERE column_name IS NOT NULL;

-- ==================== 9- The ORDER BY Clause ==================== --
SELECT * FROM table_name ORDER BY column_name1 DESC, column_name2;

-- ==================== 10- The LIMIT Clause ==================== --
SELECT * FROM table_name LIMIT number_of_rows;
SELECT * FROM table_name LIMIT offset, number_of_rows;

-- ==================== 11- Executing Sequence ==================== --
-- FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → DISTINCT → ORDER BY → LIMIT
