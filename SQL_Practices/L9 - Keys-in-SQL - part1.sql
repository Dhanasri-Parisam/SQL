
/* =====================================================
   1. PRIMARY KEY
===================================================== */
/*
A PRIMARY KEY uniquely identifies each record in a table.

Rules:
1. Cannot contain NULL values
2. Must be unique
3. Only one PRIMARY KEY per table
*/

CREATE TABLE student (
    id INT PRIMARY KEY,        -- Primary Key
    user_name VARCHAR(40),
    course_name VARCHAR(50)
);



/* =====================================================
   2. FOREIGN KEY
===================================================== */
/*
A FOREIGN KEY creates a relationship between two tables.

Purpose:
Ensures that values in the child table exist in the parent table.
*/

CREATE TABLE subjectmarks (
    id INT,
    subjects VARCHAR(40),
    course_marks INT,
    FOREIGN KEY (id) REFERENCES student(id)   -- Foreign Key referencing student table
);



/* =====================================================
   INSERT SAMPLE DATA
===================================================== */

INSERT INTO student (id, user_name, course_name)
VALUES
(1, 'dhanu', 'java'),
(2, 'raj', 'c++');

INSERT INTO subjectmarks (id, subjects, course_marks)
VALUES
(1, 'R', 39),
(2, 'C', 75);



/* =====================================================
   JOIN EXAMPLE
===================================================== */
/*
Joining two tables using PRIMARY KEY and FOREIGN KEY
*/

SELECT
    student.id,
    student.user_name,
    student.course_name,
    subjectmarks.subjects,
    subjectmarks.course_marks
FROM student
JOIN subjectmarks
ON student.id = subjectmarks.id;



/* =====================================================
   OTHER KEY CONCEPTS
===================================================== */


/* =====================================================
   3. SUPER KEY
===================================================== */
/*
A SUPER KEY is a set of one or more attributes that uniquely identify a record.

Examples:
{id}
{id, user_name}
{id, user_name, course_name}

All these combinations are SUPER KEYS because they uniquely identify a row.
*/



/* =====================================================
   4. CANDIDATE KEY
===================================================== */
/*
A CANDIDATE KEY is a minimal SUPER KEY.

It uniquely identifies a record without unnecessary attributes.

Examples:
id
email
*/



/* =====================================================
   5. ALTERNATE KEY
===================================================== */
/*
ALTERNATE KEYS are candidate keys that are NOT selected as the primary key.

Example:
If id is chosen as PRIMARY KEY,
then email becomes an ALTERNATE KEY.
*/



/* =====================================================
   6. COMPOSITE KEY
===================================================== */
/*
A COMPOSITE KEY is a PRIMARY KEY formed using two or more columns.
*/

CREATE TABLE orders (
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id, product_id)   -- Composite Primary Key
);



/* =====================================================
   7. UNIQUE KEY
===================================================== */
/*
A UNIQUE KEY ensures all values in a column are unique.

Difference from PRIMARY KEY:
PRIMARY KEY → cannot contain NULL
UNIQUE KEY  → can contain NULL (depending on DB system)
*/

CREATE TABLE users (
    id INT PRIMARY KEY,
    email VARCHAR(50) UNIQUE   -- Unique Key
);



/* =====================================================
   KEY RELATION SUMMARY
===================================================== */
/*
Super Key      → Any column combination that uniquely identifies a row
Candidate Key  → Minimal super key
Primary Key    → Selected candidate key
Alternate Key  → Remaining candidate keys
Composite Key  → Primary key made using multiple columns
Foreign Key    → Reference to primary key of another table
Unique Key     → Prevents duplicate values
*/