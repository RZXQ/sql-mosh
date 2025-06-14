GRANT CREATE VIEW ON sql_store.* TO moon_app;

SHOW GRANTS FOR moon_app;

REVOKE CREATE VIEW ON sql_store.* FROM moon_app;
