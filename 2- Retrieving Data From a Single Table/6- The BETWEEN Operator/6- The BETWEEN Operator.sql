-- Select customers with points between 1000 and 3000.
USE sql_store;
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;

-- Select customers born between January 1, 1990, and January 1, 2000.
USE sql_store;
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';