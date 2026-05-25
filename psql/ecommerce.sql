-- Create Database
DROP DATABASE IF EXISTS ecommercedb;
CREATE DATABASE ecommercedb;

-- Use the database
\c ecommercedb;

-- Create Schema
CREATE SCHEMA IF NOT EXISTS ecommerce;

-- PostgreSQL: Drop tables if they exist
DROP TABLE IF EXISTS ecommerce.orders CASCADE;

DROP TABLE IF EXISTS ecommerce.products CASCADE;

DROP TABLE IF EXISTS ecommerce.employees CASCADE;

DROP TABLE IF EXISTS ecommerce.users CASCADE;

-- ====================
-- USERS TABLE
-- ====================
CREATE TABLE ecommerce.users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    age INT,
    created_at DATE
);

INSERT INTO
    ecommerce.users
VALUES
    (
        1,
        'Alice Johnson',
        'alice@gmail.com',
        25,
        '2025-01-10'
    ),
    (
        2,
        'Brian Kim',
        'brian@yahoo.com',
        30,
        '2025-02-01'
    ),
    (
        3,
        'Charles Njoroge',
        'charles@gmail.com',
        27,
        '2025-03-12'
    ),
    (
        4,
        'Diana Lopez',
        'diana@gmail.com',
        22,
        '2024-11-29'
    ),
    (
        5,
        'Emily Stone',
        'emily@hotmail.com',
        35,
        '2023-07-19'
    ),
    (
        6,
        'Frank Oti',
        'frank@gmail.com',
        29,
        '2025-01-22'
    ),
    (
        7,
        'Grace Wanjiku',
        'grace@gmail.com',
        41,
        '2024-12-03'
    ),
    (
        8,
        'Henry Ford',
        'henry@gmail.com',
        25,
        '2025-02-18'
    ),
    (
        9,
        'Ian Kibet',
        'ian@yahoo.com',
        33,
        '2025-01-15'
    ),
    (
        10,
        'Jane Doe',
        'jane@gmail.com',
        28,
        '2024-10-09'
    ),
    (
        11,
        'Kevin Ade',
        'kevin@gmail.com',
        24,
        '2025-03-20'
    ),
    (
        12,
        'Lara Madsen',
        'lara@gmail.com',
        31,
        '2025-01-28'
    ),
    (
        13,
        'Musa Ali',
        'musa@yahoo.com',
        26,
        '2024-09-14'
    ),
    (
        14,
        'Nina Cole',
        'nina@gmail.com',
        38,
        '2023-12-11'
    ),
    (
        15,
        'Omar Khan',
        'omar@gmail.com',
        29,
        '2025-04-02'
    ),
    (
        16,
        'Paula Reed',
        'paula@hotmail.com',
        34,
        '2024-05-17'
    ),
    (
        17,
        'Quincy Hall',
        'quincy@gmail.com',
        23,
        '2025-02-09'
    ),
    (
        18,
        'Rita George',
        'rita@yahoo.com',
        45,
        '2023-03-25'
    ),
    (
        19,
        'Sam Patel',
        'sam@gmail.com',
        32,
        '2025-01-06'
    ),
    (
        20,
        'Tina Brooks',
        'tina@gmail.com',
        27,
        '2024-08-30'
    ),
    (
        21,
        'Uche Okafor',
        'uche@gmail.com',
        36,
        '2025-04-10'
    ),
    (
        22,
        'Vivian Smith',
        'vivian@yahoo.com',
        29,
        '2025-05-12'
    ),
    (
        23,
        'Will Brown',
        'will@gmail.com',
        31,
        '2024-09-22'
    ),
    (
        24,
        'Xena Lee',
        'xena@gmail.com',
        28,
        '2025-06-18'
    ),
    (
        25,
        'Yusuf Bello',
        'yusuf@gmail.com',
        40,
        '2023-11-11'
    ),
    (
        26,
        'Zara Patel',
        'zara@gmail.com',
        33,
        '2025-07-01'
    ),
    (
        27,
        'Aiden Clark',
        'aiden@gmail.com',
        26,
        '2024-12-20'
    ),
    (
        28,
        'Bella Evans',
        'bella@gmail.com',
        37,
        '2025-02-28'
    ),
    (
        29,
        'Carlos Gomez',
        'carlos@gmail.com',
        30,
        '2025-03-15'
    ),
    (
        30,
        'Daisy King',
        'daisy@gmail.com',
        27,
        '2024-10-25'
    );

-- ====================
-- EMPLOYEES TABLE
-- ====================
CREATE TABLE ecommerce.employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    age INT
);

INSERT INTO
    ecommerce.employees
