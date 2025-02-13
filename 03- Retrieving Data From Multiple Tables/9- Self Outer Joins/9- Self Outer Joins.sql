USE sql_hr;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve employee details along with their respective managers' names
-- Select: 'employee_id' and 'first_name' from 'employees' (as employee details)
--          'first_name' from 'employees' (as 'manager' name)
-- From: 'employees' table (aliased as 'e')
-- Join: LEFT JOIN with 'employees' (aliased as 'm') to include all employees, even those without a manager (e.g., CEO)
-- Condition: Matches 'reports_to' in 'employees' ('e') with 'employee_id' in 'employees' ('m')
-- Note: The LEFT JOIN ensures that employees without a manager (null 'reports_to') are included
-- ------------------------------------------------------------------------------------
SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees e
         LEFT JOIN employees m ON e.reports_to = m.employee_id;
