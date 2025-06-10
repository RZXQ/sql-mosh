-- Select 'sql_store2' database
USE sql_store2;

-- Add 'last_name' column after 'first_name' in 'customers'
-- Add 'city' column to 'customers'
-- Change 'first_name' column type to VARCHAR(55) and set default value ''
-- Remove 'points' column from 'customers'
ALTER TABLE customers
    ADD last_name VARCHAR(50) NOT NULL AFTER first_name,
    ADD city      VARCHAR(50) NOT NULL,
    MODIFY COLUMN first_name VARCHAR(55) DEFAULT '',
    DROP points;