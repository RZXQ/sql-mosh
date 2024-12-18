-- Query: Create an updatable view to show invoices with a positive balance
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
-- From: 'invoices' table (in `sql_invoicing` database)
-- Filter (Where): Includes only invoices where balance > 0
-- Note: The view is updatable because it does not include DISTINCT, aggregates, GROUP BY, or UNION
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
WHERE invoice_total - payment_total > 0;

-- Query: Demonstrate a DELETE operation on the view
-- Action: Deletes the record from the 'invoices_with_balance' view where invoice_id = 1
-- Note: Deleting from an updatable view will delete the corresponding row in the base table ('invoices')
DELETE
FROM invoices_with_balance
WHERE invoice_id = 1;

-- Query: Demonstrate an UPDATE operation on the view
-- Action: Updates the due_date by adding 2 days for the row where invoice_id = 2
-- Note: Updating an updatable view will modify the corresponding row in the base table ('invoices')
UPDATE invoices_with_balance
SET due_date = DATE_ADD(due_date, INTERVAL 2 DAY)
WHERE invoice_id = 2;
