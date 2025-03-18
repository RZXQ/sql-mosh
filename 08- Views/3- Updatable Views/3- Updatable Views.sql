-- updatable table view:
-- doesn't have those:
-- 1. Distinct
-- 2. Aggregate functions(min, max, sum)
-- 3. union

USE sql_invoicing;

-- Query: Create or replace a view showing invoices with positive balance
-- View name: invoices_with_balance
-- Columns:
--   - invoice_id (from table invoices)
--   - number (from table invoices)
--   - client_id (from table invoices)
--   - invoice_total (from table invoices)
--   - payment_total (from table invoices)
--   - balance (calculated as invoice_total minus payment_total)
--   - invoice_date (from table invoices)
--   - due_date (from table invoices)
-- Sources: invoices table
-- Condition: where (invoice_total - payment_total) > 0
CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT invoice_id,
       number,
       client_id,
       invoice_total,
       payment_total,
       invoice_total - payment_total AS balance,
       invoice_date,
       due_date
FROM invoices
WHERE (invoice_total - payment_total) > 0;

-- Query: Delete record from invoices_with_balance view
-- Target: invoices_with_balance view
-- Action: DELETE
-- Condition: where invoice_id = 1
DELETE
FROM invoices_with_balance
WHERE invoice_id = 1;

-- Query: Update due_date for a specific invoice
-- Target: invoices_with_balance view
-- Action: UPDATE due_date by adding 2 days using DATE_ADD function
-- Condition: where invoice_id = 2
UPDATE invoices_with_balance
SET due_date = DATE_ADD(due_date, INTERVAL 2 DAY)
WHERE invoice_id = 2;