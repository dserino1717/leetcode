# Write your MySQL query statement below
WITH counts AS (SELECT
    num,
    COUNT(*)
FROM mynumbers
GROUP BY num
HAVING COUNT(*) = 1)
SELECT
    MAX(num) AS num
FROM counts;