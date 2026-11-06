# Write your MySQL query statement below
-- running sum
WITH weights AS (SELECT
    turn,
    person_name,
    weight,
    SUM(weight) OVER (ORDER BY turn) total_weight
FROM queue)
SELECT 
    person_name
FROM weights w
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;