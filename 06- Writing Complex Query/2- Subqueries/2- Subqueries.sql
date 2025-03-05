-- ------------------------------------------------------------------------------------
-- Query: Retrieve products with a higher unit price than the product with ID = 3
-- Select: All columns from 'products'
-- Filter (WHERE): unit_price > (SELECT unit_price FROM products WHERE product_id = 3)
-- Note: Uses a subquery in the WHERE clause to compare prices
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM products
WHERE unit_price > (SELECT unit_price FROM products WHERE product_id = 3);

-- ------------------------------------------------------------------------------------
-- Query: Retrieve employees earning above the average salary
-- Select: All columns from 'employees'
-- Filter (WHERE): salary > (SELECT AVG(salary) FROM employees)
-- Note: Utilizes an aggregate function (AVG) in a subquery to filter rows
-- ------------------------------------------------------------------------------------
USE sql_hr;
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
