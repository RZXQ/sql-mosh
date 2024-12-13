-- Query: Retrieve clients that have an invoice (using INNER JOIN)
-- Select:
--   - DISTINCT client_id
-- Join:
--   - `clients` with `invoices` on client_id using a LEFT JOIN
-- Filter: Includes rows where invoice_id is NOT NULL
USE sql_invoicing;
SELECT DISTINCT client_id
FROM clients
         LEFT JOIN invoices i USING (client_id)
WHERE i.invoice_id IS NOT NULL;

-- Query: Retrieve clients that have an invoice (using IN)
-- Select:
--   - All columns from `clients`
-- Filter: Includes rows where client_id is in the list of client_ids from `invoices`
-- Note: Uses a subquery to find all client_ids in `invoices`
USE sql_invoicing;
SELECT *
FROM clients
WHERE client_id IN (SELECT DISTINCT client_id
                    FROM invoices);

-- Query: Retrieve clients that have an invoice (using EXISTS)
-- Select:
--   - All columns from `clients`
-- Filter: Includes rows where a matching client_id exists in the `invoices` table
-- Note: Uses a correlated subquery to check for matching client_ids
USE sql_invoicing;
SELECT *
FROM clients c
WHERE EXISTS (SELECT client_id
              FROM invoices
              WHERE client_id = c.client_id);

-- Query: Retrieve products that have never been ordered (using IN)
-- Select:
--   - All columns from `products`
-- Filter: Includes rows where product_id is NOT in the list of product_ids from `order_items`
-- Note: Uses a subquery to find all product_ids in `order_items`
USE sql_store;
SELECT *
FROM products
WHERE product_id NOT IN (SELECT product_id
                         FROM order_items);

-- Query: Retrieve products that have never been ordered (using EXISTS)
-- Select:
--   - All columns from `products`
-- Filter: Includes rows where no matching product_id exists in the `order_items` table
-- Note: Uses a correlated subquery to check for matching product_ids
USE sql_store;
SELECT *
FROM products p
WHERE NOT EXISTS (SELECT product_id
                  FROM order_items
                  WHERE product_id = p.product_id);
