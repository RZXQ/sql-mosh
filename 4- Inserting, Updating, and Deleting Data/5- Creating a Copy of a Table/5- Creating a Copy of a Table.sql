-- Switches to the `sql_store` database
USE sql_store;

-- Creates a new table `orders_archived` with the same structure and data as the `orders` table
-- Note: The primary key and AUTO_INCREMENT properties will not be copied to the new table
CREATE TABLE orders_archived AS
SELECT *
FROM orders;

-- Truncates the `orders_archived` table
-- Removes all data from the table but preserves its structure
TRUNCATE TABLE orders_archived;

-- Copies records from the `orders` table to the `orders_archived` table
-- Only copies records where `order_date` is earlier than '2019-01-01'
INSERT INTO orders_archived
SELECT *
FROM orders
WHERE order_date < '2019-01-01';

-- Switches to the `sql_invoicing` database
USE sql_invoicing;

-- Creates a new table `invoices_archived` with a specific structure and data from `invoices`
-- Includes invoice_id, number, client name (from the `clients` table), invoice_total, payment_total, invoice_date, payment_date, and due_date
-- Joins `invoices` with `clients` on client_id
-- Only copies records where `payment_date` is not null
CREATE TABLE invoices_archived AS
SELECT i.invoice_id,
       i.number,
       c.name AS client,
       i.invoice_total,
       i.payment_total,
       i.invoice_date,
       i.payment_date,
       i.due_date
FROM invoices i
         JOIN clients c USING (client_id)
WHERE i.payment_date IS NOT NULL;