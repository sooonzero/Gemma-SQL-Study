# [Number of violations](https://platform.stratascratch.com/coding/9728-inspections-that-resulted-in-violations?code_type=3)

You're given a dataset of health inspections. Count the number of violation in an inspection in 'Roxanne Cafe' for each year. If an inspection resulted in a violation, there will be a value in the 'violation_id' column. Output the number of violations by year in ascending order.

## Table: sf_restaurant_health_violations

### sf_restaurant_health_violations
business_id:int

business_name:varchar

business_address:varchar

business_city:varchar

business_state:varchar

business_postal_code:float

business_latitude:float

business_longitude:float

business_location:varchar

business_phone_number:float

inspection_id:varchar

inspection_date:datetime

inspection_score:float

inspection_type:varchar

violation_id:varchar

violation_description:varchar

risk_category:varchar




## Expected Output
<table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">YEAR</th><th class="ResultsTable__header-cell">n_inspections</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">2015</td><td class="ResultsTable__cell">5</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2016</td><td class="ResultsTable__cell">2</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">2018</td><td class="ResultsTable__cell">3</td></tr></tbody></table>
