USE sql_store2;

DROP TABLE IF EXISTS customers;

CREATE TABLE IF NOT EXISTS customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    points      INT          NOT NULL DEFAULT 0,
    email       VARCHAR(255) NOT NULL UNIQUE
)