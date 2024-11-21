USE sql_invoicing;

-- Updates the payment_total to be 50% of the invoice_total and sets the
-- payment_date to the due_date for rows in the invoices table
-- where the client_id is either 3 or 4
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE client_id IN (3, 4);

USE sql_store;

-- Adds 50 points to the points column for rows in the customers table
-- where the birth_date is before January 1, 1990
UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01';