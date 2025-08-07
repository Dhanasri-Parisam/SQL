SQL: Working with Tables & Data Types
1️⃣ Data Types in SQL
Numeric Data Types

INT: Whole numbers (-2,147,483,648 to 2,147,483,647)
BIGINT: Large whole numbers (-9 quintillion to 9 quintillion)
SMALLINT: Smaller whole numbers (-32,768 to 32,767)
DECIMAL(p,s) / NUMERIC(p,s): Fixed-point numbers (e.g., DECIMAL(10,2))
FLOAT / REAL: Approximate floating-point numbers
String Data Types

CHAR(n): Fixed-length string (e.g., CHAR(10) always stores 10 characters)
VARCHAR(n): Variable-length string (e.g., VARCHAR(50) stores up to 50 characters)
TEXT: Large variable-length text
Date & Time Data Types

DATE: Stores only date (format: YYYY-MM-DD)
TIME: Stores only time (format: HH:MM:SS)
DATETIME: Stores both date and time
TIMESTAMP: Similar to DATETIME, auto-updates with system time
Boolean Data Type

BOOLEAN: Stores TRUE or FALSE (internally as 1 or 0)
Other Data Types

BLOB: Binary Large Object (for images, files)
ENUM: String from predefined values (e.g., ENUM(‘Small’, ‘Medium’, ‘Large’))
2️⃣ Creating Tables (CREATE TABLE)
CREATE TABLE statement defines a new table with columns and data types.
Syntax:

CREATE TABLE table_name (
    column1 datatype constraints,
    column2 datatype constraints,
    ...
);
Example:

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18),
    Salary DECIMAL(10,2) DEFAULT 30000.00,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
EmployeeID: Primary Key (ensures uniqueness)
Name: NOT NULL (must have a value)
Age: CHECK constraint (must be 18 or older)
Salary: DEFAULT value (30,000 if not provided)
DepartmentID: Foreign Key (links to Departments table)
3️⃣ Inserting Data (INSERT INTO)
INSERT INTO statement adds new records to a table.
Syntax:

INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
Example:

INSERT INTO Employees (EmployeeID, Name, Age, Salary, DepartmentID)
VALUES (1, 'John Doe', 25, 50000.00, 2);
If all columns are inserted in order, column names can be skipped:
INSERT INTO Employees 
VALUES (2, 'Jane Smith', 30, 60000.00, 1);
4️⃣ Updating and Deleting Records (UPDATE, DELETE)
Updating Data (UPDATE)
UPDATE statement modifies existing records.
Syntax:

UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;
Example:

UPDATE Employees
SET Salary = 55000.00
WHERE EmployeeID = 1;
⚠ Always use WHERE to avoid updating all records.

Deleting Data (DELETE)

DELETE statement removes specific records.
Syntax:

DELETE FROM table_name
WHERE condition;
Example:

DELETE FROM Employees
WHERE EmployeeID = 2;


Dropping a Table (DROP TABLE)

Command: DROP TABLE table_name;
Example: DROP TABLE Employees;
Important Note: If WHERE is omitted, all rows in the table will be deleted permanently.
Altering a Table (ALTER TABLE)

Command: ALTER TABLE table_name;
Adding a Column:
Syntax: ALTER TABLE Employees ADD Email VARCHAR(255);
Modifying a Column:
Syntax: ALTER TABLE Employees MODIFY COLUMN Age SMALLINT;
Dropping a Column:
Syntax: ALTER TABLE Employees DROP COLUMN Email;
SQL Constraints (Ensuring Data Integrity)

Purpose: Enforce rules at the column or table level to ensure data integrity.

Primary Key (PRIMARY KEY)

Ensures each row is unique.
Cannot have NULL values.
Example:
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);
Foreign Key (FOREIGN KEY)

Ensures referential integrity between tables.
Example:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
Unique Constraint (UNIQUE)

Ensures all values in a column are different.
Example:
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE
);
Check Constraint (CHECK)

Restricts column values based on a condition.
Example:
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Price DECIMAL(10,2) CHECK (Price > 0)
);
Default Constraint (DEFAULT)

Assigns a default value if no value is provided.
Example:
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Country VARCHAR(50) DEFAULT 'USA'
);
Not Null Constraint (NOT NULL)

Ensures a column must have a value.
Example:
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL
);
Summary of SQL Operations

Create Table: CREATE TABLE - Defines table structure.
Insert Data: INSERT INTO - Adds new rows.
Update Data: UPDATE - Modifies existing rows.
Delete Data: DELETE - Removes specific rows.
Drop Table: DROP TABLE - Removes a table completely.
Alter Table: ALTER TABLE - Adds, modifies, or removes columns.
Constraints: PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, DEFAULT, NOT NULL - Ensures data integrity.
