-- In relational databases:
-- - One-to-one and one-to-many relationships are directly supported.
-- - To represent a many-to-many relationship, use an intermediary (junction) table.
--
-- MySQL requirements:
-- - Each foreign key constraint name must be unique within the same schema.


USE sql_students;

DROP TABLE IF EXISTS tags;
CREATE TABLE tags
(
    tag_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    name   VARCHAR(50) NOT NULL
);

-- Table: course_tags (junction table for many-to-many between courses and tags)
-- +-----------+---------+------------------------------+
-- | Column    | Type    | Notes                        |
-- +-----------+---------+------------------------------+
-- | course_id | INT     | PK, FK → courses.course_id   |
-- | tag_id    | TINYINT | PK, FK → tags.tag_id         |
-- +-----------+---------+------------------------------+
-- PK = Composite Primary Key, FK = Foreign Key

DROP TABLE IF EXISTS course_tags;
CREATE TABLE course_tags
(
    course_id INT     NOT NULL,
    tag_id    TINYINT NOT NULL,
    PRIMARY KEY (course_id, tag_id),
    CONSTRAINT fk_course_tags_course FOREIGN KEY (course_id) REFERENCES courses (course_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_course_tags_tag FOREIGN KEY (tag_id) REFERENCES tags (tag_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);