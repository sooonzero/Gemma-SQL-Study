select distinct(a.user_id)
from amazon_transactions a 
        left join (select user_id, min(created_at) created_at
                    from amazon_transactions
                    group by user_id
                    having count(id)>1) b 
    on a.user_id = b.user_id
where datediff(a.created_at,b.created_at) between 1 and 7
order by 1
/*
목표: 두 번의 구매가 7일 이내에 이루어진 구매자를 찾기
방법1: 최솟값, 최댓값에 대한 차이로 찾기 
반례: 4번 구매 경우 2번째 3번째 구매 날짜 차이 계산 어려움 
        -> 제시된 테이블 경우 3월달만 있어서 5번 이상 구매일 경우 상관없음
        -> 일단 시도
user_id별 최초 구매일자, 마지막 구매일자 join
두 번 이상 구매한 사람을 찾기위해 having count(id)>1 (creted_at으로 할 경우 같은날 두 번 사는거 처리 안될까봐 id로 count)
원래 테이블 구매일자 - 최초 구매일자 1에서 7일 사이인 user_id 출력

결과: 내 코드 출력에 나온 143번의 경우 3월 11일 구매 후 3월 16일 구매해 7일 내에 두번째 구매를 했지만 Expected Output에 없음, 문제를 잘못 이해했나 싶다.
*/
