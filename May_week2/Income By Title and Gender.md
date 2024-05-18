# [Income By Title and Gender](https://platform.stratascratch.com/coding/10077-income-by-title-and-gender?code_type=3)

Find the average total compensation based on employee titles and gender. Total compensation is calculated by adding both the salary and bonus of each employee. However, not every employee receives a bonus so disregard employees without bonuses in your calculation. Employee can receive more than one bonus.
Output the employee title, gender (i.e., sex), along with the average total compensation.

Tables: sf_employee, sf_bonus

### sf_employee
id:int

first_name:varchar

last_name:varchar

age:int

sex:varchar

employee_title:varchar

department:varchar

salary:int

target:int

email:varchar

city:varchar

address:varchar

manager_id:int

### sf_bonus
worker_ref_id:int

bonus:int



## Expected Output
<table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">employee_title</th><th class="ResultsTable__header-cell">sex</th><th class="ResultsTable__header-cell">avg_compensation</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">Senior Sales</td><td class="ResultsTable__cell">M</td><td class="ResultsTable__cell">5350</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Auditor</td><td class="ResultsTable__cell">M</td><td class="ResultsTable__cell">2200</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Sales</td><td class="ResultsTable__cell">M</td><td class="ResultsTable__cell">4600</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Manager</td><td class="ResultsTable__cell">F</td><td class="ResultsTable__cell">209500</td></tr></tbody></table>
