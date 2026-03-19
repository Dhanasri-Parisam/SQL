/* =====================================================
   SQL CONSTRAINTS NOTES
   (Before vs After Examples)
===================================================== */


/* =====================================================
   1. NOT NULL CONSTRAINT
===================================================== */

/*
Definition:
NOT NULL ensures that a column cannot store NULL values.
*/

/* ---------- Before NOT NULL ---------- */

CREATE TABLE users_before(
    id INT,
    name VARCHAR(40)
);

INSERT INTO users_before VALUES (1, NULL);

/*
Result:
id | name
1  | NULL

Explanation:
NULL values are allowed because NOT NULL constraint is not applied.
*/


/* ---------- After NOT NULL ---------- */

CREATE TABLE users_after(
    id INT,
    name VARCHAR(40) NOT NULL
);

-- This query will fail
INSERT INTO users_after VALUES (1, NULL);

/*
Result:
ERROR: Column 'name' cannot be null
*/



/* =====================================================
   2. UNIQUE CONSTRAINT
===================================================== */

/*
Definition:
UNIQUE constraint prevents duplicate values in a column.
*/

/* ---------- Before UNIQUE ---------- */

CREATE TABLE email_before(
    id INT,
    email VARCHAR(50)
);

INSERT INTO email_before VALUES
(1,'dhanu@gmail.com'),
(2,'dhanu@gmail.com');

/*
Result:
Duplicate emails are allowed.
*/


/* ---------- After UNIQUE ---------- */

CREATE TABLE email_after(
    id INT,
    email VARCHAR(50) UNIQUE
);

-- This query will fail
INSERT INTO email_after VALUES
(1,'dhanu@gmail.com'),
(2,'dhanu@gmail.com');

/*
Result:
ERROR: Duplicate entry for key 'email'
*/



/* =====================================================
   3. CHECK CONSTRAINT
===================================================== */

/*
Definition:
CHECK ensures that column values satisfy a condition.
*/

/* ---------- Before CHECK ---------- */

CREATE TABLE age_before(
    id INT,
    age INT
);

INSERT INTO age_before VALUES (1,-5);

/*
Result:
Invalid age values are allowed.
*/


/* ---------- After CHECK ---------- */

CREATE TABLE age_after(
    id INT,
    age INT CHECK(age >= 18)
);

-- This query will fail
INSERT INTO age_after VALUES (1,16);

/*
Result:
ERROR: Check constraint violated
*/



/* =====================================================
   4. PRIMARY KEY CONSTRAINT
===================================================== */

/*
Definition:
PRIMARY KEY uniquely identifies each row in a table.

Rules:
1. Must be UNIQUE
2. Cannot contain NULL
3. Only one PRIMARY KEY per table
*/

/* ---------- Before PRIMARY KEY ---------- */

CREATE TABLE student_before(
    id INT,
    name VARCHAR(40)
);

INSERT INTO student_before VALUES
(1,'dhanu'),
(1,'raj');

/*
Result:
Duplicate IDs are allowed.
*/


/* ---------- After PRIMARY KEY ---------- */

CREATE TABLE student_after(
    id INT PRIMARY KEY,
    name VARCHAR(40)
);

-- This query will fail
INSERT INTO student_after VALUES
(1,'dhanu'),
(1,'raj');

/*
Result:
ERROR: Duplicate entry '1' for key 'PRIMARY'
*/



/* =====================================================
   5. FOREIGN KEY CONSTRAINT
===================================================== */

/*
Definition:
FOREIGN KEY creates a relationship between two tables.
It ensures the value exists in the parent table.
*/


/* ---------- Parent Table ---------- */

CREATE TABLE students(
    id INT PRIMARY KEY,
    name VARCHAR(40)
);

INSERT INTO students VALUES
(1,'dhanu'),
(2,'raj');


/* ---------- Before FOREIGN KEY ---------- */

CREATE TABLE marks_before(
    student_id INT,
    marks INT
);

INSERT INTO marks_before VALUES (5,90);

/*
Result:
Record inserted even though student_id 5 does not exist.
*/


/* ---------- After FOREIGN KEY ---------- */

CREATE TABLE marks_after(
    student_id INT,
    marks INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
);

-- This query will fail
INSERT INTO marks_after VALUES (5,90);

/*
Result:
ERROR:
Cannot add or update a child row:
a foreign key constraint fails
*/



/* =====================================================
   6. DEFAULT CONSTRAINT
===================================================== */

/*
Definition:
DEFAULT assigns a default value to a column when no value is provided.
*/

/* ---------- Before DEFAULT ---------- */

CREATE TABLE course_before(
    id INT,
    course VARCHAR(40)
);

INSERT INTO course_before(id) VALUES (1);

/*
Result:
course column becomes NULL.
*/


/* ---------- After DEFAULT ---------- */

CREATE TABLE course_after(
    id INT,
    course VARCHAR(40) DEFAULT 'Java'
);

INSERT INTO course_after(id) VALUES (1);

/*
Result:
course = 'Java'
*/



/* =====================================================
   7. AUTO_INCREMENT
===================================================== */

/*
Definition:
AUTO_INCREMENT automatically generates unique IDs.
*/

/* ---------- Before AUTO_INCREMENT ---------- */

CREATE TABLE users_before_auto(
    id INT PRIMARY KEY,
    name VARCHAR(40)
);

INSERT INTO users_before_auto VALUES
(1,'dhanu'),
(2,'raj');

/*
IDs must be inserted manually.
*/


/* ---------- After AUTO_INCREMENT ---------- */

CREATE TABLE users_after_auto(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40)
);

INSERT INTO users_after_auto(name) VALUES
('dhanu'),
('raj');

/*
Result:

id | name
1  | dhanu
2  | raj

IDs are generated automatically.
*/



/* =====================================================
   QUICK SUMMARY
===================================================== */

/*
Constraint        Purpose
-----------------------------------------------
NOT NULL          Prevent NULL values
UNIQUE            Prevent duplicate values
CHECK             Restrict values by condition
PRIMARY KEY       Unique + NOT NULL identifier
FOREIGN KEY       Maintain table relationship
DEFAULT           Set default value
AUTO_INCREMENT    Automatically generate IDs
*/