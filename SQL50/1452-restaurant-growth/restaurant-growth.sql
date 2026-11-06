# Write your MySQL query statement below
SELECT
    visited_on,
    amt AS amount,
    ROUND(amt / 7, 2) average_amount
FROM (SELECT visited_on, SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amt FROM 
    (SELECT
        visited_on,
        SUM(amount) AS amount
    FROM customer
    GROUP BY visited_on) daily ) c1
WHERE DATE_SUB(visited_on, INTERVAL 6 DAY) >= (SELECT MIN(visited_on) FROM customer);