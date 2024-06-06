select a.video_id, count(distinct(a.name))
from (select concat(ifnull(user_firstname," "), ifnull(user_lastname," ")) name, video_id
    from user_flags
    where flag_id is not null) a
group by a.video_id
order by 1;
