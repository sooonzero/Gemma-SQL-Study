select c.username
from (
select concat(b.user_firstname," ",b.user_lastname) username, rank() over(order by count(reviewed_outcome) desc) ranking
    from flag_review a left join user_flags b on a.flag_id = b.flag_id
    where reviewed_outcome = 'APPROVED'
    group by username
    ) c
where c.ranking = 1

#답이 다르다, 결국 못풀음
