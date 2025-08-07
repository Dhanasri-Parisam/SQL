Problem Description:
A table Point is given with only one column:

Point
+-------------+
| x           |
+-------------+
| -1          |
| 0           |
| 2           |
+-------------+


All possible pairs are:

|-1 - 0| = 1

|-1 - 2| = 3

|0 - 2| = 2

Minimum is 1.

CODE : 
--------------------------------------------

SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM Point p1, Point p2
WHERE p1.x != p2.x;
