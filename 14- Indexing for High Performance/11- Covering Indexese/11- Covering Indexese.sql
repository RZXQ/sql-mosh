USE sql_store;

-- Covering Index Example:
-- If we have index(state, points), InnoDB automatically includes the primary key,
-- making it effectively: index(state, points, customer_id)
-- Since this query only needs customer_id and sorts by state, the index "covers"
-- all required data - no table lookup needed.

SELECT customer_id
FROM customers
ORDER BY state;

-- Non-covering query:
-- SELECT * requires all table columns, but our index only contains (state, points, customer_id)
-- MySQL must use the index for sorting, then lookup remaining columns from table data
EXPLAIN
SELECT *
FROM customers
ORDER BY state;

-- Index Design Guidelines (for individual queries, not one massive index):
--
-- Step 1 - WHERE columns: Most selective filters first
-- Step 2 - ORDER BY columns: Enable index-based sorting
-- Step 3 - SELECT columns: Make it covering if practical