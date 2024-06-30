# [week4 피드백]
## #1
### [sooonzero 풀이]
```sql
select nationality,
count(*) apartment_count
from (
    select host_id,
    nationality,
    age
    from airbnb_hosts
    group by host_id
) a
join airbnb_units b 
on a.host_id = b.host_id
where b.unit_type like '%apartment%'
and age < 30
order by apartment_count desc;
```


### [Gemma님 풀이]
```sql
select t1.nationality,
count(t2.unit_id)
from 
(
    select distinct host_id,
    nationality
    from airbnb_hosts
    where age < 30
) as t1
inner join airbnb_units as t2
on t1.host_id=t2.host_id
where t2.unit_type='Apartment'
group by t1.nationality;
```

### [피드백]
1. group by를 사용한 방식 때문에, 재영님 코드는 틀린 코드입니다.
group by에 작성한 컬럼과 select문에 작성한 컬럼은 같아야 합니다. 
select에 host_id, nationality, age를 작성하는 만큼, group by에서도 동일하게 작성합니다.
(mySQL에서는 group by와 select의 컬럼이 일치하지 않아도 돌아는 가는데, 다른 데이터베이스 엔진에서는 syntax 에러로 돌아가지 않을 것입니다.)

2. a라는 서브쿼리를 사용하셨는데요. 그럼 age < 30 조건도 a 서브쿼리에 포함시키는 것을 추천드립니다.

3. 바깥 쿼리에서는 nationality, count(*)를 사용하셨는데, 그것과 맞는 group by를 사용하시지 않았습니다. 그래서 이 부분도 틀린 코드 입니다.


참고로 재영님 풀이는 group by와 select를 잘 맞춰주지 못하셔서 제가 틀렸다는 피드백을 유독 많이 드린 듯합니다ㅠ
mySQL이 좀 이상해서(?) 쿼리는 syntax 에러 없이 돌아가는데요. 하지만 대부분의 데이터베이스 엔진에서는 syntax 에러를 뱉어내서 아예 돌아가지 않을 것입니다.
select문과 group by에 사용하는 컬럼이 잘 맞춰졌는지 특히나 더 신경써주시길 바랍니다!


## #2
### [sooonzero 풀이]
```sql
select a.student_id
from (
    select student_id,
    dense_rank() over(order by sat_writing desc) rk
    from sat_scores
) a
where a.rk like round((select count(student_id) - 4 from sat_scores) / 2);
```

### [Gemma님 풀이]
```sql
select student_id
from sat_scores
where sat_writing
in (
    select sat_writing
    from
    (
        select student_id,
        sat_writing,
        row_number() over (order by sat_writing) rk,
        ceil(count(*) over ()/2) median_index
        from sat_scores
    ) A
    where rk= median_index
);
```

### [피드백]
1. 제 풀이의 핵심은 count(*) over () 이였습니다.
윈도우 함수를 사용하였는데, 데이터의 전체 count를 하나의 컬럼으로 표현한 것입니다. (사진 참고)
over()를 사용하는 윈도우 함수는, group by와 무관하게 select문에서 사용가능합니다.
그저 컬럼이 옆으로 추가되었다고 상상하면 됩니다.
