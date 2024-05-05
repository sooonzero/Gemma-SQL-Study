# [Highest Cost Orders](https://platform.stratascratch.com/coding/9915-highest-cost-orders?code_type=3)

Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output customer's first name, total cost of their items, and the date.


For simplicity, you can assume that every first name in the dataset is unique.


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
<div class="ResultsTable__container ExpectedOutput__results-table"><table class="ResultsTable__table"><thead><tr class="ResultsTable__header-row"><th class="ResultsTable__header-cell">first_name</th><th class="ResultsTable__header-cell">order_date</th><th class="ResultsTable__header-cell">total_cost</th></tr></thead><tbody><tr class="ResultsTable__row "><td class="ResultsTable__cell">Jill</td><td class="ResultsTable__cell">2019-04-19</td><td class="ResultsTable__cell">275</td></tr></tbody></table></div>
