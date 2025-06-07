use sql_store;

-- Start "rehearsal mode" - practicing behind the curtain
start transaction;

-- Practice the scene (change points to 20, but audience can't see yet)
update customers set points = 20 where customer_id = 1;

-- Decide "that was terrible!" - go back to original script
rollback;

-- This line does nothing now (you already went back to original)
commit;

-- What's my session ID? (different performer ticket)
SELECT CONNECTION_ID();

-- What's my "access level"? (probably regular audience seat)
SELECT @@transaction_isolation;