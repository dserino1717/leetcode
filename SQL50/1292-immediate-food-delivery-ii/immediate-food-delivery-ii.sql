# Write your MySQL query statement below



WITH min_dates AS (SELECT 
    customer_id,
    MIN(order_date) first_order_date
FROM delivery
GROUP BY customer_id)
SELECT
    ROUND((SUM(CASE
                WHEN d.order_date = d.customer_pref_delivery_date THEN 1
                ELSE 0
               END) / COUNT(*) ) * 100, 2) immediate_percentage
FROM delivery d
JOIN min_dates m ON d.customer_id = m.customer_id
WHERE d.order_date = m.first_order_date; 
