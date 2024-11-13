-- Retrieves 'order_id' from the 'orders' table and 'first_name' from the 'customers' table
-- Joins 'orders' table with 'customers' table using NATURAL RIGHT JOIN
-- NATURAL RIGHT JOIN automatically detects and joins tables on columns with identical names
-- In this case, it joins on 'customer_id' shared between 'orders' and 'customers' tables
-- WARNING: NATURAL JOIN can be unpredictable if columns have unintended name matches or change over time

USE sql_store;

SELECT o.order_id, c.first_name
FROM orders o
         NATURAL JOIN customers c; -- can also be natural left join and natural right join