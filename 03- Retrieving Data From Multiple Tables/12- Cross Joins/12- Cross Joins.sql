USE sql_store;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve all possible combinations of customer names and product names using explicit CROSS JOIN
-- Select: 'first_name' from 'customers' (as 'customer'), 'name' from 'products' (as 'product')
-- From: 'customers' (aliased as 'c')
-- Join: Explicit CROSS JOIN with 'products' (aliased as 'p'), generating all possible pairs
-- Note: CROSS JOIN pairs each row in 'customers' with every row in 'products'
-- Order: By 'first_name' in ascending order
-- ------------------------------------------------------------------------------------
SELECT c.first_name AS customer, p.name AS product
FROM customers c
         CROSS JOIN products p
ORDER BY c.first_name;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve all possible combinations of customer names and product names using implicit CROSS JOIN
-- Select: 'first_name' from 'customers' (as 'customer'), 'name' from 'products' (as 'product')
-- From: 'customers' (aliased as 'c'), 'products' (aliased as 'p') (comma-separated for implicit CROSS JOIN)
-- Note: Implicit CROSS JOIN (comma-separated tables) is functionally identical to explicit CROSS JOIN
--       but is less clear and may be harder to read in complex queries
-- Order: By 'first_name' in ascending order
-- ------------------------------------------------------------------------------------
SELECT c.first_name AS customer, p.name AS product
FROM customers c,
     products p
ORDER BY c.first_name;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve all possible combinations of shipper names and product names using implicit CROSS JOIN
-- Select: 'name' from 'shippers' (as 'shipper'), 'name' from 'products' (as 'product')
-- From: 'shippers' (aliased as 'sh'), 'products' (aliased as 'p') (comma-separated for implicit CROSS JOIN)
-- Note: Implicit CROSS JOIN generates all possible pairs of 'shippers' and 'products'
-- Order: By 'name' of 'shippers' in ascending order
-- ------------------------------------------------------------------------------------
SELECT sh.name AS shipper, p.name AS product
FROM shippers sh,
     products p
ORDER BY sh.name;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve all possible combinations of shipper names and product names using explicit CROSS JOIN
-- Select: 'name' from 'shippers' (as 'shipper'), 'name' from 'products' (as 'product')
-- From: 'shippers' (aliased as 'sh')
-- Join: Explicit CROSS JOIN with 'products' (aliased as 'p') to clearly define the join type
-- Note: Explicit CROSS JOIN is preferred for readability and avoiding ambiguity
-- Order: By 'name' of 'shippers' in ascending order
-- ------------------------------------------------------------------------------------
SELECT sh.name AS shipper, p.name AS product
FROM shippers sh
         CROSS JOIN products p
ORDER BY sh.name;