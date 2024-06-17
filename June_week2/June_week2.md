# [week2 피드백]
## #1 Highest Salary In Department
### [sooonzero 풀이]
```sql
select department,
first_name,
salary
from employee
where salary  in (
	select max(salary)
	from employee
	group by department
);
```

### [Gemma님 풀이]
```sql
select department,
first_name,
salary
from
(
    select department,
    first_name,
    salary,
    rank() over (partition by department order by salary desc) rn
    from employee
) A
where rn=1;
```


### [피드백]
1. group by department를 쓰면, select문 안에서도 department를 쓴 후에 max(salary)를 작성해야 합니다.
안그러면 department와 연결하지 못한 채로, 그저 각 department의 max salary가 여러 개 나옵니다. (사진 참고)
(그런데 어차피 group by department를 쓰고 select문 안에 department를 추가하면, in 연산자로 문제풀이가 불가능합니다)

재영님의 풀이대로라면,
Sales의 max salary가 2200인데, 우연히 Management의 직원의 salary가 2200이면 해당 직원이 답으로 출력될 것입니다.
따라서 재영님 풀이는 틀린 풀이입니다.

2. 저는 rank로 문제를 풀었습니다. 풀이 참고 부탁드립니다.


### #2 Customer Revenue In March
### [sooonzero 풀이]
```sql
select cust_id,
sum(total_order_cost) revenue
from orders
where order_date between '2019-03-01' and '2019-03-31'
group by cust_id;
```

### [Gemma님 풀이]
```sql
select cust_id,
sum(total_order_cost) as revenue
from orders
where DATE_FORMAT(order_date,'%Y%m')='201903'
group by cust_id;
```

### [피드백]
로직은 재영님과 동일하나, 저는 date_format으로 날짜 추출을 하였습니다. 참고 바랍니다.


## #3 Users By Average Session Time
### [sooonzero 풀이]
```sql
select a.user_id,
avg(timestampdiff(second,a.timestamp,b.timestamp)) session_time
from(
	select user_id,
	timestamp,
	action
	from facebook_web_log
	where action like ('page%')
	group by user_id, date_format(timestamp,'%Y-%m-%d'), action
) a 
inner join
(
	select user_id,
	timestamp,
	action
	from facebook_web_log
	where action like ('page%')
	group by user_id, date_format(timestamp,'%Y-%m-%d'), action
) b
on a.user_id = b.user_id
where a.action = 'page_load' and b.action = 'page_exit'
group by a.user_id
order by 1;
```


### [Gemma님 풀이]
```sql
select user_id,
avg(time_diff)
from
(
    select user_id,
    date,
    timestampdiff(second, latest_load, earliest_exit) as time_diff
    from
    (
        select user_id,
        date_format(timestamp,'%Y%m%d') date,
        max(case when action='page_load' then timestamp end) latest_load,
        min(case when action='page_exit' then timestamp end) earliest_exit
        from facebook_web_log
        group by user_id, date_format(timestamp,'%Y%m%d')
    ) A
    where latest_load < earliest_exit
) B
group by user_id;
```


### [피드백]
1. 저는 case when을 사용해서 문제를 풀이하였습니다. 풀이 참고 부탁드립니다.

2. 일단 재영님 풀이에서 group by user_id, date_format(timestamp,'%Y-%m-%d'), action를 사용했으면,
select 문 안에서도 그대로 user_id, date_format(timestamp,'%Y-%m-%d'), action를 사용해야 합니다.
하지만 timestamp를 사용하였기에 틀린 풀이가 됩니다.
(mysql에서는 왜그런지는 모르겠지만 이러한 쿼리를 에러로 뱉어내지는 않는데요… oracle 등에서는 아예 문법 에러로 뱉어내기 때문에 원래는 쿼리가 조회가 되면 안됩니다.)

3. 재영님 풀이를 올바른 정답으로 고치기에는 여러 가지 조건을 포함하지 않아서 그대로 재영님 풀이를 살리기에는 어려울 듯합니다ㅠ
