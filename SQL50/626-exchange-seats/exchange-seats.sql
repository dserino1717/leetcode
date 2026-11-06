# Write your MySQL query statement below
WITH new_ids AS (SELECT
    id,
    LEAD(student, 1, student) OVER (ORDER BY id) next_student_odd,
    LAG(student, 1) OVER (ORDER BY id) next_student_even
FROM seat
ORDER BY id ASC)
SELECT
    id,
    CASE
        WHEN id % 2 = 1 THEN next_student_odd
        WHEN id % 2 = 0 THEN next_student_even
    END AS student
FROM new_ids;
