-- =========================================================
-- ALTER TABLE - Clean Notes + Practice (MySQL)
-- =========================================================

-- 1) What is ALTER TABLE?
-- ALTER TABLE is used to change the structure of an existing table.
-- Common uses:
--   - Add a new column
--   - Drop an existing column
--   - Change a column data type or constraints
--   - Rename a column
--   - Rename the table

-- CREATE TABLE -> structure defined
-- ALTER TABLE  -> structure changed

-- ---------------------------------------------------------
-- 2) General syntax
-- ---------------------------------------------------------
-- ALTER TABLE table_name operation;
--
-- MySQL operations used most often:
-- ADD, DROP COLUMN, MODIFY, CHANGE, RENAME TO


-- ---------------------------------------------------------
-- 3) Base table setup
-- ---------------------------------------------------------
DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
      id INT PRIMARY KEY,
      course_name VARCHAR(50)
);

INSERT INTO courses (id, course_name)
VALUES
      (1, 'Java'),
      (2, 'Python');

SELECT * FROM courses;


-- ---------------------------------------------------------
-- 4) Step 1: Add a column
-- ---------------------------------------------------------
-- Syntax:
-- ALTER TABLE table_name ADD column_name datatype;

ALTER TABLE courses
ADD duration INT;

SELECT * FROM courses;
-- duration will be NULL for existing rows until updated.

-- Add a column with constraints:
ALTER TABLE courses
ADD age INT NOT NULL DEFAULT 10;

SELECT * FROM courses;


-- ---------------------------------------------------------
-- 5) Step 2: Drop a column
-- ---------------------------------------------------------
-- Syntax:
-- ALTER TABLE table_name DROP COLUMN column_name;

ALTER TABLE courses
DROP COLUMN duration;

SELECT * FROM courses;
-- Warning: data in dropped column is permanently deleted.


-- ---------------------------------------------------------
-- 6) Step 3: Modify column data type (MySQL)
-- ---------------------------------------------------------
-- Syntax:
-- ALTER TABLE table_name MODIFY column_name new_datatype;

ALTER TABLE courses
MODIFY course_name VARCHAR(100);

SELECT * FROM courses;


-- ---------------------------------------------------------
-- 7) Step 4: Rename a column (MySQL CHANGE)
-- ---------------------------------------------------------
-- Syntax:
-- ALTER TABLE table_name
-- CHANGE old_column_name new_column_name datatype;
-- Note: With CHANGE, datatype must be written again.

ALTER TABLE courses
CHANGE course_name course_title VARCHAR(100);

SELECT * FROM courses;


-- ---------------------------------------------------------
-- 8) Step 5: Rename the table
-- ---------------------------------------------------------
-- Syntax:
-- ALTER TABLE old_table_name RENAME TO new_table_name;

ALTER TABLE courses
RENAME TO training_courses;

SELECT * FROM training_courses;


-- ---------------------------------------------------------
-- 9) Quick memory flow
-- ---------------------------------------------------------
-- ALTER TABLE table_name ADD column_name datatype;
-- ALTER TABLE table_name DROP COLUMN column_name;
-- ALTER TABLE table_name MODIFY column_name datatype;
-- ALTER TABLE table_name CHANGE old_name new_name datatype;
-- ALTER TABLE old_table_name RENAME TO new_table_name;


-- ---------------------------------------------------------
-- 10) Real developer-style evolution example
-- ---------------------------------------------------------
DROP TABLE IF EXISTS users;

CREATE TABLE users (
      id INT PRIMARY KEY,
      name VARCHAR(50)
);

ALTER TABLE users ADD email VARCHAR(100);
ALTER TABLE users MODIFY email VARCHAR(150);
ALTER TABLE users CHANGE email user_email VARCHAR(150);
ALTER TABLE users DROP COLUMN user_email;

-- This is common because schema changes over time.