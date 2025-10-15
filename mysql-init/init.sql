-- Init schema and demo data for ecommerce DB
CREATE TABLE IF NOT EXISTS products (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  category VARCHAR(255),
  price DOUBLE,
  image_path VARCHAR(512)
);

INSERT INTO products (name, category, price, image_path) VALUES
('Wireless Mouse', 'Peripherals', 19.99, 'mouse.jpg'),
('USB Pendrive 64GB', 'Pendrives', 9.99, 'pendrive.jpg'),
('Gaming Laptop', 'Laptops', 1299.00, 'laptop.jpg')
ON DUPLICATE KEY UPDATE name=VALUES(name);
