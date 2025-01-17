-- Query: Retrieve order ID and customer first name using NATURAL JOIN
-- Select: order_id from orders; first_name from customers
-- From: orders (o)
-- Join: customers (c) using NATURAL JOIN (joins on all columns with identical names, e.g., customer_id)
-- Note: NATURAL JOIN automatically detects matching column names but can lead to unpredictable behavior
--       if column names unintentionally match or change over time
USE sql_store;
SELECT o.order_id, c.first_name
FROM orders o
         NATURAL JOIN customers c;