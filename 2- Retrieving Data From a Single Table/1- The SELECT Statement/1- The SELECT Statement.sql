USE sql_store;

-- Task objectives:
-- 1. Switch to the `sql_store` database.
-- 2. Select all columns from the `customers` table.
-- 3. Retrieve only the customer data where `customer_id` is 1.
-- 4. Sort the result by the `first_name` column
SELECT *
FROM customers
WHERE customer_id = 1
ORDER BY first_name;