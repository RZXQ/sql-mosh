-- Query: Retrieve clients who have at least one invoice (using LEFT JOIN)
-- Select:
--   - DISTINCT client_id from `clients`
-- Join:
--   - `clients` and `invoices` using client_id
-- Filter:
--   - Exclude rows where invoice_id is NULL (clients without invoices)
USE sql_invoicing;
SELECT DISTINCT client_id
FROM clients
         LEFT JOIN invoices i USING (client_id)
WHERE i.invoice_id IS NOT NULL;

-- Query: Retrieve clients who have at least one invoice (using IN)
-- Select:
--   - All columns from `clients`
-- Filter:
--   - Include only clients whose client_id is in the list of client_ids from `invoices`
-- Subquery:
--   - Finds all client_ids that exist in the `invoices` table
USE sql_invoicing;
SELECT *
FROM clients
WHERE client_id IN (SELECT DISTINCT client_id
                    FROM invoices);

-- Query: Retrieve clients who have at least one invoice (using EXISTS)
-- Select:
--   - All columns from `clients`
-- Filter:
--   - Include only clients for whom a matching client_id exists in the `invoices` table
-- Subquery:
--   - Correlates each client_id in `clients` with client_ids in `invoices`
USE sql_invoicing;
SELECT *
FROM clients c
WHERE EXISTS (SELECT client_id
              FROM invoices
              WHERE client_id = c.client_id);

-- Query: Retrieve products that have never been ordered (using NOT IN)
-- Select:
--   - All columns from `products`
-- Filter:
--   - Exclude products whose product_id exists in the `order_items` table
-- Subquery:
--   - Finds all product_ids present in the `order_items` table
USE sql_store;
SELECT *
FROM products
WHERE product_id NOT IN (SELECT product_id
                         FROM order_items);

-- Query: Retrieve products that have never been ordered (using NOT EXISTS)
-- Select:
--   - All columns from `products`
-- Filter:
--   - Exclude products for which a matching product_id exists in the `order_items` table
-- Subquery:
--   - Correlates each product_id in `products` with product_ids in `order_items`
USE sql_store;
SELECT *
FROM products p
WHERE NOT EXISTS (SELECT product_id
                  FROM order_items
                  WHERE product_id = p.product_id);
