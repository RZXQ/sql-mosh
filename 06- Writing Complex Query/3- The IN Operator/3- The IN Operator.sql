-- Query: Retrieve products that have never been ordered
-- Select:
--   - All columns from `products`
-- Filter: Includes rows where product_id is not in the list of product_ids from `order_items`
-- Note: Uses a subquery to identify all product_ids in `order_items`
USE sql_store;
SELECT *
FROM products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM order_items);

-- Query: Retrieve clients without invoices
-- Select:
--   - All columns from `clients`
-- Filter: Includes rows where client_id is not in the list of client_ids from `invoices`
-- Note: Uses a subquery to identify all client_ids in `invoices`
USE sql_invoicing;
SELECT *
FROM clients
WHERE client_id NOT IN (SELECT DISTINCT client_id FROM invoices);
