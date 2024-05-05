[User with Most Approved Flags]
select c.username
from (
select concat(b.user_firstname," ",b.user_lastname) username, rank() over(order by count(reviewed_outcome) desc) ranking
    from flag_review a left join user_flags b on a.flag_id = b.flag_id
    where reviewed_outcome = 'APPROVED'
    group by username
    ) c
where c.ranking = 1

'''
reviewed_outcome이 APPROVED인 경우 횟수를 구해서 가장 높은 횟수를 지닌 username 출력
Richard Hasson이 4번으로 1등 Mark May가 3번으로 2등이지만 Expected Output은 Mark May 와 Richard Hasson이 공동 1등
'''
