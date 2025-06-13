
-- Task: Optimize string column indexes using prefix indexing technique
-- Database: sql_store
-- Objective: Create efficient indexes on string columns by using only a portion (prefix) of the column
-- Concept: Prefix indexes use only the first N characters of a string column instead of the entire value
-- Benefits:
--   1. Reduced index size (saves disk space and memory)
--   2. Faster index operations (less data to compare)
--   3. Improved cache efficiency (more index entries fit in memory)
-- Trade-off: Slightly less selective than full-column indexes

USE sql_store;

-- Task 1: Create a prefix index on last_name column
-- Query: Create index using first 20 characters of last_name
-- Table: customers
-- Reasoning: 
--   - Full last_name values can be very long (waste space if indexed completely)
--   - First 20 characters usually provide enough uniqueness for efficient filtering
--   - String columns have variable lengths, so prefix indexing is especially beneficial
-- Syntax: column_name(prefix_length) specifies how many characters to index
CREATE INDEX idx_last_name ON customers(last_name(20));

-- Task 2: Determine optimal prefix length through selectivity analysis
-- Query: Test different prefix lengths to find the sweet spot between size and uniqueness
-- Method: Compare distinct value counts for different prefix lengths
-- Goal: Find the shortest prefix that maintains good selectivity (high distinct count)

-- Test 1: Single character prefix (very short, likely poor selectivity)
-- Expected result: Low distinct count (only 26 possible values for English alphabet)
-- Use case: Too short - many different last names would have same prefix
SELECT COUNT(DISTINCT LEFT(last_name, 1)) AS single_char_distinct FROM customers; -- Shows 25

-- Test 2: Five character prefix (longer, better selectivity)
-- Expected result: Much higher distinct count, approaching full column distinctness
-- Use case: Good balance - captures most of the uniqueness while saving space
SELECT COUNT(DISTINCT LEFT(last_name, 5)) AS five_char_distinct FROM customers; -- Shows 995

-- Task 3: Additional prefix length testing for optimization
-- Query: Test various prefix lengths to find optimal balance
-- Strategy: Increment prefix length until distinct count stops increasing significantly
-- Best practice: Choose shortest prefix that gives 90-95% of full column's distinctness

-- Test different prefix lengths to find optimal value
SELECT
    COUNT(DISTINCT LEFT(last_name, 1)) AS prefix_1,
    COUNT(DISTINCT LEFT(last_name, 3)) AS prefix_3,
    COUNT(DISTINCT LEFT(last_name, 5)) AS prefix_5,
    COUNT(DISTINCT LEFT(last_name, 10)) AS prefix_10,
    COUNT(DISTINCT LEFT(last_name, 20)) AS prefix_20,
    COUNT(DISTINCT last_name) AS full_column
FROM customers;

-- Interpretation Guide:
-- - If prefix_5 ≈ full_column, then 5 characters is optimal
-- - If prefix_5 << full_column, try longer prefixes
-- - Stop increasing when additional characters don't significantly improve distinctness
-- - Consider storage vs. selectivity trade-off based on your specific use case