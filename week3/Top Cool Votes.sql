select business_name, review_text
from yelp_reviews
where cool in (select max(cool)
        from yelp_reviews)
