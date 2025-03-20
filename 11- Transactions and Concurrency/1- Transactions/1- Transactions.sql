# Transaction:
-- TRANSACTION: a group of SQL statements that represents a single unit of work
-- A transaction is a group of SQL statements that execute as a single, unified operation.
-- Transactions ensure database integrity and consistency by committing changes either completely or not at all.

-- ACID PROPERTIES:
-- These are the key properties that guarantee reliable processing of database transactions.

-- 1. Atomicity:
-- Ensures that all statements within a transaction are treated as a single unit—either fully executed or fully rolled back.
-- Example: In a bank transfer, funds debit and credit must both either fail or succeed.

-- 2. Consistency:
-- Guarantees that a transaction will transform the database from one valid state to another, maintaining database integrity constraints.
-- Example: After a transaction completes, data rules like unique keys or foreign key constraints are always satisfied.

-- 3. Isolation:
-- Ensures that a transaction executes independently, without interference from concurrent transactions.
-- Example: Multiple customers withdrawing cash simultaneously—each sees their own isolated transaction state.

-- 4. Durability:
-- Ensures that the transaction results are permanently saved to the database, surviving any system failure.
-- Example: After a successful commit, data remains safe and recoverable even after crashes, power loss, or errors.