USE sql_store;

-- Use Case 1: Understanding different index types on customers table
-- Expected indexes:
--   1. PRIMARY (Clustered Index/Primary Index): Automatically created when primary key is defined
--      - Physically orders and stores ALL table data by primary key value in ascending order (Collation: A)
--      - This is WHY table data appears sorted by primary key by default
--      - Every InnoDB table must have exactly one clustered index
--      - The clustered index IS the table data itself, not a separate structure
--   2. idx_state (Secondary Index): Custom index created for WHERE state queries
--      - MySQL automatically includes primary key column in all secondary indexes
--      - This means idx_state actually contains both (state, customer_id) columns
--      - Secondary indexes point back to the clustered index (primary key) to access full row data
-- Note: Cardinality shows index selectivity - higher values indicate more unique values
SHOW INDEXES IN customers;

-- Task 2: Update table statistics for accurate cardinality calculation
-- Query: Refresh table statistics to get current cardinality estimates
-- Purpose: ANALYZE TABLE recalculates index statistics and cardinality values
-- Note: Cardinality is an estimate and may not reflect exact unique count
ANALYZE TABLE customers;

-- Task 3: Compare index patterns on orders table (table with foreign keys)
-- Query: Display all indexes on orders table
-- Expected behavior: MySQL automatically creates indexes on foreign key columns for efficient joins
-- Expected indexes:
--   1. PRIMARY: Clustered index on order_id - table data is physically sorted by order_id ascending
--   2. fk_orders_customers_idx: Foreign key index on customer_id for joining with customers table
--   3. fk_orders_shippers_idx: Foreign key index on shipper_id for joining with shippers table
--   4. fk_orders_order_statuses_idx: Foreign key index on status for joining with order_statuses table
-- Note: Foreign key indexes are essential for join performance and referential integrity
SHOW INDEXES IN orders;
