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

-- -------------------------
-- How MySQL Searches with Different Index Types (Book Metaphor)
-- -------------------------
-- ALL:
--   MySQL checks every row in the table.
--   (Like reading every page of a book to find your topic. Slowest.)
--
-- ref:
--   MySQL uses the index to directly look up a specific value.
--   (Like looking at the index in the back of the book, jumping straight to the right page for your topic. Fast for exact matches.)
--
-- range:
--   MySQL uses the index to find all values that fall within a range.
--   (Like using the book's index to find all pages for topics between "California" and "Colorado". Fast for ranged searches.)