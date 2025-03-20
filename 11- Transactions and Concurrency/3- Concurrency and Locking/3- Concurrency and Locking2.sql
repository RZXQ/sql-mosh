USE sql_store;

# If another transaction is modifying the same row, this transaction will wait (be blocked)
# until the first transaction completes (i.e., commits or rolls back).
# If waiting exceeds the timeout limit, the current transaction will automatically roll back.
# When a transaction modifies data, MySQL automatically places a lock on that row
# preventing other transactions from modifying the same data simultaneously.
START TRANSACTION;

UPDATE customers
SET points = points + 10
WHERE customer_id = 1;

COMMIT;