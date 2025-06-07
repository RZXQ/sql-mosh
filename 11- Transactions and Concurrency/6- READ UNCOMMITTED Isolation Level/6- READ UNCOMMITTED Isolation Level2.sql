USE sql_store;

-- Start "rehearsal mode" - practicing behind the curtain
START TRANSACTION;

-- Practice the scene (change points to 20, but audience can't see yet)
UPDATE customers
SET points = 20
WHERE customer_id = 1;

-- Decide "that was terrible!" - go back to original script
ROLLBACK;

-- This line does nothing now (you already went back to original)
COMMIT;

-- What's my session ID? (different performer ticket)
SELECT CONNECTION_ID();

-- What's my "access level"? (probably regular audience seat)
SELECT @@transaction_isolation;