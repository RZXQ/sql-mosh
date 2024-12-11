-- Query: Retrieve employee and manager details
-- Select: employee_id, first_name from employees (e); first_name (as manager) from employees (m)
-- From: employees (e)
-- Join: employees (m) (self-join)
-- Condition: e.reports_to = m.employee_id
USE sql_hr;
SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees e
         JOIN employees m
              ON e.reports_to = m.employee_id;
