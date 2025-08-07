Sample Table:
id	seat_id	free
1    	1	      1
2    	2	      1
3	    3	      0
4	    4	      1
5	    5      	1

Expected Output:
seat_id
1
2
4
5

SQL CODE:

SELECT seat_id
FROM (
    SELECT seat_id,
           free,
           LEAD(free) OVER (ORDER BY seat_id) AS Next_seat,
           LAG(free) OVER (ORDER BY seat_id) AS Prev_seat
    FROM Cinema
) AS TA
WHERE free = 1 AND (Next_seat = 1 OR Prev_seat = 1)
ORDER BY seat_id;
