USE sql_store;

START TRANSACTION;
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;
COMMIT;

SELECT *
FROM customers c
WHERE customer_id = 1;