-- Find clients without invoices(using outer join)
USE sql_invoicing;
SELECT *
FROM clients
         LEFT JOIN invoices USING (client_id)
WHERE invoice_id IS NULL;

-- Find customers who have ordered lettuce(id = 3)
--      Select customer_id, first_name, last_name
--      using subqueries
SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN
      (SELECT customer_id
       FROM orders
       WHERE order_id IN (SELECT order_id FROM order_items WHERE product_id = 3));

-- Find customers who have ordered lettuce(id = 3)
--      Select customer_id, first_name, last_name
--      using join
USE sql_store;
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customers c
         JOIN orders o USING (customer_id)
         JOIN order_items oi USING (order_id)
WHERE oi.product_id = 3;



