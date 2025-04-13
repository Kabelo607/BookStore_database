CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    shipping_method_id INT NOT NULL,
    address_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id) 
);

-- Insert missing data into orders table
INSERT INTO orders (order_id) VALUES (1), (2), (3);

-- Insert missing data into addresses table
INSERT INTO addresses (address_id, address_line1, city, country, zip_code) 
VALUES 
    (1, '123 Victoria St', 'Cape Town', 'South Africa', '8001'),
    (2, '456 Nairobi Rd', 'Nairobi', 'Kenya', '00100'),
    (3, '789 Lagos Ave', 'Lagos', 'Nigeria', '100001');

-- Insert missing data into shipping_methods table
INSERT INTO shipping_method (shipping_method_id, shipping_method)
VALUES 
    (1, 'Standard Shipping'),
    (2, 'Express Shipping'),
    (3, 'Overnight Shipping');