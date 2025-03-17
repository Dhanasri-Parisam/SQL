-------------------------------------------------------------------------------------------------------------------------------------------
-> A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
-------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------
Different Types of SQL JOINs
Here are the different types of the JOINs in SQL:

(INNER) JOIN: Returns records that have matching values in both tables
LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table
-------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------
-- BASIC CODE FOR ALL
====================>

-- Create a single database instead of two
CREATE DATABASE company_db;
USE company_db;

-- Creating Table 1
CREATE TABLE table1_info (
    id INT PRIMARY KEY,
    tname1 VARCHAR(50),
    troll1 INT NOT NULL,
    tsalary1 INT DEFAULT NULL
);

-- Creating Table 2
CREATE TABLE table2_info (
    id INT PRIMARY KEY,
    tname2 VARCHAR(50),
    troll2 INT DEFAULT NULL,
    tsalary2 INT DEFAULT NULL
);

-- Inserting data into table1_info
INSERT INTO table1_info (id, tname1, troll1, tsalary1) 
VALUES
    (1, 'TOKYO', 230, 2000),
    (2, 'BERLIN', 231, 3000),
    (3, 'RIO', 232, 4000),
    (4, 'NAIROBI', 233, 5000),
    (5, 'PALAREMO', 234, NULL);

-- Inserting data into table2_info
INSERT INTO table2_info (id, tname2, troll2, tsalary2) 
VALUES
    (1, 'MOTU', 430, 6000),
    (2, 'PATLU', 431, 7000),
    (3, 'NOBITA', 432, 8000),
    (4, 'SINCHAN', 433, 9000), 
    (5, 'BENTEN', 434, NULL),
    (6, 'HYDI', NULL, NULL);

-- Fetch data from tables
SELECT * FROM table1_info;
SELECT * FROM table2_info;

-- JOIN both tables on the 'id' column
SELECT * FROM table1_info 
JOIN table2_info ON table1_info.id = table2_info.id;

-- (INNER) JOIN: Returns records that have matching
--  values in both tables

SELECT * FROM table1_info 
INNER JOIN table2_info ON table1_info.id = table2_info.id;

-- LEFT (OUTER) JOIN: Returns all records from the left table,
 -- and the matched records from the right table
 
SELECT * FROM table1_info 
LEFT JOIN table2_info ON table1_info.id = table2_info.id;

-- RIGHT (OUTER) JOIN: Returns all records from the right table,
-- and the matched records from the left table

SELECT * FROM table1_info 
RIGHT JOIN table2_info ON table1_info.id = table2_info.id;

-- FULL (OUTER) JOIN: Returns all records when there is
-- a match in either lef or right table

SELECT * FROM table1_info 
LEFT JOIN table2_info ON table1_info.id = table2_info.id
UNION
SELECT * FROM table1_info 
RIGHT JOIN table2_info ON table1_info.id = table2_info.id;
-------------------------------------------------------------------------------------------------------------------------------------------
