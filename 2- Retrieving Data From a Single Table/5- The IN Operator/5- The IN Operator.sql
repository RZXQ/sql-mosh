USE sql_store;

-- Select customers residing in either 'VA', 'GA', or 'FL'.
SELECT *
FROM customers
WHERE state IN ('VA', 'GA', 'FL');

-- Select products that have a quantity in stock of 49, 38, or 72.
SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72);

-- Select customers who do not reside in 'VA', 'GA', or 'FL'.
SELECT *
FROM customers
WHERE state NOT IN ('VA', 'GA', 'FL');