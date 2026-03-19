-- ==============================
-- 1. PRIMARY KEY
-- ==============================
-- A primary key uniquely identifies each record in a table.
-- Rules:
-- 1. Cannot contain NULL values
-- 2. Must be unique
-- 3. Only one primary key per table

CREATE TABLE student(
    id INT PRIMARY KEY,   -- Primary Key
    user_name VARCHAR(40),
    course_name VARCHAR(50)
);


-- ==============================
-- 2. FOREIGN KEY
-- ==============================
-- A foreign key creates a relationship between two tables.
-- It ensures the value exists in the parent table.

CREATE TABLE subjectmarks(
    id INT,
    subjects VARCHAR(40),
    course_marks INT,
    FOREIGN KEY(id) REFERENCES student(id)   -- Foreign Key
);


-- ==============================
-- Example Data
-- ==============================

INSERT INTO student(id, user_name, course_name) 
VALUES
(1, 'dhanu', 'java'),
(2, 'raj', 'c++');

INSERT INTO subjectmarks(id, subjects, course_marks)
VALUES
(1, 'R', 39),
(2, 'C', 75);


-- ==============================
-- JOIN Example
-- ==============================
-- Joining two tables using the primary key and foreign key

SELECT student.id, student.user_name, student.course_name,
       subjectmarks.subjects, subjectmarks.course_marks
FROM student
JOIN subjectmarks
ON student.id = subjectmarks.id;


-- =====================================================
-- REMAINING KEY CONCEPTS Will see in another sessions
-- =====================================================

-- 3. SUPER KEY
-- A set of one or more attributes that can uniquely identify a record.
-- Example:
-- {id}
-- {id, name}
-- {id, name, course}
-- All these combinations are super keys.


-- 4. CANDIDATE KEY
-- Minimal super key.
-- It uniquely identifies a record without unnecessary attributes.
-- Example:
-- id
-- email


-- 5. ALTERNATE KEY
-- Candidate keys that are not selected as the primary key.
-- Example:
-- If id is primary key, then email becomes alternate key.


-- 6. COMPOSITE KEY
-- A primary key made of two or more columns.

-- Example
CREATE TABLE orders(
    order_id INT,
    product_id INT,
    PRIMARY KEY(order_id, product_id)
);


-- 7. UNIQUE KEY
-- Ensures that all values in a column are unique.
-- Unlike PRIMARY KEY, it can allow NULL values.

CREATE TABLE users(
    id INT PRIMARY KEY,
    email VARCHAR(50) UNIQUE
);


-- =====================================================
-- KEY RELATION SUMMARY
-- =====================================================
-- Super Key      → Any column combination that uniquely identifies a row
-- Candidate Key  → Minimal super key
-- Primary Key    → Selected candidate key
-- Alternate Key  → Remaining candidate keys
-- Composite Key  → Primary key with multiple columns
-- Foreign Key    → Reference to primary key of another table
-- Unique Key     → Prevents duplicate values