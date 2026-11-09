# Write your MySQL query statement below
SELECT
    user_id,
    CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) name
FROM users
ORDER BY user_id;