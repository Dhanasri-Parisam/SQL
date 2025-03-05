TRUNCATE Command in SQL

Purpose: Quickly remove ALL rows from a table while keeping the table structure intact.

Syntax:

TRUNCATE TABLE table_name;

Key Features:

Removes all rows.
Faster than DELETE because it doesn't log individual row deletions.
Resets auto-increment counters (e.g., in MySQL).
Generally cannot be rolled back.
Does not trigger DELETE triggers.
Example:

Before:

SELECT * FROM employees;
-- Output may look like:
-- id | name  | salary
-- -- | ----- | ------
-- 1  | John  | 5000
-- 2  | Alice | 6000
-- 3  | Bob   | 5500
Truncate:

TRUNCATE TABLE employees;
After:

SELECT * FROM employees;
-- Empty table


DELETE vs. TRUNCATE:

Feature	DELETE	TRUNCATE
Removes Data	Row by row	All rows at once
Speed	Slower (logs each row deletion)	Faster (minimal logging)
Can Rollback?	Yes (if in transaction)	No (usually)
Resets Auto-Increment?	No	Yes (e.g., in MySQL)
Triggers Execution?	Yes	No
When to Use TRUNCATE:

Need to remove all records quickly.
Don't need to track/log deletions.
Want to reset auto-increment IDs.



