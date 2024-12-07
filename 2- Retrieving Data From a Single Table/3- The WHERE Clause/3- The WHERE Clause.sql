-- Select customers with points greater than 3000.
USE sql_store;
SELECT *
FROM customers
WHERE points > 3000;

-- Select customers where the state is 'VA'.
USE sql_store;
SELECT *
FROM customers
WHERE state = 'VA';

-- Select customers where the state is not 'VA'.
USE sql_store;
SELECT *
FROM customers
WHERE state != 'VA';

-- Select customers born after January 1, 1990.
USE sql_store;
SELECT *
FROM customers
WHERE birth_date > '1990-01-01';

-- Select orders placed on or after January 1, 2019.
USE sql_store;
SELECT *
FROM orders
WHERE order_date >= '2019-01-01';