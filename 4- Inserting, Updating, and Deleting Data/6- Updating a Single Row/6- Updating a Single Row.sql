USE sql_invoicing;

-- Sets the payment_total to its default value (0) and payment_date to NULL
-- for the row in the invoices table where the invoice_id is 1
-- The keyword 'default' means that MySQL will use the default value for
-- the 'payment_total' column, which is set to 0
UPDATE invoices
SET payment_total = default,
    payment_date  = NULL
WHERE invoice_id = 1;

-- Updates the payment_total to be 50% of the invoice_total and sets the
-- payment_date to the due_date for the row in the invoices table
-- where the invoice_id is 3
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE invoice_id = 3;