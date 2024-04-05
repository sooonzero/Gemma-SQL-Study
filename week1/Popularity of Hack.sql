select a.location, avg(b.popularity) avg_popularity
from facebook_employees a join facebook_hack_survey b
on a.id = b.employee_id
group by a.location
