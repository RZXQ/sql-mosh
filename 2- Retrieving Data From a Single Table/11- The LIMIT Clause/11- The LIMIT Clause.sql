-- Summary:
-- 1. Limiting results in SQL:
--    - LIMIT: Specifies the maximum number of rows to return
--    - OFFSET: Specifies the number of rows to skip before starting to return rows (used with LIMIT)

-- 1. Select the first 3 customers:
--    LIMIT 3 restricts the result to the first 3 rows
SELECT *
FROM customers
LIMIT 3;

-- Pagination:
-- To implement pagination, use LIMIT with OFFSET
-- Example for pages:
--   - page 1: rows 1 - 3
--   - page 2: rows 4 - 6
--   - page 3: rows 7 - 9

-- 2. Select 3 customers starting from the 7th record (offset 6):
--    LIMIT 6,3 skips the first 6 records and then picks the next 3 records
SELECT *
FROM customers
LIMIT 6, 3;

-- Exercise:
-- Select the top 3 customers sorted by points in descending order
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;