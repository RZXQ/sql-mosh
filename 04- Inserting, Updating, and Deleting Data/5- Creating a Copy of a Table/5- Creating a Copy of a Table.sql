-- Query: Create a new table `orders_archived` with the same structure and data as the `orders` table
-- Create Table: `orders_archived`
-- Source: Copies all columns and data from the `orders` table
-- Note: Primary key and AUTO_INCREMENT properties are not copied
-- Note: CREATE TABLE AS SELECT copies only column definitions (data types) and data values.
-- It does NOT copy primary keys, AUTO_INCREMENT properties, indexes, constraints, triggers, or default column values.
USE sql_store;
CREATE TABLE orders_archived AS
SELECT *
FROM orders;

-- Query: Truncate the `orders_archived` table
-- Truncate Table: `orders_archived`
-- Note: Removes all data but preserves the table structure
USE sql_store;
TRUNCATE TABLE orders_archived;

-- Query: Copy specific records from `orders` to `orders_archived`
-- Insert Into: `orders_archived`
-- Source: Selects all columns from `orders`
-- Filter: Copies records where `order_date` is earlier than '2019-01-01'
USE sql_store;
INSERT INTO orders_archived
SELECT *
FROM orders
WHERE order_date < '2019-01-01';

-- Query: Create a new table `invoices_archived` with specific columns and data
-- Create Table: `invoices_archived`
-- Columns: invoice_id, number, client (from `clients`), invoice_total, payment_total, invoice_date, payment_date, due_date
-- Source: Combines data from `invoices` and `clients` via INNER JOIN on `client_id`
-- Filter: Only includes records where `payment_date` is not null
USE sql_invoicing;
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
