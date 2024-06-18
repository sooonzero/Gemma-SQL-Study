# [Classify Business Type](https://platform.stratascratch.com/coding/9726-classify-business-type?code_type=3)

Classify each business as either a restaurant, cafe, school, or other.


•	A restaurant should have the word 'restaurant' in the business name.
•	A cafe should have either 'cafe', 'café', or 'coffee' in the business name.
•	A school should have the word 'school' in the business name.
•	All other businesses should be classified as 'other'.


Output the business name and their classification.

Table: sf_restaurant_health_violations

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
<div class="ResultsTable__container ExpectedOutput__results-table"><table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">business_name</th><th class="ResultsTable__header-cell">business_type</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">John Chin Elementary School</td><td class="ResultsTable__cell">school</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Sutter Pub and Restaurant</td><td class="ResultsTable__cell">restaurant</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">SRI THAI CUISINE</td><td class="ResultsTable__cell">other</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Washington Bakery &amp; Restaurant</td><td class="ResultsTable__cell">restaurant</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Brothers Restaurant</td><td class="ResultsTable__cell">restaurant</td></tr></tbody></table></div>
