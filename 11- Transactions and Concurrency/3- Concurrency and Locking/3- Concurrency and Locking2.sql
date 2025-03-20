USE sql_store;

# When a transaction updates a row, MySQL places a lock on it.
# Other transactions needing to update the same row will be blocked (wait)
# until the first transaction finishes (commits or rolls back).
# If the waiting time exceeds MySQL's timeout limit, the waiting transaction
# gets automatically rolled back.
START TRANSACTION;

UPDATE customers
SET points = points + 10
WHERE customer_id = 1;

COMMIT;