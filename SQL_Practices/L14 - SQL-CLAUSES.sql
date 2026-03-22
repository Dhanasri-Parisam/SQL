-- ============================================================
-- SQL CLAUSES: SIMPLE NOTES (WITH FLOW)
-- ============================================================
-- We use SQL clauses to:
-- 1) Filter rows
-- 2) Group data
-- 3) Filter groups
-- 4) Sort results
-- 5) Limit output
--
-- Logical flow to remember:
-- FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT


-- ============================================================
-- 1) WHERE CLAUSE (FILTER ROWS)
-- ============================================================
-- Purpose:
-- Filters specific rows based on a condition.
-- Works before grouping.

-- Syntax:
-- SELECT column_names
-- FROM table_name
-- WHERE condition;

-- Example: students with marks greater than 80
SELECT *
FROM students
WHERE marks > 80;

-- Expected sample output:
-- id | name   | department | marks
-- 1  | Ravi   | CSE        | 85
-- 2  | Anitha | CSE        | 90
-- 4  | Kiran  | ECE        | 82
-- 6  | Divya  | CSE        | 88
-- 8  | Arjun  | ECE        | 92


-- ============================================================
-- 2) LIMIT CLAUSE (RESTRICT NUMBER OF ROWS)
-- ============================================================
-- Purpose:
-- Limits how many rows are returned.

-- Syntax:
-- SELECT columns
-- FROM table
-- LIMIT number;

-- Example:
-- Step 1: filter department = CSE
-- Step 2: filter marks > 70
-- Step 3: return only first 3 rows
SELECT *
FROM students
WHERE department = 'CSE' AND marks > 70
LIMIT 3;

-- Note:
-- Without ORDER BY, LIMIT may return different rows
-- depending on storage/insertion order.


-- ============================================================
-- 3) ORDER BY CLAUSE (SORT DATA)
-- ============================================================
-- Purpose:
-- Sorts query results.
-- ASC  = ascending (default)
-- DESC = descending

-- Syntax:
-- SELECT columns
-- FROM table
-- ORDER BY column ASC|DESC;

-- Example: highest marks first
SELECT *
FROM students
ORDER BY marks DESC;

-- Expected sample output:
-- name   | marks
-- Arjun  | 92
-- Anitha | 90
-- Divya  | 88
-- Ravi   | 85


-- ============================================================
-- 4) GROUP BY CLAUSE (GROUP DATA)
-- ============================================================
-- Purpose:
-- Groups rows that share same value(s) in selected columns.
-- Commonly used with aggregate functions.

-- Common aggregate functions:
-- COUNT(*) : number of rows
-- SUM(col) : total
-- AVG(col) : average
-- MAX(col) : maximum
-- MIN(col) : minimum

-- Example 1: count students in each department
SELECT department, COUNT(*) AS student_count
FROM students
GROUP BY department;

-- Example 2: average marks per department
SELECT department, AVG(marks) AS avg_marks
FROM students
GROUP BY department;

-- Example 3: total marks per department
SELECT department, SUM(marks) AS sum_marks
FROM students
GROUP BY department;


-- ============================================================
-- 5) HAVING CLAUSE (FILTER GROUPS)
-- ============================================================
-- Purpose:
-- Filters grouped results.
--
-- Important rule:
-- WHERE  -> filters rows (before GROUP BY)
-- HAVING -> filters groups (after GROUP BY)

-- Example 1: departments with total marks > 300
SELECT department, SUM(marks) AS sum_marks
FROM students
GROUP BY department
HAVING SUM(marks) > 300;

-- Example 2: departments with max marks between 80 and 90
SELECT department, MAX(marks) AS max_score
FROM students
GROUP BY department
HAVING MAX(marks) >= 80 AND MAX(marks) <= 90;


-- ============================================================
-- COMPLETE SQL QUERY EXECUTION ORDER (VERY IMPORTANT)
-- ============================================================
-- SQL evaluates clauses in this logical order:
-- 1. FROM
-- 2. WHERE
-- 3. GROUP BY
-- 4. HAVING
-- 5. SELECT
-- 6. ORDER BY
-- 7. LIMIT

-- Full example combining all clauses:
SELECT department, AVG(marks) AS avg_marks
FROM students
WHERE marks > 70
GROUP BY department
HAVING AVG(marks) > 80
ORDER BY AVG(marks) DESC
LIMIT 2;