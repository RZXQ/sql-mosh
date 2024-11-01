/*
Summary:
1. Null checks in SQL:
   - IS NULL: Checks if a column contains NULL values
   - IS NOT NULL: Checks if a column does not contain NULL values
*/

-- 1. Select customers whose phone number is NULL
SELECT *
FROM customers
WHERE phone IS NULL;

-- 2. Select customers whose phone number is NOT NULL
SELECT *
FROM customers
WHERE phone IS NOT NULL;

/* Exercise:
 * 3. Select orders where shipped_date is NULL
 * Note: Correcting the syntax for checking NULL in where clause
 */
SELECT *
FROM orders
WHERE shipped_date IS NULL;