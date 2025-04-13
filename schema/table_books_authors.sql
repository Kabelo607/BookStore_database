-- RENAME TABLE Authors TO author;

ALTER TABLE Books DROP FOREIGN KEY Books_ibfk_1;
ALTER TABLE Books DROP COLUMN author_id;

RENAME TABLE Books TO book;

CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE address_status (
    address_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL
);

INSERT INTO address_status (status_name) VALUES
('current'),
('previous'),
('billing'),
('shipping');

-- Ensure referenced tables exist and have proper primary keys
-- Example definitions for referenced tables:
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    address_status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);
