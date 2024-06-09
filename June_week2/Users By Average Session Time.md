# [Users By Average Session Time](https://platform.stratascratch.com/coding/10352-users-by-avg-session-time?code_type=3)

Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, consider only the latest page_load and earliest page_exit, with an obvious restriction that load time event should happen before exit time event . Output the user_id and their average session time.

Table: facebook_web_log

### facebook_web_log
user_id:int

timestamp:datetime

action:varchar


## Expected Output
<div class="ResultsTable__container ExpectedOutput__results-table"><table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">user_id</th><th class="ResultsTable__header-cell">session_time</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">0</td><td class="ResultsTable__cell">1883.5</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">1</td><td class="ResultsTable__cell">35</td></tr></tbody></table></div>
