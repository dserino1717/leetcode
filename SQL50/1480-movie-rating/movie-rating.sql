# Write your MySQL query statement below
SELECT
    name AS results
FROM (  SELECT
            name,
            u.user_id,
            COUNT(m.movie_id)
        FROM users u
        LEFT JOIN movierating m ON m.user_id = u.user_id
        GROUP BY u.name, u.user_id
        ORDER BY COUNT(movie_id) DESC, name ASC
        LIMIT 1) u
UNION ALL
SELECT
    title AS results
FROM (  SELECT
            title,
            mr.movie_id,
            AVG(rating)
        FROM movies m
        JOIN (SELECT * FROM movierating WHERE MONTH(created_at) = 2 AND YEAR(created_at) = 2020) mr ON m.movie_id = mr.movie_id
        GROUP BY title, mr.movie_id
        ORDER BY AVG(rating) DESC, title ASC
        LIMIT 1) m;