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
