select a.date, sum(a.cnt)/count(a.cnt)
from (select date, case when max(action) != min(action) then 1 else 0 end cnt
    from fb_friend_requests
    group by user_id_sender, user_id_receiver) a
group by a.date
order by 1;
 
# 여기도 예상답안에 count(a.user_id_receiver)/count(b.user_id_sender) 로 컬럼 이름이 나와있었다.
# 예상 답안의 컬럼 이름을 통해 답이 안나오도록 최대한 다른 방법을 고안해서 문제를 풀어보았다.
