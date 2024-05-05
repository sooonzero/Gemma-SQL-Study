# [Finding User Purchases](https://platform.stratascratch.com/coding/10322-finding-user-purchases?code_type=3)

Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.


## Table: amazon_transactions

### amazon_transactions
id:int

user_id:int

item:varchar

created_at:datetime

revenue:int



## Expected Output
<table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">user_id</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">100</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">103</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">105</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">109</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">110</td></tr></tbody></table>
