-- Selects customer first names and product names by performing a CROSS JOIN between 'customers' and 'products' tables
-- CROSS JOIN pairs every row in the 'customers' table with every row in the 'products' table
-- Uses explicit CROSS JOIN syntax for clarity, which clearly indicates the type of join
-- Orders results by 'first_name' of customers in ascending order
USE sql_store;
SELECT c.first_name AS customer, p.name AS product
FROM customers c
         CROSS JOIN products p
ORDER BY c.first_name;

-- Selects customer first names and product names by performing a CROSS JOIN between 'customers' and 'products' tables
-- Uses implicit CROSS JOIN syntax, which lists tables separated by commas without an ON condition
-- Orders results by 'first_name' of customers in ascending order
SELECT c.first_name AS customer, p.name AS product
FROM customers c,
     products p
ORDER BY c.first_name;

-- Selects shipper names and product names by performing a CROSS JOIN between 'shippers' and 'products' tables
-- Uses implicit CROSS JOIN syntax, which lists tables separated by commas without an ON condition
-- Orders results by 'name' of shippers in ascending order
SELECT sh.name AS shipper, p.name AS product
FROM shippers sh,
     products p
ORDER BY sh.name;

-- Selects shipper names and product names by performing a CROSS JOIN between 'shippers' and 'products' tables
-- Uses explicit CROSS JOIN syntax for clarity, which clearly indicates the type of join
-- Orders results by 'name' of shippers in ascending order
SELECT sh.name AS shipper, p.name AS product
FROM shippers sh
         CROSS JOIN products p
ORDER BY sh.name;