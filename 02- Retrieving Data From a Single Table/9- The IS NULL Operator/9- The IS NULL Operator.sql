/*
Summary:
1. Null checks in SQL:
   - IS NULL: Checks if a column contains NULL values
   - IS NOT NULL: Checks if a column does not contain NULL values
*/

-- Select customers whose phone number is NULL.
use sql_store;
SELECT *
FROM customers
WHERE phone IS NULL;

-- Select customers whose phone number is NOT NULL.
use sql_store;
SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- Select orders where shipped_date is NULL.
use sql_store;
SELECT *
FROM orders
WHERE shipped_date IS NULL;