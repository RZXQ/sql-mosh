USE sql_hr;

-- Selects 'employee_id' and 'first_name' from 'employees' table as employee details
-- Joins 'employees' table with itself to get manager details
-- On condition: 'reports_to' in employee matches 'employee_id' in manager
SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees e
         JOIN employees m
              ON e.reports_to = m.employee_id;