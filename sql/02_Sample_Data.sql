USE ecommerce_db;



-- Clear existing data (in correct order due to foreign keys)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Order_Items;
TRUNCATE TABLE Orders;
TRUNCATE TABLE Inventory;
TRUNCATE TABLE Products;
TRUNCATE TABLE Customers;
SET FOREIGN_KEY_CHECKS = 1;

-- Customers
INSERT INTO Customers (full_name, email, phone, shipping_address) VALUES
('John Doe', 'john.doe@email.com', '555-0101', '123 Main St, New York, NY'),
('Jane Smith', 'jane.smith@email.com', '555-0102', '456 Oak Ave, Los Angeles, CA'),
('Emily Johnson', 'emily.johnson@email.com', '555-0103', '789 Pine Rd, Chicago, IL'),
('Michael Brown', 'michael.brown@email.com', '555-0104', '321 Elm St, Houston, TX'),
('Sarah Davis', 'sarah.davis@email.com', '555-0105', '654 Maple Dr, Phoenix, AZ'),
('David Wilson', 'david.wilson@email.com', '555-0106', '987 Cedar Ln, Philadelphia, PA'),
('Laura Garcia', 'laura.garcia@email.com', '555-0107', '159 Spruce St, San Antonio, TX'),
('James Martinez', 'james.martinez@email.com', '555-0108', '753 Birch Blvd, San Diego, CA');


-- Products 
INSERT INTO Products (product_name, category, price) VALUES
('iPhone 15 Pro', 'Electronics', 999.99),
('Samsung Galaxy S24', 'Electronics', 899.99),
('Nike Air Max', 'Apparel', 129.99),
('The Great Gatsby', 'Books', 14.99),
('Sony WH-1000XM5', 'Electronics', 349.99),
('Adidas Ultraboost', 'Apparel', 179.99),
('Dell XPS 13', 'Electronics', 1199.99),
('Levi 501 Jeans', 'Apparel', 59.99),
('Kindle Paperwhite', 'Electronics', 129.99),
('Harry Potter Box Set', 'Books', 89.99),
('Apple Watch Series 9', 'Electronics', 399.99),
('Under Armour Hoodie', 'Apparel', 69.99),
('MacBook Air M2', 'Electronics', 999.99),
('The Alchemist', 'Books', 19.99),
('Bose QuietComfort Earbuds', 'Electronics', 279.99),
('Puma Running Shoes', 'Apparel', 119.99),
('Google Pixel 8', 'Electronics', 799.99),
('1984 by George Orwell', 'Books', 12.99),
('HP Spectre x360', 'Electronics', 1399.99),
('North Face Jacket', 'Apparel', 199.99);


-- Inventory for all products
INSERT INTO Inventory (product_id, quantity_in_stock) VALUES
(1, 50), (2, 30), (3, 100), (4, 200), (5, 40),
(6, 80), (7, 25), (8, 150), (9, 60), (10, 90),
(11, 70), (12, 110), (13, 35), (14, 180), (15, 45),
(16, 95), (17, 55), (18, 210), (19, 20), (20, 75);


-- Orders (various dates and statuses)
INSERT INTO Orders (customer_id, order_date, total_amount, order_status) VALUES
(1, '2025-01-15', 1129.98, 'Delivered'),
(2, '2025-02-20', 899.99, 'Shipped'),
(3, '2025-03-05', 179.99, 'Pending'),
(4, '2025-01-25', 349.99, 'Delivered'),
(5, '2025-02-10', 59.99, 'Cancelled'),
(6, '2025-03-15', 1299.99, 'Pending'),
(7, '2025-01-30', 199.99, 'Delivered'),
(8, '2025-02-18', 69.99, 'Shipped'),
(1, '2025-03-22', 279.99, 'Pending'),
(2, '2025-01-12', 119.99, 'Delivered'),
(3, '2025-02-28', 399.99, 'Shipped'),
(4, '2025-03-10', 999.99, 'Pending');


-- Order Items
INSERT INTO Order_Items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 999.99),
(1, 4, 1, 14.99),
(2, 2, 1, 899.99),
(3, 6, 1, 179.99),
(4, 5, 1, 349.99),
(5, 8, 1, 59.99),
(6, 7, 1, 1199.99),
(7, 20, 1, 199.99),
(8, 12, 1, 69.99),
(9, 15, 1, 279.99),
(10, 16, 1, 119.99),
(11, 11, 1, 399.99),
(12, 13, 1, 999.99);