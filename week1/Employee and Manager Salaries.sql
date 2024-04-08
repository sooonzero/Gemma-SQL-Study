select a.first_name as employee_name, a.salary as employee_salary
from employee a join
    (select id, first_name, salary
    from employee
    where department like ('Management')) b
on a.manager_id = b.id
where a.salary > b.salary


--[제풀이]
select e.first_name,
e.salary
from employee as e
inner join employee as m -- self join
on e.manager_id=m.id
where e.salary > m.salary;

/*
[피드백]
재영님 코드도 올바른 코드입니다. 하지만 self join으로 푼 제 코드도 확인 부탁드립니다.
*/
