-- ------------------------------------------------------------------------------------
-- Query: Insert a new customer record into the 'customers' table
-- Insert Into: 'customers' table
-- Columns: 'last_name', 'first_name', 'birth_date', 'address', 'city', 'state'
-- Values: ('Smith', 'John', '1990-01-01', 'address', 'city', 'CA')
-- Note: Ensures correct syntax using 'VALUES' instead of 'VALUE'
-- ------------------------------------------------------------------------------------
USE sql_store;
INSERT INTO customers (last_name, first_name, birth_date, address, city, state)
VALUES ('Smith', 'John', '1990-01-01', 'address', 'city', 'CA');

SELECT *
FROM customers;
