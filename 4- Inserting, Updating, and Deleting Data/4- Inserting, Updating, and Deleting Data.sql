-- ==================== 1- Insert a Single Row ==================== --
INSERT INTO table_name (column1, column2, column3)
VALUES (value1, value2, value3);

-- ==================== 2- Insert Multiple Rows ==================== --
INSERT INTO table_name (column1, column2)
VALUES (value1, value2),
       (value3, value4),
       (value5, value6);

-- ==================== 3- Create a Copy of a Table ==================== --
CREATE TABLE new_table AS
SELECT *
FROM existing_table;

-- ==================== 4- Update a Single Row ==================== --
UPDATE table_name
SET column1 = value1,
    column2 = value2
WHERE id = specific_id;

-- ==================== 5- Update Multiple Rows ==================== --
UPDATE table_name
SET column1 = value1,
    column2 = value2
WHERE condition_column = some_value;

-- ==================== 6- Update with Subqueries ==================== --
UPDATE table_name
SET column1 = (SELECT other_column
               FROM other_table
               WHERE CONDITION)
WHERE another_condition;

-- ==================== 7- Delete Rows ==================== --
DELETE
FROM table_name
WHERE CONDITION;
