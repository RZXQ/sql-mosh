-- 1. Select the hr database
USE sql_hr;

-- Select the employee's ID and first name
SELECT e.employee_id,
       e.first_name,
       m.first_name AS manager
-- The main employees table is alias as 'e'
FROM employees e
         JOIN employees m
              ON e.reports_to = m.employee_id;