/*
Summary:
1. Joining Tables with Aliases:
   - Use `JOIN` to combine data from two tables based on a related column.
   - Aliases (like `o` and `c`) make the query shorter and more readable.
2. Selecting Columns with Prefixes:
   - To avoid ambiguity, use table prefixes (e.g., `o.customer_id`) when columns have the same name in different tables.
*/

-- 1. Query for Order and Customer Information
-- - Retrieves order and customer details, using aliases for table names to simplify the query.
SELECT order_id,
       o.customer_id,
       first_name,
       last_name
FROM orders o
         JOIN
     customers c
     ON o.customer_id = c.customer_id;

-- Exercise: Query for Order Item and Product Details
-- - Retrieves order item details along with product information.
-- - Uses table aliases (`oi` for `order_items` and `p` for `products`) for brevity.
SELECT order_id,
       oi.product_id,
       quantity,
       oi.unit_price
FROM order_items oi
         JOIN
     products p
     ON oi.product_id = p.product_id;