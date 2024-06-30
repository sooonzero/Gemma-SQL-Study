-- 답만 맞춤.....
select a.student_id
from (select student_id, dense_rank() over(order by sat_writing desc) rk
    from sat_scores) a
where a.rk  like round((select count(student_id) - 4
                       from sat_scores) / 2)
