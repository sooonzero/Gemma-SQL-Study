# [User with Most Approved Flags](https://platform.stratascratch.com/coding/2104-user-with-most-approved-flags?code_type=3)

Which user flagged the most distinct videos that ended up approved by YouTube? Output, in one column, their full name or names in case of a tie. In the user's full name, include a space between the first and the last name.

## Tables: user_flags, flag_review

### user_flags
user_firstname:varchar

user_lastname:varchar

video_id:varchar

flag_id:varchar

### flag_review
flag_id:varchar

reviewed_by_yt:bool

reviewed_date:datetime

reviewed_outcome:varchar




## Expected Output
<div class="ResultsTable__container ExpectedOutput__results-table"><table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">username</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">Mark May</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Richard Hasson</td></tr></tbody></table></div>
