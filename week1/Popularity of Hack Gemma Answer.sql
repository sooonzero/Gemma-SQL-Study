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
