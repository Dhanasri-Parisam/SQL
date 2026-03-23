/*
==========================================================
L17 - EXCLUSIVE JOINS (Clear Notes with Code + Comments)
==========================================================

Exclusive join means: return only NON-MATCHING rows between two tables.

In this lesson:
- cid = 104 exists only in student
- cid = 103 exists only in courses
So these rows appear in exclusive join results.
*/

-- ========================================================
-- 1) Setup tables and sample data
-- ========================================================

-- Optional cleanup
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
	cid INT PRIMARY KEY,
	cname VARCHAR(50) NOT NULL
);

CREATE TABLE student (
	id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	cid INT
);

INSERT INTO student (id, name, cid) VALUES
(1, 'Ravi', 101),
(2, 'Ram', 102),
(3, 'Sita', 101),
(4, 'Kiran', 104);

INSERT INTO courses (cid, cname) VALUES
(101, 'Java'),
(102, 'C++'),
(103, 'Python');

-- Check base tables
SELECT * FROM student;
SELECT * FROM courses;


-- ========================================================
-- 2) LEFT EXCLUSIVE JOIN (left-only rows)
-- Rows present in student but missing in courses
-- ========================================================

SELECT s.id, s.name, s.cid
FROM student s
LEFT JOIN courses c
	ON s.cid = c.cid
WHERE c.cid IS NULL;

/*
How it works:
1) LEFT JOIN keeps all rows from student.
2) If a match is not found in courses, course columns become NULL.
3) WHERE c.cid IS NULL filters only non-matching left rows.

Expected result:
id  name   cid
4   Kiran  104

Meaning:
Kiran's course id (104) does not exist in courses table.
*/


-- ========================================================
-- 3) RIGHT EXCLUSIVE JOIN (right-only rows)
-- Rows present in courses but missing in student
-- ========================================================

SELECT c.cid, c.cname
FROM student s
RIGHT JOIN courses c
	ON s.cid = c.cid
WHERE s.cid IS NULL;

/*
How it works:
1) RIGHT JOIN keeps all rows from courses.
2) If no student uses that course, student columns become NULL.
3) WHERE s.cid IS NULL keeps only right-side non-matching rows.

Expected result:
cid  cname
103  Python

Meaning:
Python exists as a course, but no student is enrolled in it.
*/


-- ========================================================
-- 4) FULL EXCLUSIVE JOIN (both-side non-matching rows)
-- Rows missing from either side
-- ========================================================

SELECT s.id, s.name, s.cid, c.cname
FROM student s
FULL JOIN courses c
	ON s.cid = c.cid
WHERE s.cid IS NULL OR c.cid IS NULL;

/*
How it works:
1) FULL JOIN combines all rows from both tables.
2) Matching rows are merged.
3) Non-matching rows have NULLs on one side.
4) WHERE s.cid IS NULL OR c.cid IS NULL keeps only unmatched rows.

Expected result:
id    name   cid   cname
4     Kiran  104   NULL
NULL  NULL   NULL  Python   -- course side row has no student

Note:
Depending on SQL engine and selected columns, you may display c.cid separately.
*/


-- ========================================================
-- 5) Improved FULL EXCLUSIVE output (show both cids clearly)
-- ========================================================

SELECT
	s.id,
	s.name,
	s.cid AS student_cid,
	c.cid AS course_cid,
	c.cname
FROM student s
FULL JOIN courses c
	ON s.cid = c.cid
WHERE s.cid IS NULL OR c.cid IS NULL;

/*
Expected result:
id    name   student_cid  course_cid  cname
4     Kiran  104          NULL        NULL
NULL  NULL   NULL         103         Python
*/


-- ========================================================
-- 6) If FULL JOIN is not supported in your SQL engine
-- (common workaround using UNION ALL)
-- ========================================================

SELECT
	s.id,
	s.name,
	s.cid AS student_cid,
	NULL AS course_cid,
	NULL AS cname
FROM student s
LEFT JOIN courses c
	ON s.cid = c.cid
WHERE c.cid IS NULL

UNION ALL

SELECT
	NULL AS id,
	NULL AS name,
	NULL AS student_cid,
	c.cid AS course_cid,
	c.cname
FROM courses c
LEFT JOIN student s
	ON s.cid = c.cid
WHERE s.cid IS NULL;


-- ========================================================
-- Quick summary
-- ========================================================

/*
LEFT EXCLUSIVE JOIN  -> left-only rows
RIGHT EXCLUSIVE JOIN -> right-only rows
FULL EXCLUSIVE JOIN  -> all unmatched rows from both sides

Core idea:
Use OUTER JOIN + WHERE ... IS NULL to isolate non-matching records.
*/