# Write your MySQL query statement below
WITH rnk AS (
    SELECT 
        DENSE_RANK() OVER (ORDER BY salary DESC) salary_rank,
        salary
    FROM employee
)
SELECT
    MAX(salary) AS SecondHighestSalary
FROM rnk
WHERE salary_rank = 2
LIMIT 1;