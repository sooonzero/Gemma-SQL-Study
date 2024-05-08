select a.company_name, (a.launch-b.launch) total_launch
from (select year,company_name ,count(product_name) launch
from car_launches
group by year, company_name
having year like (2020)) a join
(select year,company_name ,count(product_name) launch
from car_launches
group by year, company_name
having year like (2019))b
on a.company_name = b.company_name
