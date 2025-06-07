use sql_store;

-- Check what "access level" this session has (can it see behind curtains?)
show variables like 'transaction_isolation';

-- Give this session a "BACKSTAGE PASS" - can peek behind the curtain!
set transaction isolation level read uncommitted;

-- Look at customer 1's points (will see backstage rehearsals instantly!)
select points from customers where customer_id = 1;

-- What's my session ID? (like my ticket number)
SELECT CONNECTION_ID();

-- Double-check: what's my current "access level"?
SELECT @@transaction_isolation;