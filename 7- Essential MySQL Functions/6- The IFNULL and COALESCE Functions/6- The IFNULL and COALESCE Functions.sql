-- Query: Retrieve order IDs and shipper details, replacing NULL values with 'Not Assigned'
-- Select:
--   - order_id
--   - IFNULL(shipper_id, 'Not Assigned') as Shipper
-- From: 'orders' table (in `sql_store` database)
-- Note: IFNULL replaces NULL shipper_id values with 'Not Assigned'
USE sql_store;
SELECT order_id, IFNULL(shipper_id, 'Not Assigned') AS Shipper
FROM orders;

-- Query: Retrieve order IDs and shipper details, choosing the first non-NULL value
-- Select:
--   - order_id
--   - COALESCE(shipper_id, comments, 'Not Assigned') as Shipper
-- From: 'orders' table (in `sql_store` database)
-- Note: COALESCE checks multiple columns and returns the first non-NULL value 
--       among shipper_id, comments, or 'Not Assigned'
USE sql_store;
SELECT order_id, COALESCE(shipper_id, comments, 'Not Assigned') AS Shipper
FROM orders;

-- Query: Retrieve customer full names and phone numbers, replacing NULL phones with 'Unknown'
-- Select:
--   - CONCAT(first_name, ' ', last_name) as customer
--   - IFNULL(phone, 'Unknown') as phone
-- From: 'customers' table
-- Note: CONCAT merges first_name and last_name into a single 'customer' field, 
--       and IFNULL replaces NULL phone values with 'Unknown'
USE sql_store;
SELECT CONCAT(first_name, ' ', last_name) AS customer, IFNULL(phone, 'Unknown') AS phone
FROM customers;
