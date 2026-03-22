/*
================================================================================
                    SQL AGGREGATE FUNCTIONS - DETAILED NOTES
================================================================================

WHAT ARE AGGREGATE FUNCTIONS?
  - Aggregate functions perform calculations on multiple rows
  - They return a single summarized result
  - Usually used with GROUP BY to group and summarize data
  
Concept: Many rows  →  One result (Single calculation)

Example: Marks: 85, 90, 78, 88  →  AVG = 85.25

COMMON AGGREGATE FUNCTIONS:
  1. MIN()          - Finds the smallest value
  2. MAX()          - Finds the largest value
  3. SUM()          - Calculates the total sum
  4. COUNT()        - Counts number of rows
  5. AVG()          - Calculates average value
  6. GROUP_CONCAT() - Combines multiple values into one string

================================================================================
                              1. MIN() - MINIMUM VALUE
================================================================================
*/

-- MIN() returns the smallest value from a column

-- SYNTAX:
-- SELECT MIN(column_name)
-- FROM table_name;

-- EXAMPLE 1: Find minimum marks from all students
SELECT MIN(marks) AS lowest_marks
FROM students;

-- EXAMPLE 2: Find minimum marks in each department
SELECT department, MIN(marks) AS min_marks
FROM students
GROUP BY department;

-- EXPECTED OUTPUT:
-- department | min_marks
-- CSE        | 78
-- ECE        | 75
-- MECH       | 65

-- PRACTICAL USE CASE: Find the lowest salary in the company
SELECT MIN(salary) AS lowest_salary
FROM employees;

-- PRACTICAL USE CASE: Find the employee with the highest salary and their department
SELECT 
    department, 
    MIN(salary) AS lowest_salary_in_dept,
    MIN(hire_date) AS earliest_hire_date
FROM employees
GROUP BY department;


/*
================================================================================
                              2. MAX() - MAXIMUM VALUE
================================================================================
*/

-- MAX() returns the largest value in a column

-- SYNTAX:
-- SELECT MAX(column_name)
-- FROM table_name;

-- EXAMPLE 1: Find maximum marks from all students
SELECT MAX(marks) AS highest_marks
FROM students;

-- EXAMPLE 2: Find maximum marks in each department
SELECT department, MAX(marks) AS max_marks
FROM students
GROUP BY department;

-- EXPECTED OUTPUT:
-- department | max_marks
-- CSE        | 90
-- ECE        | 92
-- MECH       | 80

-- PRACTICAL USE CASE: Find the highest salary in each department
SELECT 
    department, 
    MAX(salary) AS highest_salary,
    MAX(bonus) AS highest_bonus
FROM employees
GROUP BY department;

-- PRACTICAL USE CASE: Find most recent order date
SELECT MAX(order_date) AS latest_order
FROM orders;


/*
================================================================================
                              3. SUM() - TOTAL VALUE
================================================================================
*/

-- SUM() calculates the total of all numeric values in a column

-- SYNTAX:
-- SELECT SUM(column_name)
-- FROM table_name;

-- EXAMPLE 1: Calculate total marks scored by all students
SELECT SUM(marks) AS total_marks
FROM students;

-- EXAMPLE 2: Calculate total marks in each department
SELECT department, SUM(marks) AS total_dept_marks
FROM students
GROUP BY department;

-- EXPECTED OUTPUT:
-- department | total_dept_marks
-- CSE        | 341
-- ECE        | 249
-- MECH       | 215

-- PRACTICAL USE CASE: Calculate total salary expenses by department
SELECT 
    department,
    SUM(salary) AS total_salary_expense,
    SUM(bonus) AS total_bonus_expense
FROM employees
GROUP BY department;

-- PRACTICAL USE CASE: Calculate total revenue per month
SELECT 
    MONTH(order_date) AS month,
    SUM(price) AS total_revenue
FROM orders
GROUP BY MONTH(order_date);

-- PRACTICAL USE CASE: Calculate total units sold per product
SELECT 
    product_name,
    SUM(quantity) AS total_units_sold
FROM sales
GROUP BY product_name;


