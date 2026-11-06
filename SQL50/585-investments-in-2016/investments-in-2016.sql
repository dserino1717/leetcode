# Write your MySQL query statement below
SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM (SELECT
            *,
            CONCAT(lat, '-', lon) AS combined
        FROM insurance i
        WHERE tiv_2015 IN (SELECT tiv_2015 FROM insurance WHERE pid != i.pid) AND
        CONCAT(lat, '-', lon) NOT IN (SELECT CONCAT(lat, '-', lon) AS combined FROM insurance WHERE pid != i.pid)) filtered;