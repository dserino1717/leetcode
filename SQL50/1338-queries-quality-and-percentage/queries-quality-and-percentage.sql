# Write your MySQL query statement below
with qualities as (select 
    query_name,
    result,
    rating / position as quality,
    case 
        when rating < 3 then 1
        when rating >= 3 then 0
    end poor_rating
from queries)
select
    query_name,
    round(sum(quality) / count(quality), 2) as quality,
    round((sum(poor_rating) / count(*)) * 100, 2) as poor_query_percentage
from qualities
group by query_name;