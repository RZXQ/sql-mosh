-- Query: Reset payment details for a specific invoice
-- Update Table: `invoices`
-- Columns:
--   - payment_total (set to default value, 0)
--   - payment_date (set to NULL)
-- Filter: Only updates the row where invoice_id is 1
-- Note: The keyword 'DEFAULT' uses the column's default value defined in the schema
USE sql_invoicing;
UPDATE invoices
SET payment_total = DEFAULT,
    payment_date  = NULL
WHERE invoice_id = 1;

-- Query: Update payment details for a specific invoice
-- Update Table: `invoices`
-- Columns:
--   - payment_total (set to 50% of the invoice_total)
--   - payment_date (set to due_date)
-- Filter: Only updates the row where invoice_id is 3
-- Note: Calculates payment_total as half of invoice_total and sets payment_date to the due_date
USE sql_invoicing;
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE invoice_id = 3;