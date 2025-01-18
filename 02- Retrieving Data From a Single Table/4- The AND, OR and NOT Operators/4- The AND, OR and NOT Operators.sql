-- Select customers born after January 1, 1990, and having more than 1000 points.
USE sql_store;
SELECT *
FROM customers
WHERE birth_date > '1990-01-01'
  AND points > 1000;

-- Select customers born after January 1, 1990, or having more than 1000 points and residing in 'VA'.
USE sql_store;
SELECT *
FROM customers
WHERE birth_date > '1990-01-01'
   OR points > 1000 AND state = 'VA';

-- Select customers not born after January 1, 1990, and not having more than 1000 points.
USE sql_store;
SELECT *
FROM customers
WHERE NOT (birth_date > '1990-01-01' OR points > 1000);

-- Select customers born on or before January 1, 1990, and having 1000 points or less.
USE sql_store;
SELECT *
FROM customers
WHERE birth_date <= '1990-01-01'
  AND points <= 1000;

-- Select items from order_items with order_id 6 where the total price (unit_price * quantity) is greater than 30.
USE sql_store;
SELECT *
FROM order_items
WHERE order_id = 6
  AND unit_price * quantity > 30;