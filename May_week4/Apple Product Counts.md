# [Apple Product Counts](https://platform.stratascratch.com/coding/10141-apple-product-counts?code_type=3)

Find the number of Apple product users and the number of total users with a device and group the counts by language. Assume Apple products are only MacBook-Pro, iPhone 5s, and iPad-air. Output the language along with the total number of Apple users and users with any device. Order your results based on the number of total users in descending order.

Tables: playbook_events, playbook_users

### playbook_events
user_id:int

occurred_at:datetime

event_type:varchar

event_name:varchar

location:varchar

device:varchar

### playbook_users
user_id:int

created_at:datetime

company_id:int

language:varchar

activated_at:datetime

state:varchar


## Expected Output
<div class="ResultsTable__container ExpectedOutput__results-table"><table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">language</th><th class="ResultsTable__header-cell">n_apple_user</th><th class="ResultsTable__header-cell">n_total_users</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">english</td><td class="ResultsTable__cell">11</td><td class="ResultsTable__cell">45</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">spanish</td><td class="ResultsTable__cell">3</td><td class="ResultsTable__cell">9</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">japanese</td><td class="ResultsTable__cell">2</td><td class="ResultsTable__cell">6</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">french</td><td class="ResultsTable__cell">0</td><td class="ResultsTable__cell">5</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">russian</td><td class="ResultsTable__cell">0</td><td class="ResultsTable__cell">5</td></tr></tbody></table></div>
