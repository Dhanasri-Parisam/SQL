/*
=========================================================
L18 - SUB QUERIES (Detailed Notes with Code + Comments)
=========================================================

Definition:
A subquery is a query written inside another query.
The inner query executes first, and its result is used by the outer query.
*/

-- =====================================================
-- 1) Tables used in all examples
-- =====================================================

-- Optional cleanup (works in most SQL engines)
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
    cid INT PRIMARY KEY,
    cname VARCHAR(50) NOT NULL
);

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    cid INT,
    FOREIGN KEY (cid) REFERENCES courses(cid)
);

INSERT INTO courses (cid, cname) VALUES
(101, 'Java'),
(102, 'C++'),
(103, 'Python');

INSERT INTO student (id, name, cid) VALUES
(1, 'Ravi', 101),
(2, 'Ram', 102),
(3, 'Sita', 101),
(4, 'Kiran', 103);

-- View base data
SELECT * FROM student;
SELECT * FROM courses;


-- =====================================================
-- 2) Generic structure of a subquery
-- =====================================================

/*
SELECT column_name
FROM table_name
WHERE column_name operator (
    SELECT column_name
    FROM table_name
);
*/


-- =====================================================
-- 3) Subquery with WHERE (single value subquery)
-- Question: Find students who are studying Java.
-- =====================================================

-- Inner query returns one value: cid for Java => 101
SELECT cid
FROM courses
WHERE cname = 'Java';

-- Outer query uses that value
SELECT name
FROM student
WHERE cid = (
    SELECT cid
    FROM courses
    WHERE cname = 'Java'
);

-- Expected result: Ravi, Sita


-- =====================================================
-- 4) Subquery with IN (multiple values)
-- Question: Find students enrolled in Java or Python.
-- =====================================================

-- Inner query returns multiple rows: 101, 103
SELECT cid
FROM courses
WHERE cname IN ('Java', 'Python');

-- IN handles a list of values from the subquery
SELECT name
FROM student
WHERE cid IN (
    SELECT cid
    FROM courses
    WHERE cname IN ('Java', 'Python')
);

-- Expected result: Ravi, Sita, Kiran


-- =====================================================
-- 5) Subquery with NOT IN
-- Question: Find students not enrolled in Java.
-- =====================================================

SELECT name
FROM student
WHERE cid NOT IN (
    SELECT cid
    FROM courses
    WHERE cname = 'Java'
);

-- Expected result: Ram, Kiran

/*
Important note:
If the subquery returns NULL, NOT IN can produce unexpected results in some engines.
In real projects, consider NOT EXISTS for safer null-handling.
*/


-- =====================================================
-- 6) Subquery with EXISTS
-- EXISTS only checks whether at least one row is returned.
-- =====================================================

SELECT s.name
FROM student s
WHERE EXISTS (
    SELECT 1
    FROM courses c
    WHERE s.cid = c.cid
);

-- Expected result: Ravi, Ram, Sita, Kiran


-- =====================================================
-- 7) Subquery in SELECT (scalar subquery in projection)
-- Question: Show each student with their course name.
-- =====================================================

SELECT
    s.name,
    (
        SELECT c.cname
        FROM courses c
        WHERE c.cid = s.cid
    ) AS course_name
FROM student s;

-- Expected result:
-- Ravi  Java
-- Ram   C++
-- Sita  Java
-- Kiran Python


-- =====================================================
-- 8) Subquery in FROM (derived table)
-- Subquery behaves like a temporary table for outer query.
-- =====================================================

SELECT *
FROM (
    SELECT name, cid
    FROM student
) AS temp;

-- Expected result: all student rows with name and cid


-- =====================================================
-- 9) Correlated subquery
-- Inner query depends on each row of outer query.
-- =====================================================

SELECT s.name
FROM student s
WHERE s.cid = (
    SELECT c.cid
    FROM courses c
    WHERE c.cid = s.cid
);

-- Expected result: Ravi, Ram, Sita, Kiran
-- Reason: for each student row, matching course row exists.


-- =====================================================
-- 10) Subquery with ANY
-- Condition is true if it matches at least one value from subquery.
-- =====================================================

SELECT name
FROM student
WHERE cid = ANY (
    SELECT cid
    FROM courses
);

-- Equivalent meaning here: cid IN (101, 102, 103)
-- Expected result: Ravi, Ram, Sita, Kiran


-- =====================================================
-- 11) Subquery with ALL
-- Condition must be true for every value from subquery.
-- =====================================================

SELECT name
FROM student
WHERE cid > ALL (
    SELECT cid
    FROM courses
);

-- Since max(cid) in courses is 103,
-- this means cid > 103. No student satisfies it.
-- Expected result: Empty set


-- =====================================================
-- Quick summary table
-- =====================================================

/*
Type         Use
-----------  ---------------------------------------------
WHERE        Filter rows using a single value subquery
IN           Compare against multiple subquery values
NOT IN       Exclude rows based on subquery values
EXISTS       Check if related rows exist
SELECT       Return extra computed column from subquery
FROM         Use subquery as temporary table (derived table)
Correlated   Inner query depends on outer query row
ANY / ALL    Compare against one / all returned values
*/


-- =====================================================
-- Extra practice queries
-- =====================================================

-- A) Students enrolled in courses that start with 'P'
SELECT name
FROM student
WHERE cid IN (
    SELECT cid
    FROM courses
    WHERE cname LIKE 'P%'
);

-- B) Show students whose course id is the minimum course id
SELECT name
FROM student
WHERE cid = (
    SELECT MIN(cid)
    FROM courses
);

-- C) Show course names that have at least one student
SELECT c.cname
FROM courses c
WHERE EXISTS (
    SELECT 1
    FROM student s
    WHERE s.cid = c.cid
);