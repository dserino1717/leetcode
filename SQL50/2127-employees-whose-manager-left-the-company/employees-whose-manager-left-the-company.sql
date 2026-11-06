# Write your MySQL query statement below
SELECT
    e1.employee_id
FROM employees e1
WHERE salary < 30000 AND manager_id IS NOT NULL AND
NOT EXISTS (
    SELECT
        e2.employee_id
    FROM employees e2
    WHERE e1.manager_id = e2.employee_id
)
ORDER BY employee_id;