# [Acceptance Rate By Date](https://platform.stratascratch.com/coding/10285-acceptance-rate-by-date?code_type=3)

What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.


Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.


## Table: fb_friend_requests

### fb_friend_requests
user_id_sender:varchar

user_id_receiver:varchar

date:datetime

action:varchar



## Expected Output
<table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">date</th><th class="ResultsTable__header-cell">count(a.user_id_receiver)/count(b.user_id_sender)</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">2020-01-04</td><td class="ResultsTable__cell">0.75</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2020-01-06</td><td class="ResultsTable__cell">0.667</td></tr></tbody></table>
