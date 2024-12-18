-- The WITH CHECK OPTION enforces that any INSERT or UPDATE operations performed through the view must satisfy the WHERE condition of the view.
-- Direct modifications to the base table bypass the view’s constraints because views are only virtual layers

-- Query: Update payment_total in the 'invoices_with_balance' view
-- Action: Set payment_total = invoice_total for the row where invoice_id = 3
-- Note: After this update, the row might no longer satisfy the view's WHERE condition
--       (invoice_total - payment_total > 0) and will disappear from the view
USE sql_invoicing;
UPDATE invoices_with_balance
SET payment_total = invoice_total
WHERE invoice_id = 3;

-- Query: Retrieve all rows from the 'invoices_with_balance' view
-- Select: All columns (*)
-- From: 'invoices_with_balance' view
-- Note: Updated rows that no longer satisfy the WHERE condition will not appear in the view
SELECT *
FROM invoices_with_balance;

-- Solution: Use WITH CHECK OPTION to prevent updates that violate the view's condition
-- Query: Create or replace the 'invoices_with_balance' view with a CHECK OPTION
-- View Name: invoices_with_balance
-- Columns in View:
--   - invoice_id
--   - number
--   - client_id
--   - invoice_total
--   - payment_total
--   - balance (calculated as invoice_total - payment_total)
--   - invoice_date
--   - due_date
--   - payment_date
-- Filter (Where): Includes only rows where invoice_total - payment_total > 0
-- WITH CHECK OPTION: Ensures that any UPDATE or INSERT operation maintains the WHERE condition
USE sql_invoicing;
CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT invoice_id,
       number,
       client_id,
       invoice_total,
       payment_total,
       invoice_total - payment_total AS balance,
       invoice_date,
       due_date,
       payment_date
FROM invoices
WHERE invoice_total - payment_total > 0
WITH CHECK OPTION;
