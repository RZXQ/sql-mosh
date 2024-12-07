/*
Summary:
1. Limiting results in SQL:
   - LIMIT: Specifies the maximum number of rows to return
   - OFFSET: Specifies the number of rows to skip before starting to return rows (used with LIMIT)
*/

-- Select the first 3 customers.
use sql_store;
SELECT *
FROM customers
LIMIT 3;

-- Select 3 customers starting from the 7th record (implementing pagination).
use sql_store;
SELECT *
FROM customers
LIMIT 6, 3;

-- Select the top 3 customers sorted by points in descending order.
use sql_store;
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;