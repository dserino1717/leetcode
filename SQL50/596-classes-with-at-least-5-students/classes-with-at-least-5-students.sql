# Write your MySQL query statement below
WITH counts AS (SELECT
    class,
    COUNT(*) AS class_counts
FROM courses
GROUP BY class)
SELECT 
    class
FROM counts
WHERE class_counts >= 5;