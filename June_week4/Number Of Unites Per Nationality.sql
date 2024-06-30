select nationality, count(*) apartment_count
from(
select host_id, nationality, age
from airbnb_hosts
group by host_id
)a join airbnb_units b 
on a.host_id = b.host_id
where b.unit_type like '%apartment%' and age < 30
order by apartment_count desc;
