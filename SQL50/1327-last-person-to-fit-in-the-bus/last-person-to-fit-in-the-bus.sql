# Write your MySQL query statement below
-- running sum
WITH weights AS (SELECT
    turn,
    person_name,
    weight,
    SUM(weight) OVER (ORDER BY turn) total_weight
FROM queue),
max_turn AS (SELECT
    MAX(turn) turn_max
FROM weights w
WHERE total_weight <= 1000)
SELECT 
    person_name
FROM weights w
JOIN max_turn m ON w.turn = m.turn_max;