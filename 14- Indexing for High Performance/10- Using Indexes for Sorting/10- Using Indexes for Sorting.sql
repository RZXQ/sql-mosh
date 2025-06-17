USE sql_store;

-- Sorting by indexed column: MySQL can use the index for sorting
-- EXPLAIN shows: type = 'index', no 'Using filesort' in Extra
EXPLAIN ANALYZE
SELECT customer_id
FROM customers
ORDER BY points;

-- Index usage rules for composite indexes like INDEX(a, b):
-- MySQL CAN use the index for sorting when:
-- ORDER BY a
-- ORDER BY a, b
-- ORDER BY a DESC, b DESC (same direction for all columns)

-- MySQL CANNOT use the index for sorting when:
-- ORDER BY a, b DESC (mixed sort directions)
-- ORDER BY a DESC, b ASC (mixed sort directions)
-- ORDER BY a, c, b (skipping columns or wrong order)
-- ORDER BY b (skipping the first column)

-- Sorting by non-indexed column: MySQL must sort results manually
-- EXPLAIN shows: type = 'ALL', 'Using filesort' in Extra (expensive operation)
EXPLAIN
SELECT customer_id
FROM customers
ORDER BY first_name;