-- --------------------------------------------------------------
-- SQL Aggregate Functions and Alias Usage
-- --------------------------------------------------------------
-- MIN()  - Returns the smallest value within the selected column
-- MAX()  - Returns the largest value within the selected column
-- COUNT() - Returns the number of rows in a set
-- SUM()  - Returns the total sum of a numerical column
-- AVG()  - Returns the average value of a numerical column
-- Aggregate functions ignore NULL values (except for COUNT()).
-- --------------------------------------------------------------

-- Step 1: Create Database
CREATE DATABASE customer;
USE customer;

-- --------------------------------------------------------------
-- Syntax to Create a Table
-- --------------------------------------------------------------
-- CREATE TABLE table_name (
--     column1 datatype PRIMARY KEY,
--     column2 datatype, 
--     column3 datatype,
--     ...
-- );

-- Step 2: Create Employees Table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    e_name VARCHAR(50),
    salary INT
);

-- --------------------------------------------------------------
-- Syntax to Insert Data
-- --------------------------------------------------------------
-- INSERT INTO table_name (column1, column2, ...)
-- VALUES (value1, value2, ...);

-- Step 3: Insert 20 Sample Records
INSERT INTO employees (id, e_name, salary) VALUES
(1, 'Alice', 5000),
(2, 'Bob', 6000),
(3, 'Charlie', 7000),
(4, 'David', 5500),
(5, 'Emma', 7200),
(6, 'Frank', 4800),
(7, 'Grace', 6500),
(8, 'Hannah', 5300),
(9, 'Ian', 7100),
(10, 'Jack', 5900),
(11, 'Kevin', 5700),
(12, 'Laura', 6800),
(13, 'Mia', 6200),
(14, 'Nathan', 7500),
(15, 'Olivia', 6400),
(16, 'Paul', 5600),
(17, 'Quinn', 6900),
(18, 'Rachel', 7300),
(19, 'Sam', 5200),
(20, 'Tom', 6000);

-- --------------------------------------------------------------
-- Aggregate Functions with Aliases
-- --------------------------------------------------------------

-- 📌 Syntax:
-- SELECT AGGREGATE_FUNCTION(column_name) AS alias_name FROM table_name;

-- Find the minimum salary in the employees table
SELECT MIN(salary) AS min_salary FROM employees;

-- Find the maximum salary in the employees table
SELECT MAX(salary) AS max_salary FROM employees;

-- Find the total number of employees
SELECT COUNT(*) AS total_employees FROM employees;

-- Find the total sum of all employees' salaries
SELECT SUM(salary) AS total_salary FROM employees;

-- Find the average salary of employees
SELECT AVG(salary) AS average_salary FROM employees;

-- --------------------------------------------------------------
-- SQL Aggregate Functions with HAVING Clause
-- --------------------------------------------------------------

-- 1. Minimum salary (HAVING)
SELECT MIN(salary) AS min_salary FROM employees 
HAVING MIN(salary) < 5000;

-- 2. Maximum salary (HAVING)
SELECT MAX(salary) AS max_salary FROM employees 
HAVING MAX(salary) > 5000;

-- 3. Total count of employees (HAVING)
SELECT COUNT(*) AS total_count FROM employees 
HAVING COUNT(*) > 10;

-- 4. Count employees where id > 5 (HAVING)
SELECT COUNT(id) AS total_cnt FROM employees 
HAVING COUNT(id) > 5;

-- 5. Sum of all employee IDs (HAVING)
SELECT SUM(id) AS sum_of_id FROM employees 
HAVING SUM(id) > 50;

-- 6. Sum of IDs where salary = 7000 (HAVING)
SELECT SUM(id) AS sum_of_id FROM employees 
WHERE salary = 7000 
HAVING SUM(id) > 3;

-- 7. Average of all employee IDs (HAVING)
SELECT AVG(id) AS avg_of_id FROM employees 
HAVING AVG(id) > 5;

-- 8. Average ID where salary = 7000 (HAVING)
SELECT AVG(id) AS avg_of_id FROM employees 
WHERE salary = 7000 
HAVING AVG(id) > 5;

-- --------------------------------------------------------------
-- Using GROUP BY with Aggregate Functions
-- --------------------------------------------------------------

-- 📌 Syntax:
-- SELECT column_name, AGGREGATE_FUNCTION(column_name) FROM table_name
-- GROUP BY column_name;

-- Find the highest salary for each employee name
SELECT e_name, MAX(salary) AS max_salary 
FROM employees 
GROUP BY e_name;

-- Find the lowest salary for each employee name
SELECT e_name, MIN(salary) AS min_salary 
FROM employees 
GROUP BY e_name;

-- Count the number of employees with the same salary
SELECT salary, COUNT(*) AS count_of_employees
FROM employees 
GROUP BY salary;

-- --------------------------------------------------------------
-- Sorting and Filtering with Aggregate Functions
-- --------------------------------------------------------------

-- 📌 Syntax:
-- SELECT * FROM table_name WHERE condition ORDER BY column_name ASC|DESC;

-- Get the top 5 highest salaries
SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- Get the 5 lowest salaries
SELECT * FROM employees ORDER BY salary ASC LIMIT 5;

-- Get the employees with salaries greater than 6000
SELECT * FROM employees WHERE salary > 6000;

-- Get employees with salaries between 5000 and 7000
SELECT * FROM employees WHERE salary BETWEEN 5000 AND 7000;

-- Get employees whose name starts with 'A'
SELECT * FROM employees WHERE e_name LIKE 'A%';

-- Get employees whose name ends with 'a'
SELECT * FROM employees WHERE e_name LIKE '%a';

-- --------------------------------------------------------------
-- SQL Aggregate Functions with WHERE Clause
-- --------------------------------------------------------------

-- Minimum salary in the table
SELECT MIN(salary) AS min_salary FROM employees;

-- Minimum salary where salary is less than 5000
SELECT MIN(salary) AS min_salary FROM employees
WHERE salary < 5000;

-- Maximum salary in the table
SELECT MAX(salary) AS max_salary FROM employees;

-- Maximum salary where salary is greater than 5000
SELECT MAX(salary) AS max_salary FROM employees 
WHERE salary > 5000;

-- Count total employees
SELECT COUNT(*) AS total_count FROM employees;

-- Count employees with id greater than 5
SELECT COUNT(id) AS total_cnt FROM employees WHERE id > 5;

-- Sum of all employee IDs
SELECT SUM(id) AS sum_of_id FROM employees;

-- Sum of IDs where salary is 7000
SELECT SUM(id) AS sum_of_id FROM employees WHERE salary = 7000;

-- Average of all employee IDs
SELECT AVG(id) AS avg_of_id FROM employees;

-- Average ID where salary is 7000
SELECT AVG(id) AS avg_of_id FROM employees WHERE salary = 7000;

-- ------------------------------------------------------------------

-- --------------------------------------------------------------
-- SQL Aggregate Functions with DISTINCT
-- --------------------------------------------------------------

-- Count distinct salaries
SELECT COUNT(DISTINCT salary) AS unique_salaries 
FROM employees;

-- Count employees per salary category
SELECT COUNT(*) AS number_of_records, salary
FROM employees 
GROUP BY salary;

-- --------------------------------------------------------------
-- Pagination Example: Fetch 5 records starting from the 6th record
-- --------------------------------------------------------------

-- 📌 Syntax:
-- SELECT * FROM table_name LIMIT number OFFSET start_index;

SELECT * FROM employees LIMIT 5 OFFSET 5;
