-- ------------------------------------------------------------------------------------
-- Query: Retrieve products that have never been ordered
-- Select: All columns from 'products'
-- Filter (WHERE): product_id NOT IN (SELECT DISTINCT product_id FROM order_items)
-- Note: Uses a subquery to find product_ids listed in 'order_items'
-- ------------------------------------------------------------------------------------
USE sql_store;
SELECT *
FROM products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM order_items);

-- ------------------------------------------------------------------------------------
-- Query: Retrieve clients without invoices
-- Select: All columns from 'clients'
-- Filter (WHERE): client_id NOT IN (SELECT DISTINCT client_id FROM invoices)
-- Note: Uses a subquery to find client_ids listed in 'invoices'
-- ------------------------------------------------------------------------------------
USE sql_invoicing;
SELECT *
FROM clients
WHERE client_id NOT IN (SELECT DISTINCT client_id FROM invoices);
