-- ------------------------------------------------------------------------------------
-- Query: Insert multiple new records into the 'shippers' table
-- Insert Into: 'shippers' table
-- Columns: 'name'
-- Values: ('Shipper1'), ('Shipper2'), ('Shipper3')
-- Note: Adds three new shippers with their respective names
-- ------------------------------------------------------------------------------------
USE sql_store;
INSERT INTO shippers (name)
VALUES ('Shipper1'),
       ('Shipper2'),
       ('Shipper3');

-- ------------------------------------------------------------------------------------
-- Query: Insert multiple new records into the 'products' table
-- Insert Into: 'products' table
-- Columns: 'name', 'quantity_in_stock', 'unit_price'
-- Values: ('Product1', 10, 1.95), ('Product2', 11, 1.95), ('Product3', 12, 1.95)
-- Note: Adds three new products with specified stock quantities and unit prices
-- ------------------------------------------------------------------------------------
INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES ('Product1', 10, 1.95),
       ('Product2', 11, 1.95),
       ('Product3', 12, 1.95);
