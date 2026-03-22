-- ===============================================================
-- SQL Operators - Detailed Notes (Code + Comments)
-- ===============================================================
-- Operators in SQL are used to filter, compare, and manipulate data,
-- mainly inside the WHERE clause.

-- ---------------------------------------------------------------
-- 0) Example Base Table Setup (optional, for practice)
-- ---------------------------------------------------------------
-- Run this section if you want to test all queries in one place.
CREATE DATABASE college;
USE college;

CREATE TABLE management (
	id INT,
	name VARCHAR(50),
	department VARCHAR(50),
	salary INT
);

INSERT INTO management (id, name, department, salary)
VALUES
	(1, 'Ramesh', 'Administration', 50000),
	(2, NULL, 'Finance', 55000),
	(3, 'Anitha', 'HR', 48000),
	(4, 'Rahul', 'Operations', 60000);

-- View base data
SELECT * FROM management;


-- ---------------------------------------------------------------
-- 1) AND Operator
-- ---------------------------------------------------------------
-- Returns rows only when BOTH conditions are true.

-- Syntax:
-- SELECT column_name
-- FROM table_name
-- WHERE condition1 AND condition2;

SELECT *
FROM management
WHERE name = 'Anitha' AND salary >= 48000;

-- Logic:
-- condition 1: name = 'Anitha'
-- condition 2: salary >= 48000
-- Both must be true.


-- ---------------------------------------------------------------
-- 2) OR Operator
-- ---------------------------------------------------------------
-- Returns rows when AT LEAST ONE condition is true.

-- Syntax:
-- SELECT *
-- FROM table_name
-- WHERE condition1 OR condition2;

SELECT *
FROM management
WHERE id = 4 OR department = 'HR';

-- Logic:
-- condition 1: id = 4
-- OR
-- condition 2: department = 'HR'


-- ---------------------------------------------------------------
-- 3) NOT Operator
-- ---------------------------------------------------------------
-- Reverses a condition (TRUE becomes FALSE, FALSE becomes TRUE).

-- Syntax:
-- SELECT *
-- FROM table_name
-- WHERE NOT condition;

SELECT *
FROM management
WHERE NOT department = 'HR';

-- Another valid use with AND:
SELECT *
FROM management
WHERE id = 1 AND department <> 'Rahul';


-- ---------------------------------------------------------------
-- 4) IN Operator
-- ---------------------------------------------------------------
-- Checks whether a value exists in a list of values.
-- Works like multiple OR conditions.

-- Syntax:
-- SELECT *
-- FROM table_name
-- WHERE column_name IN (value1, value2, value3);

SELECT *
FROM management
WHERE department IN ('IT', 'Marketing');

-- Equivalent idea:
-- WHERE department = 'IT' OR department = 'Marketing'


-- ---------------------------------------------------------------
-- 5) NOT IN Operator
-- ---------------------------------------------------------------
-- Returns rows that do NOT match the listed values.

SELECT *
FROM management
WHERE department NOT IN ('IT', 'Marketing');

-- Meaning: select all rows except IT and Marketing departments.


-- ---------------------------------------------------------------
-- 6) IS NULL Operator
-- ---------------------------------------------------------------
-- NULL means missing or unknown value.
-- IMPORTANT: never compare NULL using '='.

-- Wrong:
-- WHERE name = NULL

-- Correct:
SELECT *
FROM management
WHERE name IS NULL;


-- ---------------------------------------------------------------
-- 7) IS NOT NULL Operator
-- ---------------------------------------------------------------
-- Finds rows where the column has a value.

SELECT *
FROM management
WHERE name IS NOT NULL;


-- ---------------------------------------------------------------
-- 8) LIKE Operator (Pattern Matching)
-- ---------------------------------------------------------------
-- Used mainly with text/string columns.
-- Wildcards:
--   %  -> any number of characters
--   _  -> exactly one character


-- ---------------------------------------------------------------
-- 9) LIKE with %
-- ---------------------------------------------------------------
-- Names starting with 'R'

SELECT *
FROM management
WHERE name LIKE 'R%';


-- ---------------------------------------------------------------
-- 10) LIKE with _
-- ---------------------------------------------------------------
-- Pattern '_a%':
-- first character  -> anything
-- second character -> 'a'
-- remaining        -> anything

SELECT *
FROM management
WHERE name LIKE '_a%';


-- ---------------------------------------------------------------
-- 11) Comparison Operators
-- ---------------------------------------------------------------
-- =   equal
-- !=  not equal (supported in many databases)
-- <>  not equal (standard SQL)
-- >   greater than
-- <   less than
-- >=  greater than or equal
-- <=  less than or equal

SELECT *
FROM management
WHERE salary >= 50000;


-- ---------------------------------------------------------------
-- Quick Summary
-- ---------------------------------------------------------------
-- AND            : both conditions must be true
-- OR             : at least one condition true
-- NOT            : reverse a condition
-- IN             : match multiple values
-- NOT IN         : exclude listed values
-- IS NULL        : find missing values
-- IS NOT NULL    : find available values
-- LIKE '%'       : pattern with multiple characters
-- LIKE '_'       : pattern with single character
-- Comparison ops : compare numbers/strings