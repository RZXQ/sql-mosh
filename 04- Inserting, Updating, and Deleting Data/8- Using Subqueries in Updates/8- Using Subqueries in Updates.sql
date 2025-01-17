-- Query: Update payment details for invoices linked to a specific client
-- Update Table: `invoices`
-- Columns:
--   - payment_total (set to 50% of the invoice_total)
--   - payment_date (set to due_date)
-- Filter: Updates rows where client_id matches the client_id of the client named 'Myworks'
-- Note: Uses a subquery to find the client_id based on the client's name
USE sql_invoicing;
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE client_id = (SELECT c.client_id
                   FROM clients c
                   WHERE name = 'Myworks');

-- Query: Update payment details for invoices linked to clients in specific states
-- Update Table: `invoices`
-- Columns:
--   - payment_total (set to 50% of the invoice_total)
--   - payment_date (set to due_date)
-- Filter: Updates rows where client_id matches the client_id of clients in 'CA' or 'NY'
-- Note: Uses a subquery to find client_ids based on the state
USE sql_invoicing;
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE client_id IN (SELECT c.client_id FROM clients c WHERE state IN ('CA', 'NY'));

-- Query: Update payment details for invoices with no payment date
-- Update Table: `invoices`
-- Columns:
--   - payment_total (set to 50% of the invoice_total)
--   - payment_date (set to due_date)
-- Filter: Updates rows where payment_date is NULL
-- Note: Ensures all unpaid invoices have updated payment details
USE sql_invoicing;
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE payment_date IS NULL;

-- Query: Mark customers as 'Gold customer' in the orders table
-- Update Table: `orders`
-- Columns:
--   - comments (set to 'Gold customer')
-- Filter: Updates rows where customer_id matches the customer_id of customers with points > 3000
-- Note: Uses a subquery to find eligible customers based on their points
USE sql_store;
UPDATE orders
SET comments = 'Gold customer'
WHERE customer_id IN (SELECT customer_id FROM customers WHERE points > 3000);