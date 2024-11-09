USE sql_store;

-- Select all columns from 'customers' table for customer with customer_id = 1, ordered by first_name.
SELECT *
FROM customers
WHERE customer_id = 1
ORDER BY first_name;