# Write your MySQL query statement below
WITH consecutive_table AS (
    SELECT
        num,
        id,
        id - (LAG(id, 2) OVER (PARTITION BY num ORDER BY id ASC)) id_diff
    FROM logs
    ORDER BY num, id ASC)
SELECT
    DISTINCT num AS ConsecutiveNums
FROM consecutive_table
WHERE id_diff = 2;