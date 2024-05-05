select a.first_name, a.last_name, a.city, b.order_details
from customers a left outer join orders b
on a.id = b.cust_id
order by 1, 4;


--[Gemma풀이]
select first_name,
last_name,
city,
order_details
from customers as t1
left outer join orders as t2
on t1.id=t2.cust_id
order by first_name, order_details;

/*
[피드백]
제 풀이와 동일합니다:)
*/
