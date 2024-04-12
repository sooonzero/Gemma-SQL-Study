select count(address)/count(*) * 100 percent_shipable
from orders a join customers b on a.cust_id = b.id