VALUES
    (1, 'John Smith', 'IT', 6000, 29),
    (2, 'Sarah Lee', 'HR', 4500, 35),
    (3, 'Mike Taylor', 'IT', 7000, 40),
    (4, 'Linda White', 'Finance', 5500, 32),
    (5, 'James Carter', 'Finance', 5500, 43),
    (6, 'Betty Green', 'IT', 7800, 31),
    (7, 'Peter Black', 'Marketing', 4300, 27),
    (8, 'Kevin Moore', 'IT', 6000, 26),
    (9, 'Susan Brown', 'HR', 4700, 34),
    (10, 'David Wilson', 'Marketing', 5200, 30),
    (11, 'Waleed Noor', 'Support', 4200, 27),
    (12, 'Ximena Cruz', 'IT', 8100, 38),
    (13, 'Yusuf Ali', 'Finance', 5700, 41),
    (14, 'Zainab Musa', 'HR', 4800, 32),
    (15, 'Ava Brooks', 'Marketing', 5400, 29),
    (16, 'Ben Foster', 'Support', 4000, 26),
    (17, 'Cleo Sanders', 'IT', 8300, 39),
    (18, 'Drew Harris', 'Finance', 6200, 36),
    (19, 'Ella King', 'HR', 5100, 33),
    (20, 'Felix Grant', 'Marketing', 4900, 28),
    (21, 'Gina Torres', 'IT', 7200, 30),
    (22, 'Hannah Lee', 'HR', 4600, 34),
    (23, 'Isaac Newton', 'Finance', 5800, 39),
    (24, 'Jackie Chan', 'Marketing', 5500, 31),
    (25, 'Kylie Minogue', 'Support', 4300, 29),
    (26, 'Liam Neeson', 'IT', 8000, 42),
    (27, 'Maya Rudolph', 'HR', 4900, 36),
    (28, 'Nina Dobrev', 'Finance', 6000, 33),
    (29, 'Oscar Isaac', 'Marketing', 5200, 28),
    (30, 'Penny Lane', 'Support', 4100, 27);

-- ====================
-- PRODUCTS TABLE
-- ====================
CREATE TABLE ecommerce.products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    price NUMERIC(10, 2)
);

INSERT INTO
    ecommerce.products
VALUES
    (1, 'Laptop', 999.99),
    (2, 'Mouse', 15.99),
    (3, 'Keyboard', 35.00),
    (4, 'Monitor', 149.50),
    (5, 'USB Cable', 5.99),
    (6, 'Headphones', 29.99),
    (7, 'Desk Chair', 89.99),
    (8, 'Webcam', 49.99),
    (9, 'Microphone', 79.99),
    (10, 'External SSD', 120.00),
    (11, 'Docking Station', 139.99),
    (12, 'Smartphone Stand', 12.50),
    (13, 'Gaming Mousepad', 19.00),
    (14, 'Router', 84.99),
    (15, 'Printer', 199.00),
    (16, 'Power Bank', 39.99),
    (17, 'Tablet', 329.00),
    (18, 'Ring Light', 45.00),
    (19, 'Laptop Sleeve', 22.00),
    (20, 'Bluetooth Speaker', 69.00),
    (21, 'Smartwatch', 199.99),
    (22, 'VR Headset', 399.00),
    (23, 'Fitness Tracker', 99.99),
    (24, 'Portable Projector', 249.00),
    (25, 'Wireless Charger', 29.99),
    (26, 'Smart Plug', 24.99),
    (27, 'Action Camera', 299.00),
    (28, 'E-Reader', 129.00),
    (29, 'Noise Cancelling Earbuds', 149.00),
    (30, 'Smart Thermostat', 179.00);

-- ====================
-- ORDERS TABLE
-- ====================
CREATE TABLE ecommerce.orders (
    order_id INT PRIMARY KEY,
    user_id INT REFERENCES ecommerce.users(user_id),
    product_id INT REFERENCES ecommerce.products(product_id),
    quantity INT,
    order_date DATE
);

INSERT INTO
    ecommerce.orders
VALUES
    (1, 1, 1, 1, '2025-02-15'),
    (2, 3, 2, 2, '2025-02-16'),
    (3, 6, 3, 1, '2025-01-25'),
    (4, 8, 1, 1, '2025-02-20'),
    (5, 10, 4, 2, '2024-12-10'),
    (6, 4, 8, 1, '2024-12-21'),
    (7, 2, 3, 1, '2025-02-03'),
    (8, 5, 6, 1, '2024-11-11'),
    (9, 7, 7, 1, '2024-12-14'),
    (10, 9, 1, 1, '2025-01-30'),
    (11, 11, 11, 1, '2025-03-21'),
    (12, 12, 14, 2, '2025-02-12'),
    (13, 13, 5, 3, '2024-10-01'),
    (14, 14, 15, 1, '2024-12-30'),
    (15, 15, 10, 1, '2025-04-07'),
    (16, 16, 9, 1, '2024-06-19'),
    (17, 17, 4, 2, '2025-02-14'),
    (18, 18, 2, 4, '2023-12-11'),
    (19, 19, 20, 1, '2025-01-27'),
    (20, 20, 8, 1, '2024-09-04'),
    (21, 1, 16, 2, '2025-03-03'),
    (22, 3, 12, 1, '2025-03-10'),
    (23, 8, 17, 1, '2025-02-25'),
    (24, 10, 18, 1, '2025-01-18'),
    (25, 6, 19, 2, '2025-04-01'),
    (26, 21, 21, 1, '2025-04-15'),
    (27, 22, 22, 2, '2025-05-01'),
    (28, 23, 23, 1, '2024-09-30'),
    (29, 24, 24, 1, '2025-06-20'),
    (30, 25, 25, 1, '2023-11-15'),
    (31, 26, 26, 2, '2025-07-10'),
    (32, 27, 27, 1, '2024-12-25'),
    (33, 28, 28, 1, '2025-03-18'),
    (34, 29, 29, 1, '2025-03-25'),
    (35, 30, 30, 1, '2024-10-30');