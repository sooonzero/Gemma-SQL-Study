select  a.first_name, a.target
from (select first_name, target, dense_rank() over(order by target desc) rk
from salesforce_employees
where manager_id like 13) a
where rk = 1
