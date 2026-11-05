# Write your MySQL query statement below
WITH num_depts_table AS (SELECT
    employee_id,
    COUNT(DISTINCT department_id) num_depts
FROM employee
GROUP BY employee_id)
SELECT
    e.employee_id,
    e.department_id
FROM employee e
JOIN num_depts_table n ON e.employee_id = n.employee_id
WHERE n.num_depts = 1 OR e.primary_flag = 'Y';
