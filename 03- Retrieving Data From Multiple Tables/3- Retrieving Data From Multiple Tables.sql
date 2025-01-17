-- ==================== Inner Joins ====================
SELECT *
FROM table1
         INNER JOIN table2 ON table1.column_name = table2.column_name;

-- ==================== Self Joins ====================
SELECT a.column_name, b.column_name
FROM table_name a
         INNER JOIN table_name b ON a.column_name = b.column_name;

-- ==================== Joining Multiple Tables ====================
SELECT *
FROM table1
         INNER JOIN table2 ON table1.column_name = table2.column_name
         INNER JOIN table3 ON table2.column_name = table3.column_name;

-- ==================== Compound Join Conditions ====================
SELECT *
FROM table1
         INNER JOIN table2 ON table1.column1 = table2.column1 AND table1.column2 = table2.column2;

-- ==================== Implicit Join Syntax ====================
SELECT *
FROM table1,
     table2
WHERE table1.column_name = table2.column_name;

-- ==================== Outer Joins ====================
SELECT *
FROM table1
         LEFT JOIN table2 ON table1.column_name = table2.column_name;

-- ==================== Outer Join Between Multiple Tables ====================
SELECT *
FROM table1
         LEFT JOIN table2 ON table1.column_name = table2.column_name
         LEFT JOIN table3 ON table2.column_name = table3.column_name;

-- ==================== Self Outer Joins ====================
SELECT a.column_name, b.column_name
FROM table_name a
         LEFT JOIN table_name b ON a.column_name = b.column_name;

-- ==================== The USING Clause ====================
SELECT *
FROM table1
         INNER JOIN table2 USING (column_name);

-- ==================== Natural Joins ====================
SELECT *
FROM table1
         NATURAL JOIN table2;

-- ==================== Cross Joins ====================
SELECT *
FROM table1
         CROSS JOIN table2;

-- ==================== Unions ====================
SELECT column1, column2
FROM table1

UNION

SELECT column1, column2
FROM table2;
