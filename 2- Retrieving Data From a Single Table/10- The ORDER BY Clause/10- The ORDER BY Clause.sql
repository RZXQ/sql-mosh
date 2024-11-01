/*
Summary:
1. Sorting in SQL:
   - ORDER BY: Specifies the sort order of the result set
   - DESC: Sorts the result set in descending order
*/

/* Default sorting order:
 * - The default sorting order is by the primary key if no ORDER BY clause is specified
 */
SELECT *
FROM customers;

-- 1. Select customers sorted by first name in ascending order
SELECT *
FROM customers
ORDER BY first_name;

-- 2. Select customers sorted by first name in descending order
SELECT *
FROM customers
ORDER BY first_name DESC;

-- 3. Select customers sorted by state in descending order and first name in ascending order
SELECT *
FROM customers
ORDER BY state DESC, first_name;

-- 4. Select first name and last name of customers sorted by birth_date
SELECT first_name, last_name
FROM customers
ORDER BY birth_date;

-- 5. Select first name, last name, and points (constant value) of customers sorted by points and then by first name
SELECT first_name, last_name, 10 AS points
FROM customers
ORDER BY points, first_name;

-- 6. Select first name and last name of customers sorted by the first and second columns
-- Note: It is advised to avoid using positional ordering in production code
SELECT first_name, last_name, 10 AS points
FROM customers
ORDER BY 1, 2;

/* Exercise:
 * - Order of clauses: FROM -> WHERE -> SELECT -> ORDER BY
 */

-- 7. Select all columns and calculate total_price for order_items where order_id is 2, sorted by total_price in descending order
SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC;