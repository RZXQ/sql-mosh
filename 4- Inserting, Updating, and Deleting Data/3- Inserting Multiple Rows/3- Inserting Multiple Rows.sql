USE sql_store;

-- Adds multiple new records to the 'shippers' table
-- Columns: 'name'
-- Values: ('Shipper1'), ('Shipper2'), ('Shipper3')
INSERT INTO shippers (name)
VALUES ('Shipper1'),
       ('Shipper2'),
       ('Shipper3');

-- Adds multiple new records to the 'products' table
-- Columns: 'name', 'quantity_in_stock', 'unit_price'
-- Values: ('Product1', 10, 1.95), ('Product2', 11, 1.95), ('Product3', 12, 1.95)
INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES ('Product1', 10, 1.95),
       ('Product2', 11, 1.95),
       ('Product3', 12, 1.95)