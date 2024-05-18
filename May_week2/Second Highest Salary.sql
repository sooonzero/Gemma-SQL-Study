select a.salary
from (select salary, rank() over (order by salary desc) rk
from employee) a
where a.rk = 2;
