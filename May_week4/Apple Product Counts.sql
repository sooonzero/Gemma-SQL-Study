select b.language
,count(distinct(case when a.device in ('MacBook Pro', 'iPhone 5s', 'iPad air') then a.user_id else null end ))as n_apple_user
,count(distinct(a.user_id)) n_total_users
from playbook_events a join playbook_users b on a.user_id = b.user_id
group by b.language
order by 3 desc;
