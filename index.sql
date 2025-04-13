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
   
    name VARCHAR(255) NOT NULL,
    author_id INT PRIMARY KEY AUTO_INCREMENT,

);

CREATE TABLE Books (
    title VARCHAR(255) NOT NULL,
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    author_id INT,
    language_id INT,
    num_pages INT,
    publication_date DATE,
    publisher_id INT,
    quantity_available INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    address TEXT
);



CREATE TABLE book_language (
    language_id INT,
    language_code VARCHAR(8),
    language_name VARCHAR(50),
    CONSTRAINT pk_language PRIMARY KEY (language_id)
);

CREATE TABLE address_status (
    status_id INT,
    address_status VARCHAR(30),
    CONSTRAINT pk_addr_status PRIMARY KEY (status_id)
);

CREATE TABLE order_status (
    status_id INT,
    status_value VARCHAR(20),
    CONSTRAINT pk_orderstatus PRIMARY KEY (status_id)
);

CREATE TABLE shipping_method (
    method_id INT,
    method_name VARCHAR(100),
    cost DECIMAL(6, 2),
    CONSTRAINT pk_shipmethod PRIMARY KEY (method_id)
);

CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT,
    order_date DATETIME,
    customer_id INT,
    shipping_method_id INT,
    dest_address_id INT,
    CONSTRAINT pk_custorder PRIMARY KEY (order_id),
    CONSTRAINT fk_order_cust FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_order_ship FOREIGN KEY (shipping_method_id) REFERENCES shipping_method (method_id),
    CONSTRAINT fk_order_addr FOREIGN KEY (dest_address_id) REFERENCES address (address_id)
);
