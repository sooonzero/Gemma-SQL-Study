# 예상 답안의 컬럼 이름인 count(a.user_id_receiver)/count(b.user_id_sender) 에 맞춰 답을 작성해보았다.

select sent_date as date, count(a.user_id_receiver)/count(b.user_id_sender)
from (
    select user_id_sender, user_id_receiver, date as accepted_date
    from fb_friend_requests
    where action like ('accepted')
)a right outer join (
    select user_id_sender, user_id_receiver, date as sent_date
    from fb_friend_requests
    where action like ('sent')
) b 
on a.user_id_sender = b.user_id_sender
group by sent_date

