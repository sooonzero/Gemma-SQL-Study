

# [week1 피드백]
## #1 Highest Energy Consumption
### [sooonzero 풀이]
```sql
select b.date,
b.consumption
from (
	select date,
	sum(consumption) consumption,
	rank() over(order by sum(consumption) desc) rk
	from (
		select *
		from fb_eu_energy

		union

		select *
		from fb_asia_energy

		union
		select * from fb_na_energy
		) a
	group by date
	) b
where b.rk=1;
```

### [Gemma님 풀이]
```sql
select date,
consumption
from
(
    select date,
    sum(consumption) as consumption,
    rank() over (order by sum(consumption) desc) rn -- duplicate maximum exists
    from
    (
        select *
        from fb_eu_energy
        
        union
        
        select *
        from fb_asia_energy
        
        union
        
        select *
        from fb_na_energy
    ) A
    group by date
) B
where rn=1;
```

### [피드백]
저와 풀이가 동일합니다. 중복된 최대값(consumption=1250)이 존재하기 때문에, rank로 문제를 풉니다.


## #2 Top Businesses With Most Reviews
### [sooonzero 풀이]
```sql
select a.name,
a.review_count
from (
	select business_id,
	name,
	sum(review_count) review_count,
	rank() over(order by sum(review_count) desc) rk
	from yelp_business
	group by business_id
)a
where a.rk<=5;
```

### [Gemma님 풀이]
```sql
select name,
review_count
from yelp_business
order by review_count desc
limit 5;
```


### [피드백]
1. order by와 limit 조합으로 풀면 쉽게 문제를 풀 수 있습니다.

2. 참고로 rank로 모든 최대값/최소값 문제를 풀수 있습니다.
그 중에서 유일한 최대값, 최소값이 보장된다면, min/max로 풀이가 가능합니다.
그 중에서 유일한 최대 개수, 최소 개수가 보장된다면, order by와 limit 조합의 풀이가 가능합니다.

3. business_id는 PK값이므로 group by business_id와 sum(review_count)를 사용할 필요가 없습니다.

(아래처럼 조회하면 데이터 없음)
select business_id
from yelp_business
group by business_id
having count(business_id) >=2

4. rank로 풀려면 아래처럼 풀이하시면 됩니다.
```sql
select name,
review_count
from (
	select name,
	review_count,
	rank() over(order by review_count desc) rk
	from yelp_business
) a
where a.rk<=5;
```

## #3 Flags per Video
### [sooonzero 풀이]
```sql
select a.video_id,
count(distinct(a.name))
from (
	select concat(ifnull(user_firstname," "),ifnull(user_lastname," ")) name,
	video_id
	from user_flags
	where flag_id is not null
) a
group by a.video_id
order by 1;
```

### [Gemma님 풀이]
```sql
select video_id,
count(distinct concat(ifnull(user_firstname,''), ' ', ifnull(user_lastname,''))) as num_unique_users
from user_flags
where flag_id is not null
group by video_id;
```


### [피드백]
로직은 저와 동일합니다. 하지만 굳이 sub query를 써줄 필요가 없습니다.
