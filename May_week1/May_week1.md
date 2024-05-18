# 새로 알게 된 것

## 1. where과 having은 언제 어떻게 활용해야 적절할까?
[Number of violations](https://platform.stratascratch.com/coding/9728-inspections-that-resulted-in-violations?code_type=3) 문제를 풀면서 아래와 같이 코드를 작성했다
```sql
select year(inspection_date),count(violation_id)
from sf_restaurant_health_violations
where business_name like ('Roxanne Cafe')
group by year(inspection_date)
order by 1;
```
where을 사용하거나 having사용해 문제를 풀 수 있음을 알게되며 어떤 상황에 적절히 활용하는것인지에 대해 더 알고싶어졌다.

## Gemma님 피드백
```sql
select year(inspection_date), count(violation_id)
from sf_restaurant_health_violations
where business_name='Roxanne Cafe'
group by year(inspection_date)
order by year(inspection_date);

```
having 절에는 집계함수만 쓰겠다라고 생각하면 덜 헷갈릴 듯합니다.

아래 2번에서 `having year like (2020)`라고 작성하셨는데, 가능은 하지만 where절에서도 적용할 수 있습니다.

따라서 아예 having에서는 집계함수만 쓰겠다라고 생각하는게 덜 헷갈릴 듯 합니다.

## 결론
1. WHERE는 GROUP BY 이전에 적용되어 개별 행에 대한 필터링을 수행한다.
2. HAVING은 GROUP BY 이후에 적용되어 그룹화된 결과에 대한 필터링을 수행한다.
3. HAVING은 집계 함수와 함께 사용할 수 있지만, WHERE는 그렇지 않다.
4. 나의 쿼리는 결과 세트의 첫 번째 컬럼을 기준으로 정렬하는 반면, Gemma 쿼리는 year(inspection_date) 컬럼을 사용하여 정렬함을 알 수 있다. Gemma님 방식이 좀 더 명시적이며 코드를 읽는 사람이 이해하기 쉽다는것을 알 수 있었다.



## 2. 간결한 쿼리 작성
[New Products](https://platform.stratascratch.com/coding/10318-new-products?code_type=3) 문제를 풀며 더 간결한 코드를 작성할 수 있을텐데 아쉬움이 남았다.
문제의 요구사항은 다음과 같다.
```
2020년에 출시된 제품 수와 전년도에 출시된 제품 수의 순 차이를 계산하기 위한 쿼리를 작성한다.
기업 이름과 2020년에 출시된 순 제품의 전년도 대비 순 차이를 출력한다.
```
제시된 테이블을 확인해보니 2019년과 2020년 데이터만 있어서 20년도 출시제품수와 19년도 출시제품 수를 각각 추출해 테이블로 만들어 조인 후 차이를 출력했다.
<div class="ResultsTable__container QuestionTables__preview-table"><table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">year</th><th class="ResultsTable__header-cell">company_name</th><th class="ResultsTable__header-cell">product_name</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019</td><td class="ResultsTable__cell">Toyota</td><td class="ResultsTable__cell">Avalon</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019</td><td class="ResultsTable__cell">Toyota</td><td class="ResultsTable__cell">Camry</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2020</td><td class="ResultsTable__cell">Toyota</td><td class="ResultsTable__cell">Corolla</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019</td><td class="ResultsTable__cell">Honda</td><td class="ResultsTable__cell">Accord</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019</td><td class="ResultsTable__cell">Honda</td><td class="ResultsTable__cell">Passport</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019</td><td class="ResultsTable__cell">Honda</td><td class="ResultsTable__cell">CR-V</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2020</td><td class="ResultsTable__cell">Honda</td><td class="ResultsTable__cell">Pilot</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019</td><td class="ResultsTable__cell">Honda</td><td class="ResultsTable__cell">Civic</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2020</td><td class="ResultsTable__cell">Chevrolet</td><td class="ResultsTable__cell">Trailblazer</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2020</td><td class="ResultsTable__cell">Chevrolet</td><td class="ResultsTable__cell">Trax</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019</td><td class="ResultsTable__cell">Chevrolet</td><td class="ResultsTable__cell">Traverse</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2020</td><td class="ResultsTable__cell">Chevrolet</td><td class="ResultsTable__cell">Blazer</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019</td><td class="ResultsTable__cell">Ford</td><td class="ResultsTable__cell">Figo</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2020</td><td class="ResultsTable__cell">Ford</td><td class="ResultsTable__cell">Aspire</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019</td><td class="ResultsTable__cell">Ford</td><td class="ResultsTable__cell">Endeavour</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2020</td><td class="ResultsTable__cell">Jeep</td><td class="ResultsTable__cell">Wrangler</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2020</td><td class="ResultsTable__cell">Jeep</td><td class="ResultsTable__cell">Cherokee</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2020</td><td class="ResultsTable__cell">Jeep</td><td class="ResultsTable__cell">Compass</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019</td><td class="ResultsTable__cell">Jeep</td><td class="ResultsTable__cell">Renegade</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019</td><td class="ResultsTable__cell">Jeep</td><td class="ResultsTable__cell">Gladiator</td></tr></tbody></table></div>

```sql
select a.company_name, (a.launch-b.launch) total_launch
from (
	select year,
	company_name,
	count(product_name) launch
	from car_launches
	group by year, company_name
	having year like (2020)
) a
join (
	select year,
	company_name,
	count(product_name) launch
	from car_launches
	group by year, company_name
	having year like (2019)
) b
on a.company_name = b.company_name;
```

## Gemma님 피드백
'간결하게 할 수 있을것 같은데 명확한 방법이 떠오르지않아 코드가 많이 길어지게되어 아쉬움이 남는 풀이였습니다.' 라고 후기 남겨주셨는데,
case when을 쓰면 훨씬 간결하게 쓸 수 있습니다.

재영님 풀이에서 group by의 year 제거하고, having 대신에 where절로 쓰는 등 아래와 같이 좀더 개선할 수 있습니다.
```sql
select a.company_name, (a.launch-b.launch) total_launch
from (
	select company_name,
	count(product_name) launch
	from car_launches
	where year=2020
	group by company_name
	
) a
inner join (
	select company_name,
	count(product_name) launch
	from car_launches
	where year=2019
	group by company_name
	
) b
on a.company_name = b.company_name;
```

## 결론
1. 1번 문제를 풀며 having과 where의 적절한 활용법에 헷갈렸던 부분의 다른 예시를 볼 수 있었다.
2. 내 풀이는 `HAVING 절`을 사용해 연도를 필터링하는데, `LIKE 연산자`를 사용하여 풀었다. 그러나 연도는 숫자 타입일 가능성이 높으므로, LIKE 연산자 대신 Gemma님 처럼 `=` 연산자를 사용하는 것이 더 적절할 수 있음을 알게되었다. 추가로 `LIKE 연산자`는 주로 문자열 검색에 사용된다는것을 알게되었다.
3. 내 풀이는 각 서브 쿼리에서는 `year`와 `company_name`으로 그룹화하고 있지만, HAVING 절에서 특정 연도만 필터링하므로 year로 그룹화하는 것은 불필요함을 알게되었다.
4. Gemma님의 코드를 통해 간결하고 의도를 명확하게 전달하는 접근 방식을 알 수 있었다.

## 3. Rank와 limit언제 어떻게 활용해야 적절할까?
[Largest Olympics](https://platform.stratascratch.com/coding/9942-largest-olympics?code_type=3) 문제를 풀며 매번 이러한 유형의 문제를 풀 때 `limit`을 활용해서 풀다보니, 상위 또는 하위의 1개 혹은 n개를 나열하는 문제는 잘 풀지만 2등 혹은 n등과 같이 중간에 위치한 값을 `rank`를 활용하여 문제를 풀 때 익숙하지 않아 어려움을 겪었다.
`rank`와 `limit`을 활용한 방법 중 어느 방법이 더 좋은 풀이방법인지 궁금하고, 혹시 다른 방법으로 풀 수 있다면 그 방법도 궁금했다.

나의 풀이
```sql
select games, count(distinct(id)) athletes_count
from olympics_athletes_events
group by games
order by 2 desc
limit 1;
```

이러한 궁금증을 Gemma님께 말씀드렸고, 풀이는 Gemma님과 동일했지만 추가 피드백을 주셨다.

## Gemma님 피드백
limit 1은 min/max값을 가지는 row가 1개일 때, rank는 min/max값을 가지는 row가 여러 개일 떄 사용합니다.


예를 들어 'Find the Olympics with the highest number of athletes'에서 최대 선수 인원(=118명)이 동일한 올림픽 경기가 2개 이상일 수 있습니다. 이럴 경우에는 limit 1로 하지 못하고, rank로 작성해야 합니다.

rank로 푼다면 아래와 같이 풀 수 있습니다.
 ```sql
select games,
athletes_count
from
(
    SELECT games,
    count(distinct id) athletes_count,
    rank() over (order by count(distinct id) desc) rk
    FROM olympics_athletes_events
    Group by games
) as a
where rk=1;
```

## 결론
1. `limit`를 활용한 쿼리는 가장 많은 선수가 참가한 올림픽 게임을 단 하나만 반환한다. 하지만 동일한 최대 참가 선수 수를 가진 게임이 여러 개라면, 그 중 하나만 무작위로 선택됨을 알 수 있었다.
2. `limit1를 활용한 쿼리는 '가장'이라는 조건을 충족하는 단일 결과만을 반환하는 반면, `rank`를 활용한 쿼리는 동일한 조건을 충족하는 여러 결과를 반환할 가능성이 있다.

