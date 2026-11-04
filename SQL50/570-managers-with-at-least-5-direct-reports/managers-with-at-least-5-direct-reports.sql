# Write your MySQL query statement below
with 5_reports as (select managerid,
       count(*)
from employee
where managerid is not null
group by managerid
having count(*) >= 5)
select 
    name
from employee e
join 5_reports r on e.id = r.managerid;

