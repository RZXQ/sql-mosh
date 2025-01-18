-- Query: Retrieve employees earning above the average salary in their office
-- Select:
--   - All columns from `employees`
-- Filter: Includes rows where an employee's salary is greater than the average salary
--         in their respective office
-- Note: Uses a correlated subquery to calculate the average salary for each office_id
USE sql_hr;
SELECT *
FROM employees e
WHERE salary > (SELECT AVG(salary)
                FROM employees
                WHERE office_id = e.office_id);

-- Query: Retrieve invoices larger than the client's average invoice amount
-- Select:
--   - All columns from `invoices`
-- Filter: Includes rows where an invoice_total is greater than the average invoice_total
--         for the same client
-- Note: Uses a correlated subquery to calculate the average invoice_total for each client_id
USE sql_invoicing;
SELECT *
FROM invoices i
WHERE invoice_total > (SELECT AVG(invoice_total)
                       FROM invoices
                       WHERE client_id = i.client_id);
