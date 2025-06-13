USE sql_store;

-- PROBLEM: Query uses only one index, causing partial table scan
-- When filtering by state AND points, MySQL can only use one index at a time
-- It uses idx_state to find CA customers, then scans all CA customers for points > 1000
-- This becomes inefficient as data grows (112 rows scanned instead of optimal 58)

EXPLAIN
SELECT customer_id
FROM customers
WHERE state = 'CA'
  AND points > 1000;
-- Without composite index: scans 112 rows

-- SOLUTION: Create composite index for both columns
-- Order matters: most selective column first (usually)
-- This allows MySQL to filter by both conditions in the index
CREATE INDEX idx_state_points ON customers (state, points);
-- Now scans only 58 rows

-- CLEANUP: Remove redundant single-column indexes
-- The composite index can handle queries on just 'state' (leftmost column)
-- But cannot handle queries on just 'points' (rightmost column)
DROP INDEX idx_state ON customers; -- Safe to remove: covered by composite
DROP INDEX idx_points ON customers; -- Remove if no queries filter only by points

-- VERIFY: Check remaining indexes on the table
SHOW INDEXES IN customers;