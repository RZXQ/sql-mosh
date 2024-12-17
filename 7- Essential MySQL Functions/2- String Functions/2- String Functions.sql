SELECT LENGTH('sky');

SELECT UPPER('sky');

SELECT LOWER('Sky');

SELECT LTRIM('     Sky');
SELECT RTRIM('Sky     ');
SELECT TRIM('     Sky     ');

SELECT LEFT('Kindergarten', 4);
SELECT RIGHT('Kindergarten', 6);

SELECT SUBSTR('Kindergarten', 3);
SELECT SUBSTR('Kindergarten', 3, 5);

SELECT LOCATE('n', 'Kindergarten');
SELECT LOCATE('N', 'Kindergarten');
SELECT LOCATE('q', 'Kindergarten');
SELECT LOCATE('garten', 'Kindergarten');

SELECT REPLACE('Kindergarten', 'garten', 'garden');

SELECT CONCAT('first', 'last');
USE sql_store;
SELECT CONCAT(first_name, ' ', last_name)
FROM customers;