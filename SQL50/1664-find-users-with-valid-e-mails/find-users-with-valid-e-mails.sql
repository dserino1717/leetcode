# Write your MySQL query statement below
SELECT
    user_id,
    name,
    mail
FROM users
WHERE REGEXP_LIKE(mail, '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$', 'c');