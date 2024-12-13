-- Query: Retrieve products more expensive than Lettuce (id = 3)
-- Select:
--   - All columns from `products`
-- Filter: Includes rows where unit_price is greater than the unit_price of product_id = 3
USE sql_store;
SELECT *
FROM products
WHERE unit_price > (SELECT unit_price FROM products WHERE product_id = 3);

-- Query: Retrieve employees earning above the average salary
-- Select:
--   - All columns from `employees`
-- Filter: Includes rows where salary is greater than the average salary
USE sql_hr;
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);