-- Select all columns from 'customers' table for customer with customer_id = 1, ordered by first_name.
USE sql_store;
SELECT *
FROM customers
WHERE customer_id = 1
ORDER BY first_name;