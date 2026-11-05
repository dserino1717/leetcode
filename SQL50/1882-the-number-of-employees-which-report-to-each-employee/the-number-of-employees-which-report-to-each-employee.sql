# Write your MySQL query statement below



WITH manager_report_counts AS (
    SELECT
        reports_to,
        COUNT(employee_id) reports_count,
        ROUND(AVG(age), 0) average_age
    FROM employees
    WHERE reports_to IS NOT NULL
    GROUP BY reports_to)
SELECT
    e.employee_id,
    e.name,
    m.reports_count,
    m.average_age
FROM employees e
JOIN manager_report_counts m ON e.employee_id = m.reports_to
ORDER BY employee_id;