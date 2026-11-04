with start_time_sum as (select
    machine_id,
    sum(timestamp) start_sum,
    count(distinct process_id) count_processes
from activity
where activity_type = 'start'
group by machine_id),
end_time_sum as (select
    machine_id,
    sum(timestamp) end_sum
from activity
where activity_type = 'end'
group by machine_id)
select
    s.machine_id, 
    round((e.end_sum -s.start_sum)/s.count_processes, 3) processing_time
from start_time_sum s
join end_time_sum e on s.machine_id = e.machine_id;

