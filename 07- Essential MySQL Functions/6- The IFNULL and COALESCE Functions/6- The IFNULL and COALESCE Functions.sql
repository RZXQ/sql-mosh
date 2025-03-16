-- Query: Retrieve order IDs and replace NULL shipper_id values with 'Not Assigned'
-- Select From: 'orders' table
-- Columns:
--   - 'order_id'
--   - IFNULL(shipper_id, 'Not Assigned') AS 'Shipper'
-- Note: IFNULL replaces NULL 'shipper_id' values with 'Not Assigned'
USE sql_store;
SELECT order_id, IFNULL(shipper_id, 'Not Assigned') AS Shipper
FROM orders;


-- Query: Retrieve order IDs and use first non-NULL value among shipper_id, comments, or 'Not Assigned'
-- Select From: 'orders' table
-- Columns:
--   - 'order_id'
--   - COALESCE(shipper_id, comments, 'Not Assigned') AS 'Shipper'
-- Note: COALESCE function selects the first available non-NULL value (order checked from left to right)
USE sql_store;
SELECT order_id, COALESCE(shipper_id, comments, 'Not Assigned') AS Shipper
FROM orders;


-- Query: Retrieve customer names as concatenation of first_name and last_name, and replace NULL phone numbers with 'Unknown'
-- Select From: 'customers' table
-- Columns:
--   - CONCAT(first_name, ' ', last_name) AS 'customer'
--   - IFNULL(phone, 'Unknown') AS 'phone'
-- Note: CONCAT merges first_name and last_name with space; IFNULL converts NULL phones to 'Unknown'
USE sql_store;
SELECT CONCAT(first_name, ' ', last_name) AS customer, IFNULL(phone, 'Unknown') AS phone
FROM customers;