# Write your MySQL query statement below
WITH cat_counts AS (SELECT
    account_id,
    CASE
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
        ELSE 'High Salary'
        END AS category
FROM accounts),
all_cats AS (
    SELECT 'Low Salary' AS category
    UNION
    SELECT 'Average Salary' AS category
    UNION
    SELECT 'High Salary' AS category
)
SELECT
    a.category,
    COUNT(account_id) accounts_count
FROM all_cats a
LEFT JOIN cat_counts c ON a.category = c.category
GROUP BY category;