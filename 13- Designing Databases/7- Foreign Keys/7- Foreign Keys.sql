-- Table: enrollments
-- +------------+--------------+----------------------+
-- | Column     | Type         | Notes                |
-- +------------+--------------+----------------------+
-- | date       | DATETIME     | NOT NULL             |
-- | price      | DECIMAL(5,1) | NOT NULL             |
-- | student_id | INT          | NOT NULL             |
-- | course_id  | INT          | NOT NULL             |
-- +------------+--------------+----------------------+
-- PK: student_id, course_id
-- FK: student_id -> students(student_id)
-- FK: course_id  -> courses(course_id)

USE sql_students;
DROP TABLE IF EXISTS enrollments;

CREATE TABLE enrollments
(
    date       DATETIME      NOT NULL,
    price      DECIMAL(5, 1) NOT NULL,
    student_id INT           NOT NULL,
    course_id  INT           NOT NULL,
    -- PK
    PRIMARY KEY (student_id, course_id),
    -- FK: student_id
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students (student_id),
    -- FK: course_id
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses (course_id)
);