# Popularity of Hack
[https://platform.stratascratch.com/coding/10061-popularity-of-hack?code_type=3](https://platform.stratascratch.com/coding/9891-customer-details?code_type=3)

Find the details of each customer regardless of whether the customer made an order. Output the customer's first name, last name, and the city along with the order details.
Sort records based on the customer's first name and the order details in ascending order.

## Tables: customers, orders

### customers
id:int


first_name:varchar


last_name:varchar


city:varchar


address:varchar


phone_number:varchar





### orders
id:int


cust_id:int


order_date:datetime


order_details:varchar


total_order_cost:int





## Expected Output
<table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">first_name</th><th class="ResultsTable__header-cell">last_name</th><th class="ResultsTable__header-cell">city</th><th class="ResultsTable__header-cell">order_details</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">Emma</td><td class="ResultsTable__cell">Isaac</td><td class="ResultsTable__cell">Miami</td><td class="ResultsTable__cell"></td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Eva</td><td class="ResultsTable__cell">Lucas</td><td class="ResultsTable__cell">Arizona</td><td class="ResultsTable__cell">Coat</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Eva</td><td class="ResultsTable__cell">Lucas</td><td class="ResultsTable__cell">Arizona</td><td class="ResultsTable__cell">Shirts</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Eva</td><td class="ResultsTable__cell">Lucas</td><td class="ResultsTable__cell">Arizona</td><td class="ResultsTable__cell">Slipper</td></tr><tr class="ResultsTable__row "><td class="ResultsTable__cell">Farida</td><td class="ResultsTable__cell">Joseph</td><td class="ResultsTable__cell">San Francisco</td><td class="ResultsTable__cell">Coat</td></tr></tbody></table>
