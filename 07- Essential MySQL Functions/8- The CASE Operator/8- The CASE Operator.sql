-- Query: Categorize orders based on their order year relative to 2019
-- Select:
--   - order_id
--   - CASE to determine order category:
--       - 'Active' if order_date is in 2019
--       - 'Last Year' if order_date is in 2018
--       - 'Archived' if order_date is before 2018
--       - 'Future' if order_date is after 2019
-- From: 'orders' table (in `sql_store` database)
-- Note: Uses CASE to conditionally categorize orders based on the YEAR of order_date
USE sql_store;
SELECT order_id,
       CASE
           WHEN YEAR(order_date) = YEAR('2019-01-01') THEN 'Active'
           WHEN YEAR(order_date) = YEAR('2019-01-01') - 1 THEN 'Last Year'
           WHEN YEAR(order_date) < YEAR('2019-01-01') - 1 THEN 'Archived'
           ELSE 'Future'
           END AS category
FROM orders;

-- Query: Categorize customers into Gold, Silver, or Bronze based on their points
-- Select:
--   - CONCAT(first_name, ' ', last_name) as customer
--   - points
--   - CASE to determine category:
--       - 'Gold' if points > 3000
--       - 'Silver' if points >= 2000 and <= 3000
--       - 'Bronze' for points below 2000
-- From: 'customers' table (in `sql_store` database)
-- Note: Uses CASE to assign a membership category based on the points value
USE sql_store;
SELECT CONCAT(first_name, ' ', last_name) AS customer,
       points,
       CASE
           WHEN points > 3000 THEN 'Gold'
           WHEN points >= 2000 THEN 'Silver'
           ELSE 'Bronze'
           END                            AS category
FROM customers;
