USE sql_invoicing;

-- Selects client_id and the total of invoice totals
-- From the invoices table
-- Where the invoice_date is on or after '2019-07-01'
-- Grouped by client_id
-- Orders the result by total_sales in descending order
SELECT client_id,
       SUM(invoice_total) AS total_sales
FROM invoices
WHERE invoice_date >= '2019-07-01'
GROUP BY client_id
ORDER BY total_sales DESC;

-- Selects state, city, and the total of invoice totals
-- From the invoices table
-- Joins with the clients table
-- On the condition that client_id matches in both tables
-- Where the invoice_date is on or after '2019-07-01'
-- Grouped by state and city
SELECT c.state, c.city, SUM(invoice_total) AS total_sales
FROM invoices i
         INNER JOIN clients c USING (client_id)
WHERE invoice_date >= '2019-07-01'
GROUP BY state, city;

-- Selects the date and payment_method and the total of amounts
-- From the payments table
-- Joins with the payment_methods table
-- On the condition that payment_id matches payment_method_id in both tables
-- Grouped by date and payment_method
-- Orders the result by date
SELECT p.date, pm.name AS payment_method, SUM(amount) AS total_payments
FROM payments p
         INNER JOIN payment_methods pm ON p.payment_id = pm.payment_method_id
GROUP BY p.date, payment_method
ORDER BY p.date;