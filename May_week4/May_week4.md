# [week4 피드백]
## #1 Apple Product Counts
### [sooonzero 풀이]
```sql
select b.language,
count(distinct(case when a.device in ('MacBook Pro', 'iPhone 5s', 'iPad air') then a.user_id else null end ))as n_apple_user,
count(distinct(a.user_id)) n_total_users
from playbook_events a
join playbook_users b
on a.user_id = b.user_id
group by b.language
order by 3 desc;
```


### [Gemma님 풀이]
```sql
select language,
count(distinct case when device in ('macbook pro','iphone 5s','ipad air') then t1.user_id end) n_apple_user,
count(distinct t1.user_id) as n_total_users
from (
    select distinct user_id,
    device
    from playbook_events
) as t1
inner join playbook_users as t2
on t1.user_id=t2.user_id
group by language
order by n_total_users desc;
```

### [피드백]
1. 저와 로직은 동일합니다. 다만 저는 distinct 처리한 서브쿼리 t1을 사용하였습니다. 왜냐하면 playbook_events 테이블에 중복된 user_id와 device가 있기 때문입니다.
하지만 재영님처럼 사용해도 괜찮습니다. 어차피 select문에서 distinct 문법을 사용하기 때문입니다.
2. 참고로 distinct 다음에 괄호를 사용할 필요는 없습니다.
3. 참고로 case when에서 마지막 else null을 사용할 필요는 없습니다. else를 명시적으로 쓰지 않으면, 디폴트로 null로 들어가기 때문입니다.

## #2 Highest Target Under Manager
### [sooonzero 풀이]
```sql
select  a.first_name,
a.target
from (
	select first_name,
	target,
	dense_rank() over(order by target desc) rk
	from salesforce_employees
	where manager_id like 13
) a
where rk = 1;
```

### [Gemma님 풀이]
```sql
select first_name,
target
from
(
    select first_name,
    target,
    rank() over (order by target desc) rn
    from salesforce_employees
    where manager_id=13
) A
where rn=1;
```

### [피드백]
1. 저와 로직은 동일합니다.
2. 이 문제에서는 dense_rank와 rank 둘다 가능합니다.
3. like를 사용해도 되지만, 보통 like는 복수 개의 값을 괄호로 사용할 때 사용합니다.


## #3 Find matching hosts and guests in a way that they are both of the same gender and nationality
### [sooonzero 풀이]
```sql
select a.host_id,
b.guest_id
from (
	select distinct(host_id),
	gender,
	nationality
	from airbnb_hosts
) a join (
	select distinct(guest_id),
	gender,
	nationality
	from airbnb_guests
) b
where a.gender = b.gender
and a.nationality = b.nationality;
```


### [Gemma님풀이]
```sql
select distinct host_id,
guest_id
from airbnb_hosts as t1
inner join airbnb_guests as t2
on t1.nationality=t2.nationality
and t1.gender=t2.gender;
```


### [피드백]
1. 저와 로직은 동일합니다. 하지만 저는 최종 select문에서 distinct를 한번만 사용하였습니다.
