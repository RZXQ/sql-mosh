-- Task: Analyze query performance impact of database indexes
-- Database: sql_store
-- Objective: Compare query execution plans before and after creating indexes on filtered columns
-- Steps:
--   1. Run EXPLAIN on queries without indexes to baseline performance
--   2. Create appropriate indexes on columns used in WHERE clauses
--   3. Re-run EXPLAIN to observe performance improvements
--   4. Test both exact match and range queries to see different index behaviors

USE sql_store;

-- Task 1: Analyze string column filtering performance with exact match
-- Query: Find customer_id for customers in California state
-- Table: customers
-- Filter: WHERE state = 'CA' (exact match on string column)
-- Expected without index: type = 'ALL' (full table scan)
-- Expected with index: type = 'ref' (index reference lookup)
CREATE INDEX idx_state ON customers (state);
EXPLAIN
SELECT customer_id
FROM customers
WHERE state = 'CA';

-- Task 2: Analyze numeric column filtering performance with range condition
-- Query: Find customer_id for customers with points above 1000
-- Table: customers
-- Filter: WHERE points > 1000 (range condition on numeric column)
-- Expected without index: type = 'ALL' (full table scan)
-- Expected with index: type = 'range' (index range scan)
CREATE INDEX idx_points ON customers (points);
EXPLAIN
SELECT customer_id
FROM customers
WHERE points > 1000;

-- -------------------------
-- COMMENTARY ON KEY TERMS --
-- -------------------------
-- Index: 
--   Makes searching for values in a column much faster, just like a book index helps you find a topic quickly.
-- type: 
--   Shows how the database plans to access the data.
--   "ALL"   = Full table scan (slowest; every row is checked).
--   "ref"   = Index lookup for a specific value (fast lookup for exact matches).
--   "range" = Index lookup for a range of values (fast for conditions like >, <, BETWEEN).