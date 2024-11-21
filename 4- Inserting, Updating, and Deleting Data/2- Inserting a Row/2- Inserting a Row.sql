-- Switches to the database named 'sql_store'
USE sql_store;

-- Inserts a new record into the 'customers' table
-- Sets the 'last_name' column to 'Smith'
-- Sets the 'first_name' column to 'John'
-- Sets the 'birth_date' column to '1990-01-01'
-- Sets the 'address' column to 'address'
-- Sets the 'city' column to 'city'
-- Sets the 'state' column to 'CA'
INSERT INTO customers(last_name, first_name, birth_date, address, city, state)
VALUES ('Smith', 'John', '1990-01-01', 'address', 'city', 'CA');