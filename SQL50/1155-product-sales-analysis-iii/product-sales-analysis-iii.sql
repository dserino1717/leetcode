# Write your MySQL query statement below
WITH min_years AS (
    SELECT
        product_id,
        MIN(year) first_year
    FROM sales
    GROUP BY product_id
)
SELECT 
    m.product_id,
    m.first_year,
    s.quantity,
    s.price
FROM min_years m
JOIN sales s ON m.product_id = s.product_id AND m.first_year = s.year;