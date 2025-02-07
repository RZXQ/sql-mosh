-- ------------------------------------------------------------------------------------
-- Query: Retrieve all customer details for a specific customer
-- Select From: 'customers' table
-- Filter (Where): customer_id = 1
-- Order By: first_name (ascending order)
-- Note: Fetches complete details of the customer with ID 1, sorted by first name.
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM customers
WHERE customer_id = 1
ORDER BY first_name;
