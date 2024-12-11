-- Query 1: Retrieves order and customer details
-- - Selects 'order_id' and 'customer_id' from the 'orders' table (aliased as 'o')
-- - Selects 'first_name' and 'last_name' from the 'customers' table (aliased as 'c')
-- - Joins 'orders' and 'customers' on matching 'customer_id' values to relate each order to its customer
USE sql_store;
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
USE sql_store;
SELECT oi.order_id,
       oi.product_id,
       p.name,
       oi.quantity,
       oi.unit_price
FROM order_items oi
         JOIN
     products p
     ON oi.product_id = p.product_id;