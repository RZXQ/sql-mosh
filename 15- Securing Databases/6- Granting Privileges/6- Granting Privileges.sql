-- 1: Web/desktop application: read, write data in the database, not creating, modifying existing tables
-- EXECUTE is for stored procedures and functions only
CREATE USER moon_app@localhost IDENTIFIED BY '1234';

GRANT SELECT , INSERT, UPDATE, DELETE , EXECUTE ON sql_store.* TO moon_app;

-- 2: Admin user privileges
USE sql_store;

GRANT ALL ON sql_store.* TO john; -- all privileges on all tables in sql_store database

GRANT ALL ON *.* TO john; -- all privileges on all databases and all tables