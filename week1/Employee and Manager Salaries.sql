select a.first_name as employee_name, a.salary as employee_salary
from employee a join
    (select id, first_name, salary
    from employee
    where department like ('Management')) b
on a.manager_id = b.id
where a.salary > b.salary
