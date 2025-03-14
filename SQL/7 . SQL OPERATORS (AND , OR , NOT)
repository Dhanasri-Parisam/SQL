------------------------------------------------------------------
SQL AND OPERATOR :
-----------------------------------------------------------------

CREATE DATABASE customer;

USE customer;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    e_name VARCHAR(50),
    C_no INT
); 

INSERT INTO employees (id, e_name, C_no)
VALUES
    (10, 'berlin', 123),
    (20, 'tokyo', 133),
    (30, 'palaremo', 143),
    (40, 'rio', 153);

-- AND vs OR
-- The AND operator displays a record if all the conditions are TRUE.
-- The OR operator displays a record if any of the conditions are TRUE.

SELECT * FROM employees WHERE id = 10 AND e_name LIKE 'b%';

SELECT * FROM employees WHERE id > 10 AND id < 30;

-- Combining AND and OR

SELECT * FROM employees WHERE e_name = 'palaremo' 
AND (id = 30 OR C_no = 133);

-- Without parenthesis

SELECT * FROM employees
WHERE e_name = 'tokyo' AND 
e_name LIKE '%r' OR id > 30;


------------------------------------------------------------------
SQL OR OPERATOR :
-----------------------------------------------------------------

CREATE DATABASE customer;

USE customer;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    e_name VARCHAR(50),
    C_no INT
); 

INSERT INTO employees (id, e_name, C_no)
VALUES
    (10, 'berlin', 123),
    (20, 'tokyo', 133),
    (30, 'palaremo', 143),
    (40, 'rio', 153),
    (50, 'Nairobi',163);
    
-- Syntax
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition1 OR condition2 OR condition3 ...;

SELECT * FROM employees WHERE 
e_name = 'berlinn' OR e_name = 'rio';

SELECT * FROM employees WHERE 
id > 40 OR e_name = 'rioo';

-- OR vs AND
-- The OR operator displays a record if any of the conditions are TRUE.

-- The AND operator displays a record if all the conditions are TRUE.

SELECT * FROM employees WHERE e_name LIKE '%o' OR  id > 60;

SELECT * FROM employees WHERE id = 50 AND 
e_name LIKE 'i%' OR C_no > 160;

SELECT * FROM employees WHERE id = 40 OR
 (e_name = '%g' AND C_no < 0);


------------------------------------------------------------------
SQL NOT OPERATOR :
-----------------------------------------------------------------

CREATE DATABASE customer;

USE customer;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    e_name VARCHAR(50),
    C_no INT
); 

INSERT INTO employees (id, e_name, C_no)
VALUES
    (10, 'ravi', 123),
    (20, 'kumar', 133),
    (30, 'syam', 143),
    (40, 'pavan', 153);

SELECT * FROM employees WHERE NOT e_name = 'ravi';


SELECT * FROM employees WHERE e_name NOT LIKE 'a%';

-- The BETWEEN operator is typically used with numeric values or dates, but it can also be used with strings.

SELECT * FROM employees WHERE C_no NOT BETWEEN 133 AND 143;

SELECT * FROM employees WHERE e_name NOT IN ('kumar','syam');

-- satisfies NOT id > 30, so it gets included.

SELECT * FROM employees WHERE NOT id > 30;

SELECT * FROM employees WHERE NOT id < 30;

SELECT * FROM employees WHERE NOT id = 30;

SELECT * FROM employees WHERE NOT id >= 30;


-------------------------------------------------------------------------------------
