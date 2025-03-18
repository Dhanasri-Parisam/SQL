---------------------------------------------------------------------------------------------
SQL JOINS
INNER JOIN	✅ Only matching rows
LEFT JOIN	✅ All from left, NULL from right if no match
RIGHT JOIN	✅ All from right, NULL from left if no match
FULL JOIN	✅ All from both, NULL where no match 
CROSS JOIN	✅ Every row from table 1 × Every row from table 2
SELF JOIN	✅ Table joins itself
NATURAL JOIN	✅ Automatic join on common columns
---------------------------------------------------------------------------------------------
1️⃣. INNER JOIN
Returns only the rows where there is a match in both tables.
Unmatched rows are excluded.
------------------------------------------------------------>
EXAMPLE 1:
STEP 1:
----------------------------------------->
EMPLOYEE TABLE:
-----------------------------------------
| EmployeeID | EmployeeName | DepartmentID |
-----------------------------------------
| 1          | Alice        | 101          |
-----------------------------------------
| 2          | Bob          | 102          |
-----------------------------------------
| 3          | Charlie      | 103          |
-----------------------------------------
| 4          | David        | 104          |
-----------------------------------------
| 5          | Eve          | 106          |
-----------------------------------------

DEPARTMENT TABLE:
-------------------------------
| DepartmentID | DepartmentName |
-------------------------------
| 101          | HR             |
-------------------------------
| 102          | IT             |
-------------------------------
| 103          | Sales          |
-------------------------------
| 104          | Marketing      |
-------------------------------
| 105          | Finance        |
-------------------------------

STEP2 :
-------------------------------->

2. INNER JOIN Query:
-------------------------------------------------------------------------------
SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
-------------------------------------------------------------------------------

3.INNER JOIN RESULT:
-------------------------------------
| EmployeeID | EmployeeName | DepartmentName |
-------------------------------------
| 1          | Alice        | HR             |
-------------------------------------
| 2          | Bob          | IT             |
-------------------------------------
| 3          | Charlie      | Sales          |
-------------------------------------
| 4          | David        | Marketing      |
-------------------------------------

4. INNER JOIN Condition: Matches Employees.DepartmentID with Departments.DepartmentID.
   Unmatched Rows Removed: Employee Eve (DepartmentID = 106) is excluded because
   DepartmentID 106 does not exist in the Departments table.

----------------------------------------------------------------------------------------->
EXAMPLE 2 :
----------->
2️⃣ Count Number of Employees in Each Department (INNER JOIN with GROUP BY)
-------------------------------------------------------------------------->

EMPLOYE TABLE:
-------------------------------------
| EmployeeID | EmployeeName | DepartmentName |
-------------------------------------
| 1          | Alice        | HR             |
-------------------------------------
| 2          | Bob          | IT             |
-------------------------------------
| 3          | Charlie      | Sales          |
-------------------------------------
| 4          | David        | Marketing      |
-------------------------------------

DEPARTMENT TABLE:
-------------------------------
| DepartmentID | DepartmentName |
-------------------------------
| 301          | HR             |
-------------------------------
| 302          | IT             |
-------------------------------

Query:
-------------------------------------------------------------
SELECT Departments.DepartmentName, COUNT(Employees.EmployeeID) AS EmployeeCount
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName;
--------------------------------------------------------------

Operation: Count employees in each department.
Result:
-----------------------------------
| DepartmentName | EmployeeCount |
-----------------------------------
| HR             | 2             |
-----------------------------------
| IT             | 1             |
-----------------------------------
--------------------------------------------------------------------------------------------->

EXAMPLE 3:
--------->
3️⃣ Find Products That Have Suppliers (INNER JOIN with DISTINCT):
----------------------------------------------------------------->

Employees TABLE:
-------------------------------------
| ProductID | ProductName | SupplierID |
-------------------------------------
| 1         | Apple       | 401        |
-------------------------------------
| 2         | Banana      | 402        |
-------------------------------------
| 3         | Carrot      | 401        |
-------------------------------------

Departments TABLE:
-------------------------------------
| ProductID | ProductName | SupplierID |
-------------------------------------
| 1         | Apple       | 401        |
-------------------------------------
| 2         | Banana      | 402        |
-------------------------------------
| 3         | Carrot      | 401        |
-------------------------------------

Query:
----->

SELECT DISTINCT Suppliers.SupplierName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

Operation: Get unique supplier names.
--------->

-------------------------
| SupplierName  |
-------------------------
| Fresh Farms   |
-------------------------
| Green Market  |
-------------------------

---------------------------------------------------------------------------------------------
EXAMPLE 4 :
---------->

4️⃣ Find Students Who Have Enrolled in Courses (INNER JOIN with WHERE Clause)

