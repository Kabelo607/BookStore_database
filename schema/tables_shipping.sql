CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    address_id INT NOT NULL,
    shipping_method_id INT NOT NULL,
    
    tracking_number VARCHAR(100),
    estimated_delivery DATE,
    actual_delivery DATE,
    shipping_notes TEXT,
    FOREIGN KEY (order_id) REFERENCES Orders (order_id),
    FOREIGN KEY (address_id) REFERENCES Customers (customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method (shipping_method_id)
);
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    shipping_method VARCHAR(100) NOT NULL
    
);
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country (country_id)
)