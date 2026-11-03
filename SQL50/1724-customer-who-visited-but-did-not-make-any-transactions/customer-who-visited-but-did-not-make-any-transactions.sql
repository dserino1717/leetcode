# Write your MySQL query statement below
select
    customer_id,
    count(*) count_no_trans
from visits v
left join transactions t on v.visit_id = t.visit_id
where not exists (
    select
        visit_id
    from transactions tr
    where tr.visit_id = t.visit_id
)
group by customer_id;