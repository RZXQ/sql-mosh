-- ------------------------------------------------------------------------------------
-- Query: Retrieve employees earning above the average salary in their office
-- Select: All columns from 'employees'
-- Filter (WHERE): e.salary > (SELECT AVG(salary) FROM employees WHERE office_id = e.office_id)
-- Note: Uses a correlated subquery to compare each employee's salary against the average
--       salary for their office (office_id)
-- ------------------------------------------------------------------------------------
USE sql_hr;
SELECT *
FROM employees e
WHERE salary > (SELECT AVG(salary)
                FROM employees
                WHERE office_id = e.office_id);

-- ------------------------------------------------------------------------------------
-- Query: Retrieve invoices larger than the client's average invoice amount
-- Select: All columns from 'invoices'
-- Filter (WHERE): i.invoice_total > (SELECT AVG(invoice_total) FROM invoices WHERE client_id = i.client_id)
-- Note: Uses a correlated subquery to compare each invoice_total against the average
--       invoice_total for the same client (client_id)
-- ------------------------------------------------------------------------------------
USE sql_invoicing;
SELECT *
FROM invoices i
WHERE invoice_total > (SELECT AVG(invoice_total)
                       FROM invoices
                       WHERE client_id = i.client_id);
