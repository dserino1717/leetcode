# Write your MySQL query statement below

WITH customer_counts AS (
    SELECT
        customer_id,
        COUNT(DISTINCT product_key) AS counts
    FROM customer
    GROUP BY customer_id
    HAVING counts = (SELECT COUNT(DISTINCT product_key) FROM product))
SELECT
    customer_id
FROM customer_counts;