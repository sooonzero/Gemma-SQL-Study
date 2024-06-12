select department, first_name, salary
from employee
where salary  in (select max(salary)
                from employee
                group by department)
