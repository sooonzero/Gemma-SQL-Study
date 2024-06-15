# [May week3 피드백]
## #1 Make a report showing the number of survivors and non-survivors by passenger class
### [sooonzero 풀이]
```sql
select survived,
sum(if(pclass = 1, 1, 0)) first_class,
sum(if(pclass = 2, 1, 0)) second_class,
sum(if(pclass = 3, 1, 0)) third_class
from titanic
group by survived;
```

### [Gemma님 풀이]
```sql
select survived,
sum(case when pclass=1 then 1 else 0 end) as first_class,
sum(case when pclass=2 then 1 else 0 end) as second_class,
sum(case when pclass=3 then 1 else 0 end) as third_class
from titanic
group by survived;
```

### [피드백]
저는 개인적으로 case when을 좋아해서 이렇게 풀었지만, 동일한 풀이입니다:)

## #2
### [sooonzero 풀이]
```sql
select id_guest,
sum(n_messages) messages,
dense_rank() over(order by sum(n_messages) desc) ranks
from airbnb_contacts
group by id_guest;
```

### [Gemma님 풀이]
```sql
select dense_rank() over (order by sum(n_messages) desc) ranks,
id_guest,
sum(n_messages) cnt
from airbnb_contacts
group by id_guest
order by cnt desc;
```

### [피드백]
1. 문제에서 'Order by the highest number of total messages first.'로 써있으므로, order by cnt desc 까지 작성 부탁드립니다.
2. 문제에서 'Output the rank, guest id, and number of total messages they've sent.'로 써있으므로, 해당 순서대로 select문에 작성 부탁드립니다.
3. 'dense_rank 사용하여 중복순위를 건너뛰지 않고 순위를 매기는 법을 새로 알게되었습니다.'라고 하셨는데, 해당 문제의 목적이였습니다:) 인프런 강의에서도 해당 부분 설명을 드렸습니다.


## #3 Find the rate of processed tickets for each type
### [sooonzero 풀이]
```sql
select type,
sum(processed) / count(complaint_id)
from facebook_complaints
group by type;
```


### [Gemma님 풀이]
```sql
select type,
sum(processed)/count(*) as proessed_rate
from facebook_complaints
group by type;
```


### [피드백]
제 풀이와 동일합니다:)
