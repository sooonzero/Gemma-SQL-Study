select a.location, avg(b.popularity) avg_popularity
from facebook_employees a join facebook_hack_survey b
on a.id = b.employee_id
group by a.location

--[제풀이]
select location,
avg(popularity) avg_popularity
from facebook_employees as t1
inner join facebook_hack_survey as t2
on t1.id=t2.employee_id
group by location;

/*
[피드백]
제 풀이와 동일합니다:)
*/
