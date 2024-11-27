-- Calculates total sales per state and city by summing 'invoice_total' from the 'invoices' table
-- Joins the 'invoices' table with the 'clients' table using the 'client_id' column
-- Groups the results by 'state' and 'city', and includes subtotals and grand totals using the WITH ROLLUP modifier
SELECT state, city, SUM(invoice_total) AS total_sales
FROM invoices i
         JOIN clients c USING (client_id)
GROUP BY state, city
WITH ROLLUP;

-- Calculates total payments per payment method by summing the 'amount' column from the 'payments' table
-- Joins the 'payments' table with the 'payment_methods' table using 'payment_method_id'
-- Groups the results by 'payment_method' name and includes subtotals and grand totals using the WITH ROLLUP modifier
SELECT pm.name AS payment_method, SUM(p.amount) AS total
FROM payments p
         JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
GROUP BY pm.name
WITH ROLLUP;
