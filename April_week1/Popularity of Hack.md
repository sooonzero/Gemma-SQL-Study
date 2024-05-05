# Popularity of Hack
https://platform.stratascratch.com/coding/10061-popularity-of-hack?code_type=3

Meta/Facebook has developed a new programing language called Hack.To measure the popularity of Hack they ran a survey with their employees. The survey included data on previous programing familiarity as well as the number of years of experience, age, gender and most importantly satisfaction with Hack. Due to an error location data was not collected, but your supervisor demands a report showing average popularity of Hack by office location. Luckily the user IDs of employees completing the surveys were stored.
Based on the above, find the average popularity of the Hack per office location.
Output the location along with the average popularity.

## Tables: facebook_employees, facebook_hack_survey

### facebook_employees
id:int


location:varchar


age:int


gender:varchar


is_senior:bool



### facebook_hack_survey
employee_id:int


age:int


gender:varchar


popularity:int



## Expected Output
<table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">location</th><th class="ResultsTable__header-cell">avg_popularity</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">USA</td><td class="ResultsTable__cell">4.6</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">India</td><td class="ResultsTable__cell">7.5</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">UK</td><td class="ResultsTable__cell">4.333</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Switzerland</td><td class="ResultsTable__cell">1</td></tr></tbody></table>
