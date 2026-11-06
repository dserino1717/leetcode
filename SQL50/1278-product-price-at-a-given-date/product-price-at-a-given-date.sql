# Write your MySQL query statement below
WITH latest_change_dates AS (
    SELECT
        product_id,
        MAX(change_date) latest_date
    FROM products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id)
SELECT
    d.product_id,
    IFNULL(new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM products) d
LEFT JOIN latest_change_dates l ON d.product_id = l.product_id
LEFT JOIN products p ON l.product_id = p.product_id AND l.latest_date = p.change_date
ORDER BY product_id ASC;
