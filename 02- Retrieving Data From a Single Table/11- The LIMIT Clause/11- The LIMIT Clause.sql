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

-- Select the first 3 customers.
USE sql_store;
SELECT *
FROM customers
LIMIT 3;

-- Select 3 customers starting from the 7th record (implementing pagination).
USE sql_store;
SELECT *
FROM customers
LIMIT 6, 3;

-- Select the top 3 customers sorted by points in descending order.
USE sql_store;
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;