# [Spam Posts](https://platform.stratascratch.com/coding/10134-spam-posts?code_type=3)

Calculate the percentage of spam posts in all viewed posts by day. A post is considered a spam if a string "spam" is inside keywords of the post. Note that the facebook_posts table stores all posts posted by users. The facebook_post_views table is an action table denoting if a user has viewed a post.

Tables: facebook_posts, facebook_post_views

### facebook_posts
post_id: int

poster: int

post_text: varchar

post_keywords: varchar

post_date: datetime

## Expected Output
<div class="ResultsTable__container ExpectedOutput__results-table"><table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">post_date</th><th class="ResultsTable__header-cell">spam_share</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019-01-01</td><td class="ResultsTable__cell">100</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2019-01-02</td><td class="ResultsTable__cell">50</td></tr></tbody></table></div>
