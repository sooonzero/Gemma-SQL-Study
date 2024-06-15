select a.user_id, avg(timestampdiff(second,a.timestamp,b.timestamp)) session_time
from(select user_id, timestamp, action
    from facebook_web_log
    where action like ('page%')
    group by user_id, date_format(timestamp,'%Y-%m-%d'), action) a 
    inner join
    (select user_id, timestamp, action
    from facebook_web_log
    where action like ('page%')
    group by user_id, date_format(timestamp,'%Y-%m-%d'), action) b
    on a.user_id = b.user_id
where a.action = 'page_load' and b.action = 'page_exit'
group by a.user_id
order by 1
