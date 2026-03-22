/*
============================================================
JOINS IN SQL - CLEAR NOTES (CODE + COMMENTS)
============================================================
*/

/*
1) INNER JOIN
Definition:
INNER JOIN returns only the rows where the matching condition is true in both tables.
If values do not match, they are not shown.
*/

-- Example 1
-- Tables:
-- student(id, name, cid)
-- 1, Ravi, 101
-- 2, Ram,  102
--
-- courses(cname, cid)
-- Java, 101
-- CPP,  103

SELECT student.id, student.name, courses.cname
FROM student
INNER JOIN courses
ON student.cid = courses.cid;

-- Output:
-- id | name | cname
-- 1  | Ravi | Java

-- Explanation:
-- 101 = 101 -> match
-- 102 != 103 -> not shown

-- Example 2
-- Tables:
-- students(id, name, cid)
-- 1, A, 10
-- 2, B, 20
-- 3, C, 30
--
-- courses(cid, course)
-- 10, Python
-- 30, Java

SELECT s.id, s.name, c.course
FROM students s
INNER JOIN courses c
ON s.cid = c.cid;

-- Output:
-- id | name | course
-- 1  | A    | Python
-- 3  | C    | Java


/*
2) LEFT JOIN
Definition:
LEFT JOIN returns all rows from the LEFT table and matched rows from the RIGHT table.
If no match, NULL appears.
*/

-- Example 1
SELECT student.id, student.name, courses.cname
FROM student
LEFT JOIN courses
ON student.cid = courses.cid;

-- Output:
-- id | name | cname
-- 1  | Ravi | Java
-- 2  | Ram  | NULL

-- Explanation:
-- Ram's course 102 does not exist in courses table.

-- Example 2
-- Tables:
-- employees(id, name, dept_id)
-- 1, Raj,   1
-- 2, Sam,   2
-- 3, Priya, 3
--
-- departments(dept_id, dept)
-- 1, HR
-- 3, IT

SELECT e.name, d.dept
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- Output:
-- name  | dept
-- Raj   | HR
-- Sam   | NULL
-- Priya | IT


/*
3) RIGHT JOIN
Definition:
RIGHT JOIN returns all rows from the RIGHT table and matched rows from the LEFT table.
If no match, NULL appears.
*/

-- Example 1
SELECT student.id, student.name, courses.cname
FROM student
RIGHT JOIN courses
ON student.cid = courses.cid;

-- Output:
-- id   | name | cname
-- 1    | Ravi | Java
-- NULL | NULL | CPP

-- Explanation:
-- Course CPP has cid 103 but no student.

-- Example 2
-- Tables:
-- students(id, name, course_id)
-- 1, A, 10
-- 2, B, 20
--
-- courses(course_id, course)
-- 10, Java
-- 20, Python
-- 30, C++

SELECT s.name, c.course
FROM students s
RIGHT JOIN courses c
ON s.course_id = c.course_id;

-- Output:
-- name | course
-- A    | Java
-- B    | Python
-- NULL | C++


/*
4) FULL JOIN
Definition:
FULL JOIN returns all rows from both tables.
Matched rows are combined.
Not matched rows show NULL.

MySQL does not support FULL JOIN directly, so UNION is used.
*/

-- Example 1
SELECT student.id, student.name, courses.cname
FROM student
LEFT JOIN courses
ON student.cid = courses.cid

UNION

SELECT student.id, student.name, courses.cname
FROM student
RIGHT JOIN courses
ON student.cid = courses.cid;

-- Output:
-- id   | name | cname
-- 1    | Ravi | Java
-- 2    | Ram  | NULL
-- NULL | NULL | CPP

-- Example 2
-- Table A(id, value)
-- 1, A
-- 2, B
--
-- Table B(id, value)
-- 2, X
-- 3, Y

SELECT *
FROM A
LEFT JOIN B ON A.id = B.id

UNION

SELECT *
FROM A
RIGHT JOIN B ON A.id = B.id;

-- Output:
-- A.id | A.value | B.id | B.value
-- 1    | A       | NULL | NULL
-- 2    | B       | 2    | X
-- NULL | NULL    | 3    | Y


/*
5) CROSS JOIN
Definition:
CROSS JOIN returns the Cartesian product of both tables.
Every row of table1 joins with every row of table2.
*/

-- Example 1
SELECT student.id, student.name, courses.cname
FROM student
CROSS JOIN courses;

-- Output:
-- id | name | cname
-- 1  | Ravi | Java
-- 1  | Ravi | CPP
-- 2  | Ram  | Java
-- 2  | Ram  | CPP

-- Formula:
-- rows = rows_table1 * rows_table2
-- 2 * 2 = 4 rows

-- Example 2
-- colors(color): Red, Blue
-- sizes(size): S, M

SELECT color, size
FROM colors
CROSS JOIN sizes;

-- Output:
-- color | size
-- Red   | S
-- Red   | M
-- Blue  | S
-- Blue  | M


/*
6) SELF JOIN
Definition:
SELF JOIN joins a table with itself.
Used when a table has related data inside the same table.

Example: manager -> employee
*/

-- Example 1
-- employees(id, name, manager_id)
-- 1, Raj,   NULL
-- 2, Sam,   1
-- 3, Priya, 1

SELECT e.name AS Employee, m.name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;

-- Output:
-- Employee | Manager
-- Raj      | NULL
-- Sam      | Raj
-- Priya    | Raj

-- Example 2
-- students(id, name, friend_id)
-- 1, A, 2
-- 2, B, 3
-- 3, C, NULL

SELECT s1.name AS Student, s2.name AS Friend
FROM students s1
LEFT JOIN students s2
ON s1.friend_id = s2.id;

-- Output:
-- Student | Friend
-- A       | B
-- B       | C
-- C       | NULL


/*
Final Quick Summary

INNER JOIN : Only matching rows
LEFT JOIN  : All left + matching right
RIGHT JOIN : All right + matching left
FULL JOIN  : All rows from both tables
CROSS JOIN : All combinations
SELF JOIN  : Table joined with itself
*/