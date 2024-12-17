-- Query: Categorize orders as 'Active' or 'Archived' based on the year of the order date
-- Select:
--   - order_id
--   - order_date
--   - IF(YEAR(order_date) = '2019', 'Active', 'Archived') AS category
-- From: 'orders' table (in `sql_store` database)
-- Note: Uses IF to check if the year of order_date is 2019 and assigns 'Active' or 'Archived'
USE sql_store;
SELECT order_id, order_date, IF(YEAR(order_date) = '2019', 'Active', 'Archived') AS category
FROM orders;

-- Query: Retrieve product details and order frequency, categorized by count of orders
-- Select:
--   - product_id
--   - name
--   - COUNT(*) AS orders
--   - IF(COUNT(*) > 1, 'Many times', 'Once') AS frequency
-- From: 'products' table joined with 'order_items' table
-- Join: 'products' and 'order_items' using product_id
-- Group By: product_id, name
-- Note: COUNT(*) calculates the number of orders per product, and IF categorizes
--       products as 'Many times' if the count > 1, otherwise as 'Once'
USE sql_store;
SELECT product_id, name, COUNT(*) AS orders, IF(COUNT(*) > 1, 'Many times', 'Once') AS frequency
FROM products
         JOIN order_items USING (product_id)
GROUP BY product_id, name;
