select a.first_name, a.last_name, a.city, b.order_details
from customers a left outer join orders b
on a.id = b.cust_id
order by 1, 4;
