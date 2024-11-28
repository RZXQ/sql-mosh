USE sql_store;

-- Find products that are more expensive than Lettuce(id = 3)
SELECT *
FROM products
WHERE unit_price > (SELECT unit_price FROM products WHERE product_id = 3);


USE sql_hr;

-- in sql_hr database:
-- Find employees whose earn more than average
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
