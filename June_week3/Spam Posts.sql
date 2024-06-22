select post_date, sum(spam)/count(spam) * 100
from (select post_id, post_date, case when post_keywords like ('%spam%') then 1 else 0 end as 'spam'
    from facebook_posts) a join facebook_post_views b on a.post_id = b.post_id
group by post_date
