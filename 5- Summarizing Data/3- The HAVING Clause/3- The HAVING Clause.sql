-- use where to filter data before group by, and using having after the group by

USE sql_invoicing;
-- Calculate total sales and number of invoices per client where total sales exceed 500 and number of invoices exceed 5
SELECT client_id, SUM(invoice_total) AS total_sales, COUNT(*) AS number_of_invoices
FROM sql_invoicing.invoices
GROUP BY client_id
HAVING total_sales > 500
   AND number_of_invoices > 5;

USE sql_store;
-- Calculate total sales per customer in Virginia (VA) where total sales exceed 100
SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.quantity * oi.unit_price) AS total_sales
FROM customers c
         JOIN orders o USING (customer_id)
         JOIN order_items oi USING (order_id)
WHERE state IN ('VA')
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING total_sales > 100;
