# Write your MySQL query statement below

WITH ranks AS (SELECT
    d.name as Department,
    e.name AS Employee,
    salary,
    DENSE_RANK() OVER (PARTITION BY d.name ORDER BY salary DESC) salary_rank
FROM employee e
JOIN department d ON e.departmentId = d.id)
SELECT 
    Department,
    Employee,
    Salary
FROM ranks
WHERE salary_rank <= 3;


