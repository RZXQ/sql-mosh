-- Query 1: Retrieve order and customer details
-- Select: order_id, customer_id from orders; first_name, last_name from customers
-- From: orders (o)
-- Join: customers (c)
-- Condition: o.customer_id = c.customer_id
USE sql_store;
SELECT o.order_id, o.customer_id, c.first_name, c.last_name
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id;

-- Query 2: Retrieve order item and product details
-- Select: order_id, product_id, quantity, unit_price from order_items; name from products
-- From: order_items (oi)
-- Join: products (p)
-- Condition: oi.product_id = p.product_id
USE sql_store;
SELECT oi.order_id, oi.product_id, p.name, oi.quantity, oi.unit_price
FROM order_items oi
         JOIN products p ON oi.product_id = p.product_id;