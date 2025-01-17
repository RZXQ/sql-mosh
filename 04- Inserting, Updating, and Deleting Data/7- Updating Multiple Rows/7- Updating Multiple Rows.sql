-- Query: Update payment details for specific clients in the `invoices` table
-- Update Table: `invoices`
-- Columns:
--   - payment_total (set to 50% of the invoice_total)
--   - payment_date (set to due_date)
-- Filter: Updates rows where client_id is 3 or 4
-- Note: Uses the IN operator to filter for multiple client_ids
USE sql_invoicing;
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE client_id IN (3, 4);

-- Query: Add bonus points to customers born before a specific date
-- Update Table: `customers`
-- Columns:
--   - points (increased by 50)
-- Filter: Updates rows where birth_date is earlier than January 1, 1990
-- Note: Birth_date condition ensures only eligible customers receive the bonus
USE sql_store;
UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01';