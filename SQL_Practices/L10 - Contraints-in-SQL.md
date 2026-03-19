-- SQL Constraints Notes (With Before vs After Examples)
-- 1. NOT NULL Constraint
-- Without NOT NULL (Before)
-- CREATE TABLE users_before(
--     id INT,
--     name VARCHAR(40)
-- );

-- INSERT INTO users_before VALUES (1, NULL);
-- Result
-- id	name
-- 1	NULL

-- NULL values are allowed.

-- With NOT NULL (After)
-- CREATE TABLE users_after(
--     id INT,
--     name VARCHAR(40) NOT NULL
-- );

-- INSERT INTO users_after VALUES (1, NULL);
-- Result

-- ❌ ERROR

-- Column 'name' cannot be null
-- 2. UNIQUE Constraint
-- Without UNIQUE (Before)
-- CREATE TABLE email_before(
--     id INT,
--     email VARCHAR(50)
-- );

-- INSERT INTO email_before VALUES
-- (1,'dhanu@gmail.com'),
-- (2,'dhanu@gmail.com');
-- Result
-- id	email
-- 1	dhanu@gmail.com

-- 2	dhanu@gmail.com

-- Duplicates allowed.

-- With UNIQUE (After)
-- CREATE TABLE email_after(
--     id INT,
--     email VARCHAR(50) UNIQUE
-- );

-- INSERT INTO email_after VALUES
-- (1,'dhanu@gmail.com'),
-- (2,'dhanu@gmail.com');
-- Result

-- ❌ ERROR

-- Duplicate entry for key 'email'
-- 3. CHECK Constraint
-- Without CHECK (Before)
-- CREATE TABLE age_before(
--     id INT,
--     age INT
-- );

-- INSERT INTO age_before VALUES (1,-5);
-- Result
-- id	age
-- 1	-5

-- Invalid values allowed.

-- With CHECK (After)
-- CREATE TABLE age_after(
--     id INT,
--     age INT CHECK(age >= 18)
-- );

-- INSERT INTO age_after VALUES (1,16);
-- Result

-- ❌ ERROR

-- Check constraint violated
-- 4. PRIMARY KEY Constraint
-- Without PRIMARY KEY (Before)
-- CREATE TABLE student_before(
--     id INT,
--     name VARCHAR(40)
-- );

-- INSERT INTO student_before VALUES
-- (1,'dhanu'),
-- (1,'raj');
-- Result
-- id	name
-- 1	dhanu
-- 1	raj

-- Duplicates allowed.

-- With PRIMARY KEY (After)
-- CREATE TABLE student_after(
--     id INT PRIMARY KEY,
--     name VARCHAR(40)
-- );

-- INSERT INTO student_after VALUES
-- (1,'dhanu'),
-- (1,'raj');
-- Result

-- ❌ ERROR

-- Duplicate entry '1' for key 'PRIMARY'
-- 5. FOREIGN KEY Constraint
-- Parent Table
-- CREATE TABLE students(
--     id INT PRIMARY KEY,
--     name VARCHAR(40)
-- );
-- INSERT INTO students VALUES
-- (1,'dhanu'),
-- (2,'raj');
-- Without FOREIGN KEY (Before)
-- CREATE TABLE marks_before(
--     student_id INT,
--     marks INT
-- );

-- INSERT INTO marks_before VALUES (5,90);
-- Result
-- student_id	marks
-- 5	90

-- Even though student doesn't exist, it still inserts.

-- With FOREIGN KEY (After)
-- CREATE TABLE marks_after(
--     student_id INT,
--     marks INT,
--     FOREIGN KEY(student_id) REFERENCES students(id)
-- );

-- INSERT INTO marks_after VALUES (5,90);
-- Result

-- ❌ ERROR

-- Cannot add or update a child row: a foreign key constraint fails
-- 6. DEFAULT Constraint
-- Without DEFAULT (Before)
-- CREATE TABLE course_before(
--     id INT,
--     course VARCHAR(40)
-- );

-- INSERT INTO course_before(id) VALUES (1);
-- Result
-- id	course
-- 1	NULL
-- With DEFAULT (After)
-- CREATE TABLE course_after(
--     id INT,
--     course VARCHAR(40) DEFAULT 'Java'
-- );

-- INSERT INTO course_after(id) VALUES (1);
-- Result
-- id	course
-- 1	Java
-- 7. AUTO_INCREMENT
-- Without AUTO_INCREMENT (Before)
-- CREATE TABLE users_before_auto(
--     id INT PRIMARY KEY,
--     name VARCHAR(40)
-- );

-- INSERT INTO users_before_auto VALUES
-- (1,'dhanu'),
-- (2,'raj');

-- You must manually insert ID.

-- With AUTO_INCREMENT (After)
-- CREATE TABLE users_after_auto(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(40)
-- );

-- INSERT INTO users_after_auto(name) VALUES
-- ('dhanu'),
-- ('raj');
-- Result
-- id	name
-- 1	dhanu
-- 2	raj

-- IDs are generated automatically.

-- Quick Summary Table
-- Constraint	Purpose
-- NOT NULL	Prevent NULL values
-- UNIQUE	Prevent duplicate values
-- CHECK	Restrict values by condition
-- PRIMARY KEY	Unique + Not Null identifier
-- FOREIGN KEY	Maintain table relationship
-- DEFAULT	Set default value
-- AUTO_INCREMENT	Automatically generate IDs  