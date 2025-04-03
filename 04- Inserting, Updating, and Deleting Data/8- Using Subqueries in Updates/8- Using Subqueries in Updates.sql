-- Query: Update payment details in the `invoices` table for the client named 'Myworks'.
-- Details:
--   - Set `payment_total` to half (`50%`) of the `invoice_total`
--   - Set `payment_date` to the existing `due_date`
-- Condition:
--   - Only update invoices linked to the client with the name exactly matching 'Myworks'
-- Hint:
--   - You'll need a subquery to find `client_id` from the `clients` table matching this client name.
USE sql_invoicing;
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE client_id = (SELECT c.client_id FROM clients c WHERE name = 'Myworks');

-- Query: Update payment details in the `invoices` table for invoices of clients located in 'CA' or 'NY'.
-- Details:
--   - Set `payment_total` to half (`50%`) of the `invoice_total`
--   - Set `payment_date` to the existing `due_date`
-- Condition:
--   - Only update invoices linked to clients from states 'CA' or 'NY'
-- Hint:
--   - Use a subquery to select relevant `client_id` values from the `clients` table, filtering by client's `state`.
USE sql_invoicing;
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE client_id IN (SELECT c.client_id FROM clients c WHERE state IN ('CA', 'NY'));

-- Query: Update unpaid invoices (those with no existing payment date) in the `invoices` table.
-- Details:
--   - Set `payment_total` to half (`50%`) of the `invoice_total`
--   - Set `payment_date` to the existing `due_date`
-- Condition:
--   - Only update rows where `payment_date` is NULL (unpaid invoices)
-- Hint:
--   - Directly filter using a WHERE condition on `payment_date` IS NULL.
USE sql_invoicing;
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE payment_date IS NULL;

-- Query: Mark high-value customers' orders as 'Gold customer' in the `orders` table.
-- Details:
--   - Set `comments` column to 'Gold customer'
-- Condition:
--   - Only update orders for customers who have more than 3000 points in the `customers` table
-- Hint:
--   - Use an IN subquery to identify `customer_id` values from the `customers` table based on `points`.
USE sql_store;
UPDATE orders
SET comments = 'Gold customer'
WHERE customer_id IN (SELECT customer_id FROM customers WHERE points > 3000);