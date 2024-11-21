USE sql_invoicing;

-- Updates the payment_total to be 50% of the invoice_total and sets the
-- payment_date to the due_date for rows in the invoices table
-- where the client_id matches the client_id of the client named 'Myworks'
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE client_id = (SELECT c.client_id
                   FROM clients c
                   WHERE name = 'Myworks');

-- Updates the payment_total to be 50% of the invoice_total and sets the
-- payment_date to the due_date for rows in the invoices table
-- where the client_id matches the client_id of the clients located in
-- either 'CA' or 'NY'
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE client_id IN (SELECT c.client_id
                    FROM clients c
                    WHERE state IN ('CA', 'NY'));

-- Updates the payment_total to be 50% of the invoice_total and sets the
-- payment_date to the due_date for rows in the invoices table
-- where the payment_date is currently NULL
UPDATE invoices
SET payment_total = invoice_total * 0.5,
    payment_date  = due_date
WHERE payment_date IS NULL;

USE sql_store;

-- Sets the comments to 'Gold customer' for rows in the orders table
-- where the customer_id matches the customer_id of customers who have
-- more than 3000 points
UPDATE orders
SET comments = 'Gold customer'
WHERE customer_id IN (SELECT customer_id
                      FROM customers
                      WHERE points > 3000);