-- 1. Databases Reporting: When generating reports, having a meaningful label for missing data enhances readability.
-- SELECT name, COALESCE(email, phone, 'No Contact Information') AS preferred_contact FROM customers;
-- 2. Configuration Defaults: When fetching configuration data, `COALESCE` helps to return default values if customized values are missing.
-- SELECT COALESCE(custom_timeout, global_timeout, 30) AS timeout FROM user_settings;


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