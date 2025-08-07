✅ SQL Data Aggregation (Detailed Explanation & Examples)
Data aggregation in SQL helps analyze and summarize large datasets using built-in functions. The key aggregation functions include:

1️⃣ COUNT() – Counts rows
2️⃣ SUM() – Adds values
3️⃣ AVG() – Finds the average
4️⃣ MIN() – Finds the smallest value
5️⃣ MAX() – Finds the largest value
We also use GROUP BY to categorize data and HAVING to filter aggregated results.


1️⃣ COUNT() – Counting Rows
The COUNT() function returns the number of rows in a column, including or excluding NULL values.

Syntax:
SELECT COUNT(column_name) FROM table_name;

Example:
SELECT COUNT(EmployeeID) AS TotalEmployees FROM Employees;
🔹 This counts the total number of employees.

Count with a Condition:
SELECT COUNT(*) FROM Employees WHERE Age > 30;
🔹 This counts employees older than 30.

2️⃣ SUM() – Total Sum of Values
The SUM() function calculates the total sum of a numeric column.

Syntax:
SELECT SUM(column_name) FROM table_name;

Example:
SELECT SUM(Salary) AS TotalSalary FROM Employees;
🔹 This returns the total salary paid to all employees.

Sum with a Condition:
SELECT SUM(Salary) FROM Employees WHERE DepartmentID = 1;
🔹 This sums salaries for employees in Department 1.


3️⃣ AVG() – Calculating the Average
The AVG() function returns the average of numeric values.

Syntax:
SELECT AVG(column_name) FROM table_name;

Example:
SELECT AVG(Salary) AS AverageSalary FROM Employees;
🔹 This returns the average salary of all employees.

Average with a Condition:
SELECT AVG(Salary) FROM Employees WHERE Age > 30;
🔹 This finds the average salary of employees older than 30.



4️⃣ MIN() – Finding the Smallest Value
The MIN() function finds the smallest value in a column.

Syntax:
SELECT MIN(column_name) FROM table_name;

Example:
SELECT MIN(Salary) AS LowestSalary FROM Employees;
🔹 This returns the lowest salary in the company.



5️⃣ MAX() – Finding the Largest Value
The MAX() function finds the largest value in a column.

Syntax:
SELECT MAX(column_name) FROM table_name;

Example:
SELECT MAX(Salary) AS HighestSalary FROM Employees;
🔹 This returns the highest salary in the company.


✅ GROUP BY – Grouping Data
The GROUP BY statement groups rows with the same values in one or more columns and applies aggregate functions (SUM(), COUNT(), etc.) to each group.

Syntax:
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name;

Example 1: Grouping by Department
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID;
🔹 This counts the number of employees in each department.


Example 2: Summing Salaries by Department
SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID;
🔹 This finds the total salary paid in each department.


Example 3: Finding the Highest Salary in Each Department
SELECT DepartmentID, MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY DepartmentID;
🔹 This finds the highest salary in each department.


✅ HAVING – Filtering Grouped Results
The HAVING clause filters grouped results after aggregation, similar to WHERE but used with GROUP BY.

Syntax:
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;


Example 1: Departments with More Than 5 Employees
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 5;
🔹 This selects departments with more than 5 employees.

Example 2: Departments Where Total Salary > 100,000
SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
HAVING SUM(Salary) > 100000;
🔹 This selects departments where the total salary exceeds 100,000.

Example 3: Departments with Average Salary > 50,000
SELECT DepartmentID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 50000;
🔹 This finds departments where the average salary is greater than 50,000.

✅ Summary Table

SQL Function	Purpose	Example
COUNT()	Counts rows	COUNT(*) → Total rows
SUM()	Adds up values	SUM(Salary) → Total salary
AVG()	Finds the average	AVG(Salary) → Average salary
MIN()	Finds smallest value	MIN(Salary) → Lowest salary
MAX()	Finds largest value	MAX(Salary) → Highest salary
GROUP BY	Groups data	GROUP BY DepartmentID
HAVING	Filters groups	HAVING SUM(Salary) > 100000

✅ Final Notes

Use WHERE before aggregation and HAVING after aggregation.
Use GROUP BY whenever applying aggregate functions on groups.
COUNT(*) counts all rows, including NULL values.
Aggregations like SUM(), AVG(), MIN(), MAX() only work on numeric columns.
