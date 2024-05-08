select year(inspection_date), count(violation_id)
from sf_restaurant_health_violations
where business_name like ('Roxanne Cafe')
group by year(inspection_date)
order by 1;
