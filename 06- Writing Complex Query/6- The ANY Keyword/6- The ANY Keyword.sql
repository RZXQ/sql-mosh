-- Query: Retrieve clients with at least two invoices (using IN)
-- Select:
--   - All columns from `clients`
-- Filter: Includes rows where client_id is in the list of client_ids with at least two invoices
-- Note: Uses a subquery with GROUP BY and HAVING to find clients with two or more invoices
USE sql_invoicing;
SELECT *
FROM clients
WHERE client_id IN (SELECT client_id FROM invoices GROUP BY client_id HAVING COUNT(*) >= 2);

-- Query: Retrieve clients with at least two invoices (using ANY)
-- Select:
--   - All columns from `clients`
-- Filter: Includes rows where client_id matches any client_id with at least two invoices
-- Note: Uses a subquery with GROUP BY and HAVING to identify qualifying client_ids
USE sql_invoicing;
SELECT *
FROM clients
WHERE client_id = ANY (SELECT client_id FROM invoices GROUP BY client_id HAVING COUNT(*) >= 2);
