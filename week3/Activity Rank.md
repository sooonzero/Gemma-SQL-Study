# [Activity Rank](https://platform.stratascratch.com/coding/10351-activity-rank?code_type=3)

Find the email activity rank for each user. Email activity rank is defined by the total number of emails sent. The user with the highest number of emails sent will have a rank of 1, and so on. Output the user, total emails, and their activity rank. Order records by the total emails in descending order. Sort users with the same number of emails in alphabetical order.
In your rankings, return a unique value (i.e., a unique rank) even if multiple users have the same number of emails. For tie breaker use alphabetical order of the user usernames.

## Table: google_gmail_emails

### google_gmail_emails
id:int

from_user:varchar

to_user:varchar

day:int



## Expected Output
<table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">from_user</th><th class="ResultsTable__header-cell">total_emails</th><th class="ResultsTable__header-cell">ROW_NUMBER() OVER(ORDER BY count(*) DESC, from_user ASC)</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">32ded68d89443e808</td><td class="ResultsTable__cell">19</td><td class="ResultsTable__cell">1</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">ef5fe98c6b9f313075</td><td class="ResultsTable__cell">19</td><td class="ResultsTable__cell">2</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">5b8754928306a18b68</td><td class="ResultsTable__cell">18</td><td class="ResultsTable__cell">3</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">55e60cfcc9dc49c17e</td><td class="ResultsTable__cell">16</td><td class="ResultsTable__cell">4</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">91f59516cb9dee1e88</td><td class="ResultsTable__cell">16</td><td class="ResultsTable__cell">5</td></tr></tbody></table>
