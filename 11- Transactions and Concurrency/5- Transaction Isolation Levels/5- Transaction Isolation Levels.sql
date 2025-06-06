# Check current transaction isolation level - should show REPEATABLE-READ by default
# transaction_isolation -> REPEATABLE-READ
SHOW VARIABLES LIKE 'transaction_isolation';

# Set transaction isolation level to SERIALIZABLE for the current session only
# This affects only the current connection and will be reset when the session ends
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

# Set transaction isolation level to SERIALIZABLE globally for all new connections
# This changes the default isolation level for all future database connections
# Existing connections will keep their current isolation level
SET GLOBAL TRANSACTION ISOLATION LEVEL SERIALIZABLE;