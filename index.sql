Create Database Bookstore;

CREATE ROLE 'admin';
CREATE ROLE 'staff';
CREATE ROLE 'customer';


GRANT ALL PRIVILEGES ON bookstore.* TO 'admin';
GRANT SELECT, INSERT, UPDATE, DELETE ON Books TO 'staff';
GRANT SELECT, INSERT, UPDATE, DELETE ON Orders TO 'staff';
GRANT SELECT ON Books TO 'customer';

-- Creating users
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER 'staff_user'@'localhost' IDENTIFIED BY 'staff_password';
CREATE USER 'customer_user'@'localhost' IDENTIFIED BY 'customer_password';

-- Assign roles to users
GRANT 'admin' TO 'admin_user'@'localhost';
GRANT 'staff' TO 'staff_user'@'localhost';
GRANT 'customer' TO 'customer_user'@'localhost';

SET ROLE 'customer';
SET ROLE 'staff';
SET ROLE 'admin';

CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    bio TEXT
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    price DECIMAL(10, 2) NOT NULL,
    quantity_available INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    address TEXT
);



