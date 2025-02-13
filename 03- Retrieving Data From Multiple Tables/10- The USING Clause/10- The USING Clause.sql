USE sql_store;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve order details, including customer name and shipper name
-- Select: 'order_id' from 'orders', 'first_name' from 'customers', 'name' from 'shippers'
-- From: 'orders' (aliased as 'o')
-- Join: INNER JOIN 'customers' (aliased as 'c') using 'customer_id' (must exist in both tables)
-- Join: LEFT JOIN 'shippers' (aliased as 'sh') using 'shipper_id' (includes orders even without a shipper)
-- Note: USING simplifies joins when column names are identical in both tables
-- ------------------------------------------------------------------------------------
SELECT o.order_id, c.first_name, sh.name
FROM orders o
         JOIN customers c USING (customer_id)
         LEFT JOIN shippers sh USING (shipper_id);

-- ------------------------------------------------------------------------------------
-- Query: Retrieve all order item details, including related notes
-- Select: All columns from 'order_items' and 'order_item_notes'
-- From: 'order_items'
-- Join: INNER JOIN 'order_item_notes' using composite key ('order_id', 'product_id')
-- Note: Composite keys ensure that order item notes are linked to both 'order_id' and 'product_id'
-- ------------------------------------------------------------------------------------
SELECT *
FROM order_items
         JOIN order_item_notes USING (order_id, product_id);

USE sql_invoicing;

-- ------------------------------------------------------------------------------------
-- Query: Retrieve payment details along with client name and payment method
-- Select: 'date' and 'amount' from 'payments', 'name' from 'clients', 'name' from 'payment_methods'
-- From: 'payments' (aliased as 'p')
-- Join: INNER JOIN 'clients' (aliased as 'c') using 'client_id' (every payment is linked to a client)
-- Join: INNER JOIN 'payment_methods' (aliased as 'pm') on 'payment_method_id' (link payments to methods)
-- Note: USING is applicable only for 'client_id', while 'payment_method_id' requires ON as names differ
-- ------------------------------------------------------------------------------------
SELECT p.date, c.name, p.amount, pm.name
FROM payments p
         JOIN clients c USING (client_id)
         JOIN payment_methods pm ON p.payment_method = pm.payment_method_id;
