--Create two tables 
--Products: columns (product_id,product_name,category and price)
--Orders : columns(   order_id, customer_name, product_id, quantity, order_date)
CREATE SCHEMA Shop;
set search_path to Shop;
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT 
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

--1. CRUD
-- Insert into Products
INSERT INTO Products (product_id, product_name, category, price) VALUES 
(1, 'Laptop', 'Electronics', 1000),
(2, 'Smartphone', 'Electronics', 500),
(3, 'Tablet', 'Electronics', 300),
(4, 'Headphones', 'Accessories', 50);


INSERT INTO Orders (order_id, customer_name, product_id, quantity, order_date) VALUES 
(1, 'John Doe', 1, 2, '2024-06-01'),
(2, 'Jane Smith', 2, 1, '2024-06-02'),
(3, 'Alice Johnson', 3, 5, '2024-06-03'),
(4, 'Chris Lee', 4, 3, '2024-06-04');


-- Select all products
SELECT * FROM Products;

-- Select all orders
SELECT * FROM Orders;

-- Select orders for a specific customer
SELECT * FROM Orders WHERE customer_name = 'John Doe';

-- Update the price of a product
UPDATE Products
SET price = 1200
WHERE product_id = 1;

-- Update the quantity of an order
UPDATE Orders
SET quantity = 4
WHERE order_id = 2;


-- Delete an order
DELETE FROM Orders
WHERE order_id = 3;
--2. Calculate the Total Quantity Ordered for Each Product Category
SELECT p.category, SUM(o.quantity) AS total_quantity
FROM Orders o,
Products p where o.product_id = p.product_id
GROUP BY p.category;
--3. Find Categories Where the Total Number of Products Ordered is Greater Than 5
SELECT p.category, SUM(o.quantity) AS total_quantity
FROM Orders o,
Products p where o.product_id = p.product_id
GROUP BY p.category
HAVING SUM(o.quantity) > 5;