Students:
---------------------------
| StudentID | StudentName |
---------------------------
| 1         | John        |
---------------------------
| 2         | Sarah       |
---------------------------
| 3         | Mike        |
---------------------------

Enrollments:
-------------------------------------
| EnrollmentID | StudentID | CourseID |
-------------------------------------
| 1001         | 1         | 201      |
-------------------------------------
| 1002         | 2         | 202      |
-------------------------------------
| 1003         | 3         | 203      |
-------------------------------------

Courses:
---------------------------
| CourseID | CourseName |
---------------------------
| 201      | Math       |
---------------------------
| 202      | Science    |
---------------------------
| 203      | History    |
---------------------------

Query:
----->

SELECT Students.StudentName, Courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID
WHERE Courses.CourseName = 'Math';

Operation: Get students enrolled in Math.
--------->

-------------------------
| StudentName | CourseName |
-------------------------
| John        | Math       |
-------------------------

---------------------------------------------------------------------------------------------

EXAMPLE 5:
--------->

5️⃣ Get Top 2 Highest Paid Employees in Each Department (INNER JOIN with LIMIT & ORDER BY)

Employees:
--------->
--------------------------------------------------
| EmployeeID | EmployeeName | DepartmentID | Salary |
--------------------------------------------------
| 1          | Alice        | 301          | 80000  |
--------------------------------------------------
| 2          | Bob          | 301          | 75000  |
--------------------------------------------------
| 3          | Charlie      | 302          | 90000  |
--------------------------------------------------
| 4          | David        | 302          | 85000  |
--------------------------------------------------

Departments:
-------------->
-------------------------------
| DepartmentID | DepartmentName |
-------------------------------
| 301          | HR             |
-------------------------------
| 302          | IT             |
-------------------------------

Query:
------>

SELECT Employees.EmployeeName, Departments.DepartmentName, Employees.Salary
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
ORDER BY Employees.DepartmentID, Employees.Salary DESC
LIMIT 2;

Operation: Get top 2 highest-paid employees.
--------->
-------------------------------------
| EmployeeName | DepartmentName | Salary |
-------------------------------------
| Alice        | HR             | 80000  |
-------------------------------------
| Charlie      | IT             | 90000  |
-------------------------------------
---------------------------------------------------------------------------------------------
EXAMPLE 6:
--------->
6️⃣ Calculate Total Sales Per Customer (INNER JOIN with SUM)

Customers:
---------------------------
| CustomerID | CustomerName |
---------------------------
| 1          | Alice        |
---------------------------
| 2          | Bob          |
---------------------------

Orders:
-------------------------------------
| OrderID | CustomerID | OrderAmount |
-------------------------------------
| 101     | 1          | 500         |
-------------------------------------
| 102     | 1          | 700         |
-------------------------------------
| 103     | 2          | 300         |
-------------------------------------

Query:
-------->

SELECT Customers.CustomerName, SUM(Orders.OrderAmount) AS TotalSpent
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName;


Operation: Calculate total amount spent per customer.

Result:

-----------------------------------
| CustomerName | TotalSpent |
-----------------------------------
| Alice        | 1200       |
-----------------------------------
| Bob          | 300        |
-----------------------------------

---------------------------------------------------------------------------------------------
EXAMPLE 7:
--------->
7️⃣ Find Employees Who Have No Assigned Projects (INNER JOIN with NOT IN)

Employees:
---------------------------
| EmployeeID | EmployeeName |
---------------------------
| 1          | Adam         |
---------------------------
| 2          | Ben          |
---------------------------
| 3          | Chris        |
---------------------------

Projects:
-------------------------------------
| ProjectID | EmployeeID | ProjectName |
-------------------------------------
| 101       | 1          | Project A   |
-------------------------------------
| 102       | 2          | Project B   |
-------------------------------------

Query:
------>

SELECT Employees.EmployeeName
FROM Employees
LEFT JOIN Projects ON Employees.EmployeeID = Projects.EmployeeID
WHERE Projects.ProjectID IS NULL;

Operation: Find employees without projects.
----------->

-------------------------
| EmployeeName |
-------------------------
| Chris        |
-------------------------

---------------------------------------------------------------------------------------------
Summary of Operations
Example	Operation Type
1️⃣	Basic INNER JOIN
2️⃣	INNER JOIN with WHERE
3️⃣	INNER JOIN with GROUP BY
4️⃣	INNER JOIN with DISTINCT
5️⃣	INNER JOIN with ORDER BY & LIMIT
6️⃣	INNER JOIN with SUM
7️⃣	INNER JOIN with NOT IN
---------------------------------------------------------------------------------------------
