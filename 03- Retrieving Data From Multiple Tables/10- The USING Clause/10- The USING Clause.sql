USE sql_store;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve order details, including customer name and shipper name
-- Select: 'order_id' from 'orders', 'first_name' from 'customers', 'name' from 'shippers'
-- From: 'orders' (aliased as 'o')
-- Join: INNER JOIN 'customers' (aliased as 'c') USING ('customer_id')
--       (ensures only orders with an associated customer are included)
-- Join: LEFT JOIN 'shippers' (aliased as 'sh') USING ('shipper_id')
--       (ensures orders without a shipper are still included)
-- Note: USING is used when column names are identical in both tables, simplifying the join syntax
-- ------------------------------------------------------------------------------------
SELECT o.order_id, c.first_name, sh.name
FROM orders o
         JOIN customers c USING (customer_id)
         LEFT JOIN shippers sh USING (shipper_id);

-- ------------------------------------------------------------------------------------
-- Query: Retrieve all order item details, including related notes
-- Select: All columns from 'order_items' and 'order_item_notes'
-- From: 'order_items'
-- Join: INNER JOIN 'order_item_notes' USING ('order_id', 'product_id')
--       (ensures only matching order items with notes are retrieved)
-- Note: Composite keys ('order_id', 'product_id') ensure correct mapping between order items and notes
-- ------------------------------------------------------------------------------------
SELECT *
FROM order_items
         JOIN order_item_notes USING (order_id, product_id);

USE sql_invoicing;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve payment details along with client name and payment method
-- Select: 'date' and 'amount' from 'payments', 'name' from 'clients', 'name' from 'payment_methods'
-- From: 'payments' (aliased as 'p')
-- Join: INNER JOIN 'clients' (aliased as 'c') USING ('client_id')
--       (ensures every payment is linked to a valid client)
-- Join: INNER JOIN 'payment_methods' (aliased as 'pm') ON 'p.payment_method' = 'pm.payment_method_id'
--       (links each payment to its respective payment method)
-- Note: USING is used for 'client_id' since it's identical in both tables, but 'ON' is required for 'payment_method_id'
--       as the column names differ
-- ------------------------------------------------------------------------------------
SELECT p.date, c.name, p.amount, pm.name
FROM payments p
         JOIN clients c USING (client_id)
         JOIN payment_methods pm ON p.payment_method = pm.payment_method_id;
