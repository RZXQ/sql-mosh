/*
# SQL Summary:
- Database selection: Uses 'sql_store' database
- Queries:
  1. Retrieves order details including each order's ID and customer ID from the 'orders' table,
     and matches each order with the customer's first and last name from the 'customers' table.
  2. Retrieves order item details, including each item's order ID and product ID from the 'order_items' table,
     and matches each item with the product's name from the 'products' table. Also retrieves the quantity and
     unit price for each item from 'order_items'.
*/

-- Selects the 'sql_store' database for accessing its tables in the queries
USE sql_store;

-- Query 1: Retrieves order and customer details
-- - Selects 'order_id' and 'customer_id' from the 'orders' table (aliased as 'o')
-- - Selects 'first_name' and 'last_name' from the 'customers' table (aliased as 'c')
-- - Joins 'orders' and 'customers' on matching 'customer_id' values to relate each order to its customer
SELECT o.order_id,
       o.customer_id,
       c.first_name,
       c.last_name
FROM orders o
         JOIN
     customers c
     ON o.customer_id = c.customer_id;

-- Query 2: Retrieves order item and product details
-- - Selects 'order_id' and 'product_id' from the 'order_items' table (aliased as 'oi')
-- - Selects 'name' from the 'products' table (aliased as 'p') to identify each product by name
-- - Selects 'quantity' and 'unit_price' from the 'order_items' table to show quantity ordered and price per unit
-- - Joins 'order_items' and 'products' on matching 'product_id' values to link each item with product details
SELECT oi.order_id,
       oi.product_id,
       p.name,
       oi.quantity,
       oi.unit_price
FROM order_items oi
         JOIN
     products p
     ON oi.product_id = p.product_id;