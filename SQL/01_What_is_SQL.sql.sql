What is SQL?
🔹 SQL (Structured Query Language) Overview
SQL (Structured Query Language) is a standard programming language used to manage and manipulate relational databases. It allows users to store, retrieve, update, and delete data efficiently.

🔹 Why is SQL Important?
✔ Data Management – Helps in organizing and structuring data in databases
✔ Universal Language – Used across most database management systems (DBMS) like MySQL, PostgreSQL, SQL Server, Oracle, etc.
✔ Data Analysis – Helps in retrieving and filtering useful data from large datasets
✔ Backend Development – Essential for web and app development for data storage and retrieval
✔ Business Intelligence (BI) – Used in data visualization & analytics tools like Power BI, Tableau

SQL is used for:
📌 Creating Databases & Tables → CREATE DATABASE, CREATE TABLE
📌 Inserting Data → INSERT INTO
📌 Reading Data (Querying) → SELECT
📌 Updating & Deleting Data → UPDATE, DELETE
📌 Filtering Data → WHERE, GROUP BY, HAVING
📌 Joining Multiple Tables → JOIN (Inner, Left, Right, Full)
📌 Optimizing Performance → Indexing, Query Optimization
📌 Security & Transactions → Access Control, COMMIT, ROLLBACK

🔹 Basic SQL Example

-- Create a table
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- Insert data
INSERT INTO Students (id, name, age)
VALUES (1, 'Alice', 22);

-- Retrieve data
SELECT * FROM Students WHERE age > 20;


--------------------------------------

CREATE DATABASE customer;

USE customer;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    e_name VARCHAR(50),
    C_no INT
); 

INSERT INTO employees (id, e_name, C_no)
VALUES
    (10, 'berlin', 123),
    (20, 'tokyo', 133),
    (30, 'palaremo', 143),
    (40, 'rio', 153);
    
SELECT * FROM employees;
