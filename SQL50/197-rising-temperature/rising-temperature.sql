select
    w.id
from weather w
left join weather w2 on (w.recordDate - interval 1 day)= w2.recordDate
where w.temperature > w2.temperature;