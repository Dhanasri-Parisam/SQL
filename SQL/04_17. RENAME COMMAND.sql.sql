1. Rename a Table
Syntax:
ALTER TABLE old_table_name RENAME TO new_table_name;
Example:
ALTER TABLE employees RENAME TO staff;
This renames the employees table to staff.



2. Rename a Column
Syntax:
ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;
Example:
ALTER TABLE staff RENAME COLUMN emp_name TO full_name;
This renames the column emp_name to full_name in the staff table.



3. Rename Multiple Columns (PostgreSQL, MySQL 8.0+, MariaDB 10.5+)
Syntax:
ALTER TABLE table_name 
RENAME COLUMN old_col1 TO new_col1, 
RENAME COLUMN old_col2 TO new_col2;
Example:
ALTER TABLE staff 
RENAME COLUMN full_name TO employee_name, 
RENAME COLUMN emp_salary TO salary;
This renames full_name to employee_name and emp_salary to salary.



4. Rename a Table with Schema (PostgreSQL, SQL Server)
Syntax:
ALTER TABLE schema_name.old_table_name RENAME TO new_table_name;
Example:
ALTER TABLE hr.employees RENAME TO hr.staff;
This renames employees to staff under the hr schema.



5. Rename a Table Using sp_rename (SQL Server)
Syntax:
EXEC sp_rename 'old_table_name', 'new_table_name';
Example:
EXEC sp_rename 'employees', 'staff';
This renames employees to staff in SQL Server.



6. Rename a Column Using sp_rename (SQL Server)
SYNTAX : 
EXEC sp_rename 'table_name.old_column_name', 'new_column_name', 'COLUMN';
Example:
EXEC sp_rename 'staff.emp_name', 'full_name', 'COLUMN';
This renames emp_name to full_name in SQL Server.



7. Rename a Column with Aliases in SELECT
Syntax:
SELECT column_name AS alias_name FROM table_name;
Example:
SELECT emp_name AS full_name, emp_salary AS salary FROM employees;
This renames columns temporarily in the result set.



8. Rename a Column in a View (MySQL, PostgreSQL, SQL Server)
Syntax:
CREATE OR REPLACE VIEW view_name AS 
SELECT column1 AS new_name1, column2 AS new_name2 FROM table_name;


Example:
CREATE OR REPLACE VIEW staff_view AS 
SELECT emp_name AS full_name, emp_salary AS salary FROM staff;
This renames emp_name to full_name and emp_salary to salary in a view.


Conclusion
Use ALTER TABLE ... RENAME for tables and columns.
Use sp_rename in SQL Server.
Use AS for temporary renaming in queries.
Use CREATE OR REPLACE VIEW for renaming in views.
Would you like more SQL tips or advanced queries? 🚀







