-- SQL JOIN PRACTICE DATASET
CREATE DATABASE IF NOT EXISTS human_resource_db;

# USE human_resource_db;

DROP TABLE IF EXISTS employee_projects;

DROP TABLE IF EXISTS attendance;

DROP TABLE IF EXISTS salaries;

DROP TABLE IF EXISTS projects;

DROP TABLE IF EXISTS employees;

DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO
    departments
VALUES
    (1, 'Quality Assurance'),
    (2, 'Development'),
    (3, 'Human Resources'),
    (4, 'Product Management'),
    (5, 'Data Engineering'),
    (6, 'Customer Success'),
    (7, 'Security'),
    (8, 'Sales'),
    (9, 'Marketing'),
    (10, 'Legal'),
    (11, 'Finance'),
    (12, 'Operations'),
    (13, 'IT Support'),
    (14, 'Design'),
    (15, 'Research'),
    (16, 'Logistics'),
    (17, 'Procurement'),
    (18, 'Administration'),
    (19, 'Public Relations'),
    (20, 'Business Intelligence'),
    (21, 'Strategy'),
    (22, 'Compliance'),
    (23, 'Training'),
    (24, 'Facilities'),
    (25, 'Engineering'),
    (26, 'Support'),
    (27, 'Innovation'),
    (28, 'Community'),
    (29, 'Sustainability'),
    (30, 'Analytics');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept_id INT,
    manager_id INT NULL,
    hire_date DATE
);

INSERT INTO
    employees
VALUES
    (101, 'Alice', 'Johnson', 1, NULL, '2021-01-10'),
    (102, 'Brian', 'Smith', 2, 101, '2022-05-12'),
    (103, 'Carol', 'Wong', 2, 102, '2023-02-01'),
    (104, 'David', 'Kim', 3, 101, '2022-08-20'),
    (105, 'Evelyn', 'Brown', 1, 101, '2024-01-02'),
    (106, 'Frank', 'Davis', 8, 101, '2024-03-15'),
    (107, 'Grace', 'Lee', 4, 101, '2024-02-11'),
    (108, 'Henry', 'Morris', 5, 102, '2023-11-05'),
    (109, 'Ivy', 'Turner', 5, 108, '2024-04-19'),
    (110, 'Jason', 'Mills', 6, 104, '2022-12-08'),
    (111, 'Kara', 'Singh', 7, 101, '2023-06-14'),
    (112, 'Liam', 'Parker', 2, 102, '2024-05-02'),
    (113, 'Mina', 'Ali', 3, 104, '2024-06-10'),
    (114, 'Nora', 'Ibrahim', 9, 101, '2024-07-01'),
    (115, 'Owen', 'Price', 6, 110, '2024-01-22'),
    (116, 'Priya', 'Rao', 4, 107, '2024-03-03'),
    (117, 'Quinn', 'Evans', 10, 101, '2023-09-15'),
    (118, 'Rita', 'Patel', 11, 102, '2022-10-10'),
    (119, 'Sam', 'Nguyen', 12, 101, '2023-11-11'),
    (120, 'Tina', 'Martins', 13, 101, '2024-01-20'),
    (121, 'Uma', 'Zhang', 14, 101, '2024-02-14'),
    (122, 'Victor', 'Lopez', 15, 101, '2024-03-18'),
    (123, 'Wendy', 'Clark', 16, 101, '2024-04-22'),
    (124, 'Xander', 'Baker', 17, 101, '2024-05-25'),
    (125, 'Yara', 'Gomez', 18, 101, '2024-06-30'),
    (126, 'Zane', 'Peterson', 19, 101, '2024-07-05'),
    (127, 'Ava', 'Murphy', 20, 101, '2024-08-10'),
    (128, 'Ben', 'Foster', 21, 101, '2024-09-15'),
    (129, 'Cleo', 'Sanders', 22, 101, '2024-10-20'),
    (130, 'Drew', 'Harris', 23, 101, '2024-11-25');

CREATE TABLE salaries (
    emp_id INT,
    salary INT,
    pay_date DATE
);

INSERT INTO
    salaries
