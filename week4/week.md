[Week4 코드 피드백]

#1
[재영님 풀이]
select c.username
from
(
	select concat(b.user_firstname," ",b.user_lastname) username,
	rank() over(order by count(reviewed_outcome) desc) ranking
	from flag_review a
	left join user_flags b
	on a.flag_id = b.flag_id
	where reviewed_outcome = 'APPROVED'
	group by username
) c
where c.ranking = 1;


[제풀이]
select username
from
(
    select concat(user_firstname, ' ', user_lastname) as username,
    count(distinct video_id) video_cnt,
    rank() over (order by count(distinct video_id) desc) rk
    from user_flags as t1
    inner join flag_review as t2
    on t1.flag_id=t2.flag_id
    where reviewed_outcome='APPROVED'
    group by concat(user_firstname, ' ', user_lastname)
) A
where rk=1;


[피드백]
재영님 풀이는 틀린 답으로 나옵니다.

1. 먼저 left outer join이 아닌, inner join으로 풀이해야 합니다.
재영님처럼 풀이한다면, approved가 된 flag_id이지만, 유저가 flag 하지 않은 flag_id도 나오게 됩니다.
하지만 우리는 유저가 flag한 flag_id만 관심 있기 때문에, inner join을 사용해야 합니다.

2. rank의 order by는 count(distinct video_id) desc로 작성해야 합니다.
문제에서 'the most distinct videos'를 사용하였기 때문입니다.

3. group by에 작성한 컬럼과 select문에 작성한 컬럼은 같아야 합니다. 
select에 concat(user_firstname, ' ', user_lastname) 작성하는 만큼, group by에서도 동일하게 작성합니다.

4. rank()는 집계함수는 아니지만 group by와 무관하게 select문에서 사용가능합니다.
group by의 결과물에 그저 rank() 컬럼이 옆에 추가되었다고 상상하면 됩니다.

[중간테이블 - 사진 참고]
select concat(user_firstname, ' ', user_lastname) as username,
count(distinct video_id) video_cnt,
rank() over (order by count(distinct video_id) desc) rk
from user_flags as t1
inner join flag_review as t2
on t1.flag_id=t2.flag_id
where reviewed_outcome='APPROVED'
group by concat(user_firstname, ' ', user_lastname)



----
#2
[재영님 풀이]
select distinct(a.user_id)
from amazon_transactions a 
left join (
	select user_id,
	min(created_at) created_at
	from amazon_transactions
	group by user_id
	having count(id)>1
) b 
on a.user_id = b.user_id
where datediff(a.created_at,b.created_at) between 1 and 7
order by 1;


[제풀이]
select distinct user_id
from
(
    select *,
    lag(created_at) over (partition by user_id order by created_at) prev_at
    from amazon_transactions
) A
where datediff(created_at, prev_at) <= 7;



[피드백]
재영님 풀이는 틀린 답으로 나옵니다. 일단 해당 문제는 lag로 풀이하면 간단하게 구현할 수 있습니다.

1. 2번째 구매가 1번째 구매와 같은 날짜인 코너케이스를 고려하지 않았습니다. (예: user_id 110)
사진 참고 부탁드립니다.

[중간 테이블]
with sample as (
    select *
    from amazon_transactions
    where user_id in (100, 110)
)

select *
from sample
order by user_id, created_at;

2. 재영님께서 사용했던 left outer join은 사실 inner join처럼 작동합니다.
왜냐하면 where 조건안에 b.created_at 조건을 사용하셨기 때문입니다.
이 부분은 아래 링크 참고 부탁드립니다.
https://stackoverflow.com/questions/3256304/left-join-turns-into-inner-join 
https://www.inflearn.com/questions/1209179


3. 만약 유저가 3번째 구매를 하더라도, 그 3번째 구매 기준 그 다음 구매가 7일 이내여도 정답에 포함되어야 합니다. (예: user_id 112)
(within 7 days of 'any other of their purchases')
사진 참고 부탁드립니다.

[중간 테이블]
with sample as (
    select *
    from amazon_transactions
    where user_id in (100, 112)
)

select *
from sample
order by user_id, created_at;

4. 재영님 로직과 비슷하게 작성하되, 코너케이스 1과 코너케이스 2가 포함되려면 아래와 같이 작성해야 합니다.

select distinct a.user_id
from amazon_transactions a
inner join amazon_transactions b 
on a.user_id = b.user_id
and a.id != b.id
where datediff(a.created_at,b.created_at) between 0 and 7
order by a.user_id;

----
#3
[재영님 풀이]
select b.first_name,
a.order_date,
sum(total_order_cost) total_cost
from orders a
join customers b
on a.cust_id = b.id
where a. order_date between '2019-02-01' and '2019-05-01'
group by b.first_name, a.order_date
order by 3 desc
limit 1;

[제풀이]
select first_name,
order_date,
sum(total_order_cost) cost
from customers as t1
inner join orders as t2
on t1.id=t2.cust_id
where order_date between '2019-02-01' and '2019-05-01'
group by first_name, order_date
order by cost desc
limit 1;

[피드백]
재영님 풀이도 맞습니다. 다만 'where a. order_date'에서 whitespace를 제거한 'where a.order_date'로 작성 부탁드립니다.

