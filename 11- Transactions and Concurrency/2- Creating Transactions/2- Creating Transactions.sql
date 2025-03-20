-- ------------------------------------------------------------------------------------
-- Query: Insert a new order and its items using a manual transaction
-- Database: sql_store
-- Purpose: Ensure both INSERTs succeed or fail together to maintain data consistency
-- ------------------------------------------------------------------------------------
USE sql_store;

START TRANSACTION;

INSERT INTO orders(customer_id, order_date, status)
VALUES (1, '2019-01-01', 1);

INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 1);

COMMIT;

-- ------------------------------------------------------------------------------------
-- Query: Check the autocommit setting
-- Purpose: Understand if MySQL automatically commits each statement
-- ------------------------------------------------------------------------------------
SHOW VARIABLES LIKE 'auto%';

-- ------------------------------------------------------------------------------------
-- Explanation: Why Use Manual Transactions?
-- Problem: Inserting an order and its items separately risks incomplete data if one INSERT fails.
-- Solution: A manual transaction groups them into one atomic unit—both succeed or both fail.
-- Example: If order_items INSERT fails (e.g., due to a constraint), the orders INSERT is rolled back too.
-- Benefit: Guarantees consistent data, critical for reliable web apps.
-- ------------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------------
-- Explanation: What Does Autocommit Do?
-- Definition: When ON (default), each SQL statement is automatically treated as its own transaction.
-- Behavior: A statement (e.g., INSERT) is committed if it succeeds or rolled back if it fails.
-- Purpose: Ensures data integrity for single statements without needing manual control.
-- Example: An INSERT crashing mid-execution won’t leave partial data—MySQL cleans it up automatically.
-- ------------------------------------------------------------------------------------