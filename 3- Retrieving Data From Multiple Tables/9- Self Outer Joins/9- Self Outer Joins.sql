USE sql_hr;

-- Selects 'employee_id' and 'first_name' from 'employees' table as employee details,
-- and 'first_name' from 'employees' table as 'manager' to indicate each employee's manager's name
-- Joins 'employees' with itself using LEFT JOIN to include all employees, even those without a manager (e.g., the CEO)
-- On condition: 'reports_to' in the employee table matches 'employee_id' of the manager
SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees e
         LEFT JOIN employees m ON e.reports_to = m.employee_id;
