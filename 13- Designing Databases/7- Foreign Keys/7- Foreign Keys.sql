-- =========================================
-- Table: enrollments
-- =========================================
-- Columns:
--   date        : DATETIME      | NOT NULL
--   price       : DECIMAL(5,1)  | NOT NULL
--   student_id  : INT           | NOT NULL | FK to students(student_id)
--   course_id   : INT           | NOT NULL | FK to courses(course_id)
--
-- Primary Key:
--   (student_id, course_id)
--
-- Foreign Keys:
--   student_id → students(student_id)
--     - ON UPDATE CASCADE   : If student_id changes in students, update here too.
--     - ON DELETE RESTRICT  : Cannot delete student if there are enrollments.
--
--   course_id → courses(course_id)
--     - ON UPDATE CASCADE   : If course_id changes in courses, update here too.
--     - ON DELETE RESTRICT  : Cannot delete course if there are enrollments.
--
-- Foreign Key Actions (most common listed first):
--   CASCADE     : Change or delete in parent applies to child too. (Most common for updates.)
--   RESTRICT    : Prevents delete/update if child rows exist. (Most common for deletes.)
--   NO ACTION   : Similar to RESTRICT, but checks at end of statement.
--   SET NULL    : Sets child column to NULL if parent is deleted/updated.
--   SET DEFAULT : Sets child column to default value if parent is deleted/updated.

CREATE TABLE enrollments
(
    date       DATETIME      NOT NULL,
    price      DECIMAL(5, 1) NOT NULL,
    student_id INT           NOT NULL,
    course_id  INT           NOT NULL,
    PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_student FOREIGN KEY (student_id)
        REFERENCES students (student_id)
        ON UPDATE CASCADE   -- Change student_id here if changed in students
        ON DELETE RESTRICT, -- Prevent delete if enrollments exist
    CONSTRAINT fk_course FOREIGN KEY (course_id)
        REFERENCES courses (course_id)
        ON UPDATE CASCADE   -- Change course_id here if changed in courses
        ON DELETE RESTRICT  -- Prevent delete if enrollments exist
);