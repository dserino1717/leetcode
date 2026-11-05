# Write your MySQL query statement below
SELECT
    activity_date day,
    COUNT(DISTINCT user_id) active_users
from activity
GROUP BY activity_date
HAVING activity_date > DATE_SUB('2019-7-27', INTERVAL 30 DAY) AND activity_date <= '2019-07-27';