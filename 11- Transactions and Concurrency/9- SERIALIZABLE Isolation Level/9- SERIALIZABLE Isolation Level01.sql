USE sql_store;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;

SELECT *
FROM customers
WHERE state = 'VA';

COMMIT;