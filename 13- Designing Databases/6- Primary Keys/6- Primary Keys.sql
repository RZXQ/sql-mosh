--  A primary key in SQL always meets these two conditions:
-- Unique: Each value in the primary key column(s) must be unique across all rows in the table.
-- Not null: A primary key column cannot have values; every row must have a value for the primary key.

-- Table: students
-- +--------------+--------------+----------+
-- | Column Name  | Type         | Notes    |
-- +--------------+--------------+----------+
-- | student_id   | INT          | PK, AI   |
-- | first_name   | VARCHAR(50)  | NOT NULL |
-- | last_name    | VARCHAR(50)  | NOT NULL |
-- | email        | VARCHAR(255) | NOT NULL |
-- | dateRegistered | DATETIME   | NOT NULL |
-- +--------------+--------------+----------+
-- PK = Primary Key, AI = Auto Increment

DROP TABLE IF EXISTS students;
CREATE TABLE students
(
    student_id     INT AUTO_INCREMENT PRIMARY KEY,
    first_name     VARCHAR(50)  NOT NULL,
    last_name      VARCHAR(50)  NOT NULL,
    email          VARCHAR(255) NOT NULL,
    dateRegistered DATETIME     NOT NULL
);

# CREATE TABLE students
# (
#     student_id     INT AUTO_INCREMENT,
#     first_name     VARCHAR(50)  NOT NULL,
#     last_name      VARCHAR(50)  NOT NULL,
#     email          VARCHAR(255) NOT NULL,
#     dateRegistered DATETIME     NOT NULL,
#     PRIMARY KEY (student_id)
# );
#

-- Table: courses
-- +-------------+--------------+----------+
-- | Column Name | Type         | Notes    |
-- +-------------+--------------+----------+
-- | course_id   | INT          | PK, AI   |
-- | title       | VARCHAR(255) | NOT NULL |
-- | price       | DECIMAL(5,2) | NOT NULL |
-- | instructor  | VARCHAR(255) | NOT NULL |
-- +-------------+--------------+----------+
-- PK = Primary Key, AI = Auto Increment

DROP TABLE IF EXISTS courses;
CREATE TABLE courses
(
    course_id     INT AUTO_INCREMENT PRIMARY KEY,
    title         VARCHAR(255)  NOT NULL,
    price         DECIMAL(5, 2) NOT NULL,
    instructor_id SMALLINT      NOT NULL,
    CONSTRAINT courses_fk_instructor_id FOREIGN KEY (instructor_id) REFERENCES instructors (instructor_id)
        ON UPDATE CASCADE ON DELETE RESTRICT

)