/*
================================================================================
                              4. COUNT() - COUNT ROWS
================================================================================
*/

-- COUNT() returns the number of rows that match criteria
-- COUNT(*) counts all rows including NULL values
-- COUNT(column) counts non-NULL values in that column

-- SYNTAX:
-- SELECT COUNT(column_name)  or  COUNT(*)
-- FROM table_name;

-- EXAMPLE 1: Count total number of students
SELECT COUNT(*) AS total_students
FROM students;

-- EXAMPLE 2: Count students in each department
SELECT department, COUNT(*) AS student_count
FROM students
GROUP BY department;

-- EXPECTED OUTPUT:
-- department | student_count
-- CSE        | 4
-- ECE        | 3
-- MECH       | 3

-- EXAMPLE 3: Count non-NULL marks (excludes NULL values)
SELECT COUNT(marks) AS students_with_marks
FROM students;

-- PRACTICAL USE CASE: Count employees per department
SELECT 
    department,
    COUNT(*) AS total_employees,
    COUNT(phone) AS employees_with_phone  -- Only counts non-NULL phones
FROM employees
GROUP BY department;

-- PRACTICAL USE CASE: Count number of orders shipped
SELECT COUNT(*) AS total_orders
FROM orders
WHERE status = 'Shipped';

-- PRACTICAL USE CASE: Count unique customers (if you want unique)
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM orders;


/*
================================================================================
                              5. AVG() - AVERAGE VALUE
================================================================================
*/

-- AVG() calculates the average of numeric values
-- NULL values are ignored in AVG() calculation

-- SYNTAX:
-- SELECT AVG(column_name)
-- FROM table_name;

-- EXAMPLE 1: Calculate average marks of all students
SELECT AVG(marks) AS average_marks
FROM students;

-- EXAMPLE 2: Calculate average marks in each department
SELECT 
    department,
    AVG(marks) AS avg_marks
FROM students
GROUP BY department;

-- EXAMPLE 3: Using HAVING to filter groups (Very Important!)
SELECT 
    department,
    AVG(marks) AS avg_marks
FROM students
GROUP BY department
HAVING AVG(marks) > 80;

-- EXPECTED OUTPUT FOR EXAMPLE 3:
-- department | avg_marks
-- CSE        | 85.25
-- ECE        | 83

-- PRACTICAL USE CASE: Find average salary per department
SELECT 
    department,
    AVG(salary) AS avg_salary,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- PRACTICAL USE CASE: Find average order value per customer
SELECT 
    customer_id,
    AVG(price) AS avg_order_value,
    COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 5;  -- Only customers with more than 5 orders


/*
================================================================================
                    6. GROUP_CONCAT() - COMBINE VALUES
================================================================================
*/

-- GROUP_CONCAT() combines multiple row values into one string
-- Useful for creating comma-separated or delimited lists
-- NOTE: GROUP_CONCAT is MySQL-specific
-- In SQL Server use STRING_AGG(), in PostgreSQL use STRING_AGG()

-- SYNTAX:
-- SELECT GROUP_CONCAT(column_name) or GROUP_CONCAT(column_name SEPARATOR ',')
-- FROM table_name
-- GROUP BY grouping_column;

-- EXAMPLE 1: List all student names per department
SELECT 
    department,
    GROUP_CONCAT(name) AS student_names
FROM students
GROUP BY department;

-- EXPECTED OUTPUT:
-- department | student_names
-- CSE        | Ravi,Anitha,Divya,Teja
-- ECE        | Rahul,Kiran,Arjun
-- MECH       | Suresh,Priya,Manoj

================================================================================
                        SQL EXECUTION FLOW (EXECUTION ORDER)
================================================================================

SQL processes queries in this SPECIFIC ORDER:

1️⃣  FROM        - Identify which table(s) to read data from
2️⃣  WHERE       - Filter individual rows (executes BEFORE grouping)
3️⃣  GROUP BY    - Combine rows into groups
4️⃣  HAVING      - Filter groups (executes AFTER grouping)
5️⃣  SELECT      - Choose which columns to display
6️⃣  ORDER BY    - Sort the results
7️⃣  LIMIT       - Limit number of rows to return