-- Select clients that have an invoice
-- using inner join
USE sql_invoicing;
SELECT DISTINCT client_id
FROM clients
         LEFT JOIN invoices i USING (client_id)
WHERE i.invoice_id IS NOT NULL;

-- Select clients that have an invoice
-- using in
USE sql_invoicing;
SELECT *
FROM clients
WHERE client_id IN (SELECT DISTINCT client_id FROM invoices);

-- Select clients that have an invoice
-- using exists(correlated subquery)
USE sql_invoicing;
SELECT *
FROM clients c
WHERE EXISTS (SELECT client_id FROM invoices WHERE client_id = c.client_id);

-- Find the products that have never been ordered
-- using in(correlated subquery)
USE sql_store;
SELECT *
FROM products
WHERE product_id NOT IN (SELECT product_id FROM order_items);


-- Find the products that have never been ordered
-- using exists(correlated subquery)
USE sql_store;
SELECT *
FROM products p
WHERE NOT EXISTS(SELECT product_id FROM order_items WHERE product_id = p.product_id)