VALUES
    (101, 4500, '2024-01-01'),
    (102, 6000, '2024-01-01'),
    (103, 5800, '2024-01-01'),
    (104, 5400, '2024-01-01'),
    (105, 4200, '2024-01-01'),
    (106, 4800, '2024-01-01'),
    (107, 6700, '2024-01-01'),
    (108, 7200, '2024-01-01'),
    (109, 6800, '2024-01-01'),
    (110, 5100, '2024-01-01'),
    (111, 7600, '2024-01-01'),
    (112, 5900, '2024-01-01'),
    (113, 5000, '2024-01-01'),
    (114, 5300, '2024-01-01'),
    (115, 4700, '2024-01-01'),
    (116, 6500, '2024-01-01'),
    (117, 6100, '2024-01-01'),
    (118, 6200, '2024-01-01'),
    (119, 6300, '2024-01-01'),
    (120, 6400, '2024-01-01'),
    (121, 6500, '2024-01-01'),
    (122, 6600, '2024-01-01'),
    (123, 6700, '2024-01-01'),
    (124, 6800, '2024-01-01'),
    (125, 6900, '2024-01-01'),
    (126, 7000, '2024-01-01'),
    (127, 7100, '2024-01-01'),
    (128, 7200, '2024-01-01'),
    (129, 7300, '2024-01-01'),
    (130, 7400, '2024-01-01');

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE
);

INSERT INTO
    projects
VALUES
    (10, 'Automation Framework', '2024-01-15'),
    (11, 'Mobile App Testing', '2024-02-01'),
    (12, 'API Test Suite', '2024-03-10'),
    (13, 'Data Pipeline Revamp', '2024-03-20'),
    (14, 'Cloud Cost Optimization', '2024-04-02'),
    (15, 'Customer Portal', '2024-04-15'),
    (16, 'Zero Trust Rollout', '2024-05-01'),
    (17, 'HR Analytics Dashboard', '2024-05-12'),
    (18, 'Release Automation', '2024-05-22'),
    (19, 'AI Chatbot', '2024-06-01'),
    (20, 'Website Redesign', '2024-06-10'),
    (21, 'Cloud Migration', '2024-06-20'),
    (22, 'Data Lake Setup', '2024-07-01'),
    (23, 'Mobile Payments', '2024-07-10'),
    (24, 'Customer Insights', '2024-07-20'),
    (25, 'Security Audit', '2024-08-01'),
    (26, 'API Gateway', '2024-08-10'),
    (27, 'Performance Tuning', '2024-08-20'),
    (28, 'User Analytics', '2024-09-01'),
    (29, 'Incident Response', '2024-09-10'),
    (30, 'DevOps Automation', '2024-09-20');

CREATE TABLE employee_projects (emp_id INT, project_id INT);

INSERT INTO
    employee_projects
VALUES
    (101, 10),
    (101, 11),
    (102, 11),
    (103, 12),
    (104, 13),
    (105, 10),
    (106, 14),
    (107, 15),
    (108, 13),
    (109, 13),
    (110, 15),
    (111, 16),
    (112, 18),
    (113, 17),
    (114, 19),
    (115, 15),
    (116, 14),
    (117, 20),
    (118, 21),
    (119, 22),
    (120, 23),
    (121, 24),
    (122, 25),
    (123, 26),
    (124, 27),
    (125, 28),
    (126, 29),
    (127, 30),
    (128, 10),
    (129, 11),
    (130, 12);

CREATE TABLE attendance (
    att_id INT PRIMARY KEY,
    emp_id INT,
    day DATE,
    status VARCHAR(10)
);

INSERT INTO
    attendance
VALUES
    (1, 101, '2024-03-01', 'Present'),
    (2, 102, '2024-03-01', 'Present'),
    (3, 103, '2024-03-01', 'Absent'),
    (4, 104, '2024-03-01', 'Present'),
    (5, 105, '2024-03-01', 'Present'),
    (6, 106, '2024-03-01', 'Absent'),
    (7, 107, '2024-03-01', 'Present'),
    (8, 108, '2024-03-01', 'Present'),
    (9, 109, '2024-03-01', 'Present'),
    (10, 110, '2024-03-01', 'Absent'),
    (11, 111, '2024-03-01', 'Present'),
    (12, 112, '2024-03-01', 'Present'),
    (13, 113, '2024-03-01', 'Present'),
    (14, 114, '2024-03-01', 'Absent'),
    (15, 115, '2024-03-01', 'Present'),
    (16, 116, '2024-03-01', 'Present'),
    (17, 117, '2024-03-01', 'Present'),
    (18, 118, '2024-03-01', 'Absent'),
    (19, 119, '2024-03-01', 'Present'),
    (20, 120, '2024-03-01', 'Present'),
    (21, 121, '2024-03-01', 'Present'),
    (22, 122, '2024-03-01', 'Present'),
    (23, 123, '2024-03-01', 'Absent'),
    (24, 124, '2024-03-01', 'Present'),
    (25, 125, '2024-03-01', 'Present'),
    (26, 126, '2024-03-01', 'Present'),
    (27, 127, '2024-03-01', 'Absent'),
    (28, 128, '2024-03-01', 'Present'),
    (29, 129, '2024-03-01', 'Present'),
    (30, 130, '2024-03-01', 'Present');