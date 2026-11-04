# Write your MySQL query statement below

WITH lags AS (
    SELECT
        player_id,
        MIN(event_date) first_login_date
    FROM activity
    GROUP BY player_id
)
SELECT
    ROUND(SUM(CASE
        WHEN DATEDIFF(event_date, first_login_date) = 1 THEN 1
        ELSE 0
        END)
    /
    COUNT(DISTINCT a.player_id), 2) AS fraction
FROM activity a
JOIN lags l ON a.player_id = l.player_id;


