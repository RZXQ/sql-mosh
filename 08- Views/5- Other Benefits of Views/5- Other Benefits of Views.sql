-- Benefits of Views:

-- 1. Simplify Queries:
-- Views allow you to save complex queries as reusable "virtual tables"
-- so you don’t have to rewrite them every time.

-- Example: Calculate balance (invoice_total - payment_total)
-- Instead of writing this query repeatedly:
-- SELECT invoice_id, invoice_total - payment_total AS balance
-- FROM invoices
-- WHERE invoice_total - payment_total > 0;

-- Create a view to simplify:
USE sql_invoicing;
CREATE VIEW invoices_with_balance AS
SELECT invoice_id, invoice_total - payment_total AS balance
FROM invoices
WHERE invoice_total - payment_total > 0;

-- Now you can query the view directly:
-- SELECT * FROM invoices_with_balance;

-- Benefit: Saves time and avoids mistakes when working with complex logic.


-- 2. Reduce the Impact of Changes:
-- If the structure of your database changes (e.g., column names),
-- you only need to update the view definition instead of updating every query.

-- Example: Rename 'invoice_total' to 'total_invoice'
-- Without a view, you update ALL your queries.
-- With a view, you update the view definition once,and bring back the original column name as long as the query uses the view.
USE sql_invoicing;
CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT invoice_id, total_invoice - payment_total AS balance
FROM invoices;

-- Queries using the view remain unchanged:
-- SELECT * FROM invoices_with_balance;

-- Benefit: Changes to the database structure don’t break your queries.


-- 3. Restrict Access to Data:
-- Views allow you to show only specific columns or rows to certain users,
-- without giving them access to the entire table.

-- Example: Hide sensitive columns like 'client_id' or 'payment_total'
-- Create a view showing only non-sensitive data:
USE sql_invoicing;
CREATE VIEW public_invoices AS
SELECT invoice_id, invoice_total, invoice_date
FROM invoices;

-- Users querying 'public_invoices' see only:
-- | invoice_id | invoice_total | invoice_date |

-- Benefit: You control access to sensitive data without changing table permissions.