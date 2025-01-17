-- Query: Retrieve all combinations of customer names and product names using explicit CROSS JOIN
-- Select: first_name (as customer) from customers; name (as product) from products
-- From: customers (c)
-- Join: products (p) using explicit CROSS JOIN
-- Note: Pairs each row in customers with every row in products
-- Order: By first_name in ascending order
USE sql_store;
SELECT c.first_name AS customer, p.name AS product
FROM customers c
         CROSS JOIN products p
ORDER BY c.first_name;

-- Query: Retrieve all combinations of customer names and product names using implicit CROSS JOIN
-- Select: first_name (as customer) from customers; name (as product) from products
-- From: customers (c), products (p) (comma-separated for implicit CROSS JOIN)
-- Note: Implicit syntax is equivalent to CROSS JOIN but less explicit
-- Order: By first_name in ascending order
USE sql_store;
SELECT c.first_name AS customer, p.name AS product
FROM customers c,
     products p
ORDER BY c.first_name;

-- Query: Retrieve all combinations of shipper names and product names using implicit CROSS JOIN
-- Select: name (as shipper) from shippers; name (as product) from products
-- From: shippers (sh), products (p) (comma-separated for implicit CROSS JOIN)
-- Note: Implicit syntax pairs all rows in shippers with all rows in products
-- Order: By name of shippers in ascending order
USE sql_store;
SELECT sh.name AS shipper, p.name AS product
FROM shippers sh,
     products p
ORDER BY sh.name;

-- Query: Retrieve all combinations of shipper names and product names using explicit CROSS JOIN
-- Select: name (as shipper) from shippers; name (as product) from products
-- From: shippers (sh)
-- Join: products (p) using explicit CROSS JOIN
-- Note: Explicit CROSS JOIN syntax improves clarity about the join type
-- Order: By name of shippers in ascending order
USE sql_store;
SELECT sh.name AS shipper, p.name AS product
FROM shippers sh
         CROSS JOIN products p
ORDER BY sh.name;
