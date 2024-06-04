select a.name, a.review_count
from (select business_id,name, sum(review_count) review_count, rank() over(order by sum(review_count) desc) rk
from yelp_business
group by business_id)a
where a.rk<=5
