# Write your MySQL query statement below
WITH ids AS (SELECT
    email,
    MIN(id) min_id
FROM person
GROUP BY email)
DELETE p FROM person p 
JOIN ids i ON p.email = i.email
WHERE p.id != i.min_id;