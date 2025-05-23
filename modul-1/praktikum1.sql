CREATE DATABASE db_coffeshop;
USE db_coffeshop;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    join_date DATE DEFAULT CURRENT_DATE
);
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    category ENUM('Coffee', 'Snack') NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0
);
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE IF NOT EXISTS order_details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE IF NOT EXISTS product_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    COMMENT TEXT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (nama, email, phone, join_date) VALUES
  ('Ahmad', 'ahmad@email.com', '081234567890', '2024-01-15'),
  ('Anwar', 'anwar@email.com', '082345678901', '2024-02-20'),
  ('Bella', 'bella@email.com', '083456789012', '2024-03-05'),
  ('Citra', 'citra@email.com', '084567890123', '2024-03-10'),
  ('Dito', 'dito@email.com', '085678901234', '2024-03-12'),
  ('Eva', 'eva@email.com', '086789012345', '2024-03-15'),
  ('Farhan', 'farhan@email.com', '087890123456', '2024-03-18'),
  ('Gita', 'gita@email.com', '088901234567', '2024-03-20'),
  ('Hadi', 'hadi@email.com', '089012345678', '2024-03-22'),
  ('Indra', 'indra@email.com', '080123456789', '2024-03-25');

INSERT INTO products (nama, category, price, stock) VALUES
  ('Arabica Mist', 'Coffee', 150.00, 50),
  ('Vanilla Latte', 'Coffee', 120.00, 30),
  ('Espresso Dark Blend', 'Coffee', 80.00, 100),
  ('Croissant', 'Snack', 25.00, 75),
  ('Caramel Macchiato', 'Coffee', 90.00, 60);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
  (1, '2024-03-01 10:30:00', 200.00),
  (2, '2024-03-02 14:15:00', 200.00),
  (3, '2024-03-05 09:45:00', 170.00),
  (4, '2024-03-10 16:20:00', 240.00),
  (5, '2024-03-12 11:10:00', 115.00),
  (6, '2024-03-15 13:25:00', 90.00),
  (7, '2024-03-18 17:30:00', 300.00),
  (8, '2024-03-20 08:50:00', 65.00),
  (9, '2024-03-22 12:00:00', 210.00),
  (10, '2024-03-25 15:45:00', 180.00);

INSERT INTO order_details (order_id, product_id, quantity, subtotal) VALUES
  (1, 1, 1, 150.00), (1, 4, 2, 50.00),
  (2, 2, 1, 120.00), (2, 3, 1, 80.00),
  (3, 5, 1, 90.00), (3, 4, 1, 25.00), (3, 2, 1, 120.00),
  (4, 1, 2, 300.00),
  (5, 4, 3, 75.00),
  (6, 3, 1, 80.00),
  (7, 1, 1, 150.00), (7, 2, 1, 120.00),
  (8, 4, 1, 25.00),
  (9, 5, 2, 180.00),
  (10, 3, 2, 160.00);

INSERT INTO product_reviews (product_id, customer_id, rating, COMMENT) VALUES
  (1, 1, 5, 'Aromanya sangat autentik!'),
  (3, 2, 4, 'Kuat tapi tidak pahit.'),
  (2, 3, 3, 'Terlalu manis untukku.'),
  (5, 7, 5, 'Sempurna untuk pagi hari!'),
  (4, 9, 4, 'Croissantnya renyah!');
  

SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_details;
SELECT * FROM customers;
SELECT * FROM product_reviews; 
 