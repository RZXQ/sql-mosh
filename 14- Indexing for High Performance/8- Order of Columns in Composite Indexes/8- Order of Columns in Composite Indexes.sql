# COMPOSITE INDEX COLUMN ORDERING GUIDE
# The `rows` column in EXPLAIN shows estimated rows MySQL will examine (not result count)
# Lower rows = better performance
# Rule: Put most selective column first, but always test with actual queries

# GENERAL ORDERING RULES:
# 1. Frequently used columns first
# 2. High cardinality (more unique values) columns first
# 3. Consider specific query patterns - they override general rules

USE sql_store;

# STEP 1: Check cardinality to understand data distribution
# Higher COUNT(DISTINCT) = higher cardinality = more selective
# WARNING: High cardinality doesn't always mean best performance
# Always test actual queries to see rows scanned
SELECT COUNT(DISTINCT (state)), COUNT(DISTINCT (last_name))
FROM customers;

# TASK A: Equality + Range Query (state = 'CA' AND last_name LIKE 'A%')
# Testing different column orders to find optimal performance

# Order 1: High cardinality first (last_name, state)
# Result: 40 rows scanned - less efficient
# Why: Finds all 'A%' names first, then filters by CA
CREATE INDEX idx_lastname_state ON customers (last_name, state);

EXPLAIN
SELECT customer_id
FROM customers
WHERE state = 'CA'
  AND last_name LIKE 'A%';

# Order 2: Equality condition first (state, last_name) - OPTIMAL
# Result: 7 rows scanned - more efficient
# Why: Finds CA customers first (smaller set), then filters by 'A%'
CREATE INDEX idx_state_lastName ON customers (state, last_name);

EXPLAIN
SELECT customer_id
FROM customers
WHERE state = 'CA'
  AND last_name LIKE 'A%';

# TASK B: Two Range Conditions (state LIKE 'A%' AND last_name LIKE 'A%')
# When both conditions are ranges, manually specify index for testing
# MySQL's automatic choice may not be optimal

# Test 1: (last_name, state) index - OPTIMAL for dual ranges
# Result: 40 rows scanned
# Better because last_name has higher selectivity for 'A%' pattern
EXPLAIN
SELECT *
FROM customers
         USE INDEX (idx_lastName_state)
WHERE state LIKE 'A%'
  AND last_name LIKE 'A%';

# Test 2: (state, last_name) index
# Result: 51 rows scanned - less efficient for dual ranges
# State 'A%' is less selective than last_name 'A%'
EXPLAIN
SELECT *
FROM customers
         USE INDEX (idx_state_lastName)
WHERE state LIKE 'A%'
  AND last_name LIKE 'A%';