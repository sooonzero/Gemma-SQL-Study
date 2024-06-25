# [week3 피드백]
## #1 Classify Business Type
### [sooonzero 풀이]
```sql
select distinct(business_name),
case
when business_name like ('%restaurant%' ) then 'restaurant'
     when business_name like ('%cafe%') or business_name like ('%café%') or business_name like ('%coffee%') then 'cafe'
     when business_name like ('%school%') then 'school'
     else 'other'
 end as business_type
from sf_restaurant_health_violations;
```

### [Gemma님 풀이]
```sql
select DISTINCT business_name,
case
	when lower(business_name) like '%restaurant%' then 'restaurant'
	when lower(business_name) like '%cafe%' or lower(business_name) like '%café%' or lower(business_name) like '%coffee%' then 'cafe'
	when lower(business_name) like '%school%' then 'school'
	else 'other'
end as business_type
from sf_restaurant_health_violations;
```

### [피드백]
1. lower 함수까지 사용하면 더 좋을 듯합니다.
2. like 뒤에 괄호까지 할 필요는 없습니다.


## #2 Election Results
### [sooonzero 풀이]
```sql
select a.candidate
from voting_results a
left join (
	select voter,
	1 / count(candidate) vote_score 
	from voting_results
	group by voter
) b
on a. voter = b.voter
group by a.candidate
order by sum(b.vote_score) desc
limit 1;
```

### [Gemma님 풀이]
```sql
select candidate
from
(
    select *,
    rank() over (order by point desc) as rk
    from
    (
        select candidate,
        sum(point) as point
        from
        (
            select voter,
            candidate,
            count(*) over (partition by voter) cnt,
            round(1/count(*) over (partition by voter), 3) point
            from voting_results
            where candidate is not null
        ) A
        group by candidate
    ) B
) C
where rk=1;
```

### [피드백]
1. 저는 count() over (partition by) 로직을 사용했기 때문에, 조인을 사용하지는 않았습니다. 제 풀이도 참고 부탁드립니다.
2. 참고로 재영님의 풀이 중 inner join으로 하셔도 됩니다. 왜냐하면 둘다 voting_results 테이블을 사용하였기 때문입니다.


## #3 Spam Posts
### [sooonzero 풀이]
```sql
select post_date,
sum(spam)/count(spam) * 100
from (
	select post_id,
	post_date,
	case when post_keywords like ('%spam%') then 1 else 0 end as 'spam'
	from facebook_posts
) a
join facebook_post_views b
on a.post_id = b.post_id
group by post_date;
```

### [Gemma님 풀이]
```sql
select post_date,
sum(case when post_keywords like '%spam%' then 1 else 0 end)/count(*)*100
from facebook_post_views as t1
inner join facebook_posts as t2
on t1.post_id=t2.post_id
group by post_date;
```


## [피드백]
1. 제 풀이와 같은 로직입니다. 하지만 저는 서브 쿼리 없이 풀이 한번에 풀이하였습니다.
