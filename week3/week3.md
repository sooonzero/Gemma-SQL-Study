
[Week3 코드 피드백]


#1
[재영님 풀이]
select from_user,
count(*) total_emails,
ROW_NUMBER() OVER(ORDER BY count(*) DESC, from_user ASC)
from google_gmail_emails
group by from_user
order by 3 asc;

[제풀이]
select from_user,
cnt,
row_number() over (order by cnt desc, from_user) as `rank`
from
(
    select from_user,
    count(*) cnt
    from google_gmail_emails
    group by from_user
) A
order by `rank`;


[피드백]
재영님 코드도 올바른 풀이입니다. 제 풀이에 대한 추가 설명을 적습니다.
1. 저는 명시적으로 cnt alias 컬럼명을 쓰기 위해, from에 temp table을 사용하였습니다.
2. rank라는 함수가 있기 떄문에, alias를 rank로 그대로 쓰면 에러가 납니다. rank가 함수가 아니라 alias명이라는 것을 알려주기 위해서 backtick(`)으로 감싸서 rank alias를 사용하였습니다.

#2
[재영님 풀이1]
select a.date,
sum(a.cnt)/count(a.cnt)
from (
	select date, 
	case when max(action) != min(action) then 1 else 0 end cnt
	from fb_friend_requests
	group by user_id_sender, user_id_receiver
) a
group by a.date
order by 1;

[재영님 풀이2]
select sent_date as date,
count(a.user_id_receiver)/count(b.user_id_sender)
from (
	select user_id_sender,
	user_id_receiver,
	date as accepted_date
	from fb_friend_requests
	where action like ('accepted')
)a
right outer join (
	select user_id_sender,
	user_id_receiver,
	date as sent_date
	from fb_friend_requests
	where action like ('sent')
) b 
on a.user_id_sender = b.user_id_sender
group by sent_date;

[제풀이]
select sent_date,
sum(accepted)/count(*) cnt
from
(
    select user_id_sender,
    user_id_receiver,
    min(case when action='sent' then date end) sent_date,
    sum(case when action='accepted' then 1 else 0 end) accepted
    from fb_friend_requests
    group by user_id_sender, user_id_receiver
) A
group by sent_date
order by sent_date;


[피드백]
1. 풀이 1번은 사이트에서 올바른 정답이라고 통과는 되었지만, 가급적 사용을 지양 부탁드립니다.
temp table안에 group by user_id_sender, user_id_receiver를 사용했는데요. select문에서 group by 이외의 컬럼은 집계함수를 사용해야 합니다.
해당 코드가 돌아는 가는데(<- 왜 돌아가는지 모르겠네요...), Oracle에서는 문법 에러로 돌아가지 않게 됩니다.(<- 원래 돌아가지 않는게 맞습니다)

2. 풀이 1번에서 'case when max(action) != min(action) then 1 else 0 end cnt'를 사용하셨는데, 문제에서 요구하는 조건들이(sent, accept 등에 따른 조건) 명시적으로 코드에 포함되어있지 않습니다. 그래서 다른 사람이 보았을 때, 로직을 파악하기 어렵습니다.

3. 풀이 2번은 사이트에서 올바른 정답이라고 통과는 되었지만, 틀린 풀이입니다. 해당 사이트의 테스트 데이터가 충분치 않아서 우연히 통과한 케이스입니다.
해당 테스트 케이스는 user_id_sender당 하나의 user_id_receiver만 나오는데요.

[중간테이블]
select user_id_sender,
user_id_receiver
from fb_friend_requests
group by user_id_sender, user_id_receiver
order by user_id_sender, user_id_receiver;

만약 user_id_sender당 2개의 user_id_receiver가 나온다면, 재영님의 풀이가 틀리게 됩니다. 왜냐하면 on a.user_id_sender = b.user_id_sender 과정에서 2개로 데이터가 중복이 되기 때문입니다.
따라서 on절에 and a.user_id_receiver = b.user_id_receiver까지 추가 해야 됩니다.
