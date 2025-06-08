use sql_students;

DROP TABLE IF EXISTS instructors;

CREATE TABLE instructors
(
    instructor_id SMALLINT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(50)
);