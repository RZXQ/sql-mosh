USE sql_store;

-- Case A: OR condition forces full index scan
-- Scans entire idx_state_points index because OR can't efficiently use composite indexes
-- Still faster than table scan (only reads state, points, customer_id vs all columns)
EXPLAIN
SELECT customer_id
FROM customers
WHERE state = 'CA'
   OR points > 1000;

-- Case A Solution: Split OR into UNION for better performance
-- Each query can use its respective index efficiently
CREATE INDEX idx_points ON customers (points);
CREATE INDEX idx_state ON customers (state);

EXPLAIN
SELECT customer_id
FROM customers
WHERE state = 'CA'
UNION
SELECT customer_id
FROM customers
WHERE points > 1000;

-- Case B: Expression in WHERE prevents index usage
-- Database can't use index when column is part of expression
EXPLAIN
SELECT customer_id
FROM customers
WHERE points + 10 > 2010;

-- Case B Solution: Isolate column to enable index usage
EXPLAIN
SELECT customer_id
FROM customers
WHERE points > 2000;