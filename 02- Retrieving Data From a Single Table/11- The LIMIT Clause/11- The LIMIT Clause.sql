/*
Logical execution order of SQL clauses:
1. FROM
2. JOIN
3. WHERE
4. GROUP BY
5. HAVING
6. SELECT
7. DISTINCT
8. ORDER BY
9. LIMIT
*/

/*
Explanation of LIMIT Clause:
- `LIMIT` restricts the number of rows returned in the result set.
- `LIMIT <count>` returns the first <count> rows.
- `LIMIT <offset>, <count>` returns <count> rows starting from the <offset>th record.
*/

-- ------------------------------------------------------------------------------------
-- Query 1: Select the first 3 customers
-- Select From: 'customers' table
-- Filter: LIMIT 3 (Fetches the first 3 records)
-- Note: This will return the first 3 rows from the result set.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
LIMIT 3;

-- ------------------------------------------------------------------------------------
-- Query 2: Select 3 customers starting from the 7th record (pagination)
-- Select From: 'customers' table
-- Filter: LIMIT 6, 3 (Skips the first 6 records, fetches the next 3)
-- Note: This is useful for pagination in applications, where the first page shows records 1-3, the second page shows 4-6, etc.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
LIMIT 6, 3;

-- ------------------------------------------------------------------------------------
-- Query 3: Select the top 3 customers sorted by points in descending order
-- Select From: 'customers' table
-- Filter: ORDER BY points DESC, LIMIT 3 (Sorts by points and limits the result to the top 3 customers)
-- Note: Returns the first 3 customers after sorting by points in descending order.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;
