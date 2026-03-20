-- =========================================================
-- Cascading Rules in Foreign Keys (MySQL Notes + Practice)
-- =========================================================

-- 1) What is cascading in a foreign key?
-- When a parent row is UPDATED or DELETED, cascading rules decide
-- what should happen to related child rows.
--
-- Common actions:
--   - CASCADE   : Automatically update/delete child rows
--   - SET NULL  : Set child foreign key to NULL
--   - RESTRICT  : Block parent delete/update if child exists
--   - NO ACTION : Similar to RESTRICT in most MySQL setups


-- ---------------------------------------------------------
-- 2) Base parent table
-- ---------------------------------------------------------
DROP TABLE IF EXISTS marks;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
	id INT PRIMARY KEY,
	name VARCHAR(40)
);

INSERT INTO students (id, name)
VALUES
	(1, 'Dhanu'),
	(2, 'Raj');

SELECT * FROM students;


-- ---------------------------------------------------------
-- 3) ON DELETE CASCADE
-- ---------------------------------------------------------
-- If parent row is deleted, matching child rows are deleted too.

DROP TABLE IF EXISTS marks;

CREATE TABLE marks (
	student_id INT,
	subject VARCHAR(40),
	marks INT,
	FOREIGN KEY (student_id)
		REFERENCES students(id)
		ON DELETE CASCADE
);

INSERT INTO marks (student_id, subject, marks)
VALUES
	(1, 'Math', 90),
	(2, 'C', 80);

SELECT * FROM students;
SELECT * FROM marks;

-- Delete parent id = 1
DELETE FROM students WHERE id = 1;

SELECT * FROM students;
SELECT * FROM marks;
-- Child row with student_id = 1 is automatically removed.


-- ---------------------------------------------------------
-- 4) ON UPDATE CASCADE
-- ---------------------------------------------------------
-- If parent key changes, child foreign key updates automatically.

DROP TABLE IF EXISTS marks;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
	id INT PRIMARY KEY,
	name VARCHAR(40)
);

INSERT INTO students (id, name)
VALUES
	(1, 'Dhanu'),
	(2, 'Raj');

CREATE TABLE marks (
	student_id INT,
	subject VARCHAR(40),
	marks INT,
	FOREIGN KEY (student_id)
		REFERENCES students(id)
		ON UPDATE CASCADE
);

INSERT INTO marks (student_id, subject, marks)
VALUES
	(1, 'Math', 90),
	(2, 'C', 80);

-- Update parent key 1 -> 10
UPDATE students
SET id = 10
WHERE id = 1;

SELECT * FROM students;
SELECT * FROM marks;
-- marks.student_id for Math becomes 10 automatically.


-- ---------------------------------------------------------
-- 5) ON DELETE SET NULL
-- ---------------------------------------------------------
-- If parent is deleted, child key becomes NULL (child row remains).
-- Important: foreign key column must allow NULL.

DROP TABLE IF EXISTS marks;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
	id INT PRIMARY KEY,
	name VARCHAR(40)
);

INSERT INTO students (id, name)
VALUES
	(1, 'Dhanu'),
	(2, 'Raj');

CREATE TABLE marks (
	student_id INT NULL,
	subject VARCHAR(40),
	marks INT,
	FOREIGN KEY (student_id)
		REFERENCES students(id)
		ON DELETE SET NULL
);

INSERT INTO marks (student_id, subject, marks)
VALUES
	(1, 'Math', 90),
	(2, 'C', 80);

DELETE FROM students WHERE id = 1;

SELECT * FROM students;
SELECT * FROM marks;
-- Math row remains, but student_id becomes NULL.


-- ---------------------------------------------------------
-- 6) ON DELETE RESTRICT
-- ---------------------------------------------------------
-- Parent delete is blocked if matching child rows exist.

DROP TABLE IF EXISTS marks;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
	id INT PRIMARY KEY,
	name VARCHAR(40)
);

INSERT INTO students (id, name)
VALUES
	(1, 'Dhanu'),
	(2, 'Raj');

CREATE TABLE marks (
	student_id INT,
	subject VARCHAR(40),
	marks INT,
	FOREIGN KEY (student_id)
		REFERENCES students(id)
		ON DELETE RESTRICT
);

INSERT INTO marks (student_id, subject, marks)
VALUES
	(1, 'Math', 90),
	(2, 'C', 80);

-- This delete fails because student_id = 1 is referenced in marks.
-- DELETE FROM students WHERE id = 1;

SELECT * FROM students;
SELECT * FROM marks;


-- ---------------------------------------------------------
-- 7) ON DELETE NO ACTION
-- ---------------------------------------------------------
-- In MySQL/InnoDB, this behaves like RESTRICT in practice.

DROP TABLE IF EXISTS marks;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
	id INT PRIMARY KEY,
	name VARCHAR(40)
);

INSERT INTO students (id, name)
VALUES
	(1, 'Dhanu'),
	(2, 'Raj');

CREATE TABLE marks (
	student_id INT,
	subject VARCHAR(40),
	marks INT,
	FOREIGN KEY (student_id)
		REFERENCES students(id)
		ON DELETE NO ACTION
);

INSERT INTO marks (student_id, subject, marks)
VALUES
	(1, 'Math', 90),
	(2, 'C', 80);

-- This delete also fails in most MySQL setups.
-- DELETE FROM students WHERE id = 1;

SELECT * FROM students;
SELECT * FROM marks;


-- ---------------------------------------------------------
-- 8) Quick summary (memory table)
-- ---------------------------------------------------------
-- CASCADE   : Child rows are auto deleted/updated
-- SET NULL  : Child foreign key becomes NULL
-- RESTRICT  : Parent delete/update blocked
-- NO ACTION : Usually same behavior as RESTRICT


-- ---------------------------------------------------------
-- 9) Real-world thinking
-- ---------------------------------------------------------
-- students.id    -> Parent key
-- marks.student_id -> Child foreign key
--
-- If a student is removed:
--   CASCADE  -> delete marks too
--   SET NULL -> keep marks, remove relationship
--   RESTRICT -> do not allow student deletion
