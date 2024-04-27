select b.first_name, a.order_date, sum(total_order_cost) total_cost
from orders a join customers b on a.cust_id = b.id
where a. order_date between '2019-02-01' and '2019-05-01'
group by b.first_name, a.order_date
order by 3 desc
limit 1